#!/bin/bash

ls -la
time find . -type f -regex ".+\.(ctp|php)"  -exec ls -la {} \;