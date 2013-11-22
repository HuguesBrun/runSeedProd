#!/bin/csh 

set list = `cat fullList`

foreach i ($list)
	echo "submitting $i"
	bsub -q 8nh run_analyzer.csh $i
end

