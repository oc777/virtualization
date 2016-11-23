##Docker Production


__To run:__  

`docker-compose run --rm app rake db:setup`

`docker-compose run --rm app rake create_user`   
_insert info_


if DB needs to be migrated run:  
`docker-compose run --rm app rake db:migrate` 


Precompile all static files / assets:  
`docker-compose run --rm app rake assets:precompile` 


`docker-compose up`   


__Edit `etc/hosts`__

add a line (if not there)  
`{docker-machine IP}     domain.com`

__In browser:__

navigate to `domain.com` 

_use the info you've provided to log in_


__Before pushing to GitHub__

- remove DB user and password from `docker-compose.yml`
- `gitignore` the `.env` file


