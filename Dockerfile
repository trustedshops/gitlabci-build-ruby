FROM trustedshops/gitlabci-build-base:centos7

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && \
    \curl -sSL https://get.rvm.io | bash

WORKDIR /workspace
COPY .ruby-version /workspace/.ruby-version
RUN /bin/bash -l -c "rvm install $(cat .ruby-version)" && \
    /bin/bash -l -c "rvm use $(cat .ruby-version) && gem install bundler" \
