#!/bin/bash
# Up/Down checker by Griffin ^_^

readarray -t array < *seeds.txt

    for i in "${array[@]}"
      do (
            if curl -s --head --request GET "$i" | grep -E '200|300|301|302' > /dev/null
              then echo "$i" >> sitesup.txt
            else echo "$i" >> sitesdown.txt
            fi
       )
done

