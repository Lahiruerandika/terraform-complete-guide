# ✅ Terraform Associate Exam Preparation – Bullet Points (Part 1)

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

# ✅ Terraform Associate Exam Preparation – Bullet Points (Part 2)

---

## 1. Terraform Validate (`terraform validate`)

- Validates Terraform configuration files in the current directory.
- Requires an initialized directory (`terraform init` must be run first).
- `terraform plan` implicitly performs validation, so `terraform validate` is not always necessary.

---

## 2. Terraform Refresh (`terraform refresh`)

- Reads current settings of managed resources and updates the state file accordingly.
- Deprecated due to unsafe behavior; replaced by `terraform apply -refresh-only`.

---

## 3. Resource Block Structure

![alt text](attached-images/image6.png)
- **Resource Type:** e.g., `aws_instance`
- **Local Name:** e.g., `web`
- **Arguments:** e.g., `ami`, `instance_type`
- **Example Resource Address:** `aws_instance.web`
- Resource names must be unique within a module.

---

## 4. Terraform Data Types

- Supported types: `string`, `number`, `boolean`, `list`, `set`, `map`, `null`.
- Terraform does **not** support arrays.
![alt text](attached-images/image7.png)
---

## 5. Terraform State Management

Important state subcommands:
- `terraform state move` → Moves resources within or across state files.
- `terraform state remove` → Removes a resource from the state without deleting it in the cloud.

---

## 6. Debugging Terraform

Enable logs using environment variables:
- `TF_LOG` (levels: `TRACE`, `DEBUG`, `INFO`, `WARN`, `ERROR`)
- `TF_LOG_PATH` (save logs to a file)

---

## 7. Terraform Import (`terraform import`)

- Imports existing infrastructure into Terraform management.
- New feature: Automatic code generation for imported resources.
- Supports multiple resource imports using `import` blocks.

---

## 8. Local Values (`locals`)

- Used to avoid repeating expressions.
- Defined inside a `locals` block, referenced using `local.` (singular).

---

## 9. Terraform Workspaces

- Manage multiple deployments using the same configuration.
- State files stored in `terraform.tfstate.d` directory.
- Not suitable for strong isolation (e.g., production vs. staging).
- Common workspace commands:
  - `terraform workspace new <name>`
  - `terraform workspace select <name>`
  - `terraform workspace list`

---

## 10. Terraform Modules

- Encapsulate reusable infrastructure code.
- Module locations:
  - Local filesystem (`./modules/example`)
  - Git repositories (`git::https://github.com/example.git`)
  - Terraform Registry (`terraform-aws-modules/vpc/aws`)
- Root Module vs. Child Module:
  - Root module is the main entry point.
  - Child module is any module called by another module.
- Module outputs expose values to other modules.
- Versioning:
  - Not mandatory but recommended (e.g., `version = "~> 1.2"`).

---

## 11. Terraform Registry

- Hosts publicly available Terraform modules.
- Module address format: `[hostname]/[namespace]/[name]/[system]`
- Default registry: `registry.terraform.io`

---

## 12. Terraform Functions

Terraform does **not** support user-defined functions.

Important built-in functions:
- `lookup()` → Retrieves values from a map.
- `zipmap()` → Converts lists into a map.
- `index()` → Returns index of an element in a list.
- `element()` → Retrieves element at a specific index.
- `toset()` → Converts a list into a set.
- `timestamp()` → Retrieves the current timestamp.
- `file()` → Reads content from a file.

---

## 13. Meta-Arguments in Terraform

Meta-arguments customize resource behavior.

Common meta-arguments:
- `depends_on` → Specifies dependencies between resources.
- `count` → Creates multiple instances of a resource.
- `for_each` → Iterates over a map or set.
- `lifecycle` block with options:
  - `ignore_changes` → Ignores changes to specified attributes.
  - `prevent_destroy` → Prevents accidental deletion.
  - `create_before_destroy` → Creates new resources before destroying old ones.

---


