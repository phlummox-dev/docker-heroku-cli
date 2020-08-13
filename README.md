
# use the Heroku cli without having to install their ridiculous tool

(which wants you to install it as root; and to use a custom Node.js installation.
Homestly. Why don't they just provide a "cloud shell", like Google Cloud and
Azure do?)

**Step 1: create a vol with your authentication details in it**

```
docker -D run -it --name heroku-config phlummox/heroku-cli:0.1 heroku login
```

(don't use `--rm` cos auths persist in the container.)

Then, as long as that volume `heroku-config` still exists, we can do

**Step 2: run a CLI command**

```
docker run --rm -ti --volumes-from heroku-config \
  -v $PWD:/opt/work --workdir /opt/work phlummox/heroku-cli:0.1 heroku --version
```

(Trick shamelessly stolen from <https://hub.docker.com/r/google/cloud-sdk/>.)

Or, to make things more convenient:

```
alias heroku="docker run --rm -ti --volumes-from heroku-config \
  -v $PWD:/opt/work --workdir /opt/work phlummox/heroku-cli:0.1 heroku"
```

## credits

Many thanks to @mhart for his [alpine-node](https://github.com/mhart/alpine-node) image,
which made this one possible. Or much simpler, anyway.

## docker hub link

<https://hub.docker.com/r/phlummoxdev/heroku-cli>

