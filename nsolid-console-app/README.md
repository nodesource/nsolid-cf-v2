nsolid-cf - Running the N|Solid Console server as a Cloud Foundry app
================================================================================

**Note: this server is NOT designed to be scaled with Cloud Foundry.
You should only run one instance of this app.**

To run N|Solid Console as a Cloud Foundry app, do the following:

* ensure the [user-provided service `nsolid-storage`][ups-nsolid-storage] has
  been created

* run `./setup.sh` to download the N|Solid Console archive

* run `cf push`


customization
--------------------------------------------------------------------------------

The following environment variables may be set on the app itself, or saved in
the `manifest.yml` file in the `env` stanza.


* `NSOLID_CONSOLE_STORAGE_URL` should be set to the URL of the N|Solid
  Storage server.

* `NSOLID_CF_RUN_AGENT` can be set to `false` to indicate the N|Solid agent
  should not be used with this app, so that it won't connect to the N|Solid
  Storage server or be visible in the N|Solid Console


[N|Solid buildpack]: https://github.com/nodesource/nsolid-buildpack-cf
[ups-nsolid-storage]: https://github.com/nodesource/nsolid-buildpack-cf#user-provided-service-nsolid-storage
