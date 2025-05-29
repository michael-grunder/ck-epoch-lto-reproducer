## Concurrency kit aarch64 LTO reproducer

This repo makes it easier to reproduce an LTO based aarch64 test failure with ck_epoch

## Build and run image

```bash
docker build --platform linux/aarch64 .
docker run --rm -it --platform linux/aarch64 <image sha> bash
:/ # cd /opt/ck/
:/opt/ck # regressions/ck_epoch/validate/ck_epoch_section_2 1 1 1
.8 0 7
8 0 7
8 0 7
8 0 7
8 0 7
8 0 7
8 0 7
8 0 7
```
