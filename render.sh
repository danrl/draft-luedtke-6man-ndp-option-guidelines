#!/bin/sh

for xml in $(ls *.xml)
do
  curl --http1.0 -X POST \
    --form "input=@${xml};filename=${xml}" \
    --form "modeAsFormat=txt/ascii" \
    --form "type=binary" \
    --referer "http://xml2rfc.ietf.org/" \
    --progress \
    "http://xml2rfc.ietf.org/cgi-bin/xml2rfc.cgi" \
    > "$(basename ${xml} .xml).txt"
  head "$(basename ${xml} .xml).txt"
done
