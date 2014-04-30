# old-phylesystem or "the repo formerly known as phylesystem"

Before we started tracking changes permanently in the new
curation tool for the Open Tree of Life project, this was
the phylesystem repo.

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

