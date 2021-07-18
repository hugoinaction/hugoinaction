/**!
 * Not meant as a reference for good CSS practices. The goal of Hugo in Action
 * is for us to understand Hugo. The HTML/CSS/JS code has been intentionally
 * made complicated so that we can simplify the Go HTML Template pieces of Hugo. 
 * There are intentional cases where CSS selectors are used instead of class
 * parameters for targeting. Many of the targeting done in CSS is more
 * specific than it should be. Some of the decisions taken are sub-optimal.
 * You are free to use this code on your website but beware of caveats and
 * do understand that support may be lacking where expected.
 **/
{{ $color := site.Params.color | default "#4f46e5" }}
{{ $b := substr $color -2 2 | print "0x" | int}} 
{{ $g := substr $color -4 2 | print "0x" | int}}
{{ $r := substr $color -6 2 | print "0x" | int}} 
:root {
  --red: {{$r}};
  --green: {{$g}};
  --blue: {{$b}};

  -moz-tab-size: 4;
  tab-size: 4;
}

#hero .intro>a:focus,
.btn:focus {
  box-shadow: 0 0 0 0 #fff,0 0 0 calc(4px + 0px) rgba(59,130,246,.5),0 0 transparent;
}
header:before {
  background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100' height='100'%3E%3Cpattern id='a' patternUnits='userSpaceOnUse' width='4' height='4'%3E%3Cpath d='M-1 1l2-2M0 4l4-4M3 5l2-2' stroke='rgba(255,255,255,.9)' stroke-width='1.5'/%3E%3C/pattern%3E%3Crect width='100%25' height='100%25' fill='url(%23a)'/%3E%3C/svg%3E")!important;
}
#related,
.comments {
  width: 100%;
  background-color: #fff;
  border-color: rgba(243,244,246,.4);
  border-radius: .5rem;
  border-width: 4px;
  margin: 4rem;
  padding: 1.25rem;
  box-shadow: 0 0 transparent,0 0 transparent,0 10px 15px -3px rgba(0,0,0,.1),0 4px 6px -2px rgba(0,0,0,.05);
}
@media (min-width:640px) {
  #related,
  .comments {
    max-width: 640px;
  }
}
@media (min-width:768px) {
  .btn {
    font-size: 1.125rem;
    line-height: 1.75rem;
    padding: .75rem 1.25rem;
  }
  #related,
  .comments {
    max-width: 768px;
  }
}
@media (min-width:1024px) {
  .btn {
    padding: 1rem 1.5rem;
  }
  #related,
  .comments {
    max-width: 1024px;
  }
}
@media (min-width:1280px) {
  #related,
  .comments {
    max-width: 1280px;
  }
}
#related h2,
.comments h2 {
  font-weight: 700;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 2rem;
  padding-top: .75rem;
  padding-bottom: .75rem;
  position: relative;
  width: fit-content;
  width: -moz-fit-content;
  text-align: center;
}
#related h2:after,
.blog #content aside h2:after,
.comments h2:after {
  content: "";
  height: 1px;
  width: 50%;
  background-color: rgb(var(--red), var(--green), var(--blue));
  position: absolute;
  bottom: .5rem;
  left: 25%;
}
.comments form div {
  margin: 1rem;
}
.subsections {
  background-color: #fff;
  display: grid;
  margin-left: auto;
  margin-right: auto;
  gap: 1rem;
  grid-template-columns: repeat(1,minmax(0,1fr));
  padding: 1.25rem 2.25rem;
}
@media (min-width:640px) {
  .subsections {
    grid-template-columns: repeat(2,minmax(0,1fr));
  }
  .blog #content aside {
    max-width: 640px;
  }
}
li.subsection {
  border-radius: .5rem;
  cursor: pointer;
  margin: 0;
  overflow: hidden;
  padding: .5rem;
  color: #fff;
  width: 100%;
  transform: translateX(0) translateY(0) rotate(0) skewX(0) skewY(0) scaleX(1) scaleY(1);
  background-image: linear-gradient(135deg,rgba(var(--red), var(--green), var(--blue), .9),rgba(var(--red), var(--green), var(--blue), .2));
}
li.subsection:hover {
  box-shadow: 0 0 transparent,0 0 transparent,0 1px 3px 0 rgba(0,0,0,.1),0 1px 2px 0 rgba(0,0,0,.06);
  transition-property: all;
  transition-timing-function: cubic-bezier(.4,0,.2,1);
  transition-duration: .3s;
  transform: scale(1.02);
  z-index: 9;
  position: relative;
}
li.subsection a {
  text-decoration: none!important;
  color: #fff!important;
}
li.subsection p {
  padding-top: .25rem!important;
  padding-bottom: .25rem!important;
  font-size: .875rem;
  line-height: 1.25rem;
  margin: 0;
  padding: .25rem;
}
li.subsection h3 {
  font-weight: 700;
  font-size: 1.125rem;
  line-height: 1.75rem;
  padding: .5rem 0;
  text-shadow: 1px 1px 3px rgba(36,37,47,25%);
  border-bottom: 2px solid #fff;
}
.list ul.posts {
  padding: 1.25rem;
}
.list h2 {
  text-align: center;
}
.list h2 img {
  width: 200px;
  margin: 0 auto;
}
.list .pagination {
  margin-left: auto;
  margin-right: auto;
  text-align: center;
}
.list .pagination li {
  border-radius: .375rem;
  display: inline-block;
  padding: .75rem;
  box-shadow: 0 0 transparent,0 0 transparent,0 10px 15px -3px rgba(0,0,0,.1),0 4px 6px -2px rgba(0,0,0,.05);
  transition-property: all;
  transition-timing-function: cubic-bezier(.4,0,.2,1);
  transition-duration: .15s;
}
.list .pagination li:not(.active):hover {
  transform: scale(1.2);
}
.list .pagination li a {
  text-decoration: none;
}
.list .pagination li.active a {
  color: #000;
  cursor: default;
}
.blog #content main {
  border-color: rgba(243,244,246,.4);
  border-width: 4px;
  margin: 0;
  width: auto;
  max-width: none;
}
.blog #content main h1 {
  margin-left: auto;
  margin-right: auto;
  position: relative;
  width: fit-content;
  width: -moz-fit-content;
}
.blog #content main h1:after {
  content: "";
  height: 2px;
  width: 50%;
  background-color: rgb(var(--red), var(--green), var(--blue));
  position: absolute;
  bottom: .5rem;
  left: 30%;
  transform: translate(-15%);
}
.blog #content aside {
  width: 100%;
  margin-top: 1.25rem;
  overflow: hidden;
  position: relative;
}
.blog #content aside h2 {
  font-weight: 700;
  margin-left: auto;
  margin-right: auto;
  padding-top: .75rem;
  padding-bottom: .75rem;
  position: relative;
  width: fit-content;
  width: -moz-fit-content;
  text-align: center;
}
.blog #content aside section {
  background-color: #fff;
  border-color: rgba(243,244,246,.4);
  border-radius: .5rem;
  border-width: 4px;
  padding: 1.25rem;
  box-shadow: 0 0 transparent,0 0 transparent,0 10px 15px -3px rgba(0,0,0,.1),0 4px 6px -2px rgba(0,0,0,.05);
}
.blog #content aside section p {
  font-size: .875rem;
  line-height: 1.25rem;
}
.blog #content aside section a:before {
  content: " ";
  background: url('data:image/svg+xml;utf8,<svg xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" viewBox="0 -1 24.000001 29.00000125" version="1.1" x="0px" y="0px"><g transform="translate(0,-1028.3622)"><path style="color:black;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:medium;line-height:normal;font-family:sans-serif;font-variant-ligatures:normal;font-variant-position:normal;font-variant-caps:normal;font-variant-numeric:normal;font-variant-alternates:normal;font-feature-settings:normal;text-indent:0;text-align:start;text-decoration:none;text-decoration-line:none;text-decoration-style:solid;text-decoration-color:black;letter-spacing:normal;word-spacing:normal;text-transform:none;writing-mode:lr-tb;direction:ltr;text-orientation:mixed;dominant-baseline:auto;baseline-shift:baseline;text-anchor:start;white-space:normal;shape-padding:0;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:black;solid-opacity:1;vector-effect:none;fill:black;fill-opacity:1;fill-rule:nonzero;stroke:none;stroke-width:0.99993849;stroke-linecap:butt;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;paint-order:markers stroke fill;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate" d="m 17.173828,2.8808594 v 0.00195 c -0.01805,8e-4 -0.782481,0.031934 -2.507812,0.1777344 -0.58199,0.049 -1.838427,0.2153937 -3.181641,1.5585937 L 4.4453125,11.658203 c -0.5933644,0.5934 -0.5933832,1.570663 0,2.164063 l 5.6249995,5.625 c 0.593361,0.5935 1.570745,0.5933 2.164063,0 l 7.039063,-7.039063 c 1.341656,-1.3417 1.523907,-2.5866124 1.558593,-3.1953124 0.101361,-1.779 0.175781,-2.6230468 0.175781,-2.6230468 a 0.50001924,0.50001924 0 0 0 0.002,-0.015625 C 21.067196,5.6108187 20.724681,4.6229719 19.990234,3.8886719 19.222222,3.1205719 18.178907,2.7829594 17.173828,2.8808594 Z m 0.07031,0.9980468 a 0.50001924,0.50001924 0 0 0 0.02734,0 c 0.71923,-0.07 1.459117,0.16615 2.011719,0.71875 0.527997,0.5279001 0.76908,1.2272157 0.728516,1.9160157 -7.75e-4,0.01 -0.07633,0.860825 -0.177735,2.640625 -0.03025,0.5309 -0.09858,1.3758221 -1.267578,2.5449221 l -7.039062,7.039062 c -0.213896,0.2139 -0.536127,0.2139 -0.75,0 l -5.6250002,-5.625 c -0.2138509,-0.2139 -0.2138497,-0.5362 0,-0.75 L 12.191406,5.3242188 C 13.35885,4.1568187 14.194461,4.1014875 14.75,4.0546875 c 1.732897,-0.146 2.494141,-0.1757813 2.494141,-0.1757813 z m 0.261718,1 c -0.38493,0 -0.769745,0.1467001 -1.060547,0.4375 -0.581602,0.5817 -0.581601,1.5394938 0,2.1210938 0.581597,0.5816 1.539498,0.5816 2.121094,0 0.581602,-0.5816 0.581595,-1.5394938 0,-2.1210938 -0.290798,-0.2907999 -0.675616,-0.4375 -1.060547,-0.4375 z m 0,0.9941407 c 0.126885,0 0.253732,0.050591 0.353516,0.1503906 0.199567,0.1995 0.199567,0.5074312 0,0.7070313 -0.199567,0.1994999 -0.507464,0.1994999 -0.707031,0 -0.199567,-0.1996 -0.199567,-0.5075313 0,-0.7070313 0.09978,-0.0998 0.22663,-0.1503906 0.353515,-0.1503906 z" transform="translate(0,1028.3622)"/></g></svg>') 50% 50%/contain;
  display: inline-block;
  height: 1.5rem;
  width: 1.5rem;
  vertical-align: top;
}
.blog #content aside section a:hover {
  text-decoration: underline;
}
@media (min-width:768px) {
  .subsections {
    grid-template-columns: repeat(3,minmax(0,1fr));
  }
  li.subsection {
    padding: .75rem;
  }
  .blog #content aside section {
    margin-bottom: 1rem;
  }
  .blog #content aside {
    max-width: 768px;
    width: 100rem;
  }
}
@media (min-width:1024px) {
  #related h2,
  .blog #content aside h2,
  .comments h2 {
    font-size: 1.25rem;
    line-height: 1.75rem;
    padding-top: 1rem;
  }
  .subsections {
    grid-template-columns: repeat(4,minmax(0,1fr));
  }
  li.subsection {
    padding: 1rem;
  }
  li.subsection p {
    font-size: 1rem;
    line-height: 1.5rem;
  }
  li.subsection h3 {
    font-size: 1.25rem;
    line-height: 1.75rem;
  }
  .blog #content {
    display: flex;
    flex-direction: row;
  }
  .blog #content aside {
    max-width: 1024px;
    margin-top: 0;
    margin-left: 3rem;
  }
}
@media (min-width:1280px) {
  .blog #content aside {
    max-width: 1280px;
  }
}
@media (min-width:1536px) {
  #related,
  .blog #content aside,
  .comments {
    max-width: 1536px;
  }
}
#hero nav {
  position: absolute;
  bottom: 0;
  text-align: center;
  width: 100%;
}
#hero nav li {
  display: inline-block;
  font-size: .75rem;
  line-height: 1rem;
}
#hero nav li a {
  display: inline-block;
  padding: .75rem;
}
#hero nav li a:hover {
  color: rgb(var(--red), var(--green), var(--blue));
  text-decoration: underline;
}
#hero {
  flex-direction: column;
  justify-content: space-evenly;
  padding-bottom: 0;
  position: relative;
}
#hero .intro {
  display: flex;
  flex-direction: column;
  align-content: center;
  justify-content: center;
  justify-self: stretch;
  padding-bottom: 2.5rem;
  text-align: center;
}
#hero .intro > a {
  border-radius: .75rem;
  border: 2px solid rgb(var(--red), var(--green), var(--blue));
  display: inline-block;
  font-weight: 400;
  font-size: 1rem;
  line-height: 1.5rem;
  margin-left: auto;
  margin-right: auto;
  padding: .5rem 1rem;
  text-decoration: none;
  transition-property: background-color,border-color,color,fill,stroke,opacity,box-shadow,transform,filter,backdrop-filter;
  transition-timing-function: cubic-bezier(.4,0,.2,1);
  transition-duration: .15s;
  background-color: rgb(var(--red), var(--green), var(--blue));
  margin-top: 2.5rem;
  color: #fff;
}
#hero .intro > a:hover {
  background-color: rgb(var(--red), var(--green), var(--blue));
  color: #fff;
  text-decoration: none;
  filter: brightness(.75) contrast(1.25);
}
#hero .hero {
  width: 16rem;
}
#hero:after,
.hidden,
.news-item .badge {
  display: none;
}
@media (min-width:768px) {
  #hero {
    flex-direction: row;
    justify-content: center;
  }
  #hero .intro {
    position: relative;
  }
  #hero .intro > a {
    font-size: 1.125rem;
    line-height: 1.75rem;
    padding: .75rem 1.25rem;
    margin-top: 5rem;
  }
  #hero .hero {
    width: 16rem;
  }
}
@media (min-width:1024px) {
  #hero nav li {
    font-size: .875rem;
    line-height: 1.25rem;
  }
  #hero .intro {
    padding-bottom: 3rem;
  }
  #hero .intro > a {
    padding: 1rem 1.5rem;
  }
  #hero .hero {
    width: 24rem;
  }
}
.relative,
body:not(.news) .news-item {
  position: relative;
}
body:not(.news) .news-item:before {
  background-color: rgb(var(--red), var(--green), var(--blue));
  height: .75rem;
  position: absolute;
  width: .75rem;
  content: " ";
  top: 2rem;
  right: .7rem;
  transform: rotate(45deg);
  filter: brightness(70%);
  z-index: -1;
}
body:not(.news) .news-item .badge {
  display: block;
  position: absolute;
  color: #fff;
  background-color: rgb(var(--red), var(--green), var(--blue));
  right: .5rem;
  top: 2.375rem;
  padding: 0 10px;
  font-weight: 300;
}
.news-item img {
  border: 1px solid #000;
}
.news h1,
.news h2,
.news h3,
.news h4,
.news h5,
.news h6,
.news-item h2,
.news-item h3 {
  font-family: serif;
}
.news-item:hover {
  border-radius: 0;
}
.news .content {
  text-align: justify;
}
.news .content p {
  margin-top: .75rem;
  margin-bottom: 1.25rem;
  padding-top: 0;
  padding-bottom: 0;
}
.news .content p:first-of-type {
  margin-top: 0;
}
.news .content > p:first-child:first-letter {
  color: rgb(var(--red), var(--green), var(--blue));
  float: left;
  font-family: serif;
  font-size: 75px;
  line-height: 60px;
  padding-top: 4px;
  padding-right: 8px;
  padding-left: 3px;
}
@media (min-width:640px) {
  .news .content {
    column-count: auto;
    column-count: 2;
  }
}
@media (min-width:1280px) {
  .news .content {
    column-count: auto;
    column-count: 4;
  }
}
.border {
  border-width: 1px;
}
.block {
  display: block;
}
.inline {
  display: inline;
}
.table {
  display: table;
}
.contents {
  display: contents;
}
.float-right {
  float: right;
}
.float-left {
  float: left;
}