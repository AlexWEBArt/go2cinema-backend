const http = require('http');
const fs = require('fs');
const Koa = require('koa');
const Router = require('koa-router');
const cors = require('koa2-cors');
const koaBody = require('koa-body');
const mysql = require('koa-mysql')

const mysql2 = require('mysql2/promise');

const app = new Koa();
app.use(cors());
app.use(koaBody({
    json: true
}));

// Создаем подключение для выполнения SQL-скрипта


app.use(async (ctx) => {
    try {
        const connection = await mysql2.createConnection({
            host: 'localhost',
            user: 'root',
            password: '',
            database: 'go2cinemaDB',
        });
        // Ваш SQL-скрипт для создания таблиц
        const createTablesSQL = `
            CREATE TABLE halls (
                id INTEGER AUTO_INCREMENT PRIMARY KEY,
                hall_name VARCHAR(255) NOT NULL,
                hall_row VARCHAR(255) NOT NULL,
                hall_places VARCHAR(255) NOT NULL
            );
        `;

        // Выполняем SQL-скрипт для создания таблиц
        await connection.query(createTablesSQL);

        ctx.body = 'Tables created successfully';
    } catch (err) {
        ctx.status = 500;
        ctx.body = { error: err.message };
    }
});

const port = process.env.PORT || 7071;
const server = http.createServer(app.callback());
server.listen(port);
console.log('Server listening on port ' + port);
console.log('Server listening on port ' + port);