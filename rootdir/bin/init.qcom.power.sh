#! /vendor/bin/sh

# Enable bus-dcvs
for cpubw in /sys/class/devfreq/*qcom,cpubw*
do
      echo "bw_hwmon" > $cpubw/governor
      echo 50 > $cpubw/polling_interval
      echo 762 > $cpubw/min_freq
      echo "1525 3143 5859 7759 9887 10327 11863 13763" > $cpubw/bw_hwmon/mbps_zones
      echo 4 > $cpubw/bw_hwmon/sample_ms
      echo 85 > $cpubw/bw_hwmon/io_percent
      echo 100 > $cpubw/bw_hwmon/decay_rate
      echo 50 > $cpubw/bw_hwmon/bw_step
      echo 20 > $cpubw/bw_hwmon/hist_memory
      echo 0 > $cpubw/bw_hwmon/hyst_length
      echo 80 > $cpubw/bw_hwmon/down_thres
      echo 0 > $cpubw/bw_hwmon/low_power_ceil_mbps
      echo 34 > $cpubw/bw_hwmon/low_power_io_percent
      echo 20 > $cpubw/bw_hwmon/low_power_delay
      echo 0 > $cpubw/bw_hwmon/guard_band_mbps
      echo 250 > $cpubw/bw_hwmon/up_scale
      echo 1600 > $cpubw/bw_hwmon/idle_mbps
done

for memlat in /sys/class/devfreq/*qcom,memlat-cpu*
do
    echo "mem_latency" > $memlat/governor
    echo 10 > $memlat/polling_interval
    echo 400 > $memlat/mem_latency/ratio_ceil
done

echo "cpufreq" > /sys/class/devfreq/soc:qcom,mincpubw/governor

# Signal perfd that boot has completed
setprop sys.post_boot.parsed 1