#!/bin/csh


set list = `cat fullList`

foreach i ($list)
    echo "creating $i"
    mkdir $i

end

