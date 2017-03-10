
## 17.03.0-ce (2017-03-10)
- UPDATE: update to docker 17.03.0-ce on the IaaS
- UPDATE: update docker command aliases (same to dk tb)
- UPDATE: update docker-compose command aliases (same to dk tb)
- FEATURE: docker-compose 1.11.2 now available

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
