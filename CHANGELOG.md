
## 18.03.0-ce (2018-04-13)
- BUGFIX: script for ssh key removed (missed when ssh keys where removed)

## 18.03.0-ce (2018-03-30)
- UPDATE: bump to docker 18.03.0-ce
- UPDATE: bump to docker 18.03.0-ce on the IaaS
- UPDATE: bump to docker-compose 1.20.1 on the IaaS
- UPDATE: cloud-init stuff removed (simplification)
- UPDATE: no more ssh keys, switch to default password (simplification)
- UPDATE: no more kernel upgrade stuff (simplification)

## 17.12.0-ce (2018-02-12)
- UPDATE: update to docker 17.12.0-ce
- UPDATE: update to docker 17.12.0-ce on the IaaS
- UPDATE: update to docker-compose 1.19.0 on the IaaS

## 17.09.0-ce (2017-10-12)
- UPDATE: common terraform files to be included by m4 are now `*.tf.inc.m4` 
- UPDATE: `sb_*` profile removed

## 17.09.0-ce (2017-10-09)
- UPDATE: now `ia fsync` will use sub path matching with `dk host --id` to take in account profiles differences
- BUGFIX: now use correct ip for `ia fsync`

## 17.09.0-ce (2017-10-06)
- UPDATE: update to docker 17.09.0-ce on the IaaS
- UPDATE: update `dk` commands available to fit to latest `dk tb` equivalent
- UPDATE: update to terraform version 0.10.7
- BUGFIX: now `ia ssh` command will produce a proper error if docker host is local instead of remote
- FEATURE: new `ia fsync` command added to allow auto and regular sync between localhost `iaas/fsync` folder and remote IaaS

## 17.06.2-ce (2017-09-07)
- UPDATE: update to docker 17.06.2-ce on the IaaS
- UPDATE: update to docker-compose 1.16.1 on the IaaS
- UPDATE: update to terraform version 0.10.4

## 17.06.1-ce (2017-08-25)
- UPDATE: update to docker 17.06.1-ce on the IaaS
- UPDATE: update to docker-compose 1.15 on the IaaS
- UPDATE: update to terraform version 0.10.2
- UPDATE: `dk cleani` removed on the IaaS please use `docker image prune` instead
- UPDATE: `dk cleanv` removed on the IaaS please use `docker volume prune` instead
- UPDATE: `dk cleanc` removed on the IaaS please use `docker container prune` instead
- UPDATE: `dk clean` removed on the IaaS please use `docker system prune` instead
- UPDATE: `dk [ls|vi|cat]` removed on the IaaS since they are not convenient / used please use `docker [shi|shc]` and then your command instead

## 17.06.0-ce (2017-07-05)
- UPDATE: update to docker 17.06.0-ce on the IaaS
- UPDATE: update to docker-compose 1.14 on the IaaS
- UPDATE: update to terraform version 0.9.11

## 17.05.0-ce (2017-05-09)
- UPDATE: update to docker 17.05.0-ce on the IaaS
- UPDATE: update to docker-compose 1.13 on the IaaS
- UPDATE: update to terraform version 0.9.4

## 17.04.0-ce (2017-04-07)
- UPDATE: update to docker 17.04.0-ce on the IaaS

## 17.03.1-ce (2017-04-07)
- UPDATE: update to docker 17.03.1-ce on the IaaS
- UPDATE: update to docker-compose 1.12

## 17.03.0-ce (2017-03-20)
- BUGFIX: upgrade-kernel terraform filename fixed
- BUGFIX: hack to wait for cloud-init completion

## 17.03.0-ce (2017-03-14)
- UPDATE: update to docker 17.03.0-ce on the IaaS
- UPDATE: update command aliases (same to dk tb)
- UPDATE: update docker command aliases (same to dk tb)
- UPDATE: update docker-compose command aliases (same to dk tb)
- UPDATE: update to terraform version 0.8.8 with *.tf compatibility modifications
- FEATURE: docker-compose 1.11.2 now available
- FEATURE: crontab added for docker prune (solves #1)
- FEATURE: main-noscript.tf.m4 added to allow terraform only with IaaS image and no additional script executed
- FEATURE: main-upgrade-kernel.tf.m4 added to allow kernel update during terraform on the IaaS (manual reboot will be necessary)
- FEATURE: cleanup system part added on IaaS terraform

## 1.13.1 (2017-02-24)
- FEATURE: version file added
- FEATURE: now docker engine start automatically at boot
- FEATURE: reactivate yum update at install (more long now...)

## 1.13.1 (2017-02-11)
- UPDATE: update to docker 1.13.1 on the IaaS

## 1.13.0 (2017-01-29)
- UPDATE: update to docker 1.13.0 on the IaaS

## 1.12.5 (2016-12-26)
- UPDATE: update to docker 1.12.5 on the IaaS

## 1.12.3 (2016-12-01)
- BUGFIX: terraform volumes miss /opt from toolbox so switch to volumes from current container

## 1.12.3 (2016-10-31)
- UPDATE: update to docker 1.12.3 on IaaS install
- UPDATE: now ```ia tf``` commands won't set manually a proxy because you should rely on transparent proxy service (more easy / flexible). Think to enable this service if requested with your vagrant b2d template.
- UPDATE: now ```ia tf``` won't mount volumes from docker toolbox since it may have multiple toolbox running

## 1.12.1f (2016-09-19)
- FEATURE: Added docker hosts extension capability in your project by adding doker hosts folder in iaas folder.
- UPDATE: now shell scripts have sh extension for better edition

## 1.12.1e (2016-08-31)
- Switch to version 1.12.1e to be consistent with other tools

## 1.12.1d (2016-08-31)
- Now additional iaas profiles are in **iaas-config-template** project
- BUGFIX: dk host definition fixed, now calling directly ```ia_ip``` and avoid pollution comming from ```ia ip```
- BUGFIX: ```ia ip``` won't show current docker host anymore, will be integrated in docker-toolbox prompt

## 1.12.1c (2016-08-29)
- Additional space added in shell info for ```ia``` command
- BUGFIX: ```ia fpush``` file not found
- Now ```ia fpush``` takes in accound ```dk host id``` to search inside matching subdirectory inside fpush

## 1.12.1b (2016-08-29)
- Documentation upgrade
- Now display host id in ```ia``` commands
- Now ```ia ssh``` now takes a parameter
- Added ```ia scp``` command to copy files from local to remote host
- Added ```ia fpush``` command to copy files from local to remote host with predefined source and dest folders
- Added ```ia cfpush``` same than fpush but with a remote ```rm -fr``` on the dest folder before

## 1.12.1 (2016-08-26)
- Update to docker 1.12.1 on IaaS install

## 1.12.0 (2016-07-29)
- Update to docker 1.12.0 on IaaS install

## 1.11.2 (2016-06-04)
- Update to docker 1.11.2 on IaaS install
- BUGFIX: ```ia_tf_check``` now correctly detect profile path with ```dk_host_id``` instead of ```docker host```
- BUGFIX: loop case fixed in ```ia_tf``` because of ```dk_host_change```

## 1.11.0-r2 (2016-04-23)
- Bugfix: docker host ip not set when terraform after host change

## 1.11.0 (2016-04-14)
- Version update to stick to last docker version on all projects
- Update to docker 1.11.0 on IaaS install

## 1.10.3 (2016-03-12)
- First version with ```ia``` commands for IaaS management
- Based on ```terraform``` + ```couldstack``` + ```centos 7``` on the IaaS VM
