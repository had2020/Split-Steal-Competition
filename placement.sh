mkdir rust_artifacts
cd rust_artifacts
artifacts=$(pwd)

cd ..

mkdir builds
cd base-ai
base=$(pwd)
#echo $base

projects=($(ls))
for ai in "${projects[@]}"; do 
  cd $ai
  project_files=($(ls))
  echo $project_files
  for file in "${project_files[@]}"; do
    #echo "${file}"
    if [[ "${file}" == "Cargo.toml" ]]; then  
        export CARGO_TARGET_DIR=$artifacts
        cargo build --release
        echo "rust"
        cd 
        #cp -r "$file_to_copy" $base
    elif [[ "${file}"  == *.py ]]; then
        #cp -r "${file}" $base
        echo "python"
    elif [[ "${file}"  == *.cpp ]]; then
        #g++ -o ${file} ${file}.cpp 
        echo "Cplusplus"
        #cp -r "${file}" $base
    fi
  done

  cd $base
done