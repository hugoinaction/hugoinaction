body {
  margin: 0;
  padding: 0;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
  {{ $background := resources.GetMatch "image/background.svg.tpl" | resources.ExecuteAsTemplate "background.svg" . }}
  background-image: url({{$background.Permalink}});
  background-size: cover;
}

header {
  margin: 0 auto;
  font-size: larger;
  border-bottom: 1px solid rgba(0, 0, 0, 0.3);
  position: relative;
  height: 80px;
}

header nav {
  float: right;
}

nav {
  display: inline-block;
}

nav li {
  display: inline-block;
}

header nav>ul {
  height: 80px;
  margin: 0;
}

header nav>ul>li {
  padding: 0;
  margin: 0;
  height: 80px;
  vertical-align: middle;
  display: table-cell;
}

header nav li ul {
  display: none;
  position: absolute;
  top: 80px;
  margin: 0;
  padding: 0;
  background: white;
  border: 1px solid rgba(0, 0, 0, 0.3);
}

header nav li:hover ul {
  display: block;

}

section:first-child {
  min-height: 100vh;
}

section:first-child:last-of-type {
  min-height: calc(100vh - 100px);
}

section {
  text-align: center;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 40px;
  box-sizing: border-box;
  width: 100vw;
}

.page section {
  text-align: justify;
}

body * {
  font-weight: lighter;
  text-shadow: 2px 2px 2px #ddd;
}

footer {
  background-color: #222;
  color: white;
  text-align: center;
  text-shadow: none;
  display: table-cell;
  vertical-align: middle;
  width: 100vw;
  height: 100px;
  box-sizing: border-box;
}

footer a {
  color: #DDD;
  font-size: small;
  text-shadow: none;
}


footer ul {
  margin: 0;
  padding: 0;
}

main,
article {
  background: rgba(255, 255, 255, 0.6);
}

h2 {
  color: #aaa;
  font-size: 2.5em;
  padding: 0;
  margin: 5px 0 10px;
}

h1 {
  font-size: 5em;
  margin: 0;
}

a {
  color: {{$.Param "color"}};
  text-decoration: none;
  padding: 10px;
  white-space: nowrap;
  display: inline-block;
  vertical-align: middle;
}

a:hover {
  text-decoration: underline;
}

.scroll {
  margin: 40px;
}

.posts {
  display: flex;
  margin: 20px 0;
  flex-wrap: wrap;
}

.post {
  width: calc(100% - 30px);
  margin: 15px;
  box-sizing: border-box;
  padding: 10px;
  border: 1px solid {{$.Param "color"}};
  display: inline-block;
}

table {
  margin: 30px 20px;
  border-collapse: collapse;
}

table td {
  padding: 10px;
}

thead td {
  border-bottom: 4px double #000;
  font-weight: bold;
}

details summary {
  display: block;
  cursor: pointer;
  color: {{$.Param "color"}};
}

details summary::-webkit-details-marker {
  display: none;
}

.testimonials {
  text-align: left;
  min-width: 80vw;
}

.testimonials ol {
  margin: 40px 0;
}

@media only screen and (min-width : 320px) {

  main,
  article {
    margin: 0 10px 0 10px;
  }

  header {
    padding: 0 10px;
  }
}

@media only screen and (min-width : 480px) {

  main,
  article {
    margin: 0 30px 0 30px;
  }

  header {
    padding: 0 30px;
  }

  .post {
    width: calc(100% - 30px);
    margin: 15px;
  }
}

@media only screen and (min-width : 768px) {

  main,
  article {
    margin: 0 40px 0 40px;
  }

  header {
    padding: 0 40px;
  }

  .post {
    width: calc(50% - 30px);
    margin: 15px;  }
}

@media only screen and (min-width : 992px) {

  main,
  article,
  header {
    max-width: 800px;
  }

  .post {
    width: calc(33% - 30px);
    margin: 15px;  }
}

@media only screen and (min-width : 1200px) {

  main,
  article,
  header {
    max-width: 1000px;
  }
}
