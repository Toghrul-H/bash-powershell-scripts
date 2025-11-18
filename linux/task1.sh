```bash
#!/bin/bash
# Script: Count system users
# Usage: ./task1.sh -tu | -ru | -du | -tot

if test $# -ne 1; then
    echo "Write some options, use -help if you need"
    exit 1
fi

case $1 in
  -tu)
    total_users=$(cut -d: -f1 /etc/passwd | wc -l)
    echo "Total users: $total_users"
    ;;
  -ru)
    real_users=$(awk -F: '$3 >= 1000 && $3 < 60000 {print $1}' /etc/passwd | wc -l)
    echo "Real users: $real_users"
    ;;
  -du)
    duplicate_users=$(cut -d: -f1 /etc/passwd | sort | uniq -d | wc -l)
    echo "Duplicate users: $duplicate_users"
    ;;
  -tot)
    elte_users=$(who | wc -l)
    echo "Total ELTE users: $elte_users"
    ;;
  -help)
    echo "Use:
    -tu  (total users)
    -ru  (real users)
    -du  (duplicate users)
    -tot (total logged in users)"
    ;;
esac