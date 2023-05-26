#!/bin/bash

log_directory="/var/log"

log_pattern="*.log"

error_keyword="error"

output_file="/home/pooja/wrong.txt"

 "$output_file"

for log_file in $(find "$log_directory" -type f -name "$log_pattern"); do
    echo "Log : $log_file" >> "$output_file"

    errors=$(grep -i "$error_keyword" "$log_file")
    if [ -n "$errors" ]; then
        echo "Errors : $log_file " >> "$output_file"
        echo "$errors" >> "$output_file"
    else
        echo "No errors found." >> "$output_file"
    fi

    echo "" >> "$output_file"
done

echo "Errors saved to $output_file"
echo "hellov fvf"