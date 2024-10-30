#!/bin/bash

# Set Wasabi bucket and endpoint configurations
BUCKET_NAME="qwertyupd"
ENDPOINT="https://s3.ap-southeast-2.wasabisys.com"
PROFILE="wasabi"

# Function to upload all files in the specified directory
upload_files() {
    local source_dir="$1"
    echo "Starting file upload from $source_dir..."

    # Loop through each file in the source directory
    for file in "$source_dir"/*; do
        if [[ -f "$file" ]]; then
            echo "Uploading $(basename "$file")..."
            pv "$file" | aws s3 cp - s3://"$BUCKET_NAME"/$(basename "$file") \
                --endpoint-url="$ENDPOINT" \
                --profile "$PROFILE"
        else
            echo "No files found in $source_dir."
            break
        fi
    done
    echo "Upload completed!"
}

# Function to sync a directory
sync_directory() {
    local source_dir="$1"
    echo "Starting sync from $source_dir to s3://$BUCKET_NAME/..."
    aws s3 sync "$source_dir" s3://"$BUCKET_NAME"/ \
        --endpoint-url="$ENDPOINT" \
        --profile "$PROFILE" \
        --exact-timestamps

    # Check if the sync was successful
    if [[ $? -eq 0 ]]; then
        echo "Sync completed successfully!"
    else
        echo "Sync failed. Please check the error messages above."
    fi
}

# Function to list files in the Wasabi bucket
list_files() {
    echo "Listing files in s3://$BUCKET_NAME..."
    aws s3 ls s3://"$BUCKET_NAME" --endpoint-url="$ENDPOINT" --profile "$PROFILE" --recursive
}

# Function to download files from the Wasabi bucket to a default local directory
download_files() {
    local destination_dir="/home/$USER/wasabi_download"
    echo "Starting download from s3://$BUCKET_NAME to $destination_dir..."

    # Create the destination directory if it does not exist
    mkdir -p "$destination_dir"

    aws s3 sync s3://"$BUCKET_NAME" "$destination_dir" \
        --endpoint-url="$ENDPOINT" \
        --profile "$PROFILE" \
        --exclude "*systemd-private*"

    # Check if the download was successful
    if [[ $? -eq 0 ]]; then
        echo "Download completed successfully!"
    else
        echo "Download failed. Please check the error messages above."
    fi
}

# Ask user for operation type
echo "Choose an operation:"
echo "1 - Upload files"
echo "2 - Sync a directory"
echo "3 - List files in the bucket"
echo "4 - Download files from the bucket"
read -p "Enter the number corresponding to your choice: " operation

# Perform the chosen operation
case "$operation" in
    1)
        read -p "Enter the path to the folder you want to upload: " source_path
        if [[ -d "$source_path" ]]; then
            upload_files "$source_path"
        else
            echo "The specified path does not exist or is not a directory."
        fi
        ;;
    2)
        read -p "Enter the path to the folder you want to sync: " source_path
        if [[ -d "$source_path" ]]; then
            sync_directory "$source_path"
        else
            echo "The specified path does not exist or is not a directory."
        fi
        ;;
    3)
        list_files
        ;;
    4)
        download_files
        ;;
    *)
        echo "Invalid selection. Please choose a valid option."
        ;;
esac
