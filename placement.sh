mkdir builds
cd base-ai
base=$(pwd)
#echo $base

projects=($(ls))
for ai in "${projects[@]}"; do 
  cd $ai
  project_files=($(ls))
  for file in "${project_files[@]}"; do
    #echo "${file}"
    if [[ "${file}" == "Cargo.toml" ]]; then  
        CARGO_TARGET_DIR="${pwd}" cargo build --bin my_project
        cargo build --bin my_project
        echo "rust"
        #cp -r "$file_to_copy" $base
    elif [[ "${file}"  == *.py ]]; then
        cp -r "${file}" $base
    elif [[ "${file}"  == *.cpp ]]; then
        g++ -o ${file} ${file}.cpp 
        cp -r "${file}" $base
    fi
  done
done