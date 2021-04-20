
#!/bin/bash
gpu_temp=`nvidia-smi -q -d TEMPERATURE | grep "GPU Current Temp" | awk '{print $5}'`
case $gpu_temp in
[1-70]*)
echo "OK - $gpu_temp℃ in normal operating range."
exit 0
;;
[71-80]*)
echo "WARNING - $gpu_temp℃ in high operating range."
exit 1
;;
[81-100]*)
echo "CRITICAL - $gpu_temp℃ in extreme operating range. Shutdown ASAP!"
exit 2
;;
*)
echo "UNKNOWN - $gpu_temp℃ is current temperature."
exit 3
;;
esac
