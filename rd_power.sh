#!/bin/sh

e=$(echo "scale=3; 0.5 ^ $(sudo rdmsr 0x606 -u --bitfield 3:0)" | bc)
p1="$(rdmsr 0x611 -u --bitfield 31:0)"
sleep 1
p2="$(rdmsr 0x611 -u --bitfield 31:0)"
echo "scale=2; (${p2}-${p1})/1000/1*${e}" | bc

exit 0
