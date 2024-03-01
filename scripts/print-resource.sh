
resource_id=$1
grain_path=$2
token=$3
contract_path=$CONTRACT_FILE_PATH

# will print the attribute "power_state" of the resource
jq --arg id "$resource_id" '.resources[] | select(.identifier == $id) | .attributes | .power_state' $contract_path


