echo "######### Setting up data"

mkdir -p data

if [[ ! -e data/questionnaires ]]; then
  git clone git@github.com:roqua/questionnaires.git data/questionnaires
fi

if [[ ! -e data/assets ]]; then
  git clone git@github.com:roqua/assets.git data/assets
fi
