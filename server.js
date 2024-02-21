const http = require('http');
const fs = require('fs');
const Koa = require('koa');
const cors = require('koa2-cors');
const koaBody = require('koa-body');
const session = require('koa-session');
const passport = require('./routes/login/passport.js');

require('dotenv').config();


const app = new Koa();
app.use(cors());
app.use(koaBody({
  json: true
}));

app.keys = [''];
app.use(session({}, app));

app.use(passport.initialize());
app.use(passport.session());

const router = require('./routes');

app.use(router());

const port = process.env.PORT;
const server = http.createServer(app.callback());
server.listen(port);
console.log('Server listening on port ' + port);