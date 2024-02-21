const Router = require('koa-router');
const router = new Router();
const bodyParser = require('koa-bodyparser');
const LocalStrategy = require('passport-local').Strategy;
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const passport = require('koa-passport');

const admin = {
    username: 'admin',
    password: 'admin', // Хешированный пароль - admin
    id: 1,
  }

passport.use(new LocalStrategy(
    async function(username, password, done) {
      const passwordHash = await bcrypt.hash(admin.password, 6)
      console.log(passwordHash)
      console.log(password)
      try {
        if (admin.username !== username) {
          return done(null, false, { message: 'user not found' });
        }
  
        const passwordMatch = await bcrypt.compare(password, passwordHash);
  
        if (!passwordMatch) {
          return done(null, false, { message: 'invalid password' });
        }
  
        return done(null, admin);
      } catch (error) {
        return done(error);
      }
    }
  ));
  
  passport.serializeUser((user, done) => {
    done(null, user.id);
  });
  
  passport.deserializeUser((id, done) => {
    try {
      // Здесь можно получить пользователя из базы данных по id
      if (id === admin.id) {
        return done(null, admin);
      } else {
        return done(null, false);
      }
    } catch (error) {
      return done(error);
    }
  });

 module.exports = passport;