const MathjaxModule = require("mathjax");

let MathJax = null;
module.exports = {
  /**
   * Function to handle calls to the API endpoint of the cloud function.
   */
  async handler(event, context) {
    if (!event.queryStringParams || !event.queryStringParams.tex) {
      return {
        statusCode: 400,
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          error: "The requires `tex` parameter not supplied.",
        })
      }
    }
    if (!MathJax) {
      MathJax = await MathjaxModule.init({
        loader: { load: ['input/tex', 'output/svg'] }
      });
    }

    const svg = MathJax.tex2svg(event.queryStringParams.tex, {
      display: event.queryStringParams.display,
      em: event.queryStringParams.em,
      ex: event.queryStringParams.ex,
      containerWidth: event.queryStringParams.containerWidth,
      lineWidth: event.queryStringParams.lineWidth,
      scale: event.queryStringParams.scale
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
