#!/system/bin/sh

#check if orignal files exist
if [ ! -e /system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv_ftm.bin ]; then 
    echo "WCNSS_qcom_wlan_nv_ftm.bin does not exist"
    exit 0
fi
if [ ! -e /system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv_enhanced.bin ]; then 
    echo "WCNSS_qcom_wlan_nv_enhanced.bin does not exist"
    exit 0
fi

is_testmode=$(cat /proc/cmdline|grep "testmode")
if [ -e /persist/.check_goldenbin ]; then
    goldenbin=$(cat /persist/.check_goldenbin)
else
    goldenbin=""
fi

if [ "${is_testmode}" != "" ]; then
    if [ "$goldenbin" != "0" ]; then
	cat /system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv_ftm.bin > /persist/WCNSS_qcom_wlan_nv.bin
        echo 0 > /persist/.check_goldenbin
    fi
else
    if [ "$goldenbin" != "1" ]; then
	cat /system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv_enhanced.bin > /persist/WCNSS_qcom_wlan_nv.bin
        echo 1 > /persist/.check_goldenbin
    fi
fi
