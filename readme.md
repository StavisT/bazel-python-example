# Building a python container with Bazel


## Installing bazel

Install Bazel locally through [Bazelisk](https://github.com/bazelbuild/bazelisk). This ensures that you always use the version of Bazel specified in `.bazelversion`.

Install Bazel watcher (ibazel) locally through [NPM](https://github.com/bazelbuild/bazel-watcher#npm).

## Building a python container with bazel

```
# build container with bazel
bazel build hello

# run the binary
bazel-bin/hello
```

## Some other commands

```
# list all local targets
bazel query //...

bazel query 'deps(hello)'
bazel query 'kind("source file", deps(hello))'

# build with bazel
bazel build hello

# run the binary
bazel-bin/hello
```





