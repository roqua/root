echo "######### Setting up toolchain"

function ensureBrew {
  echo "Ensuring $1 brew is installed and up to date..."
  brew install $1 || brew upgrade $1
}

function ensureGem {
  if gem list $1 -i > /dev/null; then
    echo "Ruby gems: $1 already installed; updating..."
    gem update $1
  else
    echo "Ruby gems: Installing $1..."
    gem install $1
  fi
}

ensureGem git-up
ensureGem mailcatcher

ensureBrew pstree
ensureBrew node
ensureBrew phantomjs

ensureBrew mysql
if [[ ! -d './tmp/mysql' ]]; then
  mkdir -p ./tmp/mysql

  mysql_install_db --user=$USER --basedir=/usr/local/bin/mysql_install_db/../../ --datadir=$ROOT/tmp/mysql
fi

ensureBrew postgresql
if [[ ! -d './tmp/postgres' ]]; then
  initdb './tmp/postgres' -E utf8 --locale en_US.utf8
fi

ensureBrew mongodb
if [[ ! -d './tmp/mongodb' ]]; then
  mkdir -p './tmp/mongodb'
fi
