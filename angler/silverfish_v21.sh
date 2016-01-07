#Script created by Alcolawl - 1/06/2016 - Please give credit when using this in your work!
echo ----------------------------------------------------
echo Applying 'SilverFish' v2.1 Interactive Governor Settings
echo ----------------------------------------------------

#Apply settings to LITTLE cluster
echo Applying settings to LITTLE cluster
#Temporarily change permissions to governor files for the LITTLE cluster to enable Interactive governor
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#Tweak Interactive Governor
echo 95 460800:62 600000:80 672000:95 768000:50 864000:54 960000:60 1248000:78 1478000:98 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo -1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack
echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 10000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 10000 672000:80000 768000:10000 1248000:40000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 200 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 100000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse_duration

#Apply settings to Big cluster
echo Applying settings to Big cluster
#Temporarily change permissions to governor files for the Big cluster to enable Interactive governor
echo 1 > /sys/devices/system/cpu/cpu4/online								#Online Core 4
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo 1 > /sys/devices/system/cpu/cpu5/online								#Online Core 5
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
#Temporarily change permissions to governor files for the Big cluster to lower minimum frequency to 384MHz
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo 384000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq			#Core 4 Minimum Frequency = 384MHz
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
echo 384000 > /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq			#Core 5 Minimum Frequency = 384MHz
chmod 444 /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu6/cpufreq/scaling_min_freq
echo 384000 > /sys/devices/system/cpu/cpu6/cpufreq/scaling_min_freq			#Core 6 Minimum Frequency = 384MHz
chmod 444 /sys/devices/system/cpu/cpu6/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq
echo 384000 > /sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq			#Core 7 Minimum Frequency = 384MHz
chmod 444 /sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq
#Tweak Interactive Governor
echo 26 480000:34 633600:42 768000:47 864000:52 960000:68 1248000:73 1344000:78 1440000:84 1536000:89 1632000:92 1728000:95 1824000:98 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo -1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack
echo 384000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 30000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 0 633600:30000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 200 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 30000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/boostpulse_duration

#Enable Input Boost for LITTLE cluster @672MHz for 40ms
echo Enabling Input Boost at 672MHz for the LITTLE cluster
echo 0:672000 1:672000 2:672000 3:672000 4:0 5:0 6:0 7:0 > /sys/module/cpu_boost/parameters/input_boost_freq
echo 0 > /sys/module/cpu_boost/parameters/boost_ms
echo 40 > /sys/module/cpu_boost/parameters/input_boost_ms
#Disable TouchBoost
echo Disabling TouchBoost
echo 0 > /sys/module/msm_performance/parameters/touchboost
#Disable Core Control and Enable Thermal Throttling allowing for longer sustained performance
echo Disabling Aggressive CPU Thermal Throttling
echo 0 > /sys/module/msm_thermal/core_control/enabled
echo Y > /sys/module/msm_thermal/parameters/enabled
echo ----------------------------------------------------
echo Settings Successfully Applied! You may now tweak them further in ElementalX Kernel Manager
echo ----------------------------------------------------