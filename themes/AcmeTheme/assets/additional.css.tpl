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
html {
  -webkit-text-size-adjust: 100%;
  font-family: ui-sans-serif,system-ui,-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,Noto Sans,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol,Noto Color Emoji;
  line-height: 1.5;
}
body {
  margin: 0;
  font-family: system-ui,-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji;
  font-family: inherit;
  line-height: inherit;
}
hr {
  height: 0;
  color: inherit;
  border-top-width: 1px;
}
strong {
  font-weight: bolder;
}
code,
pre {
  font-size: 1em;
  font-family: ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,Liberation Mono,Courier New,monospace;
}
small {
  font-size: 80%;
}
sup {
  font-size: 75%;
  line-height: 0;
  position: relative;
  vertical-align: baseline;
  top: -.5em;
}
table {
  text-indent: 0;
  border-color: inherit;
  border-collapse: collapse;
}
button,
input,
select,
textarea {
  font-family: inherit;
  font-size: 100%;
  line-height: 1.15;
  margin: 0;
  padding: 0;
  line-height: inherit;
  color: inherit;
}
button,
select {
  text-transform: none;
}
[type=button],
[type=submit],
button {
  -webkit-appearance: button;
}
[type=search] {
  -webkit-appearance: textfield;
  outline-offset: -2px;
}
summary {
  display: list-item;
}
blockquote,
dd,
dl,
figure,
h1,
h2,
h3,
h6,
hr,
p,
pre {
  margin: 0;
}
button {
  background-color: transparent;
  background-image: none;
}
button:focus {
  outline: dotted 1px;
  outline: -webkit-focus-ring-color auto 5px;
}
ol,
ul {
  list-style: none;
  margin: 0;
  padding: 0;
}
*,
:after,
:before {
  box-sizing: border-box;
  border: 0 solid #e5e7eb;
}
img {
  border-style: solid;
}
textarea {
  resize: vertical;
}
input::placeholder,
textarea::placeholder {
  color: #6b7280;
  opacity: 1;
}
[role=button],
button {
  cursor: pointer;
}
h1,
h2,
h3,
h6 {
  font-size: inherit;
  font-weight: inherit;
}
a {
  color: inherit;
  text-decoration: inherit;
}
iframe,
img,
svg,
video {
  display: block;
  vertical-align: middle;
}
img,
video {
  max-width: 100%;
  height: auto;
}
[multiple],
[type=email],
[type=search],
[type=text],
[type=time],
[type=url],
select,
textarea {
  appearance: none;
  background-color: #fff;
  border-color: #6b7280;
  border-width: 1px;
  border-radius: 0;
  padding: .5rem .75rem;
  font-size: 1rem;
  line-height: 1.5rem;
}
[multiple]:focus,
[type=email]:focus,
[type=search]:focus,
[type=text]:focus,
[type=time]:focus,
[type=url]:focus,
select:focus,
textarea:focus {
  outline: transparent solid 2px;
  outline-offset: 2px;
  box-shadow: 0 0 0 0 #fff,0 0 0 calc(1px + 0px) #2563eb,0 0 transparent;
  border-color: #2563eb;
}
select {
  background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
  background-position: right .5rem center;
  background-repeat: no-repeat;
  background-size: 1.5em 1.5em;
  padding-right: 2.5rem;
  color-adjust: exact;
}
[multiple] {
  background-image: none;
  background-position: 0 0;
  background-repeat: unset;
  background-size: initial;
  padding-right: .75rem;
  color-adjust: unset;
}
[type=checkbox],
[type=radio] {
  appearance: none;
  padding: 0;
  color-adjust: exact;
  display: inline-block;
  vertical-align: middle;
  background-origin: border-box;
  user-select: none;
  flex-shrink: 0;
  height: 1rem;
  width: 1rem;
  color: #2563eb;
  background-color: #fff;
  border-color: #6b7280;
  border-width: 1px;
}
.news-item:hover,
[type=checkbox] {
  border-radius: 0;
}
[type=radio] {
  border-radius: 100%;
}
[type=checkbox]:focus,
[type=radio]:focus {
  outline: transparent solid 2px;
  outline-offset: 2px;
  box-shadow: 0 0 0 2px #fff,0 0 0 calc(2px + 2px) #2563eb,0 0 transparent;
}
[type=checkbox]:checked,
[type=radio]:checked {
  border-color: transparent;
  background-color: currentColor;
  background-size: 100% 100%;
  background-position: 50%;
  background-repeat: no-repeat;
}
[type=checkbox]:checked {
  background-image: url("data:image/svg+xml,%3csvg viewBox='0 0 16 16' fill='white' xmlns='http://www.w3.org/2000/svg'%3e%3cpath d='M12.207 4.793a1 1 0 010 1.414l-5 5a1 1 0 01-1.414 0l-2-2a1 1 0 011.414-1.414L6.5 9.086l4.293-4.293a1 1 0 011.414 0z'/%3e%3c/svg%3e");
}
[type=radio]:checked {
  background-image: url("data:image/svg+xml,%3csvg viewBox='0 0 16 16' fill='white' xmlns='http://www.w3.org/2000/svg'%3e%3ccircle cx='8' cy='8' r='3'/%3e%3c/svg%3e");
}
[type=checkbox]:checked:focus,
[type=checkbox]:checked:hover,
[type=radio]:checked:focus,
[type=radio]:checked:hover {
  border-color: transparent;
  background-color: currentColor;
}
[type=checkbox]:indeterminate {
  background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 16 16'%3e%3cpath stroke='white' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M4 8h8'/%3e%3c/svg%3e");
  border-color: transparent;
  background-color: currentColor;
  background-size: 100% 100%;
  background-position: 50%;
  background-repeat: no-repeat;
}
[type=checkbox]:indeterminate:focus,
[type=checkbox]:indeterminate:hover {
  border-color: transparent;
  background-color: currentColor;
}
[type=file] {
  background: unset;
  border-color: inherit;
  border-width: 0;
  border-radius: 0;
  padding: 0;
  font-size: unset;
  line-height: inherit;
}
[type=file]:focus {
  outline: -webkit-focus-ring-color auto 1px;
}
.btn {
  background-color: #f3f4f6;
  border-radius: .75rem;
  border: 2px solid rgb(var(--red), var(--green), var(--blue));
  display: inline-block;
  font-weight: 400;
  font-size: 1rem;
  line-height: 1.5rem;
  margin-left: auto;
  margin-right: auto;
  padding: .5rem 1rem;
  color: rgb(var(--red), var(--green), var(--blue));
  text-decoration: none;
  transition-property: background-color,border-color,color,fill,stroke,opacity,box-shadow,transform,filter,backdrop-filter;
  transition-timing-function: cubic-bezier(.4,0,.2,1);
  transition-duration: .15s;
}
#cart>div button:hover,
.btn:hover {
  background-color: rgb(var(--red), var(--green), var(--blue));
  color: #fff;
  text-decoration: none;
}
#cart>div button:focus,
#hero .intro>a:focus,
#related li.product button:focus,
.btn:focus,
.home #store li.product button:focus,
.page li.product button:focus {
  box-shadow: 0 0 0 0 #fff,0 0 0 calc(4px + 0px) rgba(59,130,246,.5),0 0 transparent;
}
header:before {
  background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100' height='100'%3E%3Cpattern id='a' patternUnits='userSpaceOnUse' width='4' height='4'%3E%3Cpath d='M-1 1l2-2M0 4l4-4M3 5l2-2' stroke='rgba(255,255,255,.9)' stroke-width='1.5'/%3E%3C/pattern%3E%3Crect width='100%25' height='100%25' fill='url(%23a)'/%3E%3C/svg%3E")!important;
}
#related,
.comments,
.store section {
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
  .comments,
  .store section {
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
  .comments,
  .store section {
    max-width: 768px;
  }
}
@media (min-width:1024px) {
  .btn {
    padding: 1rem 1.5rem;
  }
  #related,
  .comments,
  .store section {
    max-width: 1024px;
  }
}
@media (min-width:1280px) {
  #related,
  .comments,
  .store section {
    max-width: 1280px;
  }
}
#related h2,
.comments h2,
.store section h2 {
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
.comments h2:after,
.store section h2:after {
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
.comments .comment {
  margin: 1.25rem;
  padding: 1.25rem;
  position: relative;
  clear: both;
}
.comments .comment .author {
  font-weight: 700;
  padding-top: .75rem;
  padding-bottom: .75rem;
}
.comments .comment img {
  width: 100px;
  border-radius: .75rem;
  float: left;
  margin-right: 1.25rem;
}
.comments .comment ~ form {
  padding-top: 3rem;
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
@media (min-width:640px) {
  .subsections {
    grid-template-columns: repeat(2,minmax(0,1fr));
  }
  .blog #content aside {
    max-width: 640px;
  }
  .news .content {
    column-count: auto;
    column-count: 2;
  }
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
  .comments h2,
  .store section h2 {
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
#cart .badge:empty,
#cart .item~.empty,
#hero:after,
#related ul.products h2:after,
.hidden,
.home #store ul.products h2:after,
.news-item .badge,
.page ul.products h2:after,
.page.store main h1:after {
  display: none;
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
.success {
  background-color: #d1fae5;
  border-color: #34d399;
  border-radius: .25rem;
  border-width: 1px;
  padding: .75rem 1rem;
  position: relative;
  color: #047857;
}
.error {
  background-color: #fee2e2;
  border-color: #f87171;
  border-radius: .25rem;
  border-width: 1px;
  padding: .75rem 1rem;
  position: relative;
  color: #b91c1c;
}
.contact .error,
.contact .success {
  align-self: center;
  text-align: center;
}
#cart {
  order: 1;
  margin-right: .5rem;
}
#cart > button {
  font-size: 0;
  background-image: url("data:image/svg+xml;utf8,<svg id='Layer_1' data-name='Layer 1' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 122.88 111.85'><path fill='black' d='M4.06,8.22A4.15,4.15,0,0,1,0,4.06,4.13,4.13,0,0,1,4.06,0h6A19.12,19.12,0,0,1,20,2.6c5.44,3.45,6.41,8.38,7.8,13.94h91a4.07,4.07,0,0,1,4.06,4.06,5,5,0,0,1-.21,1.25L112.06,64.61a4,4,0,0,1-4,3.13H41.51c1.46,5.41,2.92,8.32,4.89,9.67C48.8,79,53,79.08,59.93,79h47.13a4.06,4.06,0,0,1,0,8.12H60c-8.63.1-13.94-.11-18.2-2.91s-6.66-7.91-8.95-17h0L18.94,14.46c0-.1,0-.1-.11-.21a7.26,7.26,0,0,0-3.12-4.68A10.65,10.65,0,0,0,10,8.22H4.06Zm80.32,25a2.89,2.89,0,0,1,5.66,0V48.93a2.89,2.89,0,0,1-5.66,0V33.24Zm-16.95,0a2.89,2.89,0,0,1,5.67,0V48.93a2.89,2.89,0,0,1-5.67,0V33.24Zm-16.94,0a2.89,2.89,0,0,1,5.66,0V48.93a2.89,2.89,0,0,1-5.66,0V33.24Zm41.72-8.58H30.07l9.26,34.86H105l8.64-34.86Zm2.68,67.21a10,10,0,1,1-10,10,10,10,0,0,1,10-10Zm-43.8,0a10,10,0,1,1-10,10,10,10,0,0,1,10-10Z'/></svg>");
  background-position: 50%;
  background-repeat: no-repeat;
  padding-left: .5rem;
  padding-right: .5rem;
  position: relative;
  width: 3rem;
  line-height: 1rem;
  height: 42px;
  background-size: 30%;
  border-radius: .125rem;
  border-width: 1px;
  border-color: transparent;
}
#cart > button:hover {
  filter: brightness(.75) contrast(1.25);
}
#cart .empty {
  font-size: .875rem;
  line-height: 1.25rem;
  padding: 1rem;
  text-align: center;
  color: #374151;
}
#cart .item ~ button {
  opacity: 1;
  cursor: pointer;
}
#cart:hover > div {
  opacity: 1;
  display: block;
}
#cart > div {
  opacity: 0;
  display: none;
  background-color: #fff;
  position: absolute;
  box-shadow: 0 0 transparent,0 0 transparent,0 4px 6px -1px rgba(0,0,0,.1),0 2px 4px -1px rgba(0,0,0,.06);
  z-index: 50;
}
#cart > div .item {
  border-color: #d1d5db;
  display: grid;
  padding: .5rem;
  min-width: 250px;
  column-gap: .5rem;
  grid-template-columns: 40px 5fr 2fr;
}
#cart>div .item:not(:last-child),
#search>div a:not(:last-child) {
  border-bottom-width: 1px;
}
#cart > div .delete {
  font-size: 0;
  margin-bottom: 2px;
  width: 1rem;
  height: 1rem;
  background-image: url("data:image/svg+xml,%3C%3Fxml version='1.0' encoding='utf-8'%3F%3E%3Csvg version='1.1' id='Layer_1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' x='0px' y='0px' viewBox='0 0 105.2 122.9' style='enable-background:new 0 0 105.2 122.9;' xml:space='preserve'%3E%3Cstyle type='text/css'%3E .st0%7Bfill-rule:evenodd;clip-rule:evenodd;fill:%23991B1B;%7D%0A%3C/style%3E%3Cpath class='st0' d='M11.2,37.2h83.5c0.7,0,1.3,0,2,0.2c1.1,0.2,2.1,0.8,2.9,1.6c0.9,0.9,1.5,2.1,1.6,3.3c0,0.5,0,1-0.1,1.4 L94,117.3l0,0v0.1v0.3l0,0c0,0.3-0.1,0.6-0.2,0.9l0,0v0.1l0,0c-0.8,2.4-3,4-5.5,4.1h-71c-0.4,0-0.8-0.1-1.2-0.2 c-0.4-0.1-0.8-0.3-1.2-0.5l0,0c-1.8-1-2.9-2.8-3.1-4.9l-7-73.5c-0.1-0.5-0.1-1.1-0.1-1.7c0.1-1.3,0.7-2.4,1.6-3.3 c0.8-0.8,1.9-1.4,3-1.6c0.6-0.1,1.2-0.1,1.8-0.1L11.2,37.2z M5.7,8.8h31.5V6l0,0c0-0.1,0-0.2,0-0.3c0.1-1.5,0.7-2.9,1.8-4l0,0 C40,0.6,41.5,0,43.1,0h19.4h0.3c3.2,0.2,5.7,2.8,5.7,6l0,0l0,0v2.8h32h0.4c2.3,0.2,4.2,2.1,4.3,4.4c0,0.2,0,0.3,0,0.5v9.9 c0,1.4-1.2,2.6-2.6,2.6H2.6C1.2,26.2,0,25,0,23.6V13.5l0,0c0-0.1,0-0.2,0-0.3l0,0c0.1-2.2,1.7-4,3.9-4.3C4.5,8.8,5.1,8.8,5.7,8.8z M47.8,61.5c0.3-2.6,2.6-4.5,5.2-4.3c2.2,0.2,4,2,4.3,4.3v37c-0.3,2.6-2.6,4.5-5.2,4.3c-2.2-0.2-4-2-4.3-4.3V61.5z M71.5,61.3 c0.3-2.5,2.5-4.3,5-4.1c2.5,0,4.5,2,4.5,4.4c0,0,0,0,0,0l-2,37c-0.3,2.5-2.5,4.3-5,4.1c-2.5,0-4.5-2-4.5-4.4c0,0,0,0,0,0 C69.5,98.3,71.5,61.3,71.5,61.3z M25,61.7c0-2.5,2-4.5,4.5-4.5c0,0,0,0,0,0c2.5-0.2,4.7,1.6,5,4.1l2,37c0,2.5-2,4.5-4.5,4.5 c0,0,0,0,0,0c-2.5,0.3-4.7-1.6-5-4.1L25,61.7L25,61.7z'/%3E%3C/svg%3E%0A");
  background-repeat: no-repeat;
  background-position: 50%;
  background-size: 50%;
  cursor: pointer;
  display: block;
}
#cart > div .delete:hover {
  background-color: #f3f4f6;
}
#cart > div button {
  border-radius: 0;
  border: 2px rgb(var(--red), var(--green), var(--blue));
  display: inline-block;
  font-weight: 400;
  padding: .25rem;
  text-decoration: none;
  transition-property: background-color,border-color,color,fill,stroke,opacity,box-shadow,transform,filter,backdrop-filter;
  transition-timing-function: cubic-bezier(.4,0,.2,1);
  transition-duration: .15s;
  background-color: rgb(var(--red), var(--green), var(--blue));
  font-size: 1rem;
  line-height: 1.5rem;
  margin: 0;
  color: #fff;
  width: 100%;
  opacity: .6;
  cursor: default;
}
#cart > div .price {
  font-size: 1.125rem;
  line-height: 1.75rem;
  text-align: right;
}
#cart > div .price:first-letter {
  display: inline-block;
  font-size: 1rem;
  line-height: 1.5rem;
  padding-right: 0;
  color: #1f2937;
  vertical-align: top;
}
#cart > div .color {
  border-radius: 9999px;
  display: inline-block;
  height: .75rem;
  box-shadow: 0 0 transparent,0 0 transparent,0 1px 2px 0 rgba(0,0,0,.05);
  width: .75rem;
  vertical-align: middle;
  margin: -2px;
}
#cart>div .Red,
.colors input[value=Red],
body.page form .colors input[value=Red] {
  background-color: #b91c1c;
}
#cart>div .Orange,
.colors input[value=Orange],
body.page form .colors input[value=Orange] {
  background-color: #d97706;
}
#cart>div .Green,
.colors input[value=Green],
body.page form .colors input[value=Green] {
  background-color: #10b981;
}
#cart>div .Pink,
.colors input[value=Pink],
body.page form .colors input[value=Pink] {
  background-color: #fca5a5;
}
#cart>div .Yellow,
.colors input[value=Yellow],
body.page form .colors input[value=Yellow] {
  background-color: #fcd34d;
}
#cart>div .Blue,
.colors input[value=Blue],
body.page form .colors input[value=Blue] {
  background-color: #2563eb;
}
#cart > div img {
  border-width: 0;
  float: left;
  grid-row-start: 1;
  grid-row-end: span 2;
  clear: left;
  background-color: #f3f4f6;
  object-fit: cover;
  box-shadow: inset 0 0 20px rgba(var(--red), var(--green), var(--blue), .6);
}
#cart > div h3 {
  display: inline-block;
  font-weight: 700;
  font-size: .875rem;
  line-height: 1.25rem;
  overflow: hidden;
  padding-right: .5rem;
  color: #1f2937;
  text-overflow: ellipsis;
  white-space: nowrap;
  vertical-align: middle;
}
@media screen and (max-width:479px) {
  #cart > div {
    right: 0;
    left: 0;
  }
}
#cart .badge {
  background-color: #b91c1c;
  border-radius: 9999px;
  height: .75rem;
  line-height: .75rem;
  position: absolute;
  color: #fff;
  width: .75rem;
  right: .5rem;
  top: .5rem;
  font-size: .5rem;
}
#cart:focus,
#cart:hover {
  overflow: visible;
}
#cart:focus > button,
#cart:hover > button {
  background-color: rgba(var(--red), var(--green), var(--blue), .3);
  border-color: rgba(99,102,241,.7);
  border-width: 1px;
  border-radius: .125rem;
}
#search {
  position: relative;
  order: 2;
}
#search > div {
  opacity: 0;
  background-color: #fff;
  position: absolute;
  right: 1rem;
  left: 1rem;
  box-shadow: 0 0 transparent,0 0 transparent,0 4px 6px -1px rgba(0,0,0,.1),0 2px 4px -1px rgba(0,0,0,.06);
  z-index: 50;
}
#search > div a:hover {
  background-color: rgba(var(--red), var(--green), var(--blue), .2);
}
#search > div a {
  border-color: #d1d5db;
  cursor: pointer;
  display: grid;
  padding: .5rem;
  column-gap: .5rem;
  grid-template-columns: 40px 1fr;
}
#search > div a.selected {
  background-color: rgba(var(--red), var(--green), var(--blue), .1);
}
#search > div img {
  border-width: 0;
  float: left;
  grid-row-start: 1;
  grid-row-end: span 2;
  clear: left;
  background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" viewBox="0 0 48 48" style="enable-background:new 0 0 48 48;"> <path fill="rgb(75, 85, 99)" d="M0,47.7l14.3-17.6l9.7,9.8L38.7,20L48,31.4v16.3H0z M24.7,15.6c1.8,0,3.3,1.5,3.3,3.4s-1.5,3.4-3.3,3.4s-3.3-1.5-3.3-3.4S22.8, 15.6, 24.7, 15.6z"/></svg>');
}
#search > div h3 {
  font-weight: 700;
  font-size: .875rem;
  line-height: 1.25rem;
  overflow: hidden;
  color: #1f2937;
  text-overflow: ellipsis;
  white-space: nowrap;
}
#search > div span {
  grid-column-start: 2;
  font-size: .75rem;
  line-height: 1rem;
  overflow: hidden;
  color: #374151;
  text-overflow: ellipsis;
  white-space: nowrap;
}
#search input:focus ~ div {
  display: block;
  opacity: 1;
  transition-property: opacity;
  transition-timing-function: cubic-bezier(.4,0,.2,1);
  transition-duration: 75ms;
}
#search input {
  background-color: #f3f4f6;
  border-color: transparent;
  display: block;
  margin-top: .25rem;
  padding: 5px 10px 5px 40px;
  border-radius: 50px;
  background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 250.313 250.313" width="512" height="512" enable-background="new 0 0 250.313 250.313"><path d="M244.186 214.604l-54.379-54.378c-.289-.289-.628-.491-.93-.76 10.7-16.231 16.945-35.66 16.945-56.554 0-56.837-46.075-102.912-102.911-102.912s-102.911 46.075-102.911 102.911c0 56.835 46.074 102.911 102.91 102.911 20.895 0 40.323-6.245 56.554-16.945.269.301.47.64.759.929l54.38 54.38c8.169 8.168 21.413 8.168 29.583 0 8.168-8.169 8.168-21.413 0-29.582zm-141.275-44.458c-37.134 0-67.236-30.102-67.236-67.235 0-37.134 30.103-67.236 67.236-67.236 37.132 0 67.235 30.103 67.235 67.236s-30.103 67.235-67.235 67.235z" fill="rgb(156, 163, 175)"/></svg>');
  background-size: .8rem;
  background-position: 10px;
  background-repeat: no-repeat;
  font-size: 1rem;
  line-height: 1.5rem;
  color: #6b7280;
}
#search input:focus {
  background-color: #fff;
  border-color: #6b7280;
  box-shadow: 0 0 0 0 #fff,0 0 0 calc(0px) rgba(59,130,246,.5),0 0 transparent;
  color: #1f2937;
  background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 250.313 250.313" width="512" height="512" enable-background="new 0 0 250.313 250.313"><path d="M244.186 214.604l-54.379-54.378c-.289-.289-.628-.491-.93-.76 10.7-16.231 16.945-35.66 16.945-56.554 0-56.837-46.075-102.912-102.911-102.912s-102.911 46.075-102.911 102.911c0 56.835 46.074 102.911 102.91 102.911 20.895 0 40.323-6.245 56.554-16.945.269.301.47.64.759.929l54.38 54.38c8.169 8.168 21.413 8.168 29.583 0 8.168-8.169 8.168-21.413 0-29.582zm-141.275-44.458c-37.134 0-67.236-30.102-67.236-67.235 0-37.134 30.103-67.236 67.236-67.236 37.132 0 67.235 30.103 67.235 67.236s-30.103 67.235-67.235 67.235z" fill="rgb(55, 65, 81)"/></svg>');
}
@media screen and (max-width:1023px) {
  #cart > div {
    right: 0;
  }
  #cart {
    order: 0;
  }
  #cart > button {
    border-color: #6b7280;
  }
  #search {
    order: 0;
    overflow: hidden;
    border-radius: .125rem;
    margin-right: .5rem;
    padding-left: .5rem;
    padding-right: .5rem;
    width: 3rem;
    border-color: #6b7280;
    border-width: 1px;
  }
  #search:focus,
  #search:hover {
    background-color: #fff;
    border-color: transparent;
    width: auto;
    overflow: visible;
    z-index: 9;
  }
  #search:focus input,
  #search:hover input {
    background-color: #f3f4f6;
    width: auto;
  }
  #search:focus input:focus,
  #search:hover input:focus {
    background-color: #fff;
    border-color: #6b7280;
  }
  #search input {
    background-color: transparent;
    border-color: transparent;
    transition-property: all;
    transition-timing-function: cubic-bezier(.4,0,.2,1);
    transition-duration: .15s;
    background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 250.313 250.313" width="512" height="512" enable-background="new 0 0 250.313 250.313"><path d="M244.186 214.604l-54.379-54.378c-.289-.289-.628-.491-.93-.76 10.7-16.231 16.945-35.66 16.945-56.554 0-56.837-46.075-102.912-102.911-102.912s-102.911 46.075-102.911 102.911c0 56.835 46.074 102.911 102.91 102.911 20.895 0 40.323-6.245 56.554-16.945.269.301.47.64.759.929l54.38 54.38c8.169 8.168 21.413 8.168 29.583 0 8.168-8.169 8.168-21.413 0-29.582zm-141.275-44.458c-37.134 0-67.236-30.102-67.236-67.235 0-37.134 30.103-67.236 67.236-67.236 37.132 0 67.235 30.103 67.235 67.236s-30.103 67.235-67.235 67.235z" fill="rgb(55, 65, 81)"/></svg>');
    width: 45px;
  }
  #search input:focus {
    border-color: transparent;
  }
}
@media screen and (max-width:767px) {
  #search:hover {
    position: absolute;
    left: 0;
    right: 0;
    padding-top: 8px;
    padding-bottom: 8px;
    margin-top: -8px;
    margin-bottom: -8px;
  }
  #search:hover input {
    width: 100%;
  }
}
.addToCart:focus,
.buyNow:focus,
.page.store main .addToCart:focus,
.page.store main .buyNow:focus {
  outline: 0;
}
.page.store main {
  display: grid;
  align-items: stretch;
  gap: 1.5rem;
  grid-template-columns: repeat(1,minmax(0,1fr));
}
.page.store main img {
  background-color: #f3f4f6;
  border-radius: .125rem;
  width: 100%;
  object-fit: cover;
  box-shadow: inset 0 0 240px rgba(var(--red), var(--green), var(--blue), .6);
  object-position: bottom center;
}
.page.store main h1 {
  display: inline-block;
  margin-left: 0;
  margin-right: 0;
  padding-top: .5rem;
}
.page.store main .price {
  font-weight: 700;
  font-size: 1.5rem;
  line-height: 2rem;
  color: #4b5563;
}
.page.store main .price:first-letter {
  display: inline-block;
  font-weight: 400;
  font-size: 1rem;
  line-height: 1.5rem;
  padding-right: 0;
  color: #374151;
  vertical-align: top;
}
.page.store main form .colors {
  padding-left: 0;
  padding-right: 0;
  padding-bottom: 1rem;
}
.page.store main .addToCart,
.page.store main .buyNow {
  background-repeat: no-repeat;
  background-position: 1rem;
  background-size: 14%;
  margin-bottom: .5rem;
  padding-left: 3rem;
}
.page.store main .addToCart:hover,
.page.store main .buyNow:hover {
  box-shadow: 0 0 transparent,0 0 transparent,0 4px 6px -1px rgba(0,0,0,.1),0 2px 4px -1px rgba(0,0,0,.06);
  filter: brightness(.75) contrast(1.25);
}
.page.store main label {
  white-space: nowrap;
  font-size: .875rem;
  line-height: 1.25rem;
  padding-bottom: .25rem;
  padding-top: .5rem;
  color: #4b5563;
}
.page.store main .buyNow {
  background-color: #fff;
  border-color: rgb(var(--red), var(--green), var(--blue));
  margin-left: .5rem;
  color: rgb(var(--red), var(--green), var(--blue));
  background-image: url("data:image/svg+xml;utf8,<svg id='Layer_1' data-name='Layer 1' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 122.88 111.85'><path fill='rgb({{$r}},{{$g}},{{$b}})' d='M4.06,8.22A4.15,4.15,0,0,1,0,4.06,4.13,4.13,0,0,1,4.06,0h6A19.12,19.12,0,0,1,20,2.6c5.44,3.45,6.41,8.38,7.8,13.94h91a4.07,4.07,0,0,1,4.06,4.06,5,5,0,0,1-.21,1.25L112.06,64.61a4,4,0,0,1-4,3.13H41.51c1.46,5.41,2.92,8.32,4.89,9.67C48.8,79,53,79.08,59.93,79h47.13a4.06,4.06,0,0,1,0,8.12H60c-8.63.1-13.94-.11-18.2-2.91s-6.66-7.91-8.95-17h0L18.94,14.46c0-.1,0-.1-.11-.21a7.26,7.26,0,0,0-3.12-4.68A10.65,10.65,0,0,0,10,8.22H4.06Zm80.32,25a2.89,2.89,0,0,1,5.66,0V48.93a2.89,2.89,0,0,1-5.66,0V33.24Zm-16.95,0a2.89,2.89,0,0,1,5.67,0V48.93a2.89,2.89,0,0,1-5.67,0V33.24Zm-16.94,0a2.89,2.89,0,0,1,5.66,0V48.93a2.89,2.89,0,0,1-5.66,0V33.24Zm41.72-8.58H30.07l9.26,34.86H105l8.64-34.86Zm2.68,67.21a10,10,0,1,1-10,10,10,10,0,0,1,10-10Zm-43.8,0a10,10,0,1,1-10,10,10,10,0,0,1,10-10Z'/></svg>");
}
.page.store main .buyNow:hover {
  background-color: rgb(var(--red), var(--green), var(--blue));
  border-color: transparent;
  color: #fff;
  background-image: url("data:image/svg+xml;utf8,<svg id='Layer_1' data-name='Layer 1' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 122.88 111.85'><path fill='white' d='M4.06,8.22A4.15,4.15,0,0,1,0,4.06,4.13,4.13,0,0,1,4.06,0h6A19.12,19.12,0,0,1,20,2.6c5.44,3.45,6.41,8.38,7.8,13.94h91a4.07,4.07,0,0,1,4.06,4.06,5,5,0,0,1-.21,1.25L112.06,64.61a4,4,0,0,1-4,3.13H41.51c1.46,5.41,2.92,8.32,4.89,9.67C48.8,79,53,79.08,59.93,79h47.13a4.06,4.06,0,0,1,0,8.12H60c-8.63.1-13.94-.11-18.2-2.91s-6.66-7.91-8.95-17h0L18.94,14.46c0-.1,0-.1-.11-.21a7.26,7.26,0,0,0-3.12-4.68A10.65,10.65,0,0,0,10,8.22H4.06Zm80.32,25a2.89,2.89,0,0,1,5.66,0V48.93a2.89,2.89,0,0,1-5.66,0V33.24Zm-16.95,0a2.89,2.89,0,0,1,5.67,0V48.93a2.89,2.89,0,0,1-5.67,0V33.24Zm-16.94,0a2.89,2.89,0,0,1,5.66,0V48.93a2.89,2.89,0,0,1-5.66,0V33.24Zm41.72-8.58H30.07l9.26,34.86H105l8.64-34.86Zm2.68,67.21a10,10,0,1,1-10,10,10,10,0,0,1,10-10Zm-43.8,0a10,10,0,1,1-10,10,10,10,0,0,1,10-10Z'/></svg>");
}
.colors,
body.page form .colors {
  padding-left: 1rem;
  padding-right: 1rem;
}
.colors input,
body.page form .colors input {
  border-radius: 9999px;
  display: inline-block;
  height: 1rem;
  margin: .25rem;
  box-shadow: 0 0 transparent,0 0 transparent,0 1px 2px 0 rgba(0,0,0,.05);
  width: 1rem;
}
.colors input:checked,
body.page form .colors input:checked {
  box-shadow: 0 0 0 2px #fff,0 0 0 4px #3b82f6;
  background-image: none;
}
.addToCart {
  background-image: url("data:image/svg+xml,%3Csvg id='Layer_1' data-name='Layer 1' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 122.88 104.43'%3E%3Cdefs%3E%3Cstyle%3E.cls-1%7Bfill-rule:evenodd;fill:white%7D%3C/style%3E%3C/defs%3E%3Ctitle%3Eadd-to-cart%3C/title%3E%3Cpath class='cls-1' d='M97,0A25.9,25.9,0,1,1,78.67,7.59,25.79,25.79,0,0,1,97,0ZM3.66,10.89a3.71,3.71,0,0,1,0-7.42H9.11A17.3,17.3,0,0,1,18,5.81c4.92,3.12,5.79,7.57,7,12.59H66.7a31,31,0,0,0-.9,7.33H27.14L35.5,57.19H94.77l0-.18c.72.05,1.44.08,2.17.08a31.59,31.59,0,0,0,5.46-.48l-1.29,5.18a3.62,3.62,0,0,1-3.57,2.82H37.47c1.32,4.88,2.63,7.51,4.42,8.74,2.16,1.4,5.92,1.5,12.21,1.4H96.64a3.67,3.67,0,1,1,0,7.33H54.19c-7.79.09-12.58-.09-16.44-2.63s-6-7.14-8.07-15.31h0L17.09,16.52c0-.09,0-.09-.09-.19a6.51,6.51,0,0,0-2.82-4.22A9.51,9.51,0,0,0,9,10.89H3.66ZM60.87,33.47a2.6,2.6,0,0,1,5.11,0V47.63a2.6,2.6,0,0,1-5.11,0V33.47Zm-15.3,0a2.6,2.6,0,0,1,5.11,0V47.63a2.6,2.6,0,0,1-5.11,0V33.47ZM85.66,86.4a9,9,0,1,1-9,9,9,9,0,0,1,9-9Zm-39.55,0a9,9,0,1,1-9,9,9,9,0,0,1,9-9Zm64.08-62.91V28.3a2.09,2.09,0,0,1-2.07,2.07h-6.66V37a2.08,2.08,0,0,1-2.07,2.07H94.58A2.07,2.07,0,0,1,92.51,37V30.37H85.85a2.08,2.08,0,0,1-2.07-2.07V23.49a2.07,2.07,0,0,1,2.07-2.07h6.66V14.76a2.07,2.07,0,0,1,2.07-2.07h4.81a2.08,2.08,0,0,1,2.07,2.07v6.66h6.66a2.08,2.08,0,0,1,2.07,2.07Z'/%3E%3C/svg%3E");
}
.home #store ul.products {
  width: 100%;
}
@media (min-width:640px) {
  .page.store main img {
    max-height: 300px;
    position: sticky;
    top: 10px;
  }
  .page.store main .addToCart,
  .page.store main .buyNow {
    background-size: 18%;
  }
  .page.store main > div {
    grid-column: span 2/span 2;
  }
  .page.store main {
    grid-template-columns: repeat(2,minmax(0,1fr));
  }
  .home #store ul.products {
    max-width: 640px;
  }
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
  #cart > div button {
    padding: .25rem;
    font-size: 1rem;
    line-height: 1.5rem;
  }
  .page.store main > div:first-of-type {
    grid-column: span 1/span 1;
  }
  .home #store ul.products {
    max-width: 768px;
  }
  #related .posts li.product,
  .home #store .posts li.product,
  .page .posts li.product {
    width: calc(50% - 2rem);
    margin: 1rem;
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
  .contact .error,
  .contact .success {
    margin: 2rem;
    padding: 2rem;
    grid-column-start: 2;
    grid-column-end: 2;
  }
  .contact form ~ .error,
  .contact form ~ .success {
    margin: 0;
    padding: .75rem 1rem;
  }
  #cart > div button {
    padding: .5rem;
    font-size: 1rem;
    line-height: 1.5rem;
  }
  .page.store main > div {
    grid-column: span 3/span 3;
  }
  .page.store main > div:first-of-type {
    grid-column: span 2/span 2;
  }
  .page.store main .addToCart,
  .page.store main .buyNow {
    padding-left: 3.5rem;
  }
  .page.store main {
    grid-template-columns: repeat(3,minmax(0,1fr));
  }
  .home #store ul.products {
    max-width: 1024px;
  }
}
@media (min-width:1280px) {
  .news .content {
    column-count: auto;
    column-count: 4;
  }
  .home #store ul.products {
    max-width: 1280px;
  }
  #related .posts li.product,
  .home #store .posts li.product,
  .page .posts li.product {
    width: calc(33% - 2rem);
    margin: 1rem;
  }
}
@media (min-width:1536px) {
  #related,
  .blog #content aside,
  .comments,
  .home #store ul.products,
  .store section {
    max-width: 1536px;
  }
}
#related ul.products,
.home #store ul.products,
.page ul.products {
  display: grid;
  align-items: stretch;
  justify-content: space-around;
  margin: 4rem auto;
  padding-left: 1.25rem;
  padding-right: 1.25rem;
  gap: 1rem;
  grid-template-columns: repeat(1,minmax(0,1fr));
}
#related ul.products h2,
.home #store ul.products h2,
.page ul.products h2 {
  font-weight: 700;
  font-size: 1.5rem;
  line-height: 2rem;
  margin-right: 0;
  margin-bottom: 0;
  margin-left: 0;
  padding: 2rem 1rem .75rem;
  color: #1f2937;
}
#related .posts li.product h2,
.home #store .posts li.product h2,
.page .posts li.product h2 {
  font-weight: 700;
  font-size: 1.5rem;
  line-height: 2rem;
  margin-right: 0;
  margin-bottom: 0;
  margin-left: 0;
  padding: 2rem 1rem .75rem;
  text-align: left;
  color: #1f2937;
}
#related li.product,
.home #store li.product,
.page li.product {
  background-color: #f3f4f6;
  border-radius: .375rem;
  display: inline-block;
  display: flex;
  flex-direction: column;
  place-content: stretch;
  overflow: hidden;
  padding-bottom: 2rem;
  position: relative;
  box-shadow: 0 0 transparent,0 0 transparent,0 4px 6px -1px rgba(0,0,0,.1),0 2px 4px -1px rgba(0,0,0,.06);
  width: 100%;
}
#related li.product:hover,
.home #store li.product:hover,
.page li.product:hover {
  background-color: #fff;
  box-shadow: 0 0 transparent,0 0 transparent,0 10px 15px -3px rgba(0,0,0,.1),0 4px 6px -2px rgba(0,0,0,.05);
  transform: scale(1.02);
}
#related li.product:hover img,
.home #store li.product:hover img,
.page li.product:hover img {
  filter: saturate(2);
}
#related li.product:hover .price,
#related li.product:hover h2,
.home #store li.product:hover .price,
.home #store li.product:hover h2,
.page li.product:hover .price,
.page li.product:hover h2 {
  color: #000;
}
#related li.product > a,
.home #store li.product > a,
.page li.product > a {
  background-color: transparent;
  border-radius: 0;
  cursor: pointer;
  display: inline-block;
  overflow: hidden;
  box-shadow: 0 0 transparent,0 0 transparent,0 0 transparent;
  width: 100%;
  transform: translateX(0) translateY(0) rotate(0) skewX(0) skewY(0) scaleX(1) scaleY(1);
  transition-property: all;
  transition-timing-function: cubic-bezier(.4,0,.2,1);
  transition-duration: .3s;
  text-decoration: none;
}
#related li.product > a img,
.home #store li.product > a img,
.page li.product > a img {
  background-color: #f3f4f6;
  height: 12rem;
  object-fit: cover;
  width: 100%;
  box-shadow: inset 0 0 240px rgba(var(--red), var(--green), var(--blue), .6);
  object-position: bottom center;
}
#related li.product > a .price,
.home #store li.product > a .price,
.page li.product > a .price {
  font-weight: 400;
  font-size: 1.25rem;
  line-height: 1.75rem;
  padding-left: 1rem;
  padding-right: 1rem;
  padding-bottom: 1rem;
  color: #4b5563;
}
#related li.product > a .price:first-letter,
.home #store li.product > a .price:first-letter,
.page li.product > a .price:first-letter {
  display: inline-block;
  font-size: .875rem;
  line-height: 1.25rem;
  padding-right: 0;
  color: #374151;
  vertical-align: top;
}
#related li.product > a .rating,
.home #store li.product > a .rating,
.page li.product > a .rating {
  background-color: transparent;
  font-weight: 700;
  height: 2rem;
  font-size: .875rem;
  margin-top: 2rem;
  position: absolute;
  right: 1rem;
  top: 12rem;
  box-shadow: 0 0 transparent,0 0 transparent,0 0 transparent;
  text-align: center;
  color: #1f2937;
  width: 5rem;
  line-height: 2rem!important;
}
#related li.product button,
.home #store li.product button,
.page li.product button {
  border-radius: .75rem;
  border: 2px solid rgb(var(--red), var(--green), var(--blue));
  display: inline-block;
  font-weight: 400;
  line-height: 1.5rem;
  margin-left: auto;
  margin-right: auto;
  padding: .25rem .5rem;
  color: rgb(var(--red), var(--green), var(--blue));
  text-decoration: none;
  transition-property: background-color,border-color,color,fill,stroke,opacity,box-shadow,transform,filter,backdrop-filter;
  transition-timing-function: cubic-bezier(.4,0,.2,1);
  transition-duration: .15s;
  background-color: rgb(var(--red), var(--green), var(--blue));
  position: absolute;
  right: 1rem;
  bottom: 2rem;
  font-size: 0!important;
  width: 3rem;
  height: 3rem;
  background-position: 50%;
  background-repeat: no-repeat;
  background-size: 60%;
}
#related li.product button:hover,
.home #store li.product button:hover,
.page li.product button:hover {
  background-color: rgb(var(--red), var(--green), var(--blue));
  color: #fff;
  text-decoration: none;
  box-shadow: 0 0 transparent,0 0 transparent,0 10px 15px -3px rgba(0,0,0,.1),0 4px 6px -2px rgba(0,0,0,.05);
}
@media (min-width:768px) {
  #related li.product button,
  .home #store li.product button,
  .page li.product button {
    font-size: 1.125rem;
    line-height: 1.75rem;
    padding: .5rem 1rem;
  }
  #related ul.products,
  .home #store ul.products,
  .page ul.products {
    grid-template-columns: repeat(2,minmax(0,1fr));
  }
}
@media (min-width:1024px) {
  #related li.product > a img,
  .home #store li.product > a img,
  .page li.product > a img {
    height: 16rem;
  }
  #related li.product > a .rating,
  .home #store li.product > a .rating,
  .page li.product > a .rating {
    font-size: 1rem;
    line-height: 1.5rem;
    top: 16rem;
    width: 6rem;
  }
  #related li.product button,
  .home #store li.product button,
  .page li.product button {
    padding: .75rem 1.25rem;
  }
  #related ul.products,
  .home #store ul.products,
  .page ul.products {
    grid-template-columns: repeat(3,minmax(0,1fr));
  }
  #related li.product,
  .home #store li.product,
  .page li.product {
    width: 100%;
  }
}
.alert {
  position: fixed;
  top: 1.5rem;
  right: 1rem;
  margin: 0;
  width: 20rem;
  max-width: 100%;
}
.alert .head {
  font-weight: 700;
  color: #065f46;
}
.alert .close {
  font-size: 0;
  background-position: 50%;
  display: block;
  height: 1rem;
  opacity: .8;
  overflow: hidden;
  position: absolute;
  top: .5rem;
  right: .5rem;
  width: 1rem;
  background-image: url("data:image/svg+xml,%0A%3Csvg id='Layer_1' data-name='Layer 1' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 122.87 122.87'%3E%3Ctitle%3Eremove%3C/title%3E%3Cpath fill='rgb(6, 95, 70)' d='M18,18A61.45,61.45,0,1,1,0,61.44,61.28,61.28,0,0,1,18,18ZM77.38,39l6.53,6.54a4,4,0,0,1,0,5.63L73.6,61.44,83.91,71.75a4,4,0,0,1,0,5.63l-6.53,6.53a4,4,0,0,1-5.63,0L61.44,73.6,51.13,83.91a4,4,0,0,1-5.63,0L39,77.38a4,4,0,0,1,0-5.63L49.28,61.44,39,51.13a4,4,0,0,1,0-5.63L45.5,39a4,4,0,0,1,5.63,0L61.44,49.28,71.75,39a4,4,0,0,1,5.63,0ZM61.44,10.54a50.91,50.91,0,1,0,36,14.91,50.83,50.83,0,0,0-36-14.91Z'/%3E%3C/svg%3E");
}
.alert .close:hover {
  opacity: 1;
}
.colors label {
  width: auto !important;
}
.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0,0,0,0);
  border: 0;
}

.editor #app .loader  {
  color: #ffffff;
  font-size: 90px;
  text-indent: -9999em;
  overflow: hidden;
  width: 1em;
  height: 1em;
  border-radius: 50%;
  margin: 72px auto;
  position: relative;
  -webkit-transform: translateZ(0);
  -ms-transform: translateZ(0);
  transform: translateZ(0);
  -webkit-animation: load6 1.7s infinite ease, round 1.7s infinite ease;
  animation: load6 1.7s infinite ease, round 1.7s infinite ease;
}
@keyframes load6 {
  0% {
    box-shadow: 0 -0.83em 0 -0.4em, 0 -0.83em 0 -0.42em, 0 -0.83em 0 -0.44em, 0 -0.83em 0 -0.46em, 0 -0.83em 0 -0.477em;
  }
  5%,
  95% {
    box-shadow: 0 -0.83em 0 -0.4em, 0 -0.83em 0 -0.42em, 0 -0.83em 0 -0.44em, 0 -0.83em 0 -0.46em, 0 -0.83em 0 -0.477em;
  }
  10%,
  59% {
    box-shadow: 0 -0.83em 0 -0.4em, -0.087em -0.825em 0 -0.42em, -0.173em -0.812em 0 -0.44em, -0.256em -0.789em 0 -0.46em, -0.297em -0.775em 0 -0.477em;
  }
  20% {
    box-shadow: 0 -0.83em 0 -0.4em, -0.338em -0.758em 0 -0.42em, -0.555em -0.617em 0 -0.44em, -0.671em -0.488em 0 -0.46em, -0.749em -0.34em 0 -0.477em;
  }
  38% {
    box-shadow: 0 -0.83em 0 -0.4em, -0.377em -0.74em 0 -0.42em, -0.645em -0.522em 0 -0.44em, -0.775em -0.297em 0 -0.46em, -0.82em -0.09em 0 -0.477em;
  }
  100% {
    box-shadow: 0 -0.83em 0 -0.4em, 0 -0.83em 0 -0.42em, 0 -0.83em 0 -0.44em, 0 -0.83em 0 -0.46em, 0 -0.83em 0 -0.477em;
  }
}

@keyframes round {
  0% {
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}

.editor .designeditor .logo-item label.logo {
    {{with resources.Get "image/favicon.png"}}
    background-image: url('{{(
      (. |
      images.Filter (images.Grayscale) (images.Contrast 100)
      (images.Invert)
      ).Resize "128x").Permalink }}');
    {{end}}
}

.editor header img {
  filter: grayscale() invert();
}

.editor {
  justify-content: start;
  background: #25292e;
}

.editor header {
  background: #25292e;
  padding: 1rem 1rem 0;
  color: #fff;
  max-width: 100vw;
}

.editor #search {
  z-index: 999999;
  filter:invert();
}

.editor #search img {
  filter:invert();
}

.editor footer {
  display: none;
}

.editor .debug {
  display: none;
}

.editor .status-selector {
  display: none !important;
}

.editor header nav ul > li ul {
  z-index: 999999;
}

.editor #app {
  position: absolute;
  left: 0;
  right: 0;
  top: 60px;
  border-top: 1px solid #BBB;
  max-width: 100vw;
  margin: 0;
  bottom: 0;
}
.transform {
  transform: translateX(0) translateY(0) rotate(0) skewX(0) skewY(0) scaleX(1) scaleY(1);
}
