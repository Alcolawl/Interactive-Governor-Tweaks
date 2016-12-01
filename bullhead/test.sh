# Interactive XAP 4 for Mi4c
# Format by Cowithgun
# Values by Alcolawl

write() {
chmod 644 $2
echo $1 > $2
chmod 444 $2
}

stop perfd

write "interactive" /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
write "1248000" /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
write "85 460800:30 600000:83 864000:90 960000:97 1248000:100" /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
write "-1" /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack
write "960000" /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
write "28000" /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
write "33000" /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
write "99" /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
write "40000" /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
write "0" /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis

write "0" /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load

write "interactive" /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
write "72 633600:65 768000:73 864000:64 960000:98 1248000:72 1689600:85 1824000:100" /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
write "-1" /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_slack
write "960000" /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
write "8000" /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
write "20000 1344000:10000" /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
write "80" /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
write "20000" /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis
write "30000" /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time

write "0:600000 1:0 2:0 3:0 4:0 5:0" /sys/module/cpu_boost/parameters/input_boost_freq
write "40" /sys/module/cpu_boost/parameters/input_boost_ms

write "1" /proc/sys/kernel/sched_window_stats_policy
write "5" /proc/sys/kernel/sched_small_task
write "4" /proc/sys/kernel/sched_ravg_hist_size
write "1" /proc/sys/kernel/sched_enable_power_aware
write "15" /proc/sys/kernel/sched_upmigrate_min_nice
write "8" /proc/sys/kernel/sched_spill_nr_run
write "75" /proc/sys/kernel/sched_spill_load