" let g:hoge=piyo,グローバル変数としてhogeに代入

" Viの互換動作を無効
set nocompatible

" ファイルタイプの検出、プラグインのロード、インデントのロードを有効化
filetype plugin indent on

set number
set expandtab
set tabstop=4
set shiftwidth=4
set clipboard=unnamed
"set wildmenu
"set history=5000

" ステータスラインの設定
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する

inoremap{ {}<LEFT>
inoremap( ()<LEFT>
inoremap[ []<LEFT>
inoremap< <><LEFT>

nnoremap <S-k> 10<UP>
nnoremap <S-j> 10<DOWN>
nnoremap <S-l> 10<RIGHT>
nnoremap <S-h> 10<LEFT>
vnoremap <S-k> 10<UP>
vnoremap <S-j> 10<DOWN>
vnoremap <S-l> 10<RIGHT>
vnoremap <S-h> 10<LEFT>

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
nnoremap <C-e> :NERDTreeToggle<CR>




"call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
"call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
"call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
"call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')


"========================
" NeoBundle
"========================

" vim起動時のみ実行
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

"===== 追加するプラグイン ========

" カラースキーム
NeoBundle 'nanotech/jellybeans.vim'
"NeoBundle 'tomasr/molokai'
"if neobundle#is_installed('molokai') " molokaiがインストールされていれば
"    colorscheme molokai " カラースキームにmolokaiを設定する
"endif


" vim template
NeoBundle 'thinca/vim-template'

" ファイルをtree表示
NeoBundle 'scrooloose/nerdtree'


" ステータスラインの表示内容強化
NeoBundle 'itchyny/lightline.vim'


" 末尾の全角と半角の空白文字を赤くハイライト
NeoBundle 'bronson/vim-trailing-whitespace'


" インデントの可視化 texの文字も変換されるので注意
"NeoBundle 'Yggdroot/indentLine'


" コードの自動補完
if has('lua')
    " コードの自動補完
    NeoBundle 'Shougo/neocomplete.vim'

    " スニペットの補完機能
    NeoBundle "Shougo/neosnippet"

    " スニペット集
    NeoBundle 'Shougo/neosnippet-snippets'
endif

" neocomplete,neosnippet の設定
if neobundle#is_installed('neocomplete.vim')
    " Vim起動時にneocompleteを有効にする
    let g:neocomplete#enable_at_startup = 1

    " smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
    let g:neocomplete#enable_smart_case = 1

    " 3文字以上の単語に対して補完を有効にする
    let g:neocomplete#min_keyword_length = 3

    " 区切り文字まで補完する
    let g:neocomplete#enable_auto_delimiter = 1

    " 1文字目の入力から補完のポップアップを表示
    let g:neocomplete#auto_completion_start_length = 1

    " バックスペースで補完のポップアップを閉じる
    inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

    " エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定
    imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"

    " タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ
    imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
endif

"===========================================
"
NeoBundleCheck " 未インストールのプラグインをインストールするかcheck
call neobundle#end()

"======================================================

set t_Co=256 " iTerm2など既に256色環境なら無くても良い
syntax enable " 構文に色を付ける
syntax on
set cursorline
colorscheme jellybeans







