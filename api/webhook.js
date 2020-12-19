const stripe = require('stripe')(process.env.STRIPE_PRIVATE_KEY);

module.exports = {
  /**
   * Function to handle calls to the API endpoint of the cloud function.
   */
  async handler(event, context) {
    console.log(event.body);
    const sig = event.headers['stripe-signature'];
    let stripeEvent = {};
    try {
      stripeEvent = stripe.webhooks.constructEvent(event.body, sig, process.env.STRIPE_SIGN_SECRET);

    } catch (err) {
      // On error, log and return the error message
      console.log(`❌ Error message: ${err.message}`);
      return res.status(400).send(`Webhook Error: ${err.message}`);
    }


    console.log(stripeEvent.data, stripeEvent.data.object.id, stripeEvent.data.object.line_items, stripeEvent.data.object.customer);

    const session = await stripe.checkout.sessions.retrieve(stripeEvent.data.object.id, {
      expand: ['customer', 'line_items'],
    });

    console.log((session.customer && session.customer.email), session.line_items, session.payment_status);

    return {
      statusCode: 200
    };
  },
};
