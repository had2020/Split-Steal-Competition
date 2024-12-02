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
      break  
    fi
  done

  if [ $rust_cargo == true ]; then  
    ls
  fi

  cd "$ai_dir"  
done