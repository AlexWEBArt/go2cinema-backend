const Router = require('koa-router');
const router = new Router();
const mysql2 = require('mysql2/promise');

const dbConfig = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'go2cinemaDB',
  };

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
      console.error("Error removing hall:", error);
      ctx.response.status = 403;
      ctx.response.body = JSON.stringify({ message: error.message });
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
  
      if (requestData.hall_rows !== undefined) {
        updateFields.push("`hall_rows` = ?");
        updateValues.push(requestData.hall_rows);
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
      if (!ctx.request.body || isNaN(ctx.request.body.hall_id)) {
        ctx.response.status = 400;
        ctx.response.body = JSON.stringify({ message: "invalid data" });
        return
      }
  
      const connection = await mysql2.createConnection(dbConfig);
  
      const requestData = ctx.request.body;
  
      let updateFields = [];
      let updateValues = [];
  
      if (requestData.hall_open !== undefined) {
        updateFields.push("`hall_open` = ?");
        updateValues.push(requestData.hall_open);
      }
  
      updateValues.push(requestData.hall_id);
  
      const [result] = await connection.execute(
        `UPDATE \`halls\` SET ${updateFields.join(', ')} WHERE \`hall_id\` = ?`,
        updateValues
      );
      console.log(result)
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

module.exports = router;