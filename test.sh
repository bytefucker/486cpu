#! /bin/bash

# chmod +x
# ./test.sh

# mounting fd0 and creating result dir
mount /dev/fd0 /fd/
mkdir -p /fd/results

echo -n "Enter the CPU number: "
read input
echo -e "***** System Info *****\n" > /fd/results/temp.txt
./home/necro/info >> /fd/results/temp.txt
echo -e "\n****** CPUID ******\n" >> /fd/results/temp.txt
./home/necro/cpuid >> /fd/results/temp.txt
echo -e "\n******** END ********\n" >> /fd/results/temp.txt

# rename
mv /fd/results/temp.txt /fd/results/$input.txt

# unmount
umount /fd/

echo "Fin!"
