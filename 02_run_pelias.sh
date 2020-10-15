#!/bin/bash

echo "Current directory $(pwd)"

echo "Moving to france/ directory"
cd projects/france

# run build
echo "Updating all docker images"
pelias compose pull
pelias elastic start
pelias elastic wait
pelias elastic create
pelias download wof
pelias download osm
pelias prepare all
pelias import wof
pelias import osm
pelias compose up

