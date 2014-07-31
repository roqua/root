echo "######### Setting up ops"

mkdir -p ops

if [[ ! -e ops/chef ]]; then
  git clone git@github.com:roqua/chef.git ops/chef
fi

if [[ ! -e ops/devop ]]; then
  git clone git@github.com:roqua/opencpu.git ops/devop
fi

if [[ ! -e ops/deployer ]]; then
  git clone git@github.com:roqua/opencpu.git ops/deployer
fi

