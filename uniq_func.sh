
#!/bin/bash

function check_duplicates() {
    count_1=$(wc -l < $1)
    uniq $1 > uniq_file
    count_2=$(wc -l < uniq_file)
    if [ "$count_1" -gt "$count_2" ]; then
        echo "Verification Check Failed"
        echo "************   Duplicates have been found   ***********"
        sort $1 | uniq -c | sort -nr
    fi
    rm uniq_file
}

check_duplicates test_dups.sh
