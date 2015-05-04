FROM dock0/ssh
MAINTAINER akerl <me@lesaker.org>
RUN pacman -S --needed --noconfirm make vim-minimal
RUN mkdir -p /var/lib/dock0-manager
RUN chown -R $ADMIN:$ADMIN /var/lib/dock0-manaager
