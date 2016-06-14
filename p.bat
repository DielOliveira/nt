git add .
git commit -am "ok"
git push origin master
git push heroku master
heroku run rake assets:clean