#! env node
// Post-install script for Acme Corporation functions

const fs = require('fs').promises;
const path = require('path');

(async () => {
  ////////////////////////////////////////////////////////////////
  // Getting deploy path for multi-branch builds on Netlify
  // using stored environment variables begin
  // the env.json is dynamically created by postinstall.js script
  // provided along with the current file.
  ////////////////////////////////////////////////////////////////
  await fs.writeFile(__dirname + '/env.json', JSON.stringify(process.env, null, 2));
  ////////////////////////////////////////////////////////////////
  // End custom code for getting build details from Netlify.
  ////////////////////////////////////////////////////////////////
})();
