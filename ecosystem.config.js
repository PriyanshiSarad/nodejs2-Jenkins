module.exports = {
    apps : [{
      name   : "express_web_server",
      cwd    : "/home/ubuntu/pm2-apps/express-web-server",
      script : "app.js",
      env    : {
        "EXPRESS_PORT" : 3011
      }
    }]
  }