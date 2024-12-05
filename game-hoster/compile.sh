echo "compiling bots..."
cd ..

cd contestants

  for file in "${project_files[@]}"; do
    #echo "$file"
    if [[ "${file}" == "Cargo.toml" ]]; then  
        echo "rust"
    elif [[ "${file}"  == *.py ]]; then
        echo "python"
    elif [[ "${file}"  == *.cpp ]]; then
        echo "cpp"
    fi
  done

cd ..
rm -rf contestants