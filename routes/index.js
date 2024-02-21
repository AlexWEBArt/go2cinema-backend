const combineRouters = require('koa-combine-routers');

const login = require('./login');
const getList = require('./getList');
const halls = require('./halls');
const films = require('./films');
const seances = require('./seances');

const router = combineRouters(
    login,
    getList,
    halls,
    films,
    seances
);

module.exports = router;