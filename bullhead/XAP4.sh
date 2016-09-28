#Author: Alcolawl
#Settings By: Alcolawl
#Device: Nexus 5X (Bullhead)
#Codename: XAP
#Build Status: Alpha
#Version: 1.0
#Last Updated: 9/14/2016
#Notes: Please give credit when using this in your work!
echo ----------------------------------------------------
echo Applying 'XAP - eXperimental Advanced Profile' v1.0 Interactive Governor Settings
echo ----------------------------------------------------

#Apply settings to LITTLE cluster
echo Applying settings to LITTLE cluster
#Temporarily change permissions to governor files for the LITTLE cluster to enable Interactive governor
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#Temporarily change permissions to governor files for the LITTLE cluster to lower the maximum frequency to 1248MHz
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo 1248000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq			#Core 0 Maximum Frequency = 1248MHz			
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
#Tweak Interactive Governor
echo 85 460800:30 600000:83 864000:90 960000:97 1248000:100 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo -1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack
echo 960000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 28000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 33000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 99 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 40000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/ignore_hispeed_on_notif
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boost
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/fast_ramp_down
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/align_windows
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse_duration

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

#Grab Maximum Achievable Frequency for the Big Cluster
maxfreq=$(cat "/sys/devices/system/cpu/cpu4/cpufreq/cpuinfo_max_freq")				
if test $maxfreq -eq 2016000; then
	#Temporarily change permissions to governor files for the Big cluster to set the maximum frequency to 2016MHz
	echo Big Cluster Overclocking detected. Applying appropriate values.
	chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
	echo 2016000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq		#Core 4 Maximum Frequency = 2016MHz			
	chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
	echo 72 633600:65 768000:73 864000:64 960000:98 1248000:72 1689600:80 1824000:85 1958400:85 2016000:100 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads #Set overclock max frequency compatible target_loads
elif test $maxfreq -eq 1824000; then
	#Temporarily change permissions to governor files for the Big cluster to set the maximum frequency to 1824MHz
	echo No Big Cluster Overclocking detected. Applying appropriate values.
	chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
	echo 1824000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq		#Core 4 Maximum Frequency = 1824MHz			
	chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
	echo 72 633600:65 768000:73 864000:64 960000:98 1248000:72 1689600:85 1824000:100 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads #Set normal max frequency target_loads
fi

#Tweak Interactive Governor
echo -1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack
echo 960000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 8000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 20000 1344000:10000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo 80 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 30000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 20000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/ignore_hispeed_on_notif
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/boost
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/fast_ramp_down
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/align_windows
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/boostpulse_duration

#Enable Input Boost for LITTLE cluster @600MHz for 40ms
echo Enabling Input Boost at 600 MHz for the LITTLE cluster
echo 1 > /sys/module/cpu_boost/parameters/input_boost_enabled
echo 0:600000 1:600000 2:600000 3:600000 4:0 5:0 > /sys/module/cpu_boost/parameters/input_boost_freq
echo 0 > /sys/module/cpu_boost/parameters/boost_ms
echo 40 > /sys/module/cpu_boost/parameters/input_boost_ms
#Disable TouchBoost
echo Disabling TouchBoost
echo 0 > /sys/module/msm_performance/parameters/touchboost
#Disable BCL
echo Disabling BCL and Removing Perfd
echo disable > /sys/devices/soc.0/qcom,bcl.67/mode
#Enable Core Control and Disable MSM Thermal Throttling allowing for longer sustained performance
echo Disabling Aggressive CPU Thermal Throttling
echo 1 > /sys/module/msm_thermal/core_control/enabled
echo N > /sys/module/msm_thermal/parameters/enabled
#Tweak HMP Scheduler to feed the Big cluster more tasks
echo Tweaking HMP Scheduler for increased Big Cluster utilization
echo 1 > /proc/sys/kernel/sched_window_stats_policy
echo 5 > /proc/sys/kernel/sched_small_task
echo 4 > /proc/sys/kernel/sched_ravg_hist_size
echo 1 > /proc/sys/kernel/sched_enable_power_aware
echo 15 > /proc/sys/kernel/sched_upmigrate_min_nice
echo 8 > /proc/sys/kernel/sched_spill_nr_run
echo 75 > /proc/sys/kernel/sched_spill_load
echo ----------------------------------------------------
echo Settings Successfully Applied! You may now tweak them further in ElementalX Kernel Manager
echo ----------------------------------------------------