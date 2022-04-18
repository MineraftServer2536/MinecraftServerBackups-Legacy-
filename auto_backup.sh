#Folder 
SERVER_DIR_NAME="minecraft_server"
GITHUB_USERNAME="MY_GITHUB_USERNAME"
GITHUB_PERSONAL_TOKEN="MY_GITHUB_PERSONAL_TOKEN"
BACKUP_INTERVAL="1m" #parameter use for sleep command. Here are some example: 2 (2 seconds), 2m (2 minute), 2h (2 hours), 2d (2 days)

cd $SERVER_DIR_NAME
while [ : ]
do
    echo "-------------------Backup Start-------------------"
    pwd
    git status
    git add .
    git commit -m "regular backup"
    git push https://$GITHUB_USERNAME:$GITHUB_PERSONAL_TOKEN@github.com/MineraftServer2536/MinecraftServerBackups.git --all
    echo "-------------------Backup Completed-------------------"
    sleep $BACKUP_INTERVAL
done
