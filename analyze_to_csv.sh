#!/bin/bash

# Run on 4 cores:
# srun --pty --ntasks-per-node=4 /bin/bash

# Notify if not given extension (or given more than one)
if [ $# -ne 1 ]; then
echo "USAGE: ./analyse.sh *extension"
echo "Eg.: ./analyse.sh *.fastq.gz"
echo "Every file with .fastq.gz extension will be checked."
exit
fi

# create results file storing output
echo 'Sample_name,Before,After' > results

# search for duplicated lines (keep in mind those are fastq structured files)

for file in $1
do
    echo "Analyzing ${file}..."
    before=$(zcat ${file} | paste - - - - | wc -l)
    after=$(zcat ${file} | paste - - - - | LC_ALL=C sort -u --parallel=4 -T ./temp | wc -l)
    echo -e "${file},${before},${after}" >> results
    if [ $before -ne $after ]; then
        echo 'FAILED! Duplicated entries detected!'
    else
        echo 'PASSED!'
    fi
    echo "${file} completed!"
    echo "######################"
done
