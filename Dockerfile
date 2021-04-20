FROM ubuntu
MAINTAINER David <admin@dxscx.com>
ENV LANG C.UTF-8
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -y install git cmake golang python3-dev vim tmux python3-pip && \
	DEBIAN_FRONTEND=noninteractive apt-get -y autoremove && \
	DEBIAN_FRONTEND=noninteractive apt-get clean
	
COPY vimrc /root/.vimrc

RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
	vim +PluginInstall  +qall && \
	python3 ~/.vim/bundle/YouCompleteMe/install.py --go-completer && \
	vim +GoInstallBinaries  +qall && \
	rm -rf /go/src/* /go/pkg  && \
	rm -rf /tmp/* /var/tmp/*

RUN go env -w GO111MODULE=on && \
	go env -w GOPROXY=https://goproxy.cn,direct

WORKDIR /workdir

