# Powershell script to automate .box packaging

# Take in box name as CLI argument
$boxname=$args[0]

$configfile=".\$($boxname).json"
$boxdir=".\$($boxname)\"
$boxpath=".\$($boxname).box"
$zippath=".\$($boxname).zip"

$garbage="*.tmp*"

##### Make sure everything is clean #####

# Delete existing .box and .zip
rm -r --force $boxpath
rm -r --force $zippath

##### Make the .box #####

packer build -force $configfile

# Copy required files for Vagrant box
cp ".\Vagrantfile" $boxdir
cp ".\metadata.json" $boxdir
cp ".\config.rb" $boxdir

# Package the archive
7z a $zippath "$($boxdir)*"
# Rename .zip extension to .box
mv --force $zippath $boxpath

##### Clean things up #####

# Delete new .box and .zip
rm -r --force $boxpath
rm -r --force $zippath
