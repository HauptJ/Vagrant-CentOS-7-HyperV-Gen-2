# Powershell script to automate .box packaging

# Take in box name as CLI argument
$boxname=$args[0]

$configfile=".\$($boxname).json"
$boxdir=".\$($boxname)\"
$boxpath=".\$($boxname).box"
$zippath=".\$($boxname).zip"

##### Make sure everything is clean #####

# Delete existing .box and .zip
rm $boxpath
rm $zippath

##### Make the .box #####

packer build -force $configfile

# Copy required files for Vagrant box
cp ".\Vagrantfile" $boxdir
cp ".\metadata.json" $boxdir

# Package the archive
7z a $zippath "$($boxdir)*"
# Rename .zip extension to .box
mv $zippath $boxpath
