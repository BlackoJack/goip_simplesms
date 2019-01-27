#/bin/bash

. goip.ini

sms_line=$1
sms_phone=$2
sms_text=$3

goip_login=$goip_login
goip_password=$goip_password
goip_scheme=$goip_scheme
goip_host=$goip_host
goip_port=$goip_port
goip_url="/default/en_US/sms_info.html?type=sms"

goip_request_url=$goip_scheme"://"$goip_login":"$goip_password"@"$goip_host":"$goip_port$goip_url


post_phone=$sms_phone
post_text=$sms_text
post_line="line"$sms_line"=1"

post_data=$post_line"&action=SMS&telnum="$post_phone"&smscontent="$post_text"&send=Send"

header_content_type="Content-Type: application/x-www-form-urlencoded"

curl --silent -XPOST -H "$header_content_type" -d "$post_data" "$goip_request_url" > /dev/null

echo "Message sent"
