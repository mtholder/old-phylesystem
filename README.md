# phylesystem

[![Build Status](https://secure.travis-ci.org/OpenTreeOfLife/phylesystem.png)](http://travis-ci.org/OpenTreeOfLife/phylesystem.png)

The phylogenetic studies in this repository are synthesized into the
[Open Tree of Life](http://opentreeoflife.org) .

## The Open Tree Of Life NexSON Datastore

These studies are stored as JSON files, in the NexSON format. NexSON is simply
badgerfish conventions applied to NeXML.

## Getting involved

[![Visit our IRC channel](https://kiwiirc.com/buttons/irc.freenode.net/opentreeoflife.png)](https://kiwiirc.com/client/irc.freenode.net/?nick=guest|?#opentreeoflife)

We maintain the #opentreeoflife chat (IRC) channel on [Freenode](http://freenode.net/). Clicking the button above will join the channel as user __guest__, using the web-based [KiwiIRC](https://kiwiirc.com/) client. Yes, there are even [logs](http://irclog.perlgeek.de/opentreeoflife/today).

## Fetching changes from phylografter.

As a temporary, stopgap measure we can run ```bin/refresh_nexsons_from_phylografter.py``` to
fetch new versions of the files from phylografter. This will overwrite files in the repo
without any sophisticated merging. So this is intended to be used only before we start 
using this repo as a data store for study curation.

The ```bin/refresh_nexsons_from_phylografter.py``` script requires that the python requests
package be installed.  You can do this with:

    $ pip install requests

## License

The *code* in this repository is released under the 2-clause BSD license. See
the LICENSE file for more details.

The *data* in this repository is released under the [Create Commons Zero 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/) license.

