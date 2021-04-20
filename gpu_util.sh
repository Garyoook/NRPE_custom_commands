
#!/bin/bash
gpu_util=`nvidia-smi -q -d UTILIZATION | grep "Gpu" | awk '{print $3}'`
case $gpu_util in
[1-70]*)
echo "OK - $gpu_util% in normal operating range."
exit 0
;;
[71-85]*)
echo "WARNING - $gpu_util% in high operating range."
exit 1
;;
[86-100]*)
echo "CRITICAL - $gpu_util% in extreme operating range."
exit 2
;;
*)
echo "UNKNOWN - $gpu_util% is current GPU utilization."
exit 3
;;
esac
