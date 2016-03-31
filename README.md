# Docker-afs
A docker image that creates a single AFS server and a docker image that is an AFS client.

# What you get
 - An AFS server with
   - A protection database server
   - A volume location server
   - A backup server
   - Demand-attach file server
   - An AFS admin user (by default afsadmin.admin)
 - An AFS client where you can run AFS functions

## Running
Just run `./start.sh` on the root directory of this repo.

You will need to have [Vagrant installed](https://www.vagrantup.com/docs/installation/).

## How to customize (eg. change the CELL_NAME)

 1. Change the file `afs.env`. This way the properties will be shared between the various containers.
 1. Define environment variables in `docker-compose.yml`. You will need to define them for each service that uses AFS.

You can also customize Kerberos parameters in the `kerberos.env` file.

## Sugested usage of this repo
This repository has designed to bootstrap the creation of an AFS server for projects that need an AFS installation to perform tests.

For example: you have a project that uses AFS and you need to test it against a working AFS installation.
You will need to create in your project repository the necessary files to setup an AFS server. To bootstrap that process you
can simply copy this repository files to your project and them modify them so that you can test your
application inside the afs-client container.

If you want to keep up with the possible changes of this repo, you can use:
 - [git submodules](https://medium.com/@porteneuve/mastering-git-submodules-34c65e940407#.a2hp3b6wa)
 - [git fake submodules](http://debuggable.com/posts/git-fake-submodules:4b563ee4-f3cc-4061-967e-0e48cbdd56cb)
 - [git subtrees](https://medium.com/@porteneuve/mastering-git-subtrees-943d29a798ec#.zcxs92mvl)

## License
docker-afs is open source and available under the [MIT license](LICENSE).
