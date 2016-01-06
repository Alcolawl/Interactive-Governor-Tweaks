echo ----------------------------------------------------
echo Applying SilverFish V2 Interactive Governor Settings
echo ----------------------------------------------------

echo Applying settings to LITTLE cluster
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
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
echo 95 460800:62 600000:80 672000:95 787200:50 864000:54 960000:60 1248000:78 1440000:98 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo -1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack
echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 20000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 10000 672000:80000 787200:10000 1248000:40000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 200 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 100000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis

echo Applying settings to Big cluster
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
echo 1 > /sys/devices/system/cpu/cpu5/online
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo 384000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo 1 > /sys/devices/system/cpu/cpu1/online
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
echo 384000 > /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
echo 26 480000:34 633600:42 768000:47 864000:52 960000:68 1248000:73 1344000:78 1440000:84 1536000:89 1632000:92 1689600:95 1824000:98 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo -1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack
echo 384000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 30000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 0 633600:30000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 200 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 30000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis

echo Enabling Input Boost at 672MHz for the LITTLE cluster
echo 0:672000 1:672000 2:672000 3:672000 4:0 5:0 > /sys/module/cpu_boost/parameters/input_boost_freq
echo 0 > /sys/module/cpu_boost/parameters/boost_ms
echo 40 > /sys/module/cpu_boost/parameters/input_boost_ms
echo ----------------------------------------------------
echo Settings Successfully Applied! You may now tweak them further in ElementalX Kernel Manager or Kernel Adiutor
echo ----------------------------------------------------


