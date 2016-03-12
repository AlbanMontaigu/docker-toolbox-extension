# docker-toolbox-extension

## Introduction

Files and component to dynamically extend your [docker-toolbox](https://github.com/AlbanMontaigu/docker-toolbox).

## Warning

**Currently on working, not full ready for usage.**

This project is somthing like an **example**. You have to customize it according to your needs.

In addition this example is mainly built around:
 - IaaS managed with **Cloudstack**
 - **Terraform** commands connected to remote Cloudstack API
 - **CentOS 7** vm template on the IaaS
 - 2 hosts *(for 2 columns simulation)*
 - 2 profiles, 1 sandbox = sb, 1 qualification = v0

## Content at the time beeing

- ```iaas``` for remote docker host creation and setup with IaaS and cloudstack API.
- ```docker``` remote docker host definitions to be able to connect to them with docker command *(corresponds to IaaS definitions)*
- ```init.sh.d``` toghether with ```init.sh``` the scripts to execute dynamically to enable all extension stuff

## IaaS commands

- ```tf``` All TERRAFORM commands
- ```ip``` Show ip of the current instance *(depending dk host)* on the iaas
- ```ssh``` Ssh inside the current IaaS instance *(depending dk host)* with default keys
- ```help``` Get hep for the specified command"
