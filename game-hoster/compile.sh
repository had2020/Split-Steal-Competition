echo "compiling bots..."
cd ..

mkdir builds

cd contestants
projects=($(ls))

for ai in "${projects[@]}"; do 
  cd "$ai"
  project_files=($(ls))
  for file in "${project_files[@]}"; do
    #echo "$file"
    if [[ "${file}" == "Cargo.toml" ]]; then  
        echo "rust"
        export CARGO_TARGET_DIR=../../builds
        #cargo build
        cargo build --release --quiet
        cd ..
    elif [[ "${file}"  == *.py ]]; then
        echo "python" # Nothing else since we will just run python with python
        mv "${file}" ../builds
        echo "($(ls))"
        cd ..
    elif [[ "${file}"  == *.cpp ]]; then
        echo "cpp"
        g++ -o ${file} ${file}.cpp 
        mv "${file}" ../builds
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