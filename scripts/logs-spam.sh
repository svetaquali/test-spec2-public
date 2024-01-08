
echo "spamming logs"


for i in {1..2000000}; do
  timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  random_log="Log message $i. Just veryyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy superrrrrrrrrrrrrrrrrrrrrrrr   longgggggggggggggggggggggggggggggggggg randommmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm texttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt"
  echo "[$timestamp] $random_log"
  sleep 0.0$(shuf -i 1-10 -n 1)
done

echo "ended"
