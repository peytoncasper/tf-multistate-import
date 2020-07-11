## Setup AWS Account

1. Set AWS Provider Config

```
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_KEY=""
export AWS_REGION=""
```

2. Move into aws dir

```
cd aws
```

3. Set variables

```
touch terraform.tfvars
```

Add variables to terraform.tfvars

```
name = "terraform"
path = "/"
```

4. Init

```
terraform init
```

5. Import AWS IAM User

```
terraform import aws_iam_user.user terraform
```

6. Run a plan to make sure no changes are detected

```
terraform plan
```

## Setup GCP Account

1. Set GCP Provider Config

```
export GOOGLE_PROJECT=""
export GOOGLE_APPLICATION_CREDENTIALS=""
```

2. Move into gcp dir

```
cd gcp
```

3. Set variables

```
touch terraform.tfvars
```

Add variables to terraform.tfvars

```
account_id = "terraform@testing-2...."
display_name = "terraform"
```

4. Init

```
terraform init
```

5. Import GCP Service Account

```
terraform import google_service_account.sa terraform@testing-2....
```

6. Run a plan to make sure no changes are detected

```
terraform plan
```

## Combine States

1. Move AWS State

```
terraform state mv -state=aws/terraform.tfstate -state-out=combined/terraform.tfstate "aws_iam_user.user" "aws_iam_user.user"
```

2. Move GCP State

```
terraform state mv -state=gcp/terraform.tfstate -state-out=combined/terraform.tfstate "google_service_account.sa" "google_service_account.sa"
```

3. Move into combined dir

```
cd combined
```

4. Init

```
terraform init
```

5. Run a plan to make sure no changes are detected

```
terraform plan
```
