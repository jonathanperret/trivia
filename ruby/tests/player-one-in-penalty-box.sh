#!/bin/sh -e

$(dirname $0)/player-one-in-penalty-box | grep penalty
echo "Erreur."
