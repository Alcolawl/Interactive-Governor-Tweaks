#Author: Alcolawl
#Settings By: Alcolawl
#Device: Nexus 5X (Bullhead)
#Codename: BlueJay
#Build Status: Stable
#Version: 1.11
#Last Updated: 5/9/2016
#Notes: Please give credit when using this in your work! - For Kernels with the Impulse governor only!
echo ----------------------------------------------------
echo Applying 'BlueJay' v1.11 Impulse Governor Settings
echo ----------------------------------------------------

#For Kernels with the Impulse governor ONLY! 

#Apply settings to LITTLE cluster
echo Applying settings to LITTLE cluster
#Temporarily change permissions to governor files for the LITTLE cluster to enable impulse governor
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo impulse > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#Temporarily change permissions to governor files for the LITTLE cluster to lower minimum frequency to 302.4MHz
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 384000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq			#Core 0 Minimum Frequency = 302.4MHz			
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
#Tweak impulse Governor
echo 15 460800:25 600000:43 672000:65 787200:78 864000:92 960000:95 1248000:98 1440000:100 > /sys/devices/system/cpu/cpu0/cpufreq/impulse/target_loads
echo -1 > /sys/devices/system/cpu/cpu0/cpufreq/impulse/timer_slack
echo 960000 > /sys/devices/system/cpu/cpu0/cpufreq/impulse/hispeed_freq
echo 10000 > /sys/devices/system/cpu/cpu0/cpufreq/impulse/timer_rate
echo 33300 1248000:40000 > /sys/devices/system/cpu/cpu0/cpufreq/impulse/above_hispeed_delay
echo 95 > /sys/devices/system/cpu/cpu0/cpufreq/impulse/go_hispeed_load
echo 50000 > /sys/devices/system/cpu/cpu0/cpufreq/impulse/min_sample_time
echo 7 > /sys/devices/system/cpu/cpu0/cpufreq/impulse/go_lowspeed_load

#Apply settings to Big cluster
echo Applying settings to Big cluster
#Temporarily change permissions to governor files for the Big cluster to enable Interactive governor
echo 1 > /sys/devices/system/cpu/cpu4/online								#Online Core 4
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
#Temporarily change permissions to governor files for the Big cluster to lower minimum frequency to 633.6MHz
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo 633600 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq			#Core 4 Minimum Frequency = 633.6MHz			
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
#Tweak Interactive Governor
echo 98 633600:65 768000:78 864000:85 960000:95 1248000:60 1344000:65 1440000:70 1536000:75 1632000:80 1689000:85 1824000:95 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo -1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack
echo 960000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 30000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 60 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 60000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis

#Tune CPUquiet Driver
echo Setting CPUquiet to Userspace
echo userspace > /sys/devices/system/cpu/cpuquiet/current_governor

#Disable Input Boost
echo Disabling Input Boost
echo 0 > /sys/module/cpu_boost/parameters/input_boost_enabled
#Disable TouchBoost
echo Disabling TouchBoost
echo 0 > /sys/module/msm_performance/parameters/touchboost
#Enable Core Control and Disable MSM Thermal Throttling allowing for longer sustained performance
echo Disabling Aggressive CPU Thermal Throttling
echo 1 > /sys/module/msm_thermal/core_control/enabled
echo N > /sys/module/msm_thermal/parameters/enabled
echo 44 /sys/module/msm_performance/parameters/temp_threshold
echo ----------------------------------------------------
echo Settings Successfully Applied! You may now tweak them further in ElementalX Kernel Manager or Kernel Adiutor
echo ----------------------------------------------------