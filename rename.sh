#!/bin/bash

# Rename files to fit LyRic requirements
# Run it inside the directory containing target files

for file in *fastq.gz
    do
        # Aquire basic info
        rep="Rep1"
        ext="fastq.gz"
        tissue=$(echo $file | awk -F'_' '{print $3}')
        # Change 28HPF -> 28hpf
        if [ $tissue = "28HPF" ]; then
            tissue="28hpf"
        fi

        # Acquire capture status and format it
        capture_raw=$(echo $file | awk -F'_' '{print $5}')
        if [ $capture_raw = "PRECAP" ]; then
            capture="Pre"
        elif [ $capture_raw = "POSTCAP" ]; then
            capture="Post"
        else
            echo "ERROR! Cannot read capture status for file: ${file}"
            echo "EXITTING"
            exit
        fi

        # Fix 20220429_DR_Heart_CapTrap_POSTCAP_ALL_JOINED.fastq.gz sample name
        # to include SS500 (as every Post-capture samples)
        if [ $file = "20220429_DR_Heart_CapTrap_POSTCAP_ALL_JOINED.fastq.gz" ]; then
            mv $file 20220429_DR_Heart_CapTrap_POSTCAP_SS500_ALL_JOINED.fastq.gz
            file="20220429_DR_Heart_CapTrap_POSTCAP_SS500_ALL_JOINED.fastq.gz"
        fi

        # Create new name
        tso=$(echo $file | awk -F'_' '{print $4}')
        ss=$(echo $file | awk -F'_' '{print $6}')
        if [ $tso = "TSO" ]; then
            new_name="${capture}_${tissue}-TSO_${rep}_${ext}"
        elif [ $ss = "SS500" ]; then
            new_name="${capture}_${tissue}_${rep}_${ext}"
        else
            new_name="${capture}_${tissue}-noSS500_${rep}_${ext}"
        fi

        # Rename file
        mv $file $new_name
        
        # Report name change
        echo "Renamed: ${file} -> ${new_name}"
    done

# Report completion
echo "FILES RENAMED SUCCESSFULLY!"
