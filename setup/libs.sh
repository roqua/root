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

