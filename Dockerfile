FROM dock0/ssh
MAINTAINER akerl <me@lesaker.org>
RUN pacman -S --needed --noconfirm make vim-minimal ruby
RUN gem install --no-user-install octoauth
ENV REPO_DIR /var/lib/dock0-manager
RUN mkdir -p $REPO_DIR
RUN chown -R $ADMIN:$ADMIN $REPO_DIR
RUN echo $REPO_DIR > /.repo_dir
ADD bashrc /home/$ADMIN/.bashrc
ADD load_token /opt/load_token
