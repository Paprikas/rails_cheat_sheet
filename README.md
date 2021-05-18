# Rails Cheat Sheet App

## Development with docker-compose (optional)

### Prerequisites

1. [Install docker](https://docs.docker.com/get-docker/)
2. Add an alias for `docker-compose` for ease use

```bash
echo "alias dcdev='docker-compose -f docker-compose-dev.yml'" >> ~/.bashrc

# For Oh My Zsh
echo "alias dcdev='docker-compose -f docker-compose-dev.yml'" >> ~/.zshrc
```

3. Reload your rc file

```bash
. ~/.bashrc

# For Oh My Zsh
. ~/.zshrc
```

4. For Redis, add `vm.overcommit_memory = 1` to your `/etc/sysctl.conf`

### First run

1. Copy and edit `.env` file 
   
```bash
cp docker_dev/.env_docker.example docker_dev/.env_docker
```

2. Build an image 

```bash
dcdev build
```

3. Run app 

```bash
dcdev up
```

4. Create a Database 

```bash
dcdev run web bundle exec rails db:create
```

5. Run migrations

```bash
dcdev run web bundle exec rails db:migrate
```

### Regular dev workflow

1. Run `dcdev up` and you are good to go.
2. To run any Rails related command, just shell `dcdev run web bash` and execute anything you want inside container.
3. You can use or add any aliases you want, see `docker_dev/Dockerfile`. Don't forget to rebuild an image: Run `dcdev down` to stop everything and `dcdev build` to rebuild
4. You might have an issues on Linux OS with permissions on files that created by Docker. Just run chown `sudo chown -R YOUR_USER:YOUR_GROUP .`
