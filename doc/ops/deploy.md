Deploy
====

1. Create app on heroku 

```
heroku apps:create cgl-stg
heroku addons:create heroku-postgresql:hobby-dev -a cgl-stg
heroku git:remote --remote stg -a cgl-stg
```

1. Deploy

```
bin/deploy/stg
```
