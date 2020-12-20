#! env node
// Pre-install script for Acme Corporation functions

const fs = require('fs').promises;
const path = require('path');

(async () => {
  await fs.writeFile(__dirname + '/env.json', JSON.stringify(process.env));

  const data = {};

  const images = await fs.readdir(__dirname + "/assets");
  await Promise.all(images.map(async image => {
    const extname = path.extname(image);
    if (extname === '.png') {
      const buffer = await fs.readFile(__dirname + "/assets/" + image);
      data[path.basename(image, path.extname(image))] = buffer.toString('base64');
    }
  }));

  await fs.writeFile(__dirname + "/result.json", JSON.stringify(data, null, 2));

})();
