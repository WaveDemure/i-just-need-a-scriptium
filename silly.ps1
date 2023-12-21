Clear-Host

Write-Output "#----------=[The Discord Opera GX promo link generator]=------------#"
Write-Output "|                                                                   |"
Write-Output "| This tool will work until June 17th, 2024 (11:59 PM PST)          |"
Write-Output "|[=================================================================]|"
Write-Output "|                                                                   |"
Write-Output "| Using a cURL request it obtains an OperaGX promo token            |"
Write-Output "| And this tool does the rest then sends it to a webhook            |"
Write-Output "|                                                                   |"
Write-Output "#-------------------------------------------------------------------#"

$hookURL = Read-Host "Input your Discord webhook URL here: " -AsSecureString
$amount = Read-Host "Amount of links to generate: "
$var = 1

while ($var -le $amount) {
    Clear-Host
    Write-Output "#---------------------------------------#"
    Write-Output "| Generating Links... $var/$amount Done |"
    Write-Output "#---------------------------------------#"
    Write-Output ""
    Write-Output "[/] Obtaining promo token..."

    try {
        $bae3 = Invoke-RestMethod -Uri 'https://api.discord.gx.games/v1/direct-fulfillment' -Method POST -Headers @{
            'authority' = 'api.discord.gx.games'
            'accept' = '*/*'
            'accept-language' = 'en-US,en;q=0.9'
            'content-type' = 'application/json'
            'origin' = 'https://www.opera.com'
            'referer' = 'https://www.opera.com/'
            'sec-ch-ua' = '"Opera GX";v="105", "Chromium";v="119", "Not?A_Brand";v="24"'
            'sec-ch-ua-mobile' = '?0'
            'sec-ch-ua-platform' = '"Windows"'
            'sec-fetch-dest' = 'empty'
            'sec-fetch-mode' = 'cors'
            'sec-fetch-site' = 'cross-site'
            'user-agent' = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36 OPR/105.0.0.0'
        } -Body '{"partnerUserId":"6fb92427ae41e4649b934ca49599e3b0c44298fc1c149afbf4c8991b7852b855"}'
    } catch {
        Write-Output "[-] Error obtaining promo token: $_"
        exit 1
    }

    Write-Output "[/] Obtained promo token!"
    Write-Output "[/] Adding token to Discord promo link..."

    $WORDTOREMOVE = '{"token":"'
    $WORDTOREMOVE22 = '"}'
    $bea2 = $bae3 -replace $WORDTOREMOVE
    $b2 = $bea2 -replace $WORDTOREMOVE22

    Write-Output "[/] Added token to Discord promo link!"
    Write-Output "[/] Sending link to webhook..."

    $post_data = @{
        content = ""
        embeds = @(
            @{
                title = "Here is your Discord (Opera GX) Promotion link"
                description = "[Here](https://discord.com/billing/partner-promotions/1180231712274387115/$b2) but you can't have had Nitro in the last 12 months!`n`nSent with The Discord Opera GX promo link generator`n $var/$amount"
                color = "45973"
            }
        )
    } | ConvertTo-Json

    try {
        Invoke-RestMethod -Uri $hookURL -Method Post -Headers @{'Content-Type' = 'application/json'} -Body $post_data -ErrorAction Stop
    } catch {
        Write-Output "[-] Error sending link to webhook: $_"
        exit 1
    }

    Write-Output "[/] Sent link to webhook!"
    $var++
    Start-Sleep -Seconds 1
}

Write-Output "[=] Done!"
