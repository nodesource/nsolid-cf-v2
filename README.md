nsolid-cf-v2 - Using N|Solid v2 on Cloud Foundry
================================================================================

**Note: this repository is for N|Solid version 2.  The repository for N|Solid
version 3 is available at:
https://github.com/nodesource/nsolid-cf-v3**


This repository contains sample applications in the `sample-apps` directory
that use the [Cloud Foundry buildpack for N|Solid v2][N|Solid buildpack].

Before pushing any apps, you should create the `nsolid-storage` user-provided
service using the [instructions provided in the buildpack][ups-nsolid-storage].

After the `nsolid-storage` user-provided service is created and you have the
N|Solid Storage and Console servers running, you can use `cf push` to push
the apps to Cloud Foundry.

* `dillinger`

  The awesome open source [Dillinger](http://dillinger.io) application.

* `hello-world`

  A simple "Hello, World!" application.

* `print-versions-4x`

  Displays the versions of the Node.js and N|Solid Runtime components.
  Specifically selects the version of the N|Solid Runtime that corresponds to
  the Node.js 4.x Argon LTS line, via the `engines` property in the
  `package.json` file.

* `print-versions-6x`

  Same as `print-version-4x`, but uses the Node.js 6.x Boron LTS line

* `print-versions-8x`

  Same as `print-version-4x`, but uses the Node.js 8.x Carbon LTS line

* `native`

  A Node.js application which uses a native package, to ensure that native
  packages work with N|Solid in Cloud Foundry.


Running N|Solid servers as Cloud Foundry apps
================================================================================

This repository also contains the following components that allow you to run
N|Solid servers as Cloud Foundry apps on Pivotal Cloud Foundry, using the
[Cloud Foundry buildpack for N|Solid v2][N|Solid buildpack].

* [nsolid-storage-app](nsolid-storage-app/README.md)

  Run the N|Solid Storage server as a Cloud Foundry app, allowing connections
  from the N|Solid Console and apps built with the Cloud Foundry buildpack for
  N|Solid v2.

* [nsolid-console-app](nsolid-console-app/README.md)

  Run the N|Solid Console server as a Cloud Foundry app, connecting to the
  N|Solid Storage server.


General Notes
================================================================================

See the documentation for the
[Cloud Foundry buildpack for N|Solid v2][N|Solid buildpack] for more information
on:

* selecting which version of the N|Solid Runtime to use with your app

* creating a user-provided service named `nsolid-storage` which will be used
  to connect your applications using N|Solid to the N|Solid Storage server


Authors and Contributors
================================================================================

<table><tbody>
  <tr>
    <th align="left">Patrick Mueller</th>
    <td><a href="https://github.com/pmuellr">GitHub/pmuellr</a></td>
    <td><a href="https://twitter.com/pmuellr">Twitter/@pmuellr</a></td>
  </tr>
</tbody></table>


Contributing
================================================================================

Awesome!  We're happy that you want to contribute.

Make sure that you're read and understand the [Code of Conduct](CODE_OF_CONDUCT.md).


License & Copyright
================================================================================

**nsolid-cf** is Copyright (c) 2016 NodeSource and licensed under the
MIT license. All rights not explicitly granted in the MIT license are reserved.
See the included [LICENSE.md](LICENSE.md) file for more details.


[N|Solid buildpack]: https://github.com/nodesource/nsolid-buildpack-cf-v2
[ups-nsolid-storage]: https://github.com/nodesource/nsolid-buildpack-cf-v2#user-provided-service-nsolid-storage
