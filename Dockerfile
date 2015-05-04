FROM dock0/ssh
MAINTAINER akerl <me@lesaker.org>
ENV REPO_DIR /var/lib/dock0-manager
RUN pacman -S --needed --noconfirm make vim-minimal ruby
RUN mkdir -p $REPO_DIR
RUN usermod --home $REPO_DIR $ADMIN
ADD bashrc $REPO_DIR/.bashrc
ADD load_token /opt/load_token
RUN chown -R $ADMIN:$ADMIN $REPO_DIR
