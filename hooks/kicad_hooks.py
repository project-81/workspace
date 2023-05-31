"""
A module for implementing ctags hooks.
"""

# built-in
from pathlib import Path
from typing import Any, Dict

# third-party
from userfs.build import run_process
from userfs.config import ProjectSpecification
from vcorelib.paths.context import in_dir

# internal
from hooks_common import PREFIX, is_local_bin


def post_fetch(
    root: Path,
    project: ProjectSpecification,
    _: Dict[str, Any],
    __: Dict[str, Any],
) -> None:
    """Project interaction."""

    if is_local_bin(project.repository):
        return

    with in_dir(project.location(root=root)):
        build = Path("build")
        release = build.joinpath("release")
        release.mkdir(exist_ok=True, parents=True)
        build.joinpath("debug").mkdir(exist_ok=True, parents=True)

        with in_dir(release):
            if not Path("build.ninja").is_file():
                run_process(
                    project.logger,
                    [
                        "cmake",
                        "-DCMAKE_BUILD_TYPE=RelWithDebInfo",
                        f"-DCMAKE_INSTALL_PREFIX={PREFIX}",
                        "-DCMAKE_CXX_FLAGS=-fuse-ld=mold",
                        "../../",
                    ],
                )
            run_process(project.logger, ["ninja"])
            run_process(project.logger, ["ninja", "install"])
