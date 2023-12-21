clear
echo "#----------=[The Discord Opera GX promo link generator]=------------#"
echo "|                                                                   |" 
echo "|       This tool will work until June 17th, 2024 (11:59PM PST)     |"
echo "|[=================================================================]|"
echo "|                                                                   |"
echo "|       Using a cURL request it obtains a operaGX promo token       |"
echo "|      And this tool does the rest then sends it to a webhook       |"
echo "|                                                                   |"
echo "#-------------------------------------------------------------------#"                          
read -s -p "input your discord webhook url here : " hookURL
echo
echo "[/] Obtaining promo token..."

bae3=$(curl -s 'https://api.discord.gx.games/v1/direct-fulfillment' \
  -H 'authority: api.discord.gx.games' \
  -H 'accept: */*' \
  -H 'accept-language: en-US,en;q=0.9' \
  -H 'content-type: application/json' \
  -H 'origin: https://www.opera.com' \
  -H 'referer: https://www.opera.com/' \
  -H 'sec-ch-ua: "Opera GX";v="105", "Chromium";v="119", "Not?A_Brand";v="24"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Windows"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: cross-site' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 OPR/105.0.0.0' \
  --data-raw '{"partnerUserId":"6fb92427ae41e4649b934ca49599e3b0c44298fc1c149afbf4c8991b7852b855"}' \
  --compressed)

echo "[+] Obtained promo token!"
echo "[/] Adding token to discord promo link..."
WORDTOREMOVE='{"token":"'
WORDTOREMOVE22='"}'
bea2=$(echo $bae3 | sed s/"$WORDTOREMOVE"//)

b2=$(echo $bea2 | sed s/"$WORDTOREMOVE22"//)
var=$((var + 1))
echo "[+] Added token to discord promo link!"
echo "[/] Sending link to webhook..."

generate_post_data() {
  cat <<EOF
{
  "content": "",
  "embeds": [{
    "title": "Here is your Discord (Opera GX) Promotion link",
    "description": "[Here](https://discord.com/billing/partner-promotions/1180231712274387115/$b2) but you cant have had nitro in the last 12 months!",
    "color": "45973"
  }]
}
EOF
}
curl -H "Content-Type: application/json" -X POST -d "$(generate_post_data)" $hookURL
echo "[+] Sent link to webhook!"
echo "[=] Done!"
