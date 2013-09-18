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

## OToL API

This repo will be used by the Open Tree of Life API, which will be the main
entry point for people to access the OToL in a programmatic way. It is expected
that some people may want to interact directly with this repo for large data
changes, but most will be curating data via a website which uses the OToL API.

The API will abstract away all the Git-specific details of this repo, so users
of the API can be blissfully ignorant of all the implementation details of
TreeNexus.  Additionally, users of the OToL API will be able to download select
parts of the OToL without downloading the entire corpus or even an entire
study.

## NexSON

NexSON is a one-to-one conversion of [NeXML](http://nexml.org) according to
[Badgerfish](http://badgerfish.ning.com/) conventions.  Most OToL applications
prefer JSON over XML, so it makes more sense to store our data in that format.
It takes up less space, too.

Each NexSON file must:

* be valid NexSON (and hence valid JSON)
* be less than 50MB (files >=50MB generate warnings on Github and files larger than 100MB are not allowed)
* be "prettified" with human-readable linebreaks and indentation (so we can get meaningful diffs)

### Basic API methods

The most basic ways to interact with the API are to request a phylogenetic
study via a HTTP GET and to update an entire study (not a part of it) via HTTP
POST. All HTTP POST requests require a valid API key with the ```key```
parameter.

Examples of how to interact with the basic API via ```curl``` are provide below.

### OToL API Version 1 Methods

To get the entire NexSON of study N :

    curl http://api.opentreeoflife.org/1/study/N.json

On the backend, the API will ask treenexus for the directory containing study
```N```.  If the JSON representing that study is greater than 50MB, it will be
broken into multiple files to be stored in Git, so they  will be merged
together before a response is sent. This is all transparent to the user of the
OToL API. Only people using the treenexus data files directly will need to
handle this.

These files will have the structure of:

    studies/N/N-0.json
    studies/N/N-1.json
    ....
    studies/N/N-10.json

To update/overwrite the entire NexSON for study N with a local file called
```N.json``` and an API key called "deadbeef":

    curl -X POST http://api.opentreeoflife.org/1/study/N.json?key=deadbeef \
        -H "Content-Type: Application/json" -d@N.json

All API calls are specific to the API version, which is a part of the URL. This
allows for new versions of the API to come out which are not
backward-compatible, while allowing old clients to continue working with older
API versions.

Any POST request attempting to update a study with invalid JSON will be denied
and an HTTP error code 400 will be returned.

## Authors

Jonathan "Duke" Leto
