curl -u westonized: https://api.github.com/repos/westonized/ReleaseTests/releases -X POST -d @taginfo.json
curl -u westonized: https://uploads.github.com/repos/westonized/ReleaseTests/releases/1600441/assets?name=file.json -X POST -d @tagInfo.json --header "Content-Type:application/json"
