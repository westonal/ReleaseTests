#!/bin/bash
function jsonval {
    KEY=$1
    num=$2
    awk -v k=$KEY '{n=split($0,a,","); for (i=1; i<=n; i++) { where = match(a[i], /\"'$KEY'\"/); if(where) {print a[i]} }  }' | tr -d '"' | sed -n ${num}p
}

function getreleaseid {
    grep -Eo "[[:digit:]]+" 
}

releaseid=`curl https://api.github.com/repos/westonized/ReleaseTests/releases | jsonval upload_url 1 | getreleaseid`
#prop='upload_url'
#uploadurl=`jsonval upload_url 1`

#curl https://api.github.com/repos/westonized/ReleaseTests/releases

echo $releaseid

#curl https://api.github.com/repos/westonized/ReleaseTests/releases | sed -e 's/[{}]/''/g' | awk -v k="upload_url" '{n=split($0,a,","); for (i=1; i<=n; i++) { where = match(a[i], /\"upload_url\"/); if(where) {print a[i]} }  }'
