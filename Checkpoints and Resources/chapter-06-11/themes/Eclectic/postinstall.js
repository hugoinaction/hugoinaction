const fs = require('fs-extra');
const path = require('path');

(async () => {
  await fs.copy(path.resolve(__dirname, "./node_modules/line-awesome/src/production"),
    path.resolve(__dirname, "./assets/image/line-awesome"));
  await fs.copy(path.resolve(__dirname, "./node_modules/include-media/dist/_include-media.scss"),
    path.resolve(__dirname, "./assets/scss/_include-media.scss"));
})();
