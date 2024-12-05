echo "compiling bots..."
cd ..

cd contestants

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

cd ..
rm -rf contestants