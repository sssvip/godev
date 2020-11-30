FROM ubuntu
MAINTAINER David <admin@dxscx.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -y install git cmake golang python3-dev vim && \
	DEBIAN_FRONTEND=noninteractive apt-get -y autoremove && \
	DEBIAN_FRONTEND=noninteractive apt-get clean

COPY vimrc /root/.vimrc

RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
	vim +PluginInstall  +qall && \
	python3 ~/.vim/bundle/YouCompleteMe/install.py --go-completer && \
	rm -rf /go/src/* /go/pkg  && \
	rm -rf /tmp/* /var/tmp/*

WORKDIR /root
