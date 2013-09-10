# The TreeNexus Design Document

This file documents the design of TreeNexus, including requirements defined by
the [Open Tree of Life](http://opentreeoflife.org) community and software team
and the reasons for various "details of implementation".

## Big Picture

The raw data of the Open Tree of Life needs to be stored somewhere. Prior to
TreeNexus, this data was stored in flat files and relational databases.

TreeNexus stores each phylogenetic study in a single JSON file in NexSON
format.  In the future, each study will become a directory so that we do not
run into large-file issues with Git. Currently (September 2013)

* the largest study is 24MB of uncompressed JSON.
* about a dozen studies are larger than 1MB
* there are about 2600 studies in our datastore
* there are currently about 8000 studies in the wild (some may need heavy datascrubbing to be importable)
* We can expect dozens to hundreds of studies to be uploaded per year
* The *metadata* about studies, so-called annotation data, will likely grow very quickly as tools learn to autogenerate this data

## NexSON

NexSON is a one-to-one conversion of [NeXML](http://nexml.org) according to
Badgerfish conventions.  Most OToL applications prefer JSON over XML, so it
makes more sense to store our data in that format. It takes up less space, too.

Each NexSON file must:

* be valid NexSON (and hence valid JSON)
* be less than 50MB (files >=50MB generate warnings on Github and files larger than 100MB are not allowed)
* be "prettified" with human-readable linebreaks (so we can get meaningful diffs)

## Authors

Jonathan "Duke" Leto
