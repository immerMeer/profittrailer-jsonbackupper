# profittrailer-jsonbackupper
Auto backup your ProfitTrailerData.json files in Windows using TaskScheduler and profittrailer-jsonbackupper


If you're running one or more ProfitTrailer instances on your desktop, unnatural termination of your bots is a thing likely to happen.
Causes for this could be nuclear warfare, misplaced glasses of liquid, random kitteh or, in my case, random power outage due to wack fuses.
Abrubt crashing of your PT processes may result in the corruption of both your ProfitTrailerData.json and ProfitTrailerData.json.backup files.
Deleting the corrupted files will get your bot running again, but you'll soon notice that data regarding recent sales and DCA stats will be missing once fired up.

profittrailer-jsonbackupper is a Windows BAT file that once configured and ran will copy the current ProfitTrailerData.json file to a secure backup location of your choice.
It will append the current timestamp to the backup's filename for quick retrieval. In case of mayhem, simply replace the corrupted ProfitTrailerData.json in your PT folder with the latest working backup from your backup folder.

The BAT file can be run manually or from terminal, but for super-duper safety should be run as a recurring scheduled task from Windows TaskScheduler.

