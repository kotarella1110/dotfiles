#!/bin/bash

GITHUB_URL="https://github.com/kotarella1110/dotfiles.git"
DOTPATH=~/.dotfiles

# git が使えるなら git
if type "git"; then
    git clone --recursive "$GITHUB_URL" "$DOTPATH"

# 使えない場合は curl か wget を使用する
elif type "curl" || type "wget"; then
    tarball="https://github.com/kotarella1110/dotfiles/archive/master.tar.gz"
    
    # どっちかでダウンロードして，tar に流す
    if type "curl"; then
        curl -L "$tarball"

    elif type "wget"; then
        wget -O - "$tarball"

    fi | tar xv -
    
    # 解凍したら，DOTPATH に置く
    mv -f dotfiles-master "$DOTPATH"

else
    die "curl or wget required"
fi

cd "$DOTPATH"
if [ $? -ne 0 ]; then
    die "not found: $DOTPATH"
fi

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -snfv "$DOTPATH/$f" "$HOME/$f"
done
