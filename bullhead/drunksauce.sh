#Author: Alcolawl
#Settings By: Alcolawl & NYCHitman1
#Device: Nexus 5X (Bullhead)
#Codename: DrunkSauce
#Build Status: Stable
#Version: 1.0
#Last Updated: 11/10/2016
#Notes: Please give credit when using this in your work!
echo ----------------------------------------------------
echo Applying 'DrunkSauce' v1.0 Impluse & Ironactive Governor Settings
echo ----------------------------------------------------

#Apply settings to LITTLE cluster
echo Applying settings to LITTLE cluster
#Temporarily change permissions to governor files for the LITTLE cluster to enable Impulse governor
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo impulse > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#Temporarily change permissions to governor files for the LITTLE cluster to lower the minimum frequency to 302MHz if possible
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 302400 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq			#Core 0 Minimum Frequency = 302MHz			
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq

#Grab Maximum Achievable Frequency for the LITTLE Cluster
lilmaxfreq=$(cat "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq")				
if test $lilmaxfreq -eq 1632000; then
	#Temporarily change permissions to governor files for the LITTLE cluster to set the maximum frequency to 1632MHz
	echo LITTLE Cluster Overclocking detected. Applying appropriate values.
	chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
	echo 1632000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq		#Core 0 Maximum Frequency = 1632MHz			
	chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
	echo 80 384000:33 460800:25 600000:50 672000:65 787200:78 864000:85 960000:95 1248000:98 1440000:98 1536000:95 1632000:100 > /sys/devices/system/cpu/cpu0/cpufreq/impulse/target_loads #Set overclock max frequency compatible target_loads
elif test $lilmaxfreq -eq 1440000; then
	#Temporarily change permissions to governor files for the LITTLE cluster to set the maximum frequency to 1440MHz
	echo No LITTLE Cluster Overclocking detected. Applying appropriate values.
	chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
	echo 1440000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq		#Core 0 Maximum Frequency = 1440MHz			
	chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
	echo 80 384000:33 460800:25 600000:50 672000:65 787200:78 864000:85 960000:95 1248000:98 1440000:98 > /sys/devices/system/cpu/cpu0/cpufreq/impulse/target_loads #Set normal max frequency target_loads
fi

#Tweak Impulse Governor
echo 85 > /sys/devices/system/cpu/cpu0/cpufreq/impulse/go_hispeed_load
echo 10000 > /sys/devices/system/cpu/cpu0/cpufreq/impulse/above_hispeed_delay
echo 50000 > /sys/devices/system/cpu/cpu0/cpufreq/impulse/timer_rate
echo 960000 > /sys/devices/system/cpu/cpu0/cpufreq/impulse/hispeed_freq
echo -1 > /sys/devices/system/cpu/cpu0/cpufreq/impulse/timer_slack
echo 50000 > /sys/devices/system/cpu/cpu0/cpufreq/impulse/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/impulse/powersave_bias
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/impulse/align_windows
echo 25000 > /sys/devices/system/cpu/cpu0/cpufreq/impulse/max_freq_hysteresis

#Apply settings to Big cluster
echo Applying settings to Big cluster
#Temporarily change permissions to governor files for the Big cluster to enable Ironactive governor
echo 1 > /sys/devices/system/cpu/cpu4/online								#Online Core 4
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo ironactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
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
	echo 74 768000:73 864000:64 960000:80 1248000:61 1344000:69 1440000:64 1536000:74 1632000:69 1689600:67 1824000:72 1958400:85 2016000:100 > /sys/devices/system/cpu/cpu4/cpufreq/ironactive/target_loads #Set overclock max frequency compatible target_loads
elif test $maxfreq -eq 1824000; then
	#Temporarily change permissions to governor files for the Big cluster to set the maximum frequency to 1824MHz
	echo No Big Cluster Overclocking detected. Applying appropriate values.
	chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
	echo 1824000 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq		#Core 4 Maximum Frequency = 1824MHz			
	chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
	echo 74 768000:73 864000:64 960000:80 1248000:61 1344000:69 1440000:64 1536000:74 1632000:69 1689600:67 1824000:72 > /sys/devices/system/cpu/cpu4/cpufreq/ironactive/target_loads #Set normal max frequency target_loads
fi

#Tweak Ironactive Governor
echo 90 > /sys/devices/system/cpu/cpu4/cpufreq/ironactive/go_hispeed_load
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/ironactive/above_hispeed_delay
echo 20000 > /sys/devices/system/cpu/cpu4/cpufreq/ironactive/timer_rate
echo 1440000 > /sys/devices/system/cpu/cpu4/cpufreq/ironactive/hispeed_freq
echo -1 > /sys/devices/system/cpu/cpu4/cpufreq/ironactive/timer_slack
echo 30000 > /sys/devices/system/cpu/cpu4/cpufreq/ironactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/ironactive/boost
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/ironactive/align_windows
echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/ironactive/use_migration_notif
echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/ironactive/use_sched_load
echo 20000 > /sys/devices/system/cpu/cpu4/cpufreq/ironactive/max_freq_hysteresis
echo 80000 > /sys/devices/system/cpu/cpu4/cpufreq/ironactive/boostpulse_duration

#Enable Input Boost for LITTLE cluster @600MHz for 40ms
echo Enabling Input Boost at 600 MHz for the LITTLE cluster
echo 1 > /sys/module/cpu_boost/parameters/input_boost_enabled
echo 0:600000 1:600000 2:600000 3:600000 4:0 5:0 > /sys/module/cpu_boost/parameters/input_boost_freq
echo 0 > /sys/module/cpu_boost/parameters/boost_ms
echo 40 > /sys/module/cpu_boost/parameters/input_boost_ms
echo ----------------------------------------------------
echo Settings Successfully Applied! You may now tweak them further in ElementalX Kernel Manager
echo ----------------------------------------------------