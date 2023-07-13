#!/bin/bash

# Define the resource configurations
cpu_configs=("0.1" "0.5" "1" "2" "4")
memory_configs=("256" "512" "1024" "2048" "4096")

# Loop through each CPU configuration
for cpu in "${cpu_configs[@]}"
do
    # Loop through each memory configuration
    for memory in "${memory_configs[@]}"
    do
        # Generate a unique container name based on the resource configuration
        container_name="mycontainer_cpu${cpu}_mem${memory}"

        # Build the Singularity container
        singularity build $container_name.sif docker://mycontainer:latest

        # Set the CPU and memory limits for the container
        singularity exec --bind /sys/fs/cgroup:/sys/fs/cgroup:ro -c "lxc.cgroup.cpuset.cpus=${cpu} lxc.cgroup.memory.limit_in_bytes=${memory}M" $container_name.sif echo "Container: $container_name - CPU: $cpu - Memory: $memory"

        # Cleanup - remove the container image
        rm $container_name.sif
    done
done

