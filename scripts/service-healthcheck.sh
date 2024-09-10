# gets service address to run basic healthcheck against, and return 'result'
address=$1

HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -I http://${address})
if [ "$HTTP_STATUS" -eq 200 ]; then
    echo "Curl was successful. Status code: $HTTP_STATUS"
    result=success
else
    echo "Curl failed. Status code: $HTTP_STATUS"
    result=failure
fi

export result
