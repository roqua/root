echo "######### Setting up apps"

function renderTemplate() {
  eval "echo \"$(cat $1)\""
}

pushd $ROOT > /dev/null
  app="rom"
  renderTemplate ./config/mysql.yml > apps/roqua/config/database.yml
  renderTemplate ./config/mongoid.yml > apps/roqua/config/mongoid.yml

  app="core"
  renderTemplate ./config/postgresql.yml > apps/core/config/database.yml

popd > /dev/null
