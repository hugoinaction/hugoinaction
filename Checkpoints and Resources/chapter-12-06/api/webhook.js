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
      return {
        statusCode: 400,
        err: JSON.stringify(err)
      }
    }

    try {

      const session = await stripe.checkout.sessions.retrieve(stripeEvent.data.object.id, {
        expand: ['customer', 'payment_intent', 'payment_intent.payment_method'],
      });

      if (!(session.customer && session.customer.email && session.payment_status === 'paid' && Object.values(session.metadata || {}).length > 0)) {
        throw new Error("Could not get customer or payment information.");
      }

      const name = session.payment_intent && session.payment_intent.payment_method && session.payment_intent.payment_method.billing_details && session.payment_intent.payment_method.billing_details.name;

      const email = session.customer.email;

      sgMail.setApiKey(process.env.SENDGRID_API_KEY);

      const msg = {
        to: email,
        from: 'noreply@hugoinaction.com',
        subject: 'Your purchase with Acme Corporation (Hugo In Action)',
        text: `Dear ${name || "User"},\n\nThank you for purchasing digital shapes from the Acme Corporation. Your purchased shapes are attached to this email.`,
        attachments: Object.values(session.metadata).filter(img => result[img]).map(img => ({
          content: result[img],
          filename: img + '.png',
          type: "image/png",
          disposition: "attachment"
        }))
      };

      await sgMail.send(msg)
    }
    catch (err) {
      return {
        statusCode: 500,
        err: JSON.stringify(err)
      };
    }

    return {
      statusCode: 200
    };
  },
};
