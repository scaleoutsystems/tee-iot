#!/bin/bash
set -e

# Init venv
python -m venv .venv

# Pip deps
.venv/bin/pip install --upgrade pip
.venv/bin/pip install -r requirements.txt
.venv/bin/pip install -e "git+https://github.com/scaleoutsystems/fedn.git@develop#egg=fedn&subdirectory=fedn"