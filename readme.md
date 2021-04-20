# Building a python container with Bazel


## Installing bazel

Install Bazel locally through [Bazelisk](https://github.com/bazelbuild/bazelisk). This ensures that you always use the version of Bazel specified in `.bazelversion`.

Install Bazel watcher (ibazel) locally through [NPM](https://github.com/bazelbuild/bazel-watcher#npm).

## Building a python container with bazel

```
# build container for simple_greet with bazel
cd simple_greet
bazel build hello

# run the binary
bazel-bin/hello
# expect "Hello, Simon" returned

# build container for greet_any_name
cd ../greet_any_namy/
bazel build hello-name

# run the binary
bazel-bin/hello-name
# expect "No input arguments provided"

bazel-bin/hello-name "Not simon"
# Expect "Hello, Not Simon"
```

## Some other commands

```
# see dependencies of hello:
bazel query 'deps(hello)'

# source files in hello:
bazel query 'kind("source file", deps(hello))'
```
