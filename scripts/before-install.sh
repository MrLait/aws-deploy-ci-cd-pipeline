# mkdir /home/ubuntu/myapp1

# Delete the old  directory as needed.
if [ -d /home/ubuntu/myapp1 ]; then
    rm -rf /home/ubuntu/myapp1
fi

if [ -d /home/ubuntu/src ]; then
    rm -rf /home/ubuntu/src
fi
