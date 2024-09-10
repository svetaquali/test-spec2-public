# gets 2 arguments: grain path and output key, and return the output value.
grain_path=$1
output_key=$2

contract_path=$CONTRACT_FILE_PATH

output_value=$(jq --arg GrainPath "$grain_path" --arg OutputKey "$output_key" '.grains[$GrainPath].outputs[$OutputKey]' $contract_path)

output_value_tr=`echo -n $output_value | tr -d '"'`

echo "output: $output_value_tr"
export $output_value_tr
