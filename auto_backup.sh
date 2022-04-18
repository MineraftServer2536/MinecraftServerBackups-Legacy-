while [ : ]
do
    echo "-------------------Backup Start-------------------"
    pwd
    git status
    git add .
    git commit -m "regular backup"
    git push https://MineraftServer2536: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@github.com/MineraftServer2536/MinecraftServerBackups.git --all
    echo "-------------------Backup Completed-------------------"
    sleep 500
done
