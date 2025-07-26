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

## Question #: 05  
Topic #: 1

**A provider configuration block is required in every Terraform configuration.**

- A. True  
- B. False  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**B. False**

---

### 📘 Explanation:

- A **provider block is not strictly required** in every Terraform configuration.
- If a module or configuration only uses **child modules** and those modules include their own provider blocks, Terraform can still work.
- Additionally, **default provider configurations** (like the `hashicorp/aws` provider) can be inherited from elsewhere in the configuration.
- Terraform will also attempt to **auto-install and use a provider** based on resource type unless explicitly overridden.

---

### 🔗 References:
- [Terraform Docs: Providers](https://developer.hashicorp.com/terraform/language/providers/configuration)
- [Terraform Docs: Provider Requirements](https://developer.hashicorp.com/terraform/language/providers/requirements)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/75674-exam-terraform-associate-topic-1-question-5-discussion/)

</details>

## Question #: 06  
Topic #: 1

**You run a local-exec provisioner in a null resource called `null_resource.run_script` and realize that you need to rerun the script.  
Which of the following commands would you use first?**

- A. terraform taint null_resource.run_script  
- B. terraform apply -target=null_resource.run_script  
- C. terraform validate null_resource.run_script  
- D. terraform plan -target=null_resource.run_script  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**A. terraform taint null_resource.run_script**

---

### 📘 Explanation:

- **`local-exec` provisioners** only run **when the resource is created**.
- To **rerun** a `local-exec` script tied to a `null_resource`, you must **force Terraform to recreate the resource**.
- `terraform taint null_resource.run_script` marks the resource as **tainted**, which means Terraform will destroy and recreate it during the next `terraform apply`.
- The `apply` command would then trigger the provisioner again.

**Why not the others?**
- `terraform apply -target=...` won’t force re-execution unless the resource is changed or tainted.
- `terraform validate` only checks configuration syntax.
- `terraform plan -target=...` shows the plan but doesn’t actually trigger any actions.

---

### 🔗 References:
- [Terraform Docs: Taint Command](https://developer.hashicorp.com/terraform/cli/commands/taint)
- [Terraform Docs: Provisioners](https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/75954-exam-terraform-associate-topic-1-question-6-discussion/)

</details>

## Question #: 07  
Topic #: 1

**Which provisioner invokes a process on the resource created by Terraform?**

- A. remote-exec  
- B. null-exec  
- C. local-exec  
- D. file  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**A. remote-exec**

---

### 📘 Explanation:

- The **`remote-exec` provisioner** runs commands **on the remote resource** that Terraform creates (like an EC2 instance).
- It uses SSH or WinRM to connect to the created resource and execute scripts or commands.
- The **`local-exec`** provisioner runs commands **on the machine running Terraform** (locally).
- **`null-exec`** is not a valid provisioner.
- The **`file`** provisioner uploads files to a remote resource but does not run processes.

---

### 🔗 References:
- [Terraform Docs: Provisioners - remote-exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec)
- [Terraform Docs: Provisioners - local-exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec)
- [Terraform Docs: Provisioners - file](https://developer.hashicorp.com/terraform/language/resources/provisioners/file)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/74490-exam-terraform-associate-topic-1-question-7-discussion/)

</details>

## Question #: 08  
Topic #: 1

**Which of the following is not true of Terraform providers?**

- A. Providers can be written by individuals  
- B. Providers can be maintained by a community of users  
- C. Some providers are maintained by HashiCorp  
- D. Major cloud vendors and non-cloud vendors can write, maintain, or collaborate on Terraform providers  
- E. None of the above  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**E. None of the above**

---

### 📘 Explanation:

- All the listed statements (A to D) are true regarding Terraform providers:
  - Individuals can write custom providers.
  - Providers can be community-maintained.
  - HashiCorp maintains some official providers.
  - Both cloud vendors and non-cloud vendors contribute to providers.
- Therefore, none of the statements are false.

---

### 🔗 References:
- [Terraform Providers Overview](https://developer.hashicorp.com/terraform/language/providers)
- [Terraform Provider Development](https://developer.hashicorp.com/terraform/cli/plugin)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/74084-exam-terraform-associate-topic-1-question-8-discussion/)

</details>

## Question #: 09  
Topic #: 1

**What command does Terraform require the first time you run it within a configuration directory?**

- A. terraform import  
- B. terraform init 
- C. terraform plan  
- D. terraform workspace  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**B. terraform init**

---

### 📘 Explanation:

- `terraform init` initializes the working directory containing Terraform configuration files.
- It downloads required provider plugins and sets up the backend.
- This command must be run before any other Terraform commands such as `plan` or `apply`.
- `terraform import` is used to import existing infrastructure into state.
- `terraform plan` previews changes but requires `init` first.
- `terraform workspace` manages different state workspaces.

---

### 🔗 References:
- [Terraform Docs: terraform init](https://developer.hashicorp.com/terraform/cli/commands/init)
- [Terraform Docs: Getting Started](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/75675-exam-terraform-associate-topic-1-question-9-discussion/)

</details>

## Question #: 10  
Topic #: 1

**You have deployed a new webapp with a public IP address on a cloud provider. However, you did not create any outputs for your code.  
What is the best method to quickly find the IP address of the resource you deployed?**

- A. Run terraform output ip_address to view the result  
- B. In a new folder, use the terraform_remote_state data source to load in the state file, then write an output for each resource that you find the state file  
- C. Run terraform state list to find the name of the resource, then terraform state show to find the attributes including public IP address  
- D. Run terraform destroy then terraform apply and look for the IP address in stdout  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**C. Run terraform state list to find the name of the resource, then terraform state show to find the attributes including public IP address**

---

### 📘 Explanation:

- `terraform state list` shows all resources tracked in the state file.
- Using `terraform state show <resource_name>` displays detailed attributes of the resource, including the public IP address.
- This is the quickest way to find resource attributes if outputs were not defined.
- Option A won't work if no output is defined.
- Option B is more complex and unnecessary for quick info.
- Option D is destructive and inefficient.

---

### 🔗 References:
- [Terraform Docs: terraform state](https://developer.hashicorp.com/terraform/cli/commands/state)
- [Terraform Docs: Outputs](https://developer.hashicorp.com/terraform/language/values/outputs)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/74085-exam-terraform-associate-topic-1-question-10-discussion/)

</details>

## Question #: 11  
Topic #: 1

**Which of the following is not a key principle of infrastructure as code?**

- A. Versioned infrastructure  
- B. Golden images
- C. Idempotence  
- D. Self-describing infrastructure  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**B. Golden images**

---

### 📘 Explanation:

- **Versioned infrastructure**, **idempotence**, and **self-describing infrastructure** are core principles of infrastructure as code (IaC).
- **Golden images** (pre-baked machine images) are a deployment strategy but **not a fundamental principle of IaC**.
- IaC emphasizes managing infrastructure via code that is version-controlled, repeatable, and declarative.

---

### 🔗 References:
- [Infrastructure as Code Principles](https://www.redhat.com/en/topics/automation/what-is-infrastructure-as-code)
- [Terraform Docs: IaC Concepts](https://developer.hashicorp.com/terraform/intro/infrastructure-as-code)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/74491-exam-terraform-associate-topic-1-question-11-discussion/)

</details>

## Question #: 12  
Topic #: 1

**Terraform variables and outputs that set the “description” argument will store that description in the state file.**

- A. True  
- B. False ✅  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**B. False**

---

### 📘 Explanation:

- Terraform **does not store variable or output descriptions** in the state file.
- The state file only contains **resolved values** of variables and outputs, along with resource metadata.
- Descriptions are used only in the configuration and documentation but **are not persisted in the state**.

---

### 🔗 References:
- [Terraform Docs: Variables](https://developer.hashicorp.com/terraform/language/values/variables#description)
- [Terraform Docs: State](https://developer.hashicorp.com/terraform/language/state)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/78939-exam-terraform-associate-topic-1-question-12-discussion/)

</details>
