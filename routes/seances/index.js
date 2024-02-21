const Router = require('koa-router');
const router = new Router();
const mysql2 = require('mysql2/promise');

const dbConfig = {
  host: 'sql11.freesqldatabase.com',
  user: 'sql11685890',
  password: 'AeUwJCMkuI',
  database: 'sql11685890',
  };

router.post("/createSeance", async (ctx) => {
    try {
      const requestData = ctx.request.body;
  
      if (!requestData.seance_filmid || !requestData.seance_hallid || !requestData.seance_time || !requestData.seance_start || !requestData.seance_end || !requestData.seance_config) {
        ctx.response.status = 400;
        ctx.response.body = JSON.stringify({ message: "Invalid data" });
        return;
      }
  
      const connection = await mysql2.createConnection(dbConfig);
  
      const [result] = await connection.execute(
        'INSERT INTO `seances`(`seance_filmid`, `seance_hallid`, `seance_time`, `seance_start`, `seance_end`, `seance_config`) VALUES (?, ?, ?, ?, ?, ?)',
        [
          requestData.seance_filmid,
          requestData.seance_hallid,
          requestData.seance_time,
          requestData.seance_start,
          requestData.seance_end,
          requestData.seance_config
        ]
      );
      console.log(result)
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

  router.post("/updateSeanceConfig", async (ctx) => {
    try {
      console.log(ctx.request.body)
      if (!ctx.request.body || isNaN(ctx.request.body.seance_id)) {
        ctx.response.status = 400;
        ctx.response.body = JSON.stringify({ message: "invalid data" });
        return
      }

      const connection = await mysql2.createConnection(dbConfig);
  
      const requestData = ctx.request.body;
  
      let updateFields = [];
      let updateValues = [];
  
      if (requestData.seance_config !== undefined) {
        updateFields.push("`seance_config` = ?");
        updateValues.push(requestData.seance_config);
      }
  
      updateValues.push(requestData.seance_id);
  
      const [result] = await connection.execute(
        `UPDATE \`seances\` SET ${updateFields.join(', ')} WHERE \`seance_id\` = ?`,
        updateValues
      );

      console.log(result)
      if (result.affectedRows === 1) {
        ctx.response.status = 200;
        ctx.response.body = JSON.stringify({ message: "Seance Update" });
      } else {
        ctx.response.status = 500;
        ctx.response.body = JSON.stringify({ message: "Failed to update seance" });
      }
  
    } catch (error) {
      console.error("Error update seance:", error);
      ctx.response.status = 500;
      ctx.response.body = JSON.stringify({ message: "Server internal error" });
    }
  })
  
  router.post("/removeSeance", async (ctx) => {
    try {
      if (!ctx.request.body || isNaN(ctx.request.body.seance_id)) {
        ctx.response.status = 400;
        ctx.response.body = JSON.stringify({ message: "invalid data" });
        return
      }
  
      const connection = await mysql2.createConnection(dbConfig);
  
      const [result] = await connection.execute(
        'DELETE FROM `seances` WHERE `seance_id` = (?)',
        [ctx.request.body.seance_id]
      );
      console.log(result)
      if (result.affectedRows === 0) {
        ctx.response.status = 404;
        ctx.response.body = JSON.stringify({ message: "Seance not found" });
      } else {
        ctx.response.status = 200;
        ctx.response.body = JSON.stringify({ message: "Seance deleted successfully" });
      }
    } catch (error) {
      console.error("Error deleting seance:", error);
      ctx.response.status = 500;
      ctx.response.body = JSON.stringify({ message: "Server internal error" });
    }
  });

module.exports = router;