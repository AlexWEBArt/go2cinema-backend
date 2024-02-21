const Router = require('koa-router');
const router = new Router();
const mysql2 = require('mysql2/promise');

const dbConfig = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'go2cinemaDB',
  };

router.post("/addFilm", async (ctx) => {
    try {
      if (!ctx.request.body) {
        ctx.response.status = 400;
        ctx.response.body = JSON.stringify({ message: "invalid data" });
        return
      }
  
      const connection = await mysql2.createConnection(dbConfig);
  
      const requestData = ctx.request.body
  
      const [result] = await connection.execute(
        'INSERT INTO `films` (`film_name`, `film_description`, `film_duration`, `film_origin`, `film_poster`) VALUES (?, ?, ?, ?, ?)',
        [
          requestData.film_name,
          requestData.film_description || null,
          requestData.film_duration || null,
          requestData.film_origin || null,
          requestData.film_poster || null,
        ]
      );
      console.log(result)
  
      if (result.affectedRows === 1) {
        ctx.response.status = 200;
        ctx.response.body = JSON.stringify({ message: "Film added" });
      } else {
        ctx.response.status = 500;
        ctx.response.body = JSON.stringify({ message: "Failed to add film" });
      }
    } catch (error) {
      console.error("Error adding film:", error);
      ctx.response.status = 500;
      ctx.response.body = JSON.stringify({ message: "Server internal error" });
    }
  });
  
  router.post("/removeFilm", async (ctx) => {
    try {
      if (!ctx.request.body || isNaN(ctx.request.body.film_id)) {
        ctx.response.status = 400;
        ctx.response.body = JSON.stringify({ message: "invalid data" });
        return
      }
  
      const connection = await mysql2.createConnection(dbConfig);
  
      const [result] = await connection.execute(
        'DELETE FROM `films` WHERE `film_id` = (?)',
        [ctx.request.body.film_id]
      );
      console.log(result)
      if (result.affectedRows === 0) {
        ctx.response.status = 404;
        ctx.response.body = JSON.stringify({ message: "Film not found" });
      } else {
        ctx.response.status = 200;
        ctx.response.body = JSON.stringify({ message: "Film deleted successfully" });
      }
    } catch (error) {
      console.error("Error removing film:", error);
      ctx.response.status = 403;
      ctx.response.body = JSON.stringify({ message: error.message });
    }
  });

module.exports = router;