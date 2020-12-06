const DEPLOY_MIN_INTERVAL = 60 * 1000; // The sample code might have a different value.

module.exports = {
  /**
   * Function to handle calls to the API endpoint of the cloud function.
   */
  async handler(event, context) {
    try {
      if (
        !event.queryStringParameters ||
        !process.env.REBUILD_PASSWORD ||
        event.queryStringParameters.password !== process.env.REBUILD_PASSWORD
      ) {
        return {
          statusCode: 401,
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            error: "Access Denied.",
          }),
        };
      }
      if (process.env.NETLIFY_SITE_ID && process.env.COMMENTS_TOKEN) {
        const deploys = await fetch(
          `https://api.netlify.com/api/v1/sites/${process.env.NETLIFY_SITE_ID}/deploys?access_token=${process.env.COMMENTS_TOKEN}`
        );
        if (deploys.ok) {
          const list = await deploys.json();
          if (
            Array.isArray(list) &&
            (!list[0] ||
              new Date().getTime() - new Date(!list[0].created_at).getTime() >
                DEPLOY_MIN_INTERVAL)
          ) {

            /** Changes for a single branch begin **/

            // const rebuild = await fetch(
            //   `https://api.netlify.com/build_hooks/${process.env.BUILD_HOOK_ID}`
            // );

            /** Changes for a single branch end **/

            /** Changes for multiple branches begin **/
            const branches = ['ch11-3'];
            const rebuild = {ok: false, status: 400};
            do {
              const branch = branches.shift();
              trigger_branch
              rebuild = await fetch(
                `https://api.netlify.com/build_hooks/${process.env.BUILD_HOOK_ID}&trigger_branch=${branch}`
              );

            } while(rebuild.ok && branches.length > 0)
            /** Changes for multiple branches end **/

            if (rebuild.ok) {
              return {
                statusCode: 200,
              };
            } else {
              return { statusCode: rebuild.status };
            }
          }
        }
      }
      if (process.env.GITHUB_ACCESS_TOKEN) {
        const response = await fetch(
          "https://api.github.com/repos/hugoinaction/hugoinaction/actions/workflows/gh-pages",
          {
            headers: {
              Accept: "application/vnd.github.v3+json",
              Authorization: `token ${process.env.GITHUB_ACCESS_TOKEN}`,
            },
          }
        );
        if (response.ok) {
          const data = await response.json();
          const list = data.workflow_runs;
          if (
            Array.isArray(list) &&
            (!list[0] ||
              new Date().getTime() - new Date(!list[0].created_at).getTime() >
                DEPLOY_MIN_INTERVAL)
          ) {
            const rebuild = await fetch(
              "https://api.github.com/repos/hugoinaction/hugoinaction/workflows/gh-pages/dispatches",
              {
                method: "POST",
                headers: {
                  Accept: "application/vnd.github.v3+json",
                  Authorization: `token ${process.env.GITHUB_ACCESS_TOKEN}`,
                },
                body: JSON.stringify({
                  ref: "main",
                }),
              }
            );
            if (rebuild.ok) {
              return {
                statusCode: 200,
              };
            } else {
              return {
                statusCode: rebuild.status,
              };
            }
          }
        }
      }
      return {
        statusCode: 400,
        body: JSON.stringify({
          error: "Missing data.",
        }),
      };
    } catch (e) {
      return {
        statusCode: 500,
        body: JSON.stringify({
          error: "Please try again later.",
        }),
      };
    }
  },
};
