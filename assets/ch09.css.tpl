.testimonials .twitter-tweet {
  padding: 0;
  margin: 0;
  font-size: 0;
}

.testimonials .twitter-tweet * {
  display: none;
}

.testimonials .twitter-tweet>p:first-child {
  display: block;
  font-size: initial;
}

.contact .map {
  position: relative;
}

.contact .contact-backdrop {
  height: 400px;
  width: 100%;
  object-fit: cover;
}

.contact .marker {
  position: absolute;
  left: calc(50% - 10px);
  width: 40px;
  height: 50px;
  top: calc(50% - 25px);
  animation-name: bounceInDown;
  animation-duration: 0.5s;
}

.contact .attribution {
  font-size: 10px;
  text-align: right;
}


@keyframes bounceInDown {

  from,
  60%,
  75%,
  90%,
  to {
    animation-timing-function: cubic-bezier(0.215, 0.61, 0.355, 1);
  }

  0% {
    opacity: 0;
    transform: translate3d(0, -100px, 0) scaleY(3);
  }

  60% {
    opacity: 1;
    transform: translate3d(0, 25px, 0) scaleY(0.9);
  }

  75% {
    transform: translate3d(0, -10px, 0) scaleY(0.95);
  }

  90% {
    transform: translate3d(0, 5px, 0) scaleY(0.985);
  }

  to {
    transform: translate3d(0, 0, 0);
  }
}

.contact main {
  background: white;
  padding: 20px;
  box-shadow: 1px 1px 4px #888;
}

.contact form label {
  text-align: left;
  display: block;
  font-size: 12px;
}

input,
textarea,
select,
button {
  border: 1px solid #eee;
  border-radius: 0;
  min-height: 35px;
  margin-bottom: 30px;
  width: 100%;
  padding: 0;
  font-weight: lighter;
  text-shadow: 2px 2px 2px #ddd;
  font-family: -apple-system, BlinkMacSystemFont, segoe ui, Roboto, Oxygen, Ubuntu, Cantarell, open sans, helvetica neue, sans-serif;
  font-size: 14px;
}

select {
  appearance: none;
  line-height: 35px;
  background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22{{$.Param "color"}}%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E');
  background-repeat: no-repeat,
    repeat;
  background-position: right .7em top 50%,
    0 0;
  background-size: .65em auto,
    100%;
}

.contact button {
  padding: 0px 10px;
}

input,
select {
  padding: 0px 10px;
  width: calc(100% - 20px);
}

textarea {
  padding: 10px;
  width: calc(100% - 20px);
}

.contact textarea {
  padding: 10px;
}

input:focus,
select:focus,
.contact textarea:focus {
  color: #111;

  outline: 1px solid {
      {
      $.Param "color"
    }
  }

  ;
}

button:hover {
  color: #fff;

  background: {
      {
      $.Param "color"
    }
  }

  ;
  cursor: pointer;
}

.survey main {
  text-align: left;
}

.survey ol li {
  padding: 20px;
}

.survey label~* {
  float: right;
  width: 200px;
  margin-left: 10px;
  margin-bottom: 0;
}

.survey label~input {
  width: 180px;
}
