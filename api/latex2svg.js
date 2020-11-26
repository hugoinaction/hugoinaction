const MathjaxModule = require("mathjax");

let MathJax = null;
module.exports = {
  /**
   * Function to handle calls to the API endpoint of the cloud function.
   */
  async handler(event, context) {
    console.log("Password", process.env.LATEX2SVG_PASSWORD);
    if (!event.queryStringParameters || event.queryStringParameters.password !== process.env.LATEX2SVG_PASSWORD) {
        return {
          statusCode: 401,
          headers: {'Content-Type': 'application/json'},
          body: JSON.stringify({
            error: "Access Denied.",
            env: process.env
          })
        }
      }

    if (!event.queryStringParameters || !event.queryStringParameters.tex) {
      return {
        statusCode: 400,
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          error: "The required `tex` parameter not supplied.",
        })
      }
    }
    if (!MathJax) {
      MathJax = await MathjaxModule.init({
        loader: { load: ['input/tex', 'output/svg'] }
      });
    }

    const svg = MathJax.tex2svg(event.queryStringParameters.tex, {
      display: event.queryStringParameters.display,
      em: event.queryStringParameters.em,
      ex: event.queryStringParameters.ex,
      containerWidth: event.queryStringParameters.containerWidth,
      lineWidth: event.queryStringParameters.lineWidth,
      scale: event.queryStringParameters.scale
    });

    return {
      statusCode: 200,
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        data: MathJax.startup.adaptor.outerHTML(svg)
      })
    };
  },
}
