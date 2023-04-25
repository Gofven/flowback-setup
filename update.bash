#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source .env

bash "${SCRIPT_DIR}/"update_backend.bash
bash "${SCRIPT_DIR}/"update_frontend.bash
