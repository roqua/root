echo "######### Setting up apps"

mkdir -p apps

if [[ ! -e apps/core ]]; then
  git clone git@github.com:roqua/core.git apps/core
fi

if [[ ! -e apps/rom ]]; then
  git clone git@github.com:roqua/roqua.git apps/rom
fi

if [[ ! -e apps/grip ]]; then
  git clone git@github.com:roqua/grip.git apps/grip
fi

if [[ ! -e apps/moodmapp ]]; then
  git clone git@github.com:roqua/moodmapp.git apps/moodmapp
fi

if [[ ! -e apps/quby_admin ]]; then
  git clone git@github.com:roqua/quby_admin.git apps/quby_admin
fi

if [[ ! -e apps/medoq ]]; then
  git clone git@github.com:roqua/medo.git apps/medoq
fi

echo "######### Setting up data"

mkdir -p data

if [[ ! -e data/questionnaires ]]; then
  git clone git@github.com:roqua/questionnaires.git data/questionnaires
fi

if [[ ! -e data/assets ]]; then
  git clone git@github.com:roqua/assets.git data/assets
fi

echo "######### Setting up docs"

mkdir -p docs

if [[ ! -e docs/developer ]]; then
  git clone git@github.com:roqua/developer.git docs/developer
fi

if [[ ! -e docs/playbook ]]; then
  git clone git@github.com:roqua/playbook.git docs/playbook
fi

if [[ ! -e docs/manual ]]; then
  git clone git@github.com:roqua/manual.git docs/manual
fi

echo "######### Setting up libs"

mkdir -p libs

if [[ ! -e libs/quby_engine ]]; then
  git clone git@github.com:roqua/quby_engine.git libs/quby_engine
fi

if [[ ! -e libs/quby-mongoid ]]; then
  git clone git@github.com:roqua/quby-mongoid.git libs/quby-mongoid
fi

if [[ ! -e libs/opencpu ]]; then
  git clone git@github.com:roqua/opencpu.git libs/opencpu
fi

if [[ ! -e libs/rack-haproxy_status ]]; then
  git clone git@github.com:roqua/rack-haproxy_status.git libs/rack-haproxy_status
fi

if [[ ! -e libs/authmac ]]; then
  git clone git@github.com:roqua/authmac.git libs/authmac
fi

if [[ ! -e libs/roqua-support ]]; then
  git clone git@github.com:roqua/roqua-support.git libs/roqua-support
fi

if [[ ! -e libs/healthy ]]; then
  git clone git@github.com:roqua/healthy.git libs/healthy
fi

echo "######### Setting up ops"

mkdir -p ops

if [[ ! -e ops/chef ]]; then
  git clone git@github.com:roqua/chef.git ops/chef
fi

if [[ ! -e ops/devop ]]; then
  git clone git@github.com:roqua/devop.git ops/devop
fi

if [[ ! -e ops/deployer ]]; then
  git clone git@github.com:roqua/deployer.git ops/deployer
fi
