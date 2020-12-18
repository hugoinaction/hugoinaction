const fs = require("fs").promises;

module.exports = {
  /**
   * Function to handle calls to the API endpoint of the cloud function.
   */
  async handler(event, context) {
    const data = await fs.readFile(__dirname, "../assets/products.csv", {encoding: 'utf-8'});

    return {
      statusCode: 200,
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        data,
      }),
    };
  },
};
