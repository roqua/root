echo "######### Setting up apps"

function renderTemplate() {
  eval "echo \"$(cat $1)\""
}

pushd $ROOT > /dev/null
  app="rom"
  renderTemplate ./config/mysql.yml > apps/rom/config/database.yml
  renderTemplate ./config/mongoid.yml > apps/rom/config/mongoid.yml
  pushd $ROOT/apps/rom > /dev/null
    bundle exec rake db:reset ORGANIZATION=demo
  popd > /dev/null

  app="core"
  renderTemplate ./config/postgresql.yml > apps/core/config/database.yml

popd > /dev/null
