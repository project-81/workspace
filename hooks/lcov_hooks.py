"""
A module for implementing lcov hooks.
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
        # Install.
        run_process(project.logger, ["make", f"PREFIX={PREFIX}", "install"])
