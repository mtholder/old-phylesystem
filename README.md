# treenexus

[![Build Status](https://secure.travis-ci.org/OpenTreeOfLife/treenexus.png)](http://travis-ci.org/OpenTreeOfLife/treenexus.png)

The phylogenetic studies in this repository are synthesized into the
[Open Tree of Life](http://opentreeoflife.org) .

## The Open Tree Of Life NexSON Datastore

These studies are stored as JSON files, in the NexSON format. NexSON is simply
badgerfish conventions applied to NeXML.

## Getting involved

There is a #otol channel on the Freenode IRC network (chat.freenode.net).

## Fetching changes from phylografter.

As a temporary, stopgap measure we can run bin/refresh_nexsons_from_phylografter.py to
fetch new versions of the files from phylografter. This will overwrite files in the repo
without any sophisticated merging. So this is intended to be used only before we start 
using this repo as a data store for study curation.

The bin/refresh_nexsons_from_phylografter.py script requires that the python requests
package be installed.  You can do this with:

    $ pip install requests

