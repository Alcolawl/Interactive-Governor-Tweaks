#Author: Alcolawl
#Settings By: Alcolawl & SoniCron
#Device: Nexus 5X (Bullhead)
#Codename: RedHawk
#Build Status: Stable
#Version: 3.1
#Last Updated: 5/9/2016
#Notes: Please give credit when using this in your work! - For Kernels with the IntelliActive governor only!
echo ----------------------------------------------------
echo Applying 'RedHawk' v3.1 IntelliActive Governor Settings
echo ----------------------------------------------------

#For RACER Kernel only!

#Apply settings to LITTLE cluster
echo Applying settings to LITTLE cluster
#Temporarily change permissions to governor files for the LITTLE cluster to enable IntelliActive governor
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo intelliactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#Temporarily change permissions to governor files for the LITTLE cluster to lower minimum frequency to 302.4MHz
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 302400 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq			#Core 1 Minimum Frequency = 302.4MHz			
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
#Tweak IntelliActive Governor
echo 15 384000:20 460800:25 600000:43 672000:65 787200:78 864000:92 960000:95 1248000:97 1440000:98 1536000:100 > /sys/devices/system/cpu/cpufreq/intelliactive/target_loads
echo -1 > /sys/devices/system/cpu/cpufreq/intelliactive/timer_slack
echo 302400 > /sys/devices/system/cpu/cpufreq/intelliactive/hispeed_freq
echo 10000 > /sys/devices/system/cpu/cpufreq/intelliactive/timer_rate
echo 20000 460800:10000 > /sys/devices/system/cpu/cpufreq/intelliactive/above_hispeed_delay
echo 200 > /sys/devices/system/cpu/cpufreq/intelliactive/go_hispeed_load
echo 60000 > /sys/devices/system/cpu/cpufreq/intelliactive/min_sample_time
echo 864000 > /sys/devices/system/cpu/cpufreq/intelliactive/up_threshold_any_cpu_freq
echo 787200 > /sys/devices/system/cpu/cpufreq/intelliactive/sync_freq
echo 90 > /sys/devices/system/cpu/cpufreq/intelliactive/up_threshold_any_cpu_load

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
echo 98 633600:65 768000:78 864000:85 960000:95 1248000:60 1344000:65 1440000:70 1536000:75 1632000:80 1689000:85 1824000:90 1958400:95 2016000:100 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo -1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack
echo 633600 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 30000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 200 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 60000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis

#Enable Input Boost for LITTLE cluster @672MHz for 40ms
echo Enabling Input Boost at 672MHz for the LITTLE cluster
echo 1 > /sys/module/cpu_boost/parameters/input_boost_enabled
echo 0:672000 1:672000 2:672000 3:672000 4:0 5:0 > /sys/module/cpu_boost/parameters/input_boost_freq
echo 0 > /sys/module/cpu_boost/parameters/boost_ms
echo 40 > /sys/module/cpu_boost/parameters/input_boost_ms
#Disable TouchBoost
echo Disabling TouchBoost
echo 0 > /sys/module/msm_performance/parameters/touchboost
#Disable Core Control and Enable Thermal Throttling allowing for longer sustained performance
echo Disabling Aggressive CPU Thermal Throttling
echo 0 > /sys/module/msm_thermal/core_control/enabled
echo N > /sys/module/msm_thermal/parameters/enabled
echo ----------------------------------------------------
echo Settings Successfully Applied! You may now tweak them further in ElementalX Kernel Manager
echo ----------------------------------------------------