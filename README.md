## What
The repository uses Sysbench to benchmark I/O performance on both disk and [tmpfs](https://docs.docker.com/storage/tmpfs/).

## How
You can initiate the benchmark test using the following command:
```sh
docker compose up
```
After that, two test reports will be available in the ./reports directory:
- disk.txt: Filesystem benchmark on disk
- tmpfs.txt: Filesystem benchmark on tmpfs
