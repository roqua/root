echo "######### Setting up apps"

function renderTemplate() {
  eval "echo \"$(cat $1)\""
}

pushd $ROOT > /dev/null
  app="rom"
  renderTemplate ./config/database.yml > apps/roqua/config/database.yml
  renderTemplate ./config/mongoid.yml > apps/roqua/config/mongoid.yml
popd > /dev/null
