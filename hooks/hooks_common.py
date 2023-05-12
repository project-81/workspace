"""
Common methods and definitions for project hooks.
"""

# built-in
from multiprocessing import cpu_count
from pathlib import Path

PREFIX = Path.home().joinpath(".local")
PREFIX_ARGS = f"--prefix={PREFIX}"
MAKE_NPROCS = f"-j{cpu_count()}"

VENV = Path.home().joinpath("venv")
VENV_BIN = VENV.joinpath("bin")

# Full paths to programs that should be used instead of allowing PATH to
# resolve them.
PROGS = {"pip": VENV_BIN.joinpath("pip")}


def is_local_bin(program: str) -> bool:
    """Determine if a binary or entry script is installed locally."""
    return PREFIX.joinpath("bin", program).is_file()
