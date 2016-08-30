
## 1.12.1c (2016-08-29)
- Additional space added in shell info for ```ia``` command

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
