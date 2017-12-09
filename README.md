[![Build Status](https://travis-ci.org/opspec-pkgs/dockercloud.swarm.stack.deploy.svg?branch=master)](https://travis-ci.org/opspec-pkgs/dockercloud.swarm.stack.deploy)

# Problem statement
deploys a stack to a dockercloud swarm

# Known limitations
requires node capable of running containers w/ overlay2 filesystem

# Example usage

## install

```shell
opctl pkg install github.com/opspec-pkgs/dockercloud.swarm.stack.deploy#1.0.0
```

## run

```
opctl run github.com/opspec-pkgs/dockercloud.swarm.stack.deploy#1.0.0
```

## compose

```yaml
op:
  pkg: { ref: github.com/opspec-pkgs/dockercloud.swarm.stack.deploy#1.0.0 }
  inputs:
    dockerUsername:
    dockerPassword:
    swarm:
    stackFile:
    stackName:
    # begin optional args
    prune:
    stackFileType:
    # end optional args
```

# Support

join us on [![Slack](https://opspec-slackin.herokuapp.com/badge.svg)](https://opspec-slackin.herokuapp.com/)
or [open an issue](https://github.com/opspec-pkgs/dockercloud.swarm.stack.deploy/issues)

# Releases

releases are versioned according to
[![semver 2.0.0](https://img.shields.io/badge/semver-2.0.0-brightgreen.svg)](http://semver.org/spec/v2.0.0.html)
and [tagged](https://git-scm.com/book/en/v2/Git-Basics-Tagging); see
[CHANGELOG.md](CHANGELOG.md) for release notes

# Contributing

see [project/CONTRIBUTING.md](https://github.com/opspec-pkgs/project/blob/master/CONTRIBUTING.md)
