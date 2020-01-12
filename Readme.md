# M4S Downloader

This scripts allows archiving of M4S streams from legally available sources, i.g. BBC Sounds.

# Usage

1. Find base url of stream by using your browser's dev tools (network monitor). The base url is the common part of both the dash file and the M4S segments.
2. Determine number of available segements by listening to the last part of the stream and observing the network monitor.
3. Run the `m4s-downloader.sh` script and pass base url and start/end segment.

# Dependencies

- `bash`
- `curl`

## Known Issues

- This script only works for downloads where the dash file's url is `BASE_URL.dash` and the segments' urls are `BASE_URL-INDEX.m4s`.
- Sequential downloads are used to get all segments where parallel downloads should be possible and would increase performance.