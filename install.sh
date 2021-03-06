BASEDIR=$(dirname $0)
cd $BASEDIR
CURRENT_DIR=`pwd`

lnif() {
  if [ -e "$1"  ]; then
    ln -sf "$1" "$2"
  fi

}

echo "Step0: install dependencies "
sudo apt install curl silversearcher-ag ctags vim python3-pip -y
sudo yum install the_silver_searcher ctags vim -y
brew install the_silver_searcher ctags vim
emerge dev-util/ctags the_silver_searcher vim
#termux
pkg install silversearcher-ag fzf

echo "Step1: backing up current vim config"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.vimrc.bundles $HOME/.config/nvim/init.vim $HOME/.config/nvim; do [ -e $i  ] && [ ! -L $i  ] && mv $i $i.$today; done
#原有配置还是要删除或者备份的不然会影响到后续的安装
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.eslintrc.json /Users/lynn/.eslintrc.js $HOME/.npmrc $HOME/.tern-config $HOME/.vimrc.bundles $HOME/.config/nvim/init.vim $HOME/.config/nvim; do [ -L $i  ] && unlink $i ; done


echo "Step2: setting up symlinks"
lnif $CURRENT_DIR/config/vimrc $HOME/.vimrc
lnif "$CURRENT_DIR/" "$HOME/.config/nvim"
lnif $CURRENT_DIR/config/vimrc $HOME/.config/nvim/init.vim
lnif "$CURRENT_DIR/" "$HOME/.vim"
#lnif $CURRENT_DIR/config/eslintrc.json $HOME/.eslintrc.json
lnif $CURRENT_DIR/config/eslintrc.js $HOME/.eslintrc.js
lnif $CURRENT_DIR/config/tern-config $HOME/.tern-config
#不能乱动.npmrc
#lnif $CURRENT_DIR/config/npmrc $HOME/.npmrc

echo "Step3: update/install plugins using vim-plug"
#system_shell=$SHELL
#export SHELL="/bin/sh"
#vim +PlugInstall! +PlugClean! +qall
#export SHELL=$system_shell
#完全忘记上面自己切换shell的环境的代码在写啥了
source ./proxy.sh
#vim -c "GoInstallBinaries" -c "qa"
#vim +GoInstallBinaries! +qall

echo "Step4: install eslint"
echo "It will take a long time, just be patient!"
echo "npm i -g eslint --registry=http://registry.npm.taobao.org"
unset http_proxy
unset https_proxy
npm i -g eslint eslint-plugin-vue eslint_d eslint-plugin-babel eslint-plugin-react eslint-plugin-react-native babel-eslint eslint-config-airbnb  --registry=http://registry.npm.taobao.org
echo "Install Done!"

echo "Final install autokey"
sudo apt install autokey -y
sudo apt install autokey-gtk -y
for i in $HOME/.config/autokey/data/autokey_emacs ; do [ -L $i  ] && unlink $i ; done
lnif $CURRENT_DIR/autokey_emacs "$HOME/.config/autokey/data/autokey_emacs"
