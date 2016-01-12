#Author: Alcolawl
#Settings By: SoniCron
#Device: Nexus 6P (Angler)
#Codename: MadDog
#Build Status: Alpha
#Version: 0.1
#Last Updated: 1/11/2016
#Notes: Please give credit when using this in your work!
echo ----------------------------------------------------
echo Applying 'ButterFly' Interactive Governor Settings
echo ----------------------------------------------------

#Apply settings to LITTLE cluster
echo Applying settings to LITTLE cluster
#Temporarily change permissions to governor files for the LITTLE cluster to enable Interactive governor
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#Temporarily change permissions to governor files for the Big cluster to lower minimum frequency to 384MHz
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq			#Core 0-3 Minimum Frequency = 384MHz			
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
#Tweak Interactive Governor
echo 70 460800:58 600000:82 672000:72 787200:92 864000:83 960000:99 1248000:75 1478000:70 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo -1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack
echo 1440000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 20000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 100 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 80000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 20000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis

#Apply settings to Big cluster
echo Applying settings to Big cluster
#Temporarily change permissions to governor files for the Big cluster to enable Interactive governor
echo 1 > /sys/devices/system/cpu/cpu4/online								#Online Core 4
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
#Temporarily change permissions to governor files for the Big cluster to lower minimum frequency to 633MHz
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo 633600 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq			#Core 4 Minimum Frequency = 633MHz			
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
#Tweak Interactive Governor
echo 74 768000:73 864000:64 960000:80 1248000:61 1344000:69 1440000:64 1536000:74 1632000:69 1689600:67 1824000:72 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo -1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack
echo 1824000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 20000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 90 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 60000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 20000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis

#Enable Input Boost for LITTLE cluster @600MHz for 40ms
echo Enabling Input Boost at 600MHz for the LITTLE cluster
echo 0:600000 1:600000 2:600000 3:600000 4:0 5:0 > /sys/module/cpu_boost/parameters/input_boost_freq
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
