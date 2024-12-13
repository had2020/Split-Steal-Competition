#echo "Script name: $0"
#echo "Number of arguments: $#"
#echo "All arguments: $*"
#echo "All arguments (separated): $@"

#if [ $# -lt 2 ]; then
  #echo "Usage: $0 <argument1> <argument2>"
  #exit 1
#fi

echo "First argument: $1"
echo "Second argument: $2"

rounds=($3)
for round in "${rounds[@]}"; do 
    #"$@" >> temp_data.txt 
    ./$1 >> temp_data.txt
    echo "Round: $round" 
done
