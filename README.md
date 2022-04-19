# Minecraft Server

## Features
1. Auto-restart on server crash
2. Auto-backup to GitHub repo every 24 hr

## Managing the Server

1. Connect to the server via ssh (the user name is `ubuntu`)
2. Type `screen -ls` to list all sessions.
You should see two screen sessions — one for running the Minecraft server and another for auto server backup.
3. Type `screen -r <session ID>` to enter screen session. Session ID should be composed of 4 digits
    3.1 To know wheater are we in a screen session, type `echo $STY` (This will print out the session id. If we are not in a screen session, it will print nothing)
    3.2 To detach from current session, press: `Ctrl` + `A` + `D`
    
### To start the Minecraft server
1. Start a new screen session (or reuse an existing one) 
2. `cd minecraft_server`
3. `./start_server.sh`

This script will automatically restart the Minecraft server whenever the server crashes or shutdown.
    
### To run auto backup script
1. Start a new screen session (or reuse the exiting one) 
2. `./minecraft_server_auto_backup.sh`  

This script will regularly push all the changes to the server and clean up the local repository (as we don't need older commit records on local).

You can also run this script for a manual GitHub backup.

## Setting up Auto-Restart & Auto-GitHub-Backup for a New Server
### Auto-Restart
1. Copy `start_server.sh` to your minecraft server directory
    1.1 Modify this line if needed: `java -Xmx1024M -Xms1024M -jar server.jar nogui`
2. Give execution permission to the script via `chmod u+r+x start_server.sh`
3. Open a new screen session by typing `screen`, and execute the script via `./start_server.sh`

### Auto Backup to GitHub
1. `cd` to your Minecraft server directory
2. `git init` to initialize the Minecraft server directory as a git repo
3. `git remote add origin <GitHub repo url>` to set up GitHub backup repo.
4. Try to run the following commands to push the local repo to GitHub.
    4.1  `git status` to list repo status
    4.2 `git add .` to add all change
    4.3 `git commit -m "initial commit"` to commit changes
    4.4 `git push -u origin master` to push changes to the GitHub repo
    (When asking for the password, we recommend using GitHub Personal Access Token)
5. Copy `minecraft_server_auto_backup.sh` **OUTSIDE** the Minecraft server directory
   (We do this because we will add our GitHub personal access token to the script later, and we don't want to push it to the GitHub.)
6. Give execution permission to the script via `chmod u+r+x minecraft_server_auto_backup.sh`
7. Type `nano minecraft_server_auto_backup.sh` to configure the following parameters.
    7.1 `SERVER_DIR_NAME`: the directory of the local git repo, which should be our server folder. The script will `cd` to this directory before running git commands.
    7.2 `GITHUB_USERNAME`: GitHub user name
    7.3 `GITHUB_PERSONAL_TOKEN`: GitHub Personal Access Token (Be aware of the expiration date)
    7.4 `BACKUP_INTERVAL`: How often do we back up our server? (ex: `6h` for every six hours, `1d` for every day)
8. Open a new screen session by typing `screen` and execute the script via `./minecraft_server_auto_backup.sh`

### Other Useful commands    
* `exit` to stop the current session we are in
* `sudo apt install openjdk-17-jdk` to install specific jdk/jre (Minecraft 1.18 required Java 17)
    
## Reference Links
https://ostechnix.com/how-to-check-if-you-are-in-screen-session-or-not-in-linux
    
https://askubuntu.com/questions/302662/reattaching-to-an-existing-screen-session

https://askubuntu.com/questions/409025/permission-denied-when-running-sh-scripts

https://cets.seas.upenn.edu/answers/chmod.html

https://stackoverflow.com/questions/38171899/how-to-reduce-the-depth-of-an-existing-git-clone/46004595#46004595
