#!/usr/bin/env python

from fabric import Connection

conn = Connection("nuc2.local")

for _ in range(5):
    conn.run("sudo ls", pty=True)
