#!/bin/sh

echo "Starting application..."
echo "API_GATEWAY_URL = ${API_GATEWAY_VAR}"
json_file="/usr/share/nginx/html/assets/config/externalConfig.json"

if [ -n "${API_GATEWAY_VAR}" ]
then
        echo "{" > "${json_file}"
        echo "  \"SERVICE_URL\" :\"${API_GATEWAY_VAR}\"" >>"${json_file}"
        echo "}" >>"${json_file}"

	echo "------------- cat ${json_file} ---------------------"
	cat "${json_file}"
fi

echo "Starting NGINX Server"
nginx -g "daemon off;"
