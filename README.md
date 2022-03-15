This project contains configuration and instructions to build and develop FreeCAD using vscode in a docker container.  Please note that to run FreeCAD with 3D acceleration from within the container, you will need an nVidia graphics card.

# Installation and Setup

- checkout the FreeCAD source

- copy or link the folder '.devcontainer' into your FreeCAD source folder

- copy the folder '.vscode' into your FreeCAD source folder, or if it already exists copy 'launch.json' there

- run the script 'create-base-image.sh'.  This will build the standard FreeCAD continuous integration image, which we will use as a base for the development image

- run the script 'create-devcontainer-file.sh'.  This will create a 'devcontainer.json' file from a template file.  The generated file will replace the HOST_UID variable with the user's UID from the shell.

- install and configure the nvidia container toolkit and runtime:
  - go to https:/github.com/nvidia/nvidia-docker
  - follow the links to the installation instructions, and set up the package repository for your distro
    - note that for distributions forked from an upstream parent (such as Mint and others) you may need to look at the following link to find the correct 'distribution' string to use for your distro in the nvidia docker repo install process:
    ```
    https://nvidia.github.io/nvidia-docker/
    ```
  - install nvidia-container-toolkit and nvidia-container-runtime using your package manager according to the instructions provided
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

# Building and Running FreeCAD

- Open the FreeCAD source checkout folder in VSCode
- When prompted choose "Reopen in container"
  - The development container will build itself using the FreeCAD continuous integration container as a base image; give it a few minutes to sort itself out
- After the development container has built itself, dismiss popups related to CMake and toolkit options
- In the status bar at the bottom click "Build" to build FreeCAD
- After FreeCAD has finished building, open a terminal at bottom from within VSCode, go to "/workspaces/FreeCAD/build/bin" and run FreeCAD from the command line

# Other Features

The development container will let you open *.ui files in QtCreator from within VSCode:
- in VSCode, go to src/Gui
- right click on AboutApplication.ui and select "Open in External App"
- in a few moments the AboutApplication interface should be opened in QtCreator

# TODO

- Create an app launcher so that FreeCAD can be launched from the launch and debug tool bar; with the correct configuration has the added benefit that segfaults can be caught by VSCode, and a stack trace immediately provided to the developer

- Someday if other GPU manufacturers (AMD, Intel) provide docker integration for the `--gpus` arg, provide install instructions for their docker components as well.