# docker-toolbox-extension

## Introduction

**Disclaimer:** warning this project is a sample that you can't use as it. You need to fork this and customize it according to your needs.

Files and component to dynamically extend your [docker-toolbox](https://github.com/AlbanMontaigu/docker-toolbox).

At the time beeing this extension provides only additional docker host definition to help you defining custom profiles that you can couple with IaaS management.

**This extension is mainly built around:**
 - IaaS management with **Cloudstack**
 - **Terraform** commands connected to remote Cloudstack API
 - **CentOS 7** vm template on the IaaS
 - 2 hosts *(for 2 columns simulation)*
 - 2 profiles, 1 sandbox = sb, 1 qualification = v0

## Available commands

Each command has integrated help, just type the command to see detailed usage.

At the time beeing this extension provides the ```ia``` main command.

## Files and folders description

### docker

Contains dockers customization like **additional docker host profile definition**.

### iaas

Contains all IaaS related files to allow provisioning on so on.

### init.sh.d

Contains all scripts to be run by the extension initialization. Run by ```init.sh```.

### init.sh

Runs all scripts and so the features provided by this extension.