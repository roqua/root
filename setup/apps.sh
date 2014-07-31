echo "######### Setting up apps"

mkdir -p apps

if [[ ! -e apps/core ]]; then
  git clone git@github.com:roqua/core.git apps/core
fi

if [[ ! -e apps/roqua ]]; then
  git clone git@github.com:roqua/roqua.git apps/roqua
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

