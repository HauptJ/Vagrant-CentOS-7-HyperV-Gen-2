# Powershell script to automate .box packaging
# Why does this test to check if a file exist always fail???

# Take in box name as CLI argument
$boxname=$args[0]

$configfile=".\$($boxname).json"
$boxdir=".\$($boxname)\"
$boxpath=".\$($boxname).box"
$zippath=".\$($boxname).zip"

$garbage="*.tmp*"

##### Make sure everything is clean #####

# Delete existing .box
If([System.IO.File]::Exists($boxpath)){
  rm $boxpath
}

# Delete existing .zip archive
If([System.IO.File]::Exists($zippath)){
  rm $zippath
}

# Delete temp files if they exist
If([System.IO.File]::Exists($garbage)){
  rm $garbage
}

##### Make the .box #####

# Make sure the config file exists
# All logic is broken here
If(!(![System.IO.File]::Exists($configfile))){
  echo "Packer config file " $configfile " does not exist"
  exit
} Else {
  # Run packer
  packer build -force $configfile
}

# Copy required files for Vagrant box
cp ".\Vagrantfile" $boxdir
cp ".\metadata.json" $boxdir
# Package the archive
7z a $zippath "$($boxdir)*"
# Rename .zip extension to .box
mv -force $zippath $boxpath

##### Clean things up #####

# Delete temp files if they exist
If([System.IO.File]::Exists($garbage)){
  rm $garbage
}

# Delete new .zip archive
If([System.IO.File]::Exists($zippath)){
  rm $zippath
}
