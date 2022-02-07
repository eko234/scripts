start=2021-09-07
end=2021-12-04
while ! [[ $start > $end ]]; do
  echo $start
  start=$(date -d "$start + 1 day" +%F)
done
