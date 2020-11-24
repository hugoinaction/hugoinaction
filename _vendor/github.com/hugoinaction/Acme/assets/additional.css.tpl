.hero {
  width: 100%;
  padding: 0;
  margin: 0 0 30px;
  height: 50vh;
  object-fit: cover;
  object-position: top left;
}

.pagination li {
  display: inline-block;
}

.news section {
  text-align: justify;
}

.news section * {
  text-shadow: none;
  font-weight: normal;
}

.news main {
  background: #fffefd;
  border: 4px double #333;
  padding: 20px;
  columns: 3;
  column-rule: 1px solid #333;
  column-gap: 30px;
}

.news p {
  line-height: 22px;
}

.news p:first-of-type::first-letter {
  float: left;
  font-family: Georgia;
  font-size: 75px;
  line-height: 60px;
  padding-top: 4px;
  padding-right: 8px;
  padding-left: 3px;
}

.news h1 {
  font-variant: small-caps;
  text-align: center;
  column-span: all;
  padding: 40px;
  font-family: serif;
  position: relative;
}

.news h1::after {
  content: " ";
  position: absolute;
  width: 10%;
  border-top: 1px solid #000;
  left: 45%;
  bottom: 30px;
}

aside {
  align-self: flex-start;
  width: 210px;
  background: white;
  border: 1px solid #ddd;
  border-bottom-width: 4px;
  display: none;
}

aside h2 {
  padding: 10px;
  font-size: 30px;
  font-weight: normal;
  text-shadow: none;
  background: #ddd;
  margin: 0;
  color: black;
}

aside th {
  font-weight: normal;
  text-align: left;
  padding: 5px;
}

aside tr:nth-child(2n) {
  background: #ddd;
}

aside td {
  text-align: left;
}

aside table {
  table-layout: fixed;
  width: 210px;
  margin: 0;
}

section:first-child {
  flex-wrap: wrap;
  padding: 0;
  align-items: stretch;
}

section:first-child > main {
  align-self: center;
}

.list section:first-of-type:last-of-type {
  min-height: calc(100vh - 180px);
}

section {
  overflow-x: hidden;
}

#TableOfContents li {
  display: list-item;
  list-style-type: upper-roman;
}

.terms section main {
  width: 100%;
  min-height: calc(100vh - 260px);
  text-align: left;
}

.terms section main summary h3:before {
  content: ' ';

  border: solid {{$.Param "color"}};
  border-width: 0 2px 2px 0;
  display: inline-block;
  padding: 0 5px 5px 0;
  transform: rotate(-45deg);
  margin: 4px 20px;
}

.terms section main summary {
  list-style-image: none;
}

.terms section main ul {
  margin-left: 50px;
}

.terms section main small {
  color: gray;
  font-size: 14px;
  margin: 5px;
}

.terms section main h1 {
  text-align: center;
}

@media only screen and (min-width: 320px) {
  .hero {
    height: 20vh;
  }

  .news main {
    columns: 1;
  }
}

@media only screen and (min-width: 768px) {
  .hero {
    height: 50vh;
  }

  .news main {
    columns: 2;
  }

  aside {
    display: block;
  }

  aside~main {
    max-width: calc(100% - 210px);
  }
}

@media only screen and (min-width: 992px) {
  aside~main {
    max-width: 590px;
  }
}

@media only screen and (min-width: 1200px) {

  main,
  article {
    margin: 40px;
  }

  .news main {
    columns: 3;
  }

  aside~main {
    max-width: 790px;
  }
}
