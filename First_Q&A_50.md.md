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

**Terraform variables and outputs that set the “description” argument will store that description in the state file.**

- A. True  
- B. False  

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

## Question #: 13  

**What is the provider for this fictitious resource?**

"resource "aws_vpc" "main" {
  name = "test"
}"

- A. vpc  
- B. main  
- C. aws   
- D. test  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**C. aws**

---

### 📘 Explanation:

- In Terraform, the resource block follows the format:  
  `resource "<PROVIDER>_<RESOURCE_TYPE>" "<LOCAL_NAME>" { ... }`
- From this structure:
  - **Provider**: `aws`
  - **Resource type**: `vpc`
  - **Local name**: `main`
  - `"test"` is just a value for the `name` property, not a component of the provider
- Therefore, the provider is clearly `aws`.

---

### 🔗 References:
- [Terraform Docs: Resource Configuration](https://developer.hashicorp.com/terraform/language/resources/syntax)
- [Terraform Providers](https://developer.hashicorp.com/terraform/language/providers)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/75676-exam-terraform-associate-topic-1-question-13-discussion/)

</details>

## Question #: 14 

**If you manually destroy infrastructure, what is the best practice reflecting this change in Terraform?**

- A. Run terraform refresh  
- B. It will happen automatically  
- C. Manually update the state file  
- D. Run terraform import  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**D. Run terraform import**

---

### 📘 Explanation:

- When infrastructure is **manually destroyed**, the resource still exists in Terraform's **state file**.
- The best way to reconcile Terraform with real-world infrastructure is to **re-import the current state** of existing infrastructure using `terraform import`.
- `terraform refresh` only **updates attributes** of resources still in state — it won't detect that something has been deleted.
- **Manually editing the state file is discouraged** and can be error-prone.
- It does **not happen automatically** — Terraform assumes it manages the full lifecycle unless told otherwise.

---

### 🔗 References:
- [Terraform Docs: Import](https://developer.hashicorp.com/terraform/cli/import)
- [Terraform State Management](https://developer.hashicorp.com/terraform/language/state)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/74312-exam-terraform-associate-topic-1-question-14-discussion/)

</details>

## Question #: 15  

**What is not processed when running a `terraform refresh`?**

- A. State file  
- B. Configuration file 
- C. Credentials  
- D. Cloud provider  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**B. Configuration file**

---

### 📘 Explanation:

- `terraform refresh` **updates the state file** with the current real-world values from the infrastructure provider.
- It **uses the state file and provider configurations**, including credentials and cloud provider access.
- However, the **configuration file is not re-evaluated** — meaning Terraform doesn’t re-process resource definitions or plans.
- This command is purely for syncing state with the actual infrastructure, not for making changes based on configuration files.

---

### 🔗 References:
- [Terraform Docs: Refresh](https://developer.hashicorp.com/terraform/cli/commands/refresh)
- [Terraform State Overview](https://developer.hashicorp.com/terraform/language/state)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/74493-exam-terraform-associate-topic-1-question-15-discussion/)

</details>

## Question #: 16 

**What information does the public Terraform Module Registry automatically expose about published modules?**

- A. Required input variables  
- B. Optional input variables and default values  
- C. Outputs  
- D. All of the above   
- E. None of the above  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**D. All of the above**

---

### 📘 Explanation:

The [public Terraform Module Registry](https://registry.terraform.io/) automatically extracts and displays the following information from the module source code:

- **Required input variables** — Variables without default values.
- **Optional input variables** — Along with their **default values**.
- **Outputs** — The `output` blocks defined in the module.

This allows users to understand how to use a module **without needing to read all of the source code**.

---

### 🔗 References:
- [Terraform Docs: Module Registry](https://developer.hashicorp.com/terraform/registry/modules/publish)
- [Terraform Registry Example](https://registry.terraform.io/modules)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/74314-exam-terraform-associate-topic-1-question-16-discussion/)

</details>

## Question #: 17  

**If a module uses a local value, you can expose that value with a Terraform output.**

- A. True 
- B. False  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**A. True**

---

### 📘 Explanation:

- Terraform allows you to **reference local values** within `output` blocks.
- While local values are scoped to the module, you can **expose them externally by assigning them to an output**.
- This is a common practice when you want to use simplified or computed values outside of the module.

---

### 🔗 References:
- [Terraform Docs: Local Values](https://developer.hashicorp.com/terraform/language/values/locals)
- [Terraform Docs: Outputs](https://developer.hashicorp.com/terraform/language/values/outputs)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/81400-exam-terraform-associate-topic-1-question-17-discussion/)

</details>

## Question #: 18 

**You should store secret data in the same version control repository as your Terraform configuration.**

- A. True  
- B. False  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**B. False**

---

### 📘 Explanation:

- Storing **sensitive data** (like secrets, passwords, or access keys) in version control is a **security risk**.
- Terraform recommends using **secure methods** such as:
  - Environment variables
  - Encrypted secret management tools (e.g., Vault, AWS Secrets Manager)
  - Terraform Cloud/Enterprise sensitive variable storage
- Keeping secrets out of version control helps prevent **accidental exposure or leaks**.

---

### 🔗 References:
- [Terraform Docs: Sensitive Data](https://developer.hashicorp.com/terraform/docs/state/sensitive-data)
- [HashiCorp Security Best Practices](https://developer.hashicorp.com/terraform/tutorials/configuration-language/sensitive-variables)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/75203-exam-terraform-associate-topic-1-question-18-discussion/)
</details>

## Question #: 19 

**Which of the following is not a valid string function in Terraform?**

- A. split  
- B. join  
- C. slice 
- D. chomp  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**C. slice**

---

### 📘 Explanation:

- **`split`** and **`join`** are valid string functions in Terraform, used to break and combine strings.
- **`chomp`** is also a valid Terraform function, used to remove trailing newline characters.
- **`slice`** is **not a valid string function** in Terraform — it's not part of the Terraform function library for strings or collections.

---

### 🔗 References:
- [Terraform Docs: Functions](https://developer.hashicorp.com/terraform/language/functions)
- [Terraform String Functions](https://developer.hashicorp.com/terraform/language/functions#string-functions)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/74099-exam-terraform-associate-topic-1-question-19-discussion/)

</details>

## Question #: 20  

**You have provisioned some virtual machines (VMs) on Google Cloud Platform (GCP) using the gcloud command line tool. However, you are standardizing with  
Terraform and want to manage these VMs using Terraform instead.  
What are the two things you must do to achieve this? (Choose two.)**

- A. Provision new VMs using Terraform with the same VM names  
- B. Use the terraform import command for the existing VMs   
- C. Write Terraform configuration for the existing VMs  
- D. Run the terraform import-gcp command  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answers:  
**B. Use the terraform import command for the existing VMs**  
**C. Write Terraform configuration for the existing VMs**

---

### 📘 Explanation:

- Terraform cannot automatically discover or manage resources that were created outside of its configuration.
- To bring existing infrastructure (like GCP VMs created with `gcloud`) under Terraform management, you must:
  1. **Write Terraform configuration** that matches the resources (resource type, names, settings).
  2. **Use `terraform import`** to associate those existing resources with the Terraform state.
- `terraform import-gcp` is **not a valid Terraform command**.
- Re-provisioning (Option A) would result in resource conflicts or duplication.

---

### 🔗 References:
- [Terraform Docs: Import](https://developer.hashicorp.com/terraform/cli/import)
- [Managing Existing Infrastructure](https://developer.hashicorp.com/terraform/tutorials/state/resource-import)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/74316-exam-terraform-associate-topic-1-question-20-discussion/)

</details>

## Question #: 21  

**You have recently started a new job at a retailer as an engineer. As part of this new role, you have been tasked with evaluating multiple outages that occurred during peak shopping time during the holiday season. Your investigation found that the team is manually deploying new compute instances and configuring each compute instance manually. This has led to inconsistent configuration between each compute instance.  
How would you solve this using infrastructure as code?**

- A. Implement a ticketing workflow that makes engineers submit a ticket before manually provisioning and configuring a resource  
- B. Implement a checklist that engineers can follow when configuring compute instances  
- C. Replace the compute instance type with a larger version to reduce the number of required deployments  
- D. Implement a provisioning pipeline that deploys infrastructure configurations committed to your version control system following code reviews  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**D. Implement a provisioning pipeline that deploys infrastructure configurations committed to your version control system following code reviews**

---

### 📘 Explanation:

- **Infrastructure as Code (IaC)** enables consistent, repeatable deployments by defining infrastructure in code and managing it through version control.
- Option D addresses the **core problem of manual, inconsistent provisioning** by introducing:
  - Automated deployments
  - Peer-reviewed changes
  - Version-controlled infrastructure definitions
- Options A and B still rely on **manual processes**, which are prone to error.
- Option C addresses performance but **not configuration consistency**.

---

### 🔗 References:
- [Terraform Docs: Infrastructure as Code](https://developer.hashicorp.com/terraform/intro)
- [IaC Best Practices](https://developer.hashicorp.com/terraform/tutorials/automation/github-actions)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/74317-exam-terraform-associate-topic-1-question-21-discussion/)

</details>

## Question #: 22  

**`terraform init` initializes a sample `main.tf` file in the current directory.**

- A. True  
- B. False   

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**B. False**

---

### 📘 Explanation:

- `terraform init` **does not create any `.tf` files**, including `main.tf`.
- It is used to **initialize a working directory** containing existing Terraform configuration files.
- Specifically, it:
  - Downloads the required providers
  - Initializes the backend
  - Prepares the directory for Terraform operations
- Creating `main.tf` is a **manual step** or something done by a project template — not by `terraform init`.

---

### 🔗 References:
- [Terraform Docs: init](https://developer.hashicorp.com/terraform/cli/commands/init)
- [Terraform Getting Started Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/79070-exam-terraform-associate-topic-1-question-22-discussion/)

</details>

## Question #: 23  

**Which two steps are required to provision new infrastructure in the Terraform workflow? (Choose two.)**

- A. Destroy  
- B. Apply   
- C. Import  
- D. Init   
- E. Validate  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answers:  
**B. Apply**  
**D. Init**

---

### 📘 Explanation:

To **provision new infrastructure** using Terraform, the two essential steps are:

- **`terraform init`**: Initializes the working directory, downloads provider plugins, and sets up the backend. This step is always required before any Terraform operations.
- **`terraform apply`**: Executes the changes required to reach the desired state of the configuration — this is what actually **provisions** the infrastructure.

Other options:

- **`destroy`**: Tears down infrastructure, not provision it.
- **`import`**: Brings existing resources under Terraform management — does not provision new ones.
- **`validate`**: Checks whether the configuration is syntactically valid — useful, but not required to provision resources.

---

### 🔗 References:
- [Terraform Docs: init](https://developer.hashicorp.com/terraform/cli/commands/init)
- [Terraform Docs: apply](https://developer.hashicorp.com/terraform/cli/commands/apply)
- [Terraform Core Workflow](https://developer.hashicorp.com/terraform/cli/commands)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/75678-exam-terraform-associate-topic-1-question-23-discussion/)

</details>

## Question #: 24  

**Why would you use the `terraform taint` command?**

- A. When you want to force Terraform to destroy a resource on the next apply  
- B. When you want to force Terraform to destroy and recreate a resource on the next apply  
- C. When you want Terraform to ignore a resource on the next apply  
- D. When you want Terraform to destroy all the infrastructure in your workspace  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**B. When you want to force Terraform to destroy and recreate a resource on the next apply**

---

### 📘 Explanation:

- `terraform taint` marks a specific resource as **tainted**, which means it is **scheduled for destruction and recreation** during the next `terraform apply`.
- This is useful when a resource becomes **corrupted or misconfigured**, but Terraform doesn’t detect it as needing changes.
- It does **not** destroy the resource immediately — only on the **next apply**.
- It does **not** ignore or remove all resources like `destroy` would.

---

### 🔗 References:
- [Terraform Docs: taint](https://developer.hashicorp.com/terraform/cli/commands/taint)
- [Terraform Resource Lifecycle](https://developer.hashicorp.com/terraform/language/resources/lifecycle)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/75433-exam-terraform-associate-topic-1-question-24-discussion/)

</details>

## Question #: 25  

**Terraform requires the Go runtime as a prerequisite for installation.**

- A. True  
- B. False   

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**B. False**

---

### 📘 Explanation:

- Although **Terraform is written in Go**, it is distributed as a **precompiled binary**.
- This means users **do not need to install the Go runtime** to use Terraform.
- All you need is to **download the appropriate binary** for your system and add it to your system's PATH.

---

### 🔗 References:
- [Terraform Installation Guide](https://developer.hashicorp.com/terraform/downloads)
- [Terraform GitHub Releases](https://github.com/hashicorp/terraform/releases)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/76734-exam-terraform-associate-topic-1-question-25-discussion/)

</details>

## Question #: 26  

**When should you use the `force-unlock` command?**

- A. You see a status message that you cannot acquire the lock  
- B. You have a high priority change  
- C. Automatic unlocking failed  
- D. You apply failed due to a state lock  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**C. Automatic unlocking failed**

---

### 📘 Explanation:

- Terraform uses **state locking** to prevent simultaneous operations on the same state.
- In some cases, such as an **interrupted apply**, the lock may remain active.
- If Terraform fails to automatically release this lock, you can use `terraform force-unlock` to **manually remove the lock**.
- It should be used **with caution** to avoid potential state corruption.
- Simply having a failed apply or seeing a lock message does not justify its use unless **automatic unlocking has already failed**.

---

### 🔗 References:
- [Terraform Docs: force-unlock](https://developer.hashicorp.com/terraform/cli/commands/force-unlock)
- [Terraform State Locking](https://developer.hashicorp.com/terraform/language/state/locking)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/75054-exam-terraform-associate-topic-1-question-26-discussion/)

</details>

## Question #: 27

**Terraform can import modules from a number of sources — which of the following is not a valid source?**

- A. FTP server 
- B. GitHub repository  
- C. Local path  
- D. Terraform Module Registry  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**A. FTP server**

---

### 📘 Explanation:

- Terraform supports importing modules from a variety of **valid sources**, including:
  - **GitHub repositories** (e.g., via `git::https://github.com/user/repo`)
  - **Local paths** (e.g., `./modules/network`)
  - **Terraform Module Registry** (e.g., `terraform-aws-modules/vpc/aws`)
- **FTP servers are not a supported module source**.
- Supported sources include **Git, Mercurial, HTTP URLs (with archive files), local paths, and official registries** — but not FTP.

---

### 🔗 References:
- [Terraform Docs: Module Sources](https://developer.hashicorp.com/terraform/language/modules/sources)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/75680-exam-terraform-associate-topic-1-question-27-discussion/)

</details>

## Question #: 28  

**Which of the following is available only in Terraform Enterprise or Cloud workspaces and not in Terraform CLI?**

- A. Secure variable storage 
- B. Support for multiple cloud providers  
- C. Dry runs with terraform plan  
- D. Using the workspace as a data source  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**A. Secure variable storage**

---

### 📘 Explanation:

- **Terraform Enterprise and Terraform Cloud** offer **secure, encrypted variable storage** through their web UI or API, allowing users to safely store sensitive values like API keys or passwords.
- This feature is **not available in Terraform CLI**, where variables are passed via environment variables, `.tfvars` files, or CLI arguments — all of which are **less secure**.
- The other options are available in both CLI and Cloud/Enterprise:
  - **Multiple cloud providers**: Supported by both.
  - **`terraform plan` (dry runs)**: Core CLI feature.
  - **Workspace as a data source**: Available in CLI as well.

---

### 🔗 References:
- [Terraform Cloud: Input Variables](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/variables)
- [Terraform CLI: Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/74318-exam-terraform-associate-topic-1-question-28-discussion/)

</details>

## Question #: 29  

**`terraform validate` validates the syntax of Terraform files.**

- A. True  
- B. False  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**A. True**

---

### 📘 Explanation:

- `terraform validate` is used to **check whether a configuration is syntactically valid**.
- It parses the Terraform files and ensures that the configuration is **internally consistent**, but it does **not access remote services or validate values**.
- It’s a helpful command to run **early in your workflow** to catch syntax errors before applying.

---

### 🔗 References:
- [Terraform Docs: validate](https://developer.hashicorp.com/terraform/cli/commands/validate)
- [Terraform Syntax and Configuration](https://developer.hashicorp.com/terraform/language)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/76192-exam-terraform-associate-topic-1-question-29-discussion/)

</details>

## Question #: 30  

**You have used Terraform to create an ephemeral development environment in the cloud and are now ready to destroy all the infrastructure described by your  
Terraform configuration. To be safe, you would like to first see all the infrastructure that will be deleted by Terraform.  
Which command should you use to show all of the resources that will be deleted? (Choose two.)**

- A. Run `terraform plan -destroy`. 
- B. This is not possible. You can only show resources that will be created.  
- C. Run `terraform state rm *`.  
- D. Run `terraform destroy` and it will first output all the resources that will be deleted before prompting for approval. 

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answers:  
**A. Run `terraform plan -destroy`.**  
**D. Run `terraform destroy` and it will first output all the resources that will be deleted before prompting for approval.**

---

### 📘 Explanation:

- **`terraform plan -destroy`**: Shows the **execution plan** for destroying all resources, without actually making any changes.
- **`terraform destroy`**: Before deleting anything, it **displays the full list of resources** that will be destroyed and asks for confirmation.
- **Option B is incorrect**: Terraform can absolutely show resources that will be destroyed.
- **Option C is incorrect**: `terraform state rm` removes resources from state without destroying them, which can leave real resources unmanaged.

---

### 🔗 References:
- [Terraform Docs: plan -destroy](https://developer.hashicorp.com/terraform/cli/commands/plan#destroy-plans)
- [Terraform Docs: destroy](https://developer.hashicorp.com/terraform/cli/commands/destroy)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/74957-exam-terraform-associate-topic-1-question-30-discussion/)

</details>

## Question #: 31  

**Which of the following is the correct way to pass the value in the variable `num_servers` into a module with the input `servers`?**

- A. `servers = num_servers`  
- B. `servers = variable.num_servers`  
- C. `servers = var(num_servers)`  
- D. `servers = var.num_servers`  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**D. `servers = var.num_servers`**

---

### 📘 Explanation:

- In Terraform, input variables are referenced using the **`var.<variable_name>`** syntax.
- To pass the value of the variable `num_servers` into a module input called `servers`, you write:  
  `servers = var.num_servers`
- The other options are incorrect:
  - **A** is missing the `var.` prefix.
  - **B** uses incorrect syntax — `variable.` is not valid.
  - **C** uses function-style syntax which Terraform does not support for variables.

---

### 🔗 References:
- [Terraform Docs: Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)
- [Terraform Docs: Modules](https://developer.hashicorp.com/terraform/language/modules/syntax)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/74319-exam-terraform-associate-topic-1-question-31-discussion/)

</details>

## Question #: 32 

**A Terraform provisioner must be nested inside a resource configuration block.**

- A. True 
- B. False  

<details>
<summary><strong>✅ Check Answer</strong></summary>

---

### ✅ Correct Answer:  
**A. True**

---

### 📘 Explanation:

- **Provisioners** in Terraform (like `remote-exec` or `local-exec`) **must be defined inside a resource block**, as they are tied to the lifecycle of that specific resource.
- They are typically used for **bootstrapping or configuration tasks** after the resource has been created.
- You cannot define a provisioner **outside a resource block** or apply it globally.

---

### 🔗 References:
- [Terraform Docs: Provisioners](https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax)
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/76904-exam-terraform-associate-topic-1-question-32-discussion/)
</details>
