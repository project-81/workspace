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
