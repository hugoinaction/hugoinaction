const fs = require("fs").promises;
const env = require("./env.json");
const fetch = require("node-fetch");
module.exports = {
  /**
   * Function to handle calls to the API endpoint of the cloud function.
   */
  async handler(event, context) {
    const data = await fetch(`${env.DEPLOY_PRIME_URL}/store/index.json`);

    if (data.ok) {

      return {
        statusCode: 200,
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          data: await data.json(),
        }),
      };
    }

    return {
      statusCode: 500,
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        error: "Could not fetch pricing table."
      }),
    };


  },
};
