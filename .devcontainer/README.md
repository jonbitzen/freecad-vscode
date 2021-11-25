To build and develop FreeCAD using vscode in a docker container:

- run the script 'create-base-image.sh'.  This will build the standard FreeCAD continuous integration image, which we will use as a base for the development image

- edit the .devcontainer/Dockerfile to change the arg USER_UID to match your user id on the host system.
  - This is helpful so that files you create and other compiled artifacts will have the same ownership as the host system

- re-open the project in a development container

- may need to install and configure the nvidia container toolkit and runtime:
  - go to https::/github.com/nvidia/nvidia-docker
  - follow the links to the installation instructions, and set up the package repository for your distro
  - install nvidia-container-toolkit and nvidia-container-runtime
  - open your docker daemon file and add the following:
  ```
    {
      "runtimes": {
        "nvidia": {
          "path": "/usr/bin/nvidia-container-runtime",
          "runtimeArgs": []
        }  
      }
    }
  ```
