"""Poetry rules."""

def _symlink_project_files(repository_ctx):
    repository_ctx.symlink(
        repository_ctx.attr.project,
        repository_ctx.path("pyproject.toml"),
    )
    repository_ctx.symlink(
        repository_ctx.attr.lock,
        repository_ctx.path("poetry.lock"),
    )

def _poetry_export_impl(repository_ctx):
    _symlink_project_files(repository_ctx)
    repository_ctx.file("BUILD.bazel", "")

    repository_ctx.execute(
        [
            "poetry",
            "export",
            "-f",
            "requirements.txt",
            "--without-hashes",
            "-o",
            repository_ctx.path("_requirements.txt"),
        ],
        quiet = False,
        working_directory = "{poetry}",
    )
    reqs = repository_ctx.read(repository_ctx.path("_requirements.txt"))
    reqs += "\n setuptools==49.6.0"
    repository_ctx.file(repository_ctx.path("requirements.txt"), reqs)

poetry_export = repository_rule(
    attrs = {
        "project": attr.label(
            mandatory = False,
            default = "//:pyproject.toml",
            allow_single_file = True,
            doc = "The label of the pyproject.toml file.",
        ),
        "lock": attr.label(
            mandatory = False,
            default = "//:poetry.lock",
            allow_single_file = True,
            doc = "The label of the poetry.lock file.",
        ),
    },
    implementation = _poetry_export_impl,
)
