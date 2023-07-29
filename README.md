# aslcontainer

This is a docker image which installs my ASL fork.

It expects to be run with privileged mode so it can access `/dev/dahdi/pseudo`
and expects to have dahdi installed and the kernel module loaded on the host.
This is something I would like to find a solution to going forward, but initial
testing has not led me to any good solution yet.

Use this at your own discretion.
