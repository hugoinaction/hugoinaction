const stripe = require('stripe')(process.env.STRIPE_PRIVATE_KEY);
const sgMail = require('@sendgrid/mail')
const result = require('./result.json');

module.exports = {
  /**
   * Function to handle calls to the API endpoint of the cloud function.
   */
  async handler(event, context) {
    const sig = event.headers['stripe-signature'];
    let stripeEvent = {};
    try {
      stripeEvent = stripe.webhooks.constructEvent(event.body, sig, process.env.STRIPE_SIGN_SECRET);

    } catch (err) {
      // On error, log and return the error message
      console.log(`❌ Error message: ${err.message}`);
      return res.status(400).send(`Webhook Error: ${err.message}`);
    }

    const session = await stripe.checkout.sessions.retrieve(stripeEvent.data.object.id, {
      expand: ['customer', 'customer.sources'],
    });

    if (session.customer && session.customer.email && session.payment_status === 'paid' && Object.values(session.metadata || {}).length > 0) {
      // NOTE: We are not handling pagination of line items which should be handled in the production environment.

      // Get name of the payment owner and use that as the customer name.
      // Keeps the form simple

      const source = session.customer.sources && Array.isArray(session.customer.sources.data) && session.customer.sources.data.find(x => x.owner && x.owner.name);
      const name = source.owner && source.owner.name;

      // Try to send email to the customer:
      sgMail.setApiKey(process.env.SENDGRID_API_KEY)
      const msg = {
        to: session.customer.email, // Change to your recipient
        from: 'noreply@hugoinaction.com', // Change to your verified sender
        subject: 'Your purchase with Acme Corporation (Hugo In Action)',
        text: `Dear ${name || "User"},\n\nThank you for purchasing digital shapes from the Acme Corporation. Your purchased shapes are attached to this email.`,
        attachments: Object.values(session.metadata).filter(img => result[img]).map(img => ({
            content: result[img],
            filename: img + '.png',
            type: "image/png",
            disposition: "attachment"
        }))
      }
      try {
        await sgMail.send(msg)
        console.log(Object.assign({}, msg, { attachments: [] }));
      } catch (err) {
        console.log(err, err.response.code, err.response.body);
        console.log("Failed to send email. Returning error to make stripe try again");
        return {
          statusCode: 500
        };
      }
    }

    return {
      statusCode: 200
    };
  },
};
