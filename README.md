This project contains configuration and instructions to build and develop FreeCAD using vscode in a docker container.  Please note that to run FreeCAD with 3D acceleration from within the container, you will need an nVidia graphics card.

- checkout the FreeCAD source

- copy or link the folder '.devcontainer' into your FreeCAD source folder

- run the script 'create-base-image.sh'.  This will build the standard FreeCAD continuous integration image, which we will use as a base for the development image

- run the script 'create-devcontainer-file.sh'.  This will create a 'devcontainer.json' file from a template file.  The generated will replace the HOST_UID variable with the user's UID from the shell.

- install and configure the nvidia container toolkit and runtime:
  - go to https:/github.com/nvidia/nvidia-docker
  - follow the links to the installation instructions, and set up the package repository for your distro
  - install nvidia-container-toolkit and nvidia-container-runtime using your package manager
  - open your docker daemon file '/etc/docker/daemon.json' and add the following:
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

  - re-open the project in a development container
