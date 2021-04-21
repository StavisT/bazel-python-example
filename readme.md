# Example of how to use python with bazel

## Prerequisites
Following tools are expected to be preinstalled on your machine:
1. `brew install poetry` poetry is a python packaging and dependency management tool.

2. `brew install bazelisk` bazel is a tool for automating building and testing of software.
Bazelisk ensures that you always use the version of Bazel specified in `.bazelversion`.

## Setup with bazel
WORKSPACE needs to be in the root directory and imports necessary packages for bazel, such as installing dependenies with poetry. Notice a custom script for installing dependcies with poetry in build/rules/poetry.bzl.

Alle sub directories has a BUILD.bazel file. This can be empty.

## Simple_greet: Simple python example
See the very simple python example in src/simple_greet

```
# first cd into the directory
cd src/simple_greet

# run the code through bazel with
bazel run :hello
# this allow you to run the code without having to create a container

# build binary for simple_greet with bazel
bazel build hello

# run the binary
cd ...
bazel-bin/src/simple_greet/hello
# expect "Hello, Simon" returned
```


## Greet_any_name: Python example with input arguments
```
# first cd into the directory
cd src/greet_any_name

# run the code through bazel with
bazel run :hello-name
# expected return is "Hello, Simon-Stavland"

# changing the input argument in BUILD.bazel would allow the return o another name
```


## flask_service: Simple flask service
See the simple flask service example in src/flask_service

Notice here that there are added dependencies for both the py_library and the py_binary.
The exact version of these dependencies is handled through poetry.

```
# first cd into the directory
cd src/flask_service

# run the code with bazel
bazel run :run
```
you will see a lot of output in the terminal and the service is now up and running at http://0.0.00:5050. By going to http://0.0.00:5050/health/<something> you will se the return of the function `health` in app.py.

