#/bin/zsh
for d in */; do
    cd "$d";
    echo "Pulling $d";
    git pull;
    echo "Done";
    cd ..;   
done 
