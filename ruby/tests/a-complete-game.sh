#!/bin/sh -e

$(dirname $0)/a-complete-game | diff $(dirname $0)/a-complete-game.master.txt -
