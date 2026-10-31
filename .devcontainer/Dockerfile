FROM ubuntu:24.04

ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=$USER_UID


RUN usermod -l developer ubuntu \
    && groupmod -n developer ubuntu \
    && apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y --enable-source ppa:freecad-maintainers/freecad-daily && apt-get update \
    && apt-get update \
    && apt-get build-dep -y freecad-daily \
    && apt-get install -y sudo \
    && apt-get install -y qtcreator \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME
