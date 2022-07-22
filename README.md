# heif-converter

## A container that converts HEIF(\*.heic) files to JPEG(\*.jpg).

At first it looks for existing HEIF files and converts them. Then it starts monitoring for new HEIF files(including subdirectories).  


Uses `heif-convert` tool from `libheif-examples` package.

## How to build:
```bash
docker build -t heif-converter .
```

## How to run:
```bash
docker run -d \
  --name=heif-converter \
  -v <target dir>:/data \
  -w /data \
  --restart unless-stopped \
  heif-converter
```
