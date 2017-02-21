# gitlabci-build-ruby
RVM based ruby build container to be used with gitlabci.

## Usage

This Image is meant to be used as a base Image. To use it you have to install the ruby version you like. To do so put sth. like this into your `Dockerfile`:

```docker
FROM trustedshops/gitlabci-build-ruby:centos6

WORKDIR /workspace
COPY .ruby-version /workspace/.ruby-version
RUN /bin/bash -l -c "rvm install $(cat .ruby-version)" && \
    /bin/bash -l -c "rvm use $(cat .ruby-version) && gem install bundler" \
```
