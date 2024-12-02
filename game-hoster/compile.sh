cd ..
cd base-ai
projects=($(ls))
ai_dir=($(pwd))

# Comment
for ai in "${projects[@]}"; do 
  #echo "$ai" #prints name
  #echo "$ai: $(file --brief "$ai")"
  #ls
  cd "$ai"
  # process in here
  project_files=($(ls))
  rust_cargo=false

  for file in "${project_files[@]}"; do 
    if [[ "${file}" == "Cargo.toml" ]]; then  
      rust_cargo=true
      if [ rust_cargo ]; then 
        echo "uncovered cargo project"
        # proceed with compiling and marking exec as a contestent in a folder
        folder_to_copy=($(pwd))
        cd ..
        cd contestants
        cp -r "$folder_to_copy" .
      fi
      break
    fi
  done

  if [ $rust_cargo == true ]; then  
    ls
  fi

  cd "$ai_dir"  
done