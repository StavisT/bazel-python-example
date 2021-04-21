workspace(name = "output")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Python setup
http_archive(
    name = "rules_python",
    sha256 = "778197e26c5fbeb07ac2a2c5ae405b30f6cb7ad1f5510ea6fdac03bded96cc6f",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.2.0/rules_python-0.2.0.tar.gz",
)

# The Bazel Federation is a set of rules at versions that have been tested together to ensure interoperability.
http_archive(
    name = "bazel_federation",
    sha256 = "9d4fdf7cc533af0b50f7dd8e58bea85df3b4454b7ae00056d7090eb98e3515cc",  # pragma: allowlist secret
    strip_prefix = "bazel-federation-130c84ec6d60f31b711400e8445a8d0d4a2b5de8",
    type = "zip",
    url = "https://github.com/bazelbuild/bazel-federation/archive/130c84ec6d60f31b711400e8445a8d0d4a2b5de8.zip",
)
load("@bazel_federation//:repositories.bzl", "rules_python")

rules_python()

load("@bazel_federation//setup:rules_python.bzl", "rules_python_setup")

rules_python_setup()

#poetry
load("@rules_python//python:pip.bzl", "pip_install")
load("//build/rules:poetry.bzl", "poetry_export")

poetry_export(name = "poetry_requirements")

pip_install(
    name = "pip_deps",
    python_interpreter = "python3",
    requirements = "@poetry_requirements//:requirements.txt",
)
