echo "######### Setting up apps"

function renderTemplate() {
  eval "echo \"$(cat $1)\""
}

pushd $ROOT > /dev/null

  ./start-dbs &
  DBS_PID=$!
  sleep 3

    app="core"
    renderTemplate ./setup/config/postgresql.yml > apps/core/config/database.yml
    pushd $ROOT/apps/core > /dev/null
      bundle check || bundle install
      bundle exec rake db:drop
      bundle exec rake db:setup
    popd > /dev/null


    app="rom"
    renderTemplate ./setup/config/mysql.yml > apps/rom/config/database.yml
    renderTemplate ./setup/config/mongoid.yml > apps/rom/config/mongoid.yml
    pushd $ROOT/apps/rom > /dev/null
      ln -sf $ROOT/data/questionnaires db/questionnaires
      bundle check || bundle install
      bundle exec rake db:drop
      bundle exec rake db:setup ORGANIZATION=demo
      bundle exec rake test:prepare
    popd > /dev/null


    app="grip"
    renderTemplate ./setup/config/postgresql.yml > apps/grip/config/database.yml
    pushd $ROOT/apps/grip > /dev/null
      bundle check || bundle install
      bundle exec rake db:drop
      bundle exec rake db:setup
      bundle exec rake test:prepare
    popd > /dev/null


    app="medoq"
    renderTemplate ./setup/config/postgresql.yml > apps/medoq/config/database.yml
    pushd $ROOT/apps/medoq > /dev/null
      bundle check || bundle install
      bundle exec rake db:drop
      bundle exec rake db:setup
      bundle exec rake test:prepare
    popd > /dev/null


    app="quby_admin"
    renderTemplate ./setup/config/mongoid.yml > apps/quby_admin/config/mongoid.yml
    pushd $ROOT/apps/quby_admin > /dev/null
      ln -sf $ROOT/data/questionnaires db/questionnaires
      bundle check || bundle install
    popd > /dev/null

  kill $DBS_PID
  wait

popd > /dev/null
