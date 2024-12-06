echo "compiling bots..."
cd ..

cd contestants

projects=($(ls))

for ai in "${projects[@]}"; do 
  cd "$ai"
  project_files=($(ls))

  for file in "${project_files[@]}"; do
    echo "$file"
    if [[ "${file}" == "Cargo.toml" ]]; then  
        echo "rust"
    elif [[ "${file}"  == *.py ]]; then
        echo "python"
    elif [[ "${file}"  == *.cpp ]]; then
        echo "cpp"
    fi
  done
done