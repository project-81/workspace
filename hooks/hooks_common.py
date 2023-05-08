"""
Common methods and definitions for project hooks.
"""

# built-in
from pathlib import Path
from multiprocessing import cpu_count

PREFIX = Path.home().joinpath(".local")
PREFIX_ARGS = f"--prefix={PREFIX}"
MAKE_NPROCS = f"-j{cpu_count()}"
