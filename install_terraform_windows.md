# How to Install Terraform on Windows Manually

This guide walks you through the manual installation of **Terraform** on a Windows machine.

## Prerequisites

- A Windows 10 or later system
- Administrator access to install software
- Access to the internet to download Terraform

---

## Step-by-Step Installation Guide

### 1. Download Terraform Binary

1. Go to the official Terraform releases page:  
   👉 [https://www.terraform.io/downloads.html](https://www.terraform.io/downloads.html)

2. Scroll down to the **Windows** section.

3. Click on the download link based on your system architecture (e.g., `64-bit`).

4. A `.zip` file will be downloaded (e.g., `terraform_<version>_windows_amd64.zip`).

---

### 2. Extract and Move the Executable

1. Right-click the downloaded `.zip` file and select **Extract All...**

2. After extracting, you will see `terraform.exe`.

3. Create a new folder in `C:\Program Files` called `Terraform` (if it doesn't already exist).

4. Copy the `terraform.exe` file and paste it into:  
   ```  
   C:\Program Files\Terraform
   ```

> ⚠️ You may need admin permissions to copy the file into `C:\Program Files`.

---

### 3. Add Terraform to System PATH

1. Press `Windows Key + S` and search for `Environment Variables`.

2. Click **Edit the system environment variables**.

3. In the System Properties window, click on **Environment Variables**.

4. Under **System variables**, find and select the `Path` variable, then click **Edit**.

5. Click **New** and add the following path:

   ```
   C:\Program Files\Terraform
   ```

6. Click **OK** to close all windows.

---

### 4. Verify Installation

1. Open **Command Prompt** or **PowerShell**.

2. Run the following command:

   ```bash
   terraform -version
   ```

3. You should see the installed Terraform version printed.

   Example output:

   ```
   Terraform v1.5.7
   ```

---

## ✅ Done!

Terraform is now successfully installed and ready to use on your Windows machine.

> Tip: You can now start using Terraform by writing `.tf` configuration files and initializing them using `terraform init`.

---

## Additional Resources

- [Terraform Docs](https://developer.hashicorp.com/terraform/docs)
- [Terraform CLI Commands](https://developer.hashicorp.com/terraform/cli)

---

*Created by [Lahiruerandika] — (https://github.com/Lahiruerandika/terraform-installation-windows)*
