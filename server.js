const http = require('http');
const fs = require('fs');
const Koa = require('koa');
const Router = require('koa-router');
const cors = require('koa2-cors');
const koaBody = require('koa-body');

const mysql2 = require('mysql2/promise');

const admin = {
  login: 'admin',
  password: 'admin'
}

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

router.post("/login", async (ctx) => {
  try {
    const { login, password } = ctx.request.body;
    if (admin.login !== login) {
      ctx.response.status = 400;
      ctx.response.body = JSON.stringify({ message: "user not found" });
      return
    }

    if (admin.password !== password) {
      ctx.response.status = 400;
      ctx.response.body = JSON.stringify({ message: "invalid password" });
      return
    }

    ctx.response.status = 200;
    ctx.response.body = JSON.stringify({ message: "Admin login" });
  } catch (error) {
    ctx.response.status = 500;
    ctx.response.body = JSON.stringify({ message: "Server internal error" });
  }
});

router.post("/createHall", async (ctx) => {

  try {
    if (!ctx.request.body || !ctx.request.body.hall_name) {
      ctx.response.status = 400;
      ctx.response.body = JSON.stringify({ message: "invalid data" });
      return
    }

    const connection = await mysql2.createConnection(dbConfig);

    const [result] = await connection.execute(
      'INSERT INTO `halls`(`hall_name`) VALUES (?)',
      [ctx.request.body.hall_name]
    );
    console.log(result)
    ctx.response.status = 200;
    ctx.response.body = JSON.stringify({ message: "Hall Create" });
  } catch (error) {
    console.error("Error creating hall:", error);
    ctx.response.status = 500;
    ctx.response.body = JSON.stringify({ message: "Server internal error" });
  }
});

router.post("/removeHall", async (ctx) => {

  try {
    if (!ctx.request.body || isNaN(ctx.request.body.hall_id)) {
      ctx.response.status = 400;
      ctx.response.body = JSON.stringify({ message: "invalid data" });
      return
    }

    const connection = await mysql2.createConnection(dbConfig);

    const [result] = await connection.execute(
      'DELETE FROM `halls` WHERE `hall_id` = (?)',
      [ctx.request.body.hall_id]
    );
    console.log(result)
    if (result.affectedRows === 0) {
      ctx.response.status = 404;
      ctx.response.body = JSON.stringify({ message: "Hall not found" });
    } else {
      ctx.response.status = 200;
      ctx.response.body = JSON.stringify({ message: "Hall deleted successfully" });
    }
  } catch (error) {
    console.error("Error creating hall:", error);
    ctx.response.status = 500;
    ctx.response.body = JSON.stringify({ message: "Server internal error" });
  }
});

router.post("/updateHall", async (ctx) => {
  try {
    if (!ctx.request.body || isNaN(ctx.request.body.hall_id)) {
      ctx.response.status = 400;
      ctx.response.body = JSON.stringify({ message: "invalid data" });
      return
    }

    const connection = await mysql2.createConnection(dbConfig);

    const requestData = ctx.request.body;

    let updateFields = [];
    let updateValues = [];

    if (requestData.hall_name !== undefined) {
      updateFields.push("`hall_name` = ?");
      updateValues.push(requestData.hall_name);
    }

    if (requestData.hall_price_standart !== undefined) {
      updateFields.push("`hall_price_standart` = ?");
      updateValues.push(requestData.hall_price_standart);
    }

    if (requestData.hall_price_vip !== undefined) {
      updateFields.push("`hall_price_vip` = ?");
      updateValues.push(requestData.hall_price_vip);
    }

    if (requestData.hall_config !== undefined) {
      updateFields.push("`hall_config` = ?");
      updateValues.push(requestData.hall_config);
    }

    if (requestData.hall_places !== undefined) {
      updateFields.push("`hall_places` = ?");
      updateValues.push(requestData.hall_places);
    }

    if (requestData.hall_row !== undefined) {
      updateFields.push("`hall_row` = ?");
      updateValues.push(requestData.hall_row);
    }

    if (requestData.hall_open !== undefined) {
      updateFields.push("`hall_open` = ?");
      updateValues.push(requestData.hall_open);
    }

    if (updateFields.length === 0) {
      ctx.response.status = 400;
      ctx.response.body = JSON.stringify({ message: "No fields to update" });
      return;
    }

    updateValues.push(requestData.hall_id);

    const [result] = await connection.execute(
      `UPDATE \`halls\` SET ${updateFields.join(', ')} WHERE \`hall_id\` = ?`,
      updateValues
    );

    if (result.affectedRows === 0) {
      ctx.response.status = 404;
      ctx.response.body = JSON.stringify({ message: "Hall not found" });
    } else {
      ctx.response.status = 200;
      ctx.response.body = JSON.stringify({ message: "Hall updated successfully" });
    }
  } catch (error) {
    console.error("Error creating hall:", error);
    ctx.response.status = 500;
    ctx.response.body = JSON.stringify({ message: "Server internal error" });
  }
});

router.post("/openHall", async (ctx) => {
  try {
    const { login, password } = ctx.request.body;
    if (admin.login !== login) {
      ctx.response.status = 400;
      ctx.response.body = JSON.stringify({ message: "user not found" });
      return
    }

    if (admin.password !== password) {
      ctx.response.status = 400;
      ctx.response.body = JSON.stringify({ message: "invalid password" });
      return
    }

    ctx.response.status = 200;
    ctx.response.body = JSON.stringify({ message: "Admin login" });
  } catch (error) {
    ctx.response.status = 500;
    ctx.response.body = JSON.stringify({ message: "Server internal error" });
  }
});

router.post("/addFilm", async (ctx) => {
  try {
    if (!ctx.request.body) {
      ctx.response.status = 400;
      ctx.response.body = JSON.stringify({ message: "invalid data" });
      return
    }

    const connection = await mysql2.createConnection(dbConfig);

    const [result] = await connection.execute(
      'INSERT INTO `films` (`film_name`, `film_discription`, `film_duration`, `film_origin`, `film_poster`) VALUES (?, ?, ?, ?, ?)',
      [
        requestData.film_name,
        requestData.film_discription || null,
        requestData.film_duration || null,
        requestData.film_origin || null,
        requestData.film_poster || null,
      ]
    );

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

router.post("/createSeances", async (ctx) => {
  try {
    const requestData = ctx.request.body;

    if (!requestData.seance_filmid || !requestData.seance_hallid || !requestData.seance_time || !requestData.seance_start || !requestData.seance_end) {
      ctx.response.status = 400;
      ctx.response.body = JSON.stringify({ message: "Invalid data" });
      return;
    }

    const connection = await mysql2.createConnection(dbConfig);

    const [result] = await connection.execute(
      'INSERT INTO `seances`(`seance_filmid`, `seance_hallid`, `seance_time`, `seance_start`, `seance_end`) VALUES (?, ?, ?, ?, ?)',
      [
        requestData.seance_filmid,
        requestData.seance_hallid,
        requestData.seance_time,
        requestData.seance_start,
        requestData.seance_end,
      ]
    );

    if (result.affectedRows === 1) {
      ctx.response.status = 200;
      ctx.response.body = JSON.stringify({ message: "Seance Create" });
    } else {
      ctx.response.status = 500;
      ctx.response.body = JSON.stringify({ message: "Failed to create seance" });
    }

  } catch (error) {
    console.error("Error creating seance:", error);
    ctx.response.status = 500;
    ctx.response.body = JSON.stringify({ message: "Server internal error" });
  }
});

app.use(router.routes()).use(router.allowedMethods());

const port = process.env.PORT || 7070;
const server = http.createServer(app.callback());
server.listen(port);
console.log('Server listening on port ' + port);