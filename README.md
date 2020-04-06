# What is this?
I tested python's marshal.load function against rouge marshal'ed data.
It turns out marshal.load is shit in the aspect of security.

# How to run?
```bash
git clone --recurse-submodules git@github.com:pr0cf5/afl-tutorial.git
cd afl-tutorial
./run_docker.sh
```

# Dependencies
You must have **sudo**, because the fuzzer runs in a docker container. 
Obviously, you also need docker, whose installation steps are outlined [here](https://docs.docker.com/install/linux/docker-ce/ubuntu/) 
Also, for AFL to run you need the following configuration, which also requires root. 
``
