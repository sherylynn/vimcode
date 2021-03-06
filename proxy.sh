#删掉bash指定，因为termux是prefix格式的
#!/bin/bash
PORT=10808
HOST=127.0.0.1
while getopts 'p:h:c' OPT; do
  case $OPT in
    p)
      PORT="$OPTARG";;
    h)
      HOST="$OPTARG";;
    c)
      Client="y";;
    ?)
      echo "Usage: `basename $0` [options] filename"
  esac
done
shift $(($OPTIND - 1))
echo 开始安装依赖
echo ${HOST}
echo ${PORT}
export http_proxy=http://${HOST}:${PORT}/
export https_proxy=http://${HOST}:${PORT}/
git config http.proxy http://${HOST}:${PORT}/
go get -u github.com/klauspost/asmfmt/cmd/asmfmt
go get -u github.com/derekparker/delve/cmd/dlv
go get -u github.com/kisielk/errcheck
go get -u github.com/davidrjenni/reftools/cmd/fillstruct
#go get -u github.com/nsf/gocode
#go get -u github.com/mdempsky/gocode
#for vim-go 
go get -u github.com/stamblerre/gocode
go get -u github.com/koron/iferr
go get -u github.com/rogpeppe/godef
go get -u github.com/zmb3/gogetdoc
go get -u golang.org/x/tools/cmd/goimports
go get -u github.com/golang/lint/golint
go get -u github.com/alecthomas/gometalinter
go get -u github.com/fatih/gomodifytags
go get -u golang.org/x/tools/cmd/gorename
go get -u github.com/jstemmer/gotags
go get -u golang.org/x/tools/cmd/guru
go get -u github.com/josharian/impl
go get -u github.com/dominikh/go-tools/cmd/keyify
go get -u github.com/fatih/motion
go get -u github.com/saibing/bingo
go get -u github.com/sourcegraph/go-langserver
go get -u golang.org/x/lint/golint
go get -u golang.org/x/tools/cmd/gopls 
go get -u github.com/go-delve/delve/cmd/dlv
