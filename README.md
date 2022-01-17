关于 新手配置nvim/ neovim 在不同操作系统下面会遇到的三个问题

1   nvim 找不到默认 colorscheme   Cannot find color scheme 'molokai' before install

2   nvim coc.nvim 报错 无法工作   [coc.nvim] build/index.js not found, please install dependencies and compile coc.nvim by: yarn install

3   nvim vim-plug 安装问题   443,404等问题


1,
nvim 找不到colorscheme 是比较常见的问题，因为PlugInstall 安装默认路径不在nvim 文件夹里面，导致nvim 开启的时候无法找到colorscheme
以我的Mac OS 为例，解决的办法是：
找到呗vim-plug 下载下来的主题文件，拷贝至nvim 的文件夹里面
cp -R ~/.local/share/nvim/plugged/这里写你的colorscheme名字 ~/.conifg/nvim/
再启动nvim 即可正常识别


2,
经过 :PlugInstall 成功安装coc.nvim 之后，打开界面报错的原因是coc.nvim 没有安装完全
coc.nvim 可以理解成在nvim中，补全语法的brew插件，所以不但你得把文件包下下来，还得在nvim 内部设置。

先安装依赖
npm install nodejs
npm install yarn

然后用命令行，在nvim 文件夹中的coc.nvim文件夹的路径中下输入命令
yarn install
yarn build


然后根据你想要装的语言包装上去
比如说
:CocInstall coc-json coc-css coc-html

如果之后再进nvim 仍然显示不出来的话
尝试用nvim打开任意你装了的语言的文件
nvim会在下方框中提示你，还没有安装blablabla，会给出可选择的3个数字，选择1 Install 就好了
然后再重启nvim
如果用Tmux的童鞋也重启下Tmux


3,
vim-plug 安装出错都是因为墙的问题，但是有些时候开了墙也没法装上。这种情况下有两个办法，第一个就是复制vim-plug 原始的plug.vim文件中的所有内容，然后粘贴到
~/.config/nvim/autoload/

之后init.vim中
设定好call plug 之类的设定之后
nvim 中 :PlugInstall
即可

由于大部分Plugin都是源自GitHub，所以经常会链接不上
但是没有关系，天朝对于Git的设定是间断性封锁，一般重试3-5次基本都能装上
我自己会在装的时候在Proxy 里面的 Global 和 Direct 反复横跳1-2遍就能解决




