# ✅ Terraform Associate Exam Preparation – Bullet Points  
*Quick Reference Guide for Exam Topics (Part 1)*

---

## 📌 1. Understanding Providers & Initialization

- **Providers** define how Terraform interacts with services (e.g., AWS, Azure).
- After defining a provider, `terraform init` is **required** to initialize the directory and download plugins.
- Provider plugins are stored under `.terraform/providers/registry.terraform.io/hashicorp/aws`.

---

## ❓ 2. Is the Provider Block Mandatory?

- The **provider block is optional** if it’s empty (no region/credentials).
- Terraform can infer providers using the `required_providers` block.
- However, defining **a provider is necessary** for resource creation.

---

## 🧩 3. Using Provider Aliases

- **Aliases** let you use multiple configurations of the same provider (e.g., for multi-region setups).

### 🔽 Example:
![alt text](attached-images/image5.png)


## 🔐 4. Best Practices for Credentials

Avoid hardcoding credentials in the provider block.

Use one of the following secure methods:
- **Environment variables**
- **Shared credentials file**
- **IAM roles / external authentication mechanisms**

---

## ⚙️ 5. Terraform Settings Block (`terraform` block)

Includes:
- `required_version`: Specifies Terraform version (e.g., `>= 1.2.0`)
- `required_providers`: Defines provider dependencies and versions
- `backend`: Used for remote state (covered later)

---

## 🛠️ 6. Key Terraform Commands

- `terraform init` → Initialize working directory  
- `terraform init -upgrade` → Upgrade provider versions  
- `terraform plan` → Preview changes without modifying infrastructure  
- `terraform apply` → Apply changes to infrastructure  
- `terraform destroy` → Tear down infrastructure  
- `terraform fmt` → Format configuration files  
  - `-check` → Validate formatting only  
  - `-recursive` → Format files in subdirectories  

---

## 🔢 7. Version Constraints & Provider Tiers

### Version Operators:
- `>=`, `<=`, `~>`

### Provider Categories:
- ✅ **Official** – Maintained by HashiCorp  
- 🤝 **Partner** – Verified by trusted third parties  
- 🧪 **Community** – Open source or custom providers  

---

## 📂 8. State File & Terraform Behavior

- Default state file: `terraform.tfstate`  
- `terraform plan` → Does **not** change the state file  
- Infrastructure can be destroyed via:
  - `terraform destroy`
  - Deleting a resource from `.tf` files and running `terraform apply`

---

> 🧠 Use this as a handy cheat sheet for fast revision before your Terraform Associate exam!
