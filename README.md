# alpine-passenger-rb

    Ruby application server with bundled NGINX and zero overhead

As a Ruby develeloper, I had to struggle with the conflict of Ruby's app servers not being good in serving static files and the requirement to publish a single process docker container with rockets attached.

With Phusion Passenger I can obtain both goals, as it is a Ruby application server with bundled NGINX web server.

For more information, have a look at https://www.phusionpassenger.com/.

## Why should you use it?

 * alpine linux
 * no rvm
 * no weird init process
 * just passenger + ruby
 * idiomatic solution
 
## Why should you use it not?

 * just a side project, I need for work
 * I'm still new to building good docker containers
 * I rely on alpine's standard packages
## Caveats

A heavy caveat in comparision to puma is, that there is no threaded concurrency model available, as the container is built on top of the open source version of Passenger.

For real world large scaling projects, you should spend some money for an enterprise license of Passenger and build your own Dockerfile.