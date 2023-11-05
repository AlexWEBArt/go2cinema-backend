const http = require('http');
const fs = require('fs');
const Koa = require('koa');
const Router = require('koa-router');
const cors = require('koa2-cors');
const koaBody = require('koa-body');

const mysql2 = require('mysql2/promise');

const app = new Koa();
app.use(cors());
app.use(koaBody({
    json: true
}));

const dbConfig = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'go2cinemaDB',
};

const router = new Router();

router.get('/getlist', async (ctx) => {
    try {
        const connection = await mysql2.createConnection(dbConfig);

        const [films] = await connection.execute('SELECT * FROM films');
        const [halls] = await connection.execute('SELECT * FROM halls');
        const [seances] = await connection.execute('SELECT * FROM seances');
    
        connection.end()

        ctx.body = { films, halls, seances };
    } catch (err) {
        ctx.status = 500;
        ctx.body = { error: err.message };
        console.error('Error:', err);
    }
});

app.use(router.routes()).use(router.allowedMethods());

const port = process.env.PORT || 7070;
const server = http.createServer(app.callback());
server.listen(port);
console.log('Server listening on port ' + port);