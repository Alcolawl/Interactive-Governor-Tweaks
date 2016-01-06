echo ----------------------------------------------------
echo Applying 'GhostPepper' Interactive Governor Settings
echo ----------------------------------------------------

#Apply settings to LITTLE cluster
echo Applying settings to LITTLE cluster
#Temporarily change permissions to governor files for the little cluster to enable Interactive governor
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
#Tweak Interactive Governor
echo 95 460800:25 600000:43 672000:65 787200:78 864000:92 960000:95 1248000:98 1440000:100 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo -1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack
echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 20000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 20000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 200 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 60000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis

#Apply settings to Big cluster
echo Applying settings to Big cluster
#Temporarily change permissions to governor files for the little cluster to enable Interactive governor
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
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
echo 384000 > /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
chmod 444 /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
#Tweak Interactive Governor
echo 24 480000:17 633600:31 768000:43 864000:56 960000:79 1248000:76 1344000:85 1440000:92 1536000:95 1632000:98 1689600:99 1824000:100 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo -1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack
echo 384000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 40000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 40000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 200 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 40000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis

#Enable Input Boost for LITTLE cluster @672MHz for 40ms
echo Enabling Input Boost at 672MHz for the LITTLE cluster
echo 0:672000 1:672000 2:672000 3:672000 4:0 5:0 > /sys/module/cpu_boost/parameters/input_boost_freq
echo 0 > /sys/module/cpu_boost/parameters/boost_ms
echo 40 > /sys/module/cpu_boost/parameters/input_boost_ms
echo ----------------------------------------------------
echo Settings Successfully Applied! You may now tweak them further in ElementalX Kernel Manager
echo ----------------------------------------------------