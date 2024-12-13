mkdir rust_artifacts
cd rust_artifacts
artifacts=$(pwd)

cd ..

mkdir builds
cd builds
builds=$(pwd)

cd ..

cd base-ai
base=$(pwd)
#echo $base

projects=($(ls))
for ai in "${projects[@]}"; do 
  cd $ai
  current_ai=$ai
  project_files=($(ls))
  echo $project_files
  for file in "${project_files[@]}"; do
    #echo "${file}"
    if [[ "${file}" == "Cargo.toml" ]]; then  
        export CARGO_TARGET_DIR=$artifacts
        cargo build --release
        cd $artifacts
        cd release
        cp -r "${ai}" $builds
        echo "rust"
        #cp -r "$file_to_copy" $base
    elif [[ "${file}"  == *.py ]]; then
        cp -r "${file}" $builds
        echo "python"
    elif [[ "${file}"  == *.cpp ]]; then
        g++ -o ${file} ${file}.cpp 
        cp -r "${file}" $builds
        echo "Cplusplus"
    fi
  done

  cd $base
done