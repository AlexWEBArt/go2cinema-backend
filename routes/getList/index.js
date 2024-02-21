const Router = require('koa-router');
const router = new Router();
const mysql2 = require('mysql2/promise');

const dbConfig = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'go2cinemaDB',
  };

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

module.exports = router;