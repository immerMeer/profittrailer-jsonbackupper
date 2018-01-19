@echo off

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"

set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

set "source_drive=C:"
set "backup_drive=Z:"
set "backup_dir=profittrailer\jsonbackups\bittrex"

set "bittrex_name=PTBTCBittrex"
set "bittrex_path=%source_drive%\%bittrex_name%"
set "bittrex_backup=%backup_drive%\%backup_dir%\db56b678b5bb44fb9da026941e8de667"
copy "%bittrex_path%\ProfitTrailerData.json" "%bittrex_backup%\ProfitTrailerData-%bittrex_name%-%fullstamp%.json"

set "binance_name=PTBTCBinance"
set "binance_path=%source_drive%\%binance_name%"
set "binance_backup=%backup_drive%\profittrailer\jsonbackups\binance\JxtXkU3dxelAkgVxCXqDWTYQqfOdKQLzZ8o0GzkkdduU6ktFvPaP8B2hugn9VjBA"
copy "%binance_path%\ProfitTrailerData.json" "%binance_backup%\ProfitTrailerData-%binance_name%-%fullstamp%.json"