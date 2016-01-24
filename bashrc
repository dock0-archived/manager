[ -e ~/.targit.yml ] || /opt/load_token

function clone() {
    local org="$(echo "$1" | cut -d'/' -f1)"
    local repo="$(echo "$2" | cut -d'/' -f2)"
    if [[ -z "$org" ]] || [[ -z "$repo" ]] ; then
        echo "Usage: clone org/repo"
    fi
    local token="$(grep '^targit' ~/.targit.yml | cut -d' ' -f2)"
    local url="https://${USER}:${TOKEN}@github.com/${org}/${repo}"
    cd /opt
    git clone "${url}"
    cd $repo
    git config user.name $USER
    cat ~/.gitconfig >> .git/config
    cp ~/.targit.yml ./.github
}

cd /opt
