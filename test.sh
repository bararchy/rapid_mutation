#!/bin/bash

export LD_LIBRARY_PATH="`pwd`/lib/crsfml/voidcsfml"
crystal src/rapid_mutation.cr           
