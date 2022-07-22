#! /bin/bash

DIR="$PWD"

echo "Using directory: $DIR"
echo "Convert existing files"
# traverse already existing files
 find "$DIR" -type f -iname '*.HEIC' -print0 | 
    while IFS= read -r -d '' f; do
      jpg_file="${f/%.HEIC/.jpg}"
      if [ ! -f "$jpg_file" ]; then
        heif-convert "$f" "$jpg_file"
      fi
    done

echo "Watching for new files"
inotifywait -qm -r "$DIR" |
  while read -r directory events filename; do
    echo 
    if [[ $filename == *.HEIC ]]; then
      jpg_file="${filename/%.HEIC/.jpg}"
      if [ ! -f "$directory/$jpg_file" ]; then
        heif-convert "$directory/$filename" "$directory/$jpg_file"
      fi
    fi
  done
