##Docker Dev Proxy

__To run:__  

`docker-compose run --rm app rake db:setup`

`docker-compose run --rm app rake create_user`   
_insert info_

`docker-compose up`   


__Edit `etc/hosts`__

add a line  
`{docker-machine IP}     domain.com`

__In browser:__

navigate to `domain.com` 

_use the info you've provided to log in_
