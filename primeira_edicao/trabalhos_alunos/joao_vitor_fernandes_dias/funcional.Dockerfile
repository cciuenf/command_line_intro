FROM ubuntu:20.10

RUN set -xe && echo "Verificando se há possíveis atualizações do sistema..." \
   && apt-get update && apt-get -y upgrade

RUN set -xe && echo "Instalando pacotes base para o sistema..." \
    && apt-get install -y sudo less iputils-ping telnet \
    locales locales-all software-properties-common gnupg libtext-lorem-perl

RUN set -xe && echo "Instalando shells alternativos..." && apt-get install -y zsh fish

RUN echo "Criando usuário padrão..." && useradd ccuenf && usermod -aG sudo ccuenf

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN mkdir -p /home/ccuenf && chown -R ccuenf:ccuenf /home/ccuenf

RUN set -xe && echo "Removendo restrições do sistema..." && yes | unminimize

RUN echo 'ccuenf:ccuenf' | chpasswd

USER ccuenf:ccuenf

WORKDIR /home/ccuenf

RUN mkdir desktop videos pictures downloads documents

CMD /bin/sh
