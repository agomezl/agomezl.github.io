#!/bin/bash

sed -i 's|https://hackage.haskell.org/package/\([^/docs/]\+\)|https://hackage.haskell.org/package/\1/docs|g' *
