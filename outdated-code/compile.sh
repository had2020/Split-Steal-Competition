echo "compiling bots..."
echo "" > ../build_log.txt # > overwrite, >> append
cd ..

mkdir builds
cd builds
builds_folder=($(pwd))
cd ..

cd contestants
projects=($(ls))

for ai in "${projects[@]}"; do 
  cd "$ai"
  project_files=($(ls))
  for file in "${project_files[@]}"; do
    #echo "$file"
    if [[ "${file}" == "Cargo.toml" ]]; then  
        echo " Rust " >> build_log.txt
        #export CARGO_TARGET_DIR=../../builds
        #export CARGO_TARGET_DIR=../
        #cargo build --release --quiet
        cargo build --release --quiet
        #mv -v "${file}" ${builds_folder}
        parent_dir=($(dirname "$PWD"))
        cd target/release
        folder=($(pwd))
        #cp -r "$(folder)/$(parent_dir)"
        echo "yo"
        echo "${folder}/${parent_dir}"
        #cargo build --artifact-dir=/ --target-dir=../../builds --release --no-default-features --features=bin
        cd ..
    elif [[ "${file}"  == *.py ]]; then
        echo " Python " >> build_log.txt
        #mv "${file}" lol.py
        #echo "($(ls))"
        #mv -v "${file}" ${builds_folder}
        cd ..
    elif [[ "${file}"  == *.cpp ]]; then
        echo " C++ " >> build_log.txt 
        g++ -o ${file} ${file}.cpp 
        #mv "${file}" ../builds
        cd ..
    fi
  done
done

cd ..
#rm -rf contestants
# TODO /\ old code, make only exec and python files go into builds

#rm -rf builds #for main.rs to handle

cd game-hoster
cargo run fromsh --quiet