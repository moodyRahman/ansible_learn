FROM linuxserver/openssh-server

WORKDIR /ansible
RUN apk add python3 pipx; pipx install ansible-core; pipx ensurepath;
RUN echo 'eval $(ssh-agent)' >> /root/.bashrc
RUN echo 'ssh-add /ansible/keys/id_rsa' >> /root/.bashrc