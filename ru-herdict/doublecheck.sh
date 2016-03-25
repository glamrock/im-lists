#!/bin/bash
# Down verification via dns/dig by Griffin ^_^
# basically the same thing as before, just running the "down" sites through dig
# to make sure they are really not available.  Sites that pass this test
# are placed in a third site category, as they may be unavailable or blocked in
# the test location, but have defined nameservers in DNS records.

readarray -t array < sitesdown.txt

    for i in "${array[@]}"
      do (
            if [[ $(dig @8.8.8.8 +short NS "$i") ]]
              then echo "$i" >> sitemeh.txt
            fi
       )
done
