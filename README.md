# Alfred Workflow for Hakuna

This is a workflow in [Alfred][alfred] that allows to start and stop timers in [Hakuna][hakuna].

[alfred]: https://www.alfredapp.com
[hakuna]: https://www.hakuna.ch

## Setup

To configure this workflow you need to define the following two variables as follows:

* `hakuna_api_key`, which you get by clicking on your name in the top right corner of Hakuna and then choosing "API".
* `hakuna_base_url`, which is your Hakuna URL until the first slash ('/'), e.g. "https://companyname.hakuna.ch"

## License

This workflow is released under [MIT license][license].

[license]: https://github.com/nxt-engineering/alfred-hakuna/blob/master/LICENSE

## Contributions

The source code is available at [Github][gh]. Pull requests are welcome.

[gh]: https://github.com/nxt-engineering/alfred-hakuna

## Development

Clone this repository.
Copy the `info.plist.template` file to `info.plist`.

The update the variables `hakuna_api_key` and `hakuna_base_url` to match your Hakuna instance.

**Before you push, make sure to copy `info.plist` to `info.plist.template` and remove all sensitive information!**

## Release

To release, export the workflow in Alfred and adjust the version.
Then create a git tag with the same version.

Finally, go to Github and create a new release and upload the exported workflow file.

## Sponsor

The creation of this workflow was sponsored by [nxt Engineering GmbH][nxt].

[nxt]: https://nxt.engineering
