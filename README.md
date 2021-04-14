# Rails Cheat Sheet App

## Development with docker-compose

### Prerequisites

1. Install docker
2. Add an alias for docker-compose for ease use

```
echo "alias dcdev='docker-compose -f docker-compose-dev.yml'" >> ~/.bashrc

# For Oh My Zsh
echo "alias dcdev='docker-compose -f docker-compose-dev.yml'" >> ~/.zshrc
```

3. Reload your rc file

```
. ~/.bashrc

# For Oh My Zsh
. ~/.zshrc
```

4. For redis, add `vm.overcommit_memory = 1` to your `/etc/sysctl.conf`

### First run

1. Copy and edit `.env` file 
   
`cp docker_dev/.env_docker.example docker_dev/.env_docker`

2. Build an image 
   
`dcdev build`

3. Run app 
   
`dcdev up`

4. Create a database 
   
`dcdev run web bundle exec rails db:create`

### Regular dev workflow

1. Run `dcdev up` and you are good to go
2. To run any rails related command, just shell in `dcdev run web bash`
3. You can use and add any aliases you want, see `docker_dev/Dockerfile`. Don't forget to rebuild an image `dcdev build`
