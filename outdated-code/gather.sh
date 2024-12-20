# checking for sudo
if [ "$(id -u)" -ne 0 ]; then
    echo "You need to run this script as root."
    exit 1
fi

cd ..
mkdir contestants
cd base-ai
projects=($(ls))
ai_dir=$(pwd)

# basic dev log
cd ..
#echo "$ai_dir < -- AI dir" >> logs.txt # > overwrite, >> append
cd base-ai

echo "searhing for bots in ai_dir..."

# Comment
for ai in "${projects[@]}"; do 
  #echo "($(ls))"
  #echo "$ai" #prints name
  #echo "$ai: $(file --brief "$ai")"
  #ls
  cd "$ai"
  # process in here
  project_files=($(ls))
  rust_cargo=false
  python_project=false
  cplusplus=false

  for file in "${project_files[@]}"; do
    #echo "$file"
    if [[ "${file}" == "Cargo.toml" ]]; then  
      rust_cargo=true
      if [ rust_cargo ]; then 
        #echo "uncovered cargo project"
        # proceed with compiling and marking exec as a contestent in a folder
        folder_to_copy=($(pwd))
        cd ..
        #echo "($(ls))"
        cd ..
        cd contestants
        cp -r "$folder_to_copy" .
      fi
      break
    elif [[ "${file}"  == *.py ]]; then
        python_project=true
        folder_to_copy=($(pwd))
        cd ..
        #echo "($(ls))"
        cd ..
        cd contestants
        cp -r "$folder_to_copy" .
    elif [[ "${file}"  == *.cpp ]]; then
        cplusplus=true
        folder_to_copy=($(pwd))
        cd ..
        #echo "($(ls))"
        cd ..
        cd contestants
        cp -r "$folder_to_copy" .
    fi
  done

  #if [ $rust_cargo == true ]; then  #does work, for later use
    #echo "TODO something to rust cargo projects ie export them"
  #elif [ $python_project == true ]; then
    #echo "TODO something with python projects"
  #elif [ $cplusplus == true ]; then
    #echo "TODO something with cpluscplus projects"
  #fi

  cd "$ai_dir"  
done

#echo "game complete"
#echo "($(ls))"
cd ..

#TODO something with files/folders in contestants
echo "Finished gathering bots [🤖][✅]"
cd game-hoster
sh compile.sh
#rm -rf contestants