# Question 1

**The terraform.tfstate file always matches your currently built infrastructure.**

- A. True  
- B. False ✅

---

## ✅ Correct Answer: B. False

### 📌 Explanation:
The `terraform.tfstate` file **does not always reflect the actual infrastructure state**.  
It represents Terraform's **last known state**, based on what Terraform has created or modified.

If someone makes **manual changes** to infrastructure outside of Terraform (like in a cloud console), the state file won’t be updated unless you run:

```bash
terraform refresh

### 🔗 References:
- [ExamTopics Discussion](https://www.examtopics.com/discussions/hashicorp/view/75524-exam-terraform-associate-topic-1-question-1-discussion/)
- [Terraform Docs: State](https://developer.hashicorp.com/terraform/language/state)
- [Terraform Docs: Refresh Command](https://developer.hashicorp.com/terraform/cli/commands/refresh)
