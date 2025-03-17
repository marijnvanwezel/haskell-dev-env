#!/bin/bash

# Start local Hoogle server
nohup hoogle server --port=23196 --local > /dev/null 2>&1 &
