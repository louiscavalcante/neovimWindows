mkdir %UserProfile%\AppData\Local\nvim-data\site\autoload\
bitsadmin /transfer vimPlugDownload /download /priority high https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim %UserProfile%\AppData\Local\nvim-data\site\autoload\plug.vim
mkdir %UserProfile%\AppData\Local\nvim\
bitsadmin /transfer vimPlugDownload /download /priority high https://raw.githubusercontent.com/louiscavalcante/neovimWindows/main/init.vim %UserProfile%\AppData\Local\nvim\init.vim
bitsadmin /transfer vimPlugDownload /download /priority high https://raw.githubusercontent.com/louiscavalcante/neovimWindows/main/coc-settings.json %UserProfile%\AppData\Local\nvim\coc-settings.json
nvim +PlugInstall
