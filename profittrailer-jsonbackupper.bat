@echo off

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"

:: it is time
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

:: backups go here
set "backup_path=Z:\profittrailer\jsonbackups"

:: delete backups older than this many days (set false to disable cleanup)
set "backup_history=3"

:: Trex
set "bittrex_key=BittrexBTC"
set "bittrex_path=C:\PTBTCBittrex"
set "bittrex_backup=%backup_path%\bittrex\btc"
type "%bittrex_path%\ProfitTrailerData.json" >> "%bittrex_backup%\ProfitTrailerData-%bittrex_key%-%fullstamp%.json"
if %backup_history% neq false forfiles /p "%bittrex_backup%" /s /m *.json /D -%backup_history% /C "cmd /c del @path"

:: Nancy
set "binance_key=BinanceBTC"
set "binance_path=C:\PTBTCBinance"
set "binance_backup=%backup_path%\binance\btc"
type "%binance_path%\ProfitTrailerData.json" >> "%binance_backup%\ProfitTrailerData-%binance_key%-%fullstamp%.json"
if %backup_history% neq false forfiles /p "%binance_backup%" /s /m *.json /D -%backup_history% /C "cmd /c del @path"
