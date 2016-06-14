git add .
git commit -am "ok"
git push origin2 master
git push heroku master
heroku run rake assets:reset
heroku run rake assets:precompile