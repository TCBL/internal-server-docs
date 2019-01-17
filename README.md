# TCBL Internal server docs

Hi,

you most probably want to visit the [wiki](https://github.com/TCBL/internal-server-docs/wiki/home)
associated with this project to read documentation.

Otherwise, have a look at the separate directories in this project.

## Directories containing content applicable to a server

If the directory name starts with the server name followed by a dash (e.g. tcblsso-...), then it contains content applicable to that server.

Each such directory contains a `README.txt` file with some explanation and a subdirectory `content` containing the content in the appropriate directory structure, relative to the server root folder `/`.

To compare the content with what currently is in place, use the script `scripts/diff-files.sh`.

To put the content in place, use the script `scripts/put-files.sh`.

To update the content (existing files) with what currently is in place, use the script `scripts/get-updated-files.sh`.

Note that some directories share common files. To copy and adapt these scommon files, use the local script `copy-and-adapt-common-files.sh` script.

## The scripts directory

This directory contains some supporting scripts. They are documented internally.

## The migration directory

This directory is self-documenting and linked from the [wiki](https://github.com/TCBL/internal-server-docs/wiki/home).
