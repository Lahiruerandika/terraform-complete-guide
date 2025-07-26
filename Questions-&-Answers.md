## Question #: 01

**The terraform.tfstate file always matches your currently built infrastructure.**

- A. True  
- B. False

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

## ✅ Correct Answer: B. False

### 📌 Explanation:
The `terraform.tfstate` file **does not always reflect the actual infrastructure state**.  
It represents Terraform's **last known state**, based on what Terraform has created or modified.

If someone makes **manual changes** to infrastructure outside of Terraform (like in a cloud console), the state file won’t be updated unless you run:

### terraform refresh

### 🔗 References:
- [Terraform Docs: State](https://developer.hashicorp.com/terraform/language/state)
- [Terraform Docs: Refresh Command](https://developer.hashicorp.com/terraform/cli/commands/refresh)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/75524-exam-terraform-associate-topic-1-question-1-discussion/)

</details>

## Question #: 02

**One remote backend configuration always maps to a single remote workspace.**

- A. True  
- B. False

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**B. False**

---

### 📘 Explanation:

- A remote backend can support **multiple workspaces** within the same configuration.
- For example, Terraform Cloud or Terraform Enterprise backends allow managing multiple workspaces (like dev, staging, prod) under a single backend configuration.
- Workspaces enable managing different state files and environments using the same backend setup.
- Therefore, one remote backend configuration **does not** always map to just a single workspace.

---

### 🔗 References:
- [Terraform Workspaces](https://developer.hashicorp.com/terraform/language/state/workspaces)
- [Terraform Backend Configuration](https://developer.hashicorp.com/terraform/language/settings/backends/configuration)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/75671-exam-terraform-associate-topic-1-question-2-discussion/)

</details>

## Question #: 03  
Topic #: 1

**How is the Terraform remote backend different than other state backends such as S3, Consul, etc.?**

- A. It can execute Terraform runs on dedicated infrastructure on premises or in Terraform Cloud  
- B. It doesn’t show the output of a terraform apply locally  
- C. It is only available to paying customers  
- D. All of the above

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**D. All of the above**

---

### 📘 Explanation:

- The Terraform remote backend (such as Terraform Cloud or Terraform Enterprise) can **execute Terraform runs remotely** on dedicated infrastructure, unlike simple storage backends like S3 or Consul which only store state.
- It does **not show the output of `terraform apply` locally** because runs happen remotely.
- Some advanced remote backend features require a **paid Terraform Cloud or Enterprise subscription**.
- Therefore, all options are true.

---

### 🔗 References:
- [Terraform Remote Backend Overview](https://developer.hashicorp.com/terraform/cloud-docs/backend/remote)
- [Terraform Cloud Pricing](https://www.hashicorp.com/pricing#terraform-cloud)
- [Terraform Backends](https://developer.hashicorp.com/terraform/language/settings/backends)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/75672-exam-terraform-associate-topic-1-question-3-discussion/)

</details>

## Question #: 04  

**What is the workflow for deploying new infrastructure with Terraform?**

- A. terraform plan to import the current infrastructure to the state file, make code changes, and terraform apply to update the infrastructure.  
- B. Write a Terraform configuration, run terraform show to view proposed changes, and terraform apply to create new infrastructure.  
- C. terraform import to import the current infrastructure to the state file, make code changes, and terraform apply to update the infrastructure.  
- D. Write a Terraform configuration, run terraform init, run terraform plan to view planned infrastructure changes, and terraform apply to create new infrastructure.

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**D. Write a Terraform configuration, run terraform init, run terraform plan to view planned infrastructure changes, and terraform apply to create new infrastructure.**

---

### 📘 Explanation:

The standard workflow for deploying new infrastructure with Terraform includes:

1. **Write a configuration** – Define your infrastructure resources in `.tf` files using HCL.  
2. **Initialize the working directory** using `terraform init` to download providers and configure backends.  
3. **Preview the planned changes** using `terraform plan`.  
4. **Apply the configuration** using `terraform apply` to provision the defined infrastructure.

- `terraform import` is used to bring existing infrastructure into Terraform's state file, not to deploy new infrastructure.  
- `terraform show` displays current state but not proposed changes.  
- `terraform plan` doesn't import anything — it only shows what *will* happen.

---

### 🔗 References:
- [Terraform Docs: Core Workflow](https://developer.hashicorp.com/terraform/intro/core-workflow)  
- [Terraform CLI Overview](https://developer.hashicorp.com/terraform/cli)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/75673-exam-terraform-associate-topic-1-question-4-discussion/)

</details>

