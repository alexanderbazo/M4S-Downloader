#!/bin/bash

echo ""
echo "########################################################################################"
echo "#################################### M4S Downloader ####################################"
echo "# Disclaimer: Do not use this script to access media you are not allowed to download.  #"
echo "########################################################################################"
echo ""

# Read output file name

read -p "Please insert output files name [out.mp3]: " out
out=${out:-out.mp3}

# Read base url

read -p "Please insert M4S base url: " url

# Read start segement

read -p "Please insert first segment's ID [1]: " first
first=${first:-1}

# Read end segement

read -p "Please insert last segment's ID: " last

# Create cache folder

mkdir -p .cache
cd .cache

# Download dash file

echo "Downloading dash file ..."
curl --silent --output init.mp3 "${url}.dash"

# Download segments

for i in $(eval echo "{$first..$last}")
do
	echo -ne "Downloading segments ... (${i}/${last} done)\r"
	curl --silent --output "${i}.m4s" "${url}-${i}.m4s"
done

# Concat segments

echo "Building output file from segments ..."
cat init.mp3 $(ls -vx *.m4s) > "../${out}"

# Cleanup

echo "Clearing cache ..."
cd ..
rm -rf .cache/

echo "Done."