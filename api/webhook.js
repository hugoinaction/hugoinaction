module.exports = {
  /**
   * Function to handle calls to the API endpoint of the cloud function.
   */
  async handler(event, context) {
    console.log(event.body);

    return {
      statusCode: 200
    };
  },
};
