
resource_id=$1
contract_path=$CONTRACT_FILE_PATH
apt update -y
apt install -y jq

# will print the attribute "day" of the resource
jq --arg id "$resource_id" '.resources[] | select(.idenfitier == $id) | .attributes | .day' $contract_path


