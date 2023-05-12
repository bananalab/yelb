#!/bin/bash -uex

# Codedeploy won't overwrite files so we need to cleanup
rm -rf /tmp/yelb
rm -rf /home/yelb/*