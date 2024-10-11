#!/bin/bash
job_list=$(squeue -u $USER -o "%.18i %.25j %.2t %.10M %.20R %.30r")
held_count=0
pending_count=0
running_count=0

printf "\n%-10s %-30s %-10s %-10s %-20s\n" "JobID" "JobName" "State" "Time" "Nodelist"

while read -r line; do
  if [[ $line == JOBID* ]]; then
    continue
  fi
  job_id=$(echo "$line" | awk '{print $1}')
  job_name=$(echo "$line" | awk '{print $2}')
  state=$(echo "$line" | awk '{print $3}')
  time=$(echo "$line" | awk '{print $4}')
  nodelist=$(echo "$line" | awk '{print $5}')
  printf "%-10s %-30s %-10s %-10s %-10s\n" "$job_id" "$job_name" "$state" "$time" "$nodelist"
  if [[ "$nodelist" == *"Held"* ]]; then
    held_count=$((held_count + 1))
  fi
  case "$state" in
    R) running_count=$((running_count + 1)) ;;
    PD) pending_count=$((pending_count + 1)) ;;
  esac
done <<< "$job_list"

printf "%-30s %d\n" "Held jobs:" $held_count
printf "%-30s %d\n" "Pending jobs:" $pending_count
printf "%-30s %d\n" "Running jobs:" $running_count

echo "Quota: " $(bash -i -c "quota" | grep -o '[^ ]\{2,\}%' | tr '\n' ' ')
