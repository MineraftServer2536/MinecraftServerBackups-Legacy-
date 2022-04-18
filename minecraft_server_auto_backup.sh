SERVER_DIR_NAME="minecraft_server" #Folder name of the minecraft server (will cd to this folder before calling git commands)
GITHUB_USERNAME="MY_GITHUB_USERNAME" 
GITHUB_PERSONAL_TOKEN="MY_GITHUB_PERSONAL_TOKEN"
BACKUP_INTERVAL="1m" #Parameter use for sleep command. Here are some examples: 2 (2 seconds), 2m (2 minute), 2h (2 hours), 2d (2 days)

cd $SERVER_DIR_NAME
while [ : ]
do
    echo "-------------------Backup Start-------------------"
    dt=$(date '+%d/%m/%Y %H:%M:%S');
    echo "$dt"
    pwd
    git status
    git add .
    git commit -m "regular backup"
    git push https://$GITHUB_USERNAME:$GITHUB_PERSONAL_TOKEN@github.com/MineraftServer2536/MinecraftServerBackups.git --all
    echo "-------------------Backup Completed-------------------"
    sleep $BACKUP_INTERVAL
done
