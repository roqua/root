echo "######### Setting up docs"

mkdir -p docs

if [[ ! -e docs/developer ]]; then
  git clone git@github.com:roqua/developer.git docs/developer
fi

if [[ ! -e docs/playbook ]]; then
  git clone git@github.com:roqua/playbook.git docs/playbook
fi

if [[ ! -e docs/assets ]]; then
  git clone git@github.com:roqua/assets.git docs/assets
fi

if [[ ! -e docs/manual ]]; then
  git clone git@github.com:roqua/manual.git docs/manual
fi

