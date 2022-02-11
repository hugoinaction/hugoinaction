const env = require("./env.json");
const endpoint =  env.NETLIFY ? "https://chapter-13-07.hugoinaction.com" : "https://hugoinaction.github.io/GitHubPagesStore";
const stripe = require('stripe')(env.STRIPE_PRIVATE_KEY);
const fetch = require("node-fetch");
const origin = new URL(endpoint).origin;

module.exports = {
  /**
   * Function to handle calls to the API endpoint of the cloud function.
   */
  async handler(event, context) {
    if (
      !event.queryStringParameters ||
      !event.queryStringParameters.products
    ) {
      return {
        statusCode: 400,
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          error: "No products supplied.",
        }),
      };
    }

    let error = "Unknown error";

    try {
      let products = event.queryStringParameters.products;
      if (!Array.isArray(products)) {
        products = products.split(",");
      }

      console.log(`Fetching data from ${endpoint}`);
      const data = await fetch(`${endpoint}/store/index.json`);


      if (data.ok) {
        const table = await data.json();
        const stripeData = {
          payment_method_types: ['card'],
          line_items: [
          ],
          mode: 'payment',
          success_url: `${origin}${decodeURIComponent(event.queryStringParameters.success)}`,
          cancel_url: `${origin}${decodeURIComponent(event.queryStringParameters.cancel)}`,
          metadata: { }
        };

        products.forEach((x, i) => {
          stripeData.metadata["item " + i] = x.trim();
          const name = x.split("_")[0].trim();
          const color = x.split("_")[1].trim();
          stripeData.line_items.push({
            price_data: {
              currency: 'usd',
              product_data: {
                name: `${name}(${color})`,
                images: [table[name].Cover],
              },
              unit_amount: parseFloat(table[name].Price.trim()) * 100,
            },
            quantity: 1,
          })
        });

        const session = await stripe.checkout.sessions.create(stripeData);
        return {
          statusCode: 200,
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            sessionId: session.id,
            stripeData,
            products
          }),
        };
      } else {
        error = `Could not fetch pricing table due to ${await data.text()} ${data.statusCode}`;
      }
    } catch (e) {
      error = e.message;
    }

    return {
      statusCode: 500,
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        error
      }),
    };


  },
};
