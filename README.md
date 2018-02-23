# profittrailer-jsonbackupper
Auto backup your ProfitTrailerData.json files in Windows using TaskScheduler and profittrailer-jsonbackupper

**NB: this repository has become obsolete by improvements to the core PT application, which now integrally supports chronological state backups from versions 1.2.6.14 upwards, be sure to acquire and upgrade to the latest available stable release: [profit-trailer@github](https://github.com/taniman/profit-trailer/releases)**

If you're running one or more [ProfitTrailer](https://www.profittrailer.com) instances on your desktop, unnatural termination of your bots is a thing likely to happen at some point.
Causes for this could be nuclear warfare, misplaced glasses of liquid, random kitteh or, in my case, random power outage due to wack fuses.
Abrupt crashing of your PT processes may result in the corruption of both your ProfitTrailerData.json and ProfitTrailerData.json.backup files.
Deleting the corrupted files will get your bot running again, but you'll soon notice that data regarding recent sales and DCA stats will be missing once fired up.

profittrailer-jsonbackupper is a Windows BAT file that once configured and ran will copy the current ProfitTrailerData.json file to a secure backup location of your choice.
It will append the current timestamp to the backup's filename for quick retrieval. In case of mayhem, simply replace the corrupted ProfitTrailerData.json in your PT folder with the latest working backup from your backup folder.

Setting up: edit profittrailer-jsonbackupper.bat and fill out **backup_path**, **backup_history** and the source path(s) to your instance(s) (e.g. **bittrex_path**)

The BAT file can be run manually or from terminal, but for super-duper safety should be run as a recurring scheduled task from Windows TaskScheduler, as such:

- Start TaskScheduler (usually located at %systemroot%\WINDOWS\System32\taskschd.msc)
- Click 'Create Task..' in the far-right panel
  - A 'Create Task' popup appears
    - Add a name for your task in the General tab 
    - In the bottom of the General tab, activate the 'Run with highest privileges' checkbox
  - Move to the Triggers tab and click 'New..' to add a new trigger
    - In the 'New Trigger' popup, set the trigger to be run Daily at a certain time, have it recur every 1 days
    - At the Advanced settings in the bottom, activate 'Repeat task every:', select 1 hour (or some other interval you feel comfortable with) and set 'Indefinitely' as the duration
  - Now move to the Actions tab and click 'New..' to add a new action for your backup task
    - Select 'Start a program' for the action and browse to the profittrailer-jsonbackupper.bat on your system
    - Make sure to enter the path where profittrailer-jsonbackupper.bat resides to the 'Start in (optional)' field

Congratulations. You can now let your kitteh roam free once again :)
