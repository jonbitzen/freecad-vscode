cp devcontainer-template.json devcontainer.json
sed -i "s/HOST_UID/${UID}/g" devcontainer.json