echo ----------------------------------------------------
echo Applying Stable v2.0 Interactive Governor Settings
echo ----------------------------------------------------

echo Applying settings to LITTLE cluster
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo 1 > /sys/devices/system/cpu/cpu1/online
chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo 1 > /sys/devices/system/cpu/cpu2/online
chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo 1 > /sys/devices/system/cpu/cpu3/online
chmod 644 /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
echo 75 460000:69 600000:80 672000:76 787000:81 864000:81 960000:69 1248000:78 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo -1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack
echo 460000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 20000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 30000 600000:20000 672000:10000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 75 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 60000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse_duration

echo Applying settings to Big cluster
echo 1 > /sys/devices/system/cpu/cpu4/online
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo 1 > /sys/devices/system/cpu/cpu5/online
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo 384000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo 1 > /sys/devices/system/cpu/cpu1/online
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
echo 384000 > /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
echo 72 480000:68 633000:74 768000:80 864000:81 960000:69 1248000:83 1344000:84 1440000:84 1536000:84 1632000:86 1689000:83 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo 80000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack
echo 633000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 10000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 10000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 72 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 100000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/boostpulse_duration

echo Disabling Input Boost
echo 0:0 1:0 2:0 3:0 4:0 5:0 > /sys/module/cpu_boost/parameters/input_boost_freq
echo 0 > /sys/module/cpu_boost/parameters/boost_ms
echo 0 > /sys/module/cpu_boost/parameters/input_boost_ms
echo ----------------------------------------------------
echo Settings Successfully Applied! You may now tweak them further in ElementalX Kernel Manager or Kernel Adiutor
echo ----------------------------------------------------


