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
