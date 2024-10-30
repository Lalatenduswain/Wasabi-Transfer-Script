# Wasabi Transfer Script

This repository contains `wasabi_transfer.sh`, a powerful bash script to interact with Wasabi cloud storage using the AWS CLI. This script enables users to upload files, sync a directory, list files in a Wasabi bucket, and download files to a default directory.

## Repository Information

- **GitHub URL**: [https://github.com/Lalatenduswain/wasabi_transfer](https://github.com/Lalatenduswain/wasabi_transfer)
- **Author**: Lalatendu Swain | [GitHub](https://github.com/Lalatenduswain) | [Website](https://blog.lalatendu.info/)

---

## Prerequisites

Before using this script, make sure the following are installed and configured on your system:

1. **AWS CLI**:
   - Install the AWS CLI using the following command:
     ```bash
     sudo apt install awscli -y
     ```
   - Configure the AWS CLI with your Wasabi credentials:
     ```bash
     aws configure --profile wasabi
     ```
   - Ensure you set up the profile named `wasabi` as used in this script.

2. **pv** (Pipe Viewer):
   - This is used to show progress during uploads. Install it using:
     ```bash
     sudo apt install pv -y
     ```

3. **Permissions**:
   - Run the script with appropriate permissions if accessing restricted directories.
   - Ensure you have permission to create directories in `/home/$USER/`.

---

## Installation

Clone this repository to your local machine:

```bash
git clone https://github.com/Lalatenduswain/wasabi_transfer
cd wasabi_transfer
```

Make the script executable:

```bash
chmod +x wasabi_transfer.sh
```

---

## Usage

Run the script by executing:

```bash
./wasabi_transfer.sh
```

Upon execution, you’ll be prompted to select an operation:

1. **Upload Files**: Upload all files from a specified directory to the Wasabi bucket.
2. **Sync a Directory**: Sync a local directory with the Wasabi bucket, ensuring they are identical.
3. **List Files in the Bucket**: Display all files currently stored in the specified Wasabi bucket.
4. **Download Files from the Bucket**: Download all files from the Wasabi bucket to the default directory `/home/$USER/wasabi_download`.

### Example Walkthroughs

1. **Uploading Files**:
   - Select option `1`.
   - Provide the path to the directory containing the files you wish to upload.

2. **Syncing a Directory**:
   - Select option `2`.
   - Provide the path of the local directory to be synced with the Wasabi bucket.

3. **Listing Files in the Bucket**:
   - Select option `3` to view all files in your Wasabi bucket.

4. **Downloading Files**:
   - Select option `4` to download all files to the default path `/home/$USER/wasabi_download`.

---

## Script Details

The `wasabi_transfer.sh` script provides a menu-based interface to execute the following functions:

- `upload_files`: Uploads all files from a specified local directory to your Wasabi bucket.
- `sync_directory`: Synchronizes a specified local directory with your Wasabi bucket.
- `list_files`: Lists all files in the specified Wasabi bucket.
- `download_files`: Downloads all files from the Wasabi bucket to the default local directory `/home/$USER/wasabi_download`.

---

## Disclaimer | Running the Script

**Author**: Lalatendu Swain | [GitHub](https://github.com/Lalatenduswain) | [Website](https://blog.lalatendu.info/)

This script is provided as-is and may require modifications or updates based on your specific environment and requirements. Use it at your own risk. The authors of the script are not liable for any damages or issues caused by its usage.

## Donations

If you find this script useful and want to show your appreciation, you can donate via [Buy Me a Coffee](https://www.buymeacoffee.com/lalatendu.swain).

## Support or Contact

Encountering issues? Don't hesitate to submit an issue on our [GitHub page](https://github.com/Lalatenduswain/Wasabi-Transfer-Script/issues).
