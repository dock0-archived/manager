[ -e ~/.targit.yml ] || /opt/load_token

export REPO_DIR="$(cat /.repo_dir)"

function clone() {
    local org="$(echo "$1" | cut -s -d'/' -f1)"
    local repo="$(echo "$1" | cut -s -d'/' -f2)"
    if [[ -z "$org" ]] || [[ -z "$repo" ]] ; then
        echo "Usage: clone org/repo"
        return
    fi
    local token="$(grep '^targit' ~/.targit.yml | cut -d' ' -f2)"
    local url="https://${USER}:${token}@github.com/${org}/${repo}"
    cd $REPO_DIR
    git clone "${url}"
    cd $repo
    git config user.name $USER
    cat ~/.gitconfig >> .git/config
    cp ~/.targit.yml ./.github
}

cd $REPO_DIR
