#Author: Alcolawl
#Settings By: SoniCron
#Device: Nexus 5X (Bullhead)
#Codename: GlassFish
#Build Status: Stable
#Version: 1.2
#Last Updated: 8/23/2016
#Notes: Please give credit when using this in your work!
echo ----------------------------------------------------
echo Applying 'GlassFish' v1.2 Interactive Governor Settings
echo ----------------------------------------------------

#Apply settings to LITTLE cluster
echo Applying settings to LITTLE cluster
#Temporarily change permissions to governor files for the LITTLE cluster to enable Interactive governor
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#Temporarily change permissions to governor files for the LITTLE cluster ensure minimum frequency is 384MHz
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq			#Core 0-3 Minimum Frequency = 384MHz			
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
#Tweak Interactive Governor
echo 80 460800:70 600000:99 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo 480000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack
echo 960000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 60000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 91 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif 1
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/align_windows

#Apply settings to Big cluster
echo Applying settings to Big cluster
#Temporarily change permissions to governor files for the Big cluster to enable Interactive governor
echo 1 > /sys/devices/system/cpu/cpu4/online								#Online Core 4
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
#Temporarily change permissions to governor files for the Big cluster to raise minimum frequency to 633MHz
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo 633600 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq			#Core 4 Minimum Frequency = 633MHz			
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
#Tweak Interactive Governor
echo 70 960000:90 1440000:99 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo 480000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack
echo 960000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 30000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 91 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif 1
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/align_windows

#Enable Input Boost for LITTLE cluster @600MHz for 1.92 Seconds
echo Enabling Input Boost at 600 MHz for the LITTLE cluster
echo 0:600000 1:600000 2:600000 3:600000 4:0 5:0 > /sys/module/cpu_boost/parameters/input_boost_freq
echo 0 > /sys/module/cpu_boost/parameters/boost_ms
echo 1920 > /sys/module/cpu_boost/parameters/input_boost_ms
#Disable TouchBoost
echo Disabling TouchBoost
echo 0 > /sys/module/msm_performance/parameters/touchboost
#Disable Core Control and Enable Thermal Throttling allowing for longer sustained performance
echo Disabling Aggressive CPU Thermal Throttling
echo 1 > /sys/module/msm_thermal/core_control/enabled
echo N > /sys/module/msm_thermal/parameters/enabled
echo ----------------------------------------------------
echo Settings Successfully Applied! You may now tweak them further in ElementalX Kernel Manager
echo ----------------------------------------------------
