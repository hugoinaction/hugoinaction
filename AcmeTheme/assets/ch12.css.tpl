.store aside {
  border: none;
  width: 400px;
}
.store aside img {
  width: 100%;
}

.store main  {
  text-align: left;
}

.store section {
  background: white;
  padding: 0;
}

.store .price .value {
  font-size: 24px;
  color:  {{$.Param "color"}};
}

.store aside button {
  margin: 10px 0;
}

.store main {
  width: 100%;
}

.store .card {
  width: 250px;
  display: inline-block;
  vertical-align: top;
  padding: 20px;
  margin: 10px;
  box-shadow: 1px 2px 2px 2px #DDD;
}

.store .card-img-top {
  width: 100%;
}

.store .card-title {
  height: 28px;
  font-size: 28px;
}

.store .card-text {
  height: 60px;
  padding-bottom: 20px;
  overflow: auto;

}

.store main .content {
  padding: 20px;
}

@media only screen and (min-width: 768px) {

  aside~main {
    max-width: calc(100% - 400px);
  }
}

@media only screen and (min-width: 992px) {
  aside~main {
    max-width: 400px;
  }
}

@media only screen and (min-width: 1200px) {

  aside~main {
    max-width: 600px;
  }
}
