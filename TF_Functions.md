# Terraform Functions Cheat Sheet

> A practical, GitHub-ready reference for Terraform built-in functions, with syntax, examples, and AWS/DevOps use cases.

[![Terraform](https://img.shields.io/badge/Terraform-Functions-7B42BC?logo=terraform&logoColor=white)](https://developer.hashicorp.com/terraform/language/functions)
[![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?logo=amazonaws&logoColor=white)](https://aws.amazon.com/)

---

## Table of Contents

- [1. Quick Reference](#1-quick-reference)
- [2. String Functions](#2-string-functions)
- [3. Collection Functions](#3-collection-functions)
- [4. Map and Object Functions](#4-map-and-object-functions)
- [5. Numeric Functions](#5-numeric-functions)
- [6. Type Conversion Functions](#6-type-conversion-functions)
- [7. Validation and Error-Handling Functions](#7-validation-and-error-handling-functions)
- [8. Encoding and Decoding Functions](#8-encoding-and-decoding-functions)
- [9. File and Template Functions](#9-file-and-template-functions)
- [10. Date and Time Functions](#10-date-and-time-functions)
- [11. Hash and Cryptographic Functions](#11-hash-and-cryptographic-functions)
- [12. Filesystem Path Functions](#12-filesystem-path-functions)
- [13. IP and CIDR Functions](#13-ip-and-cidr-functions)
- [14. AWS-Focused Examples](#14-aws-focused-examples)
- [15. Functions to Prioritize for AWS/DevOps](#15-functions-to-prioritize-for-awsdevops)
- [16. Function + Expression Patterns](#16-function--expression-patterns)
- [17. Useful Commands](#17-useful-commands)
- [18. Official Documentation](#18-official-documentation)

---

# 1. Quick Reference

| Category | Functions worth knowing |
|---|---|
| Strings | `upper`, `lower`, `title`, `trim`, `trimspace`, `replace`, `split`, `join`, `format`, `formatlist`, `substr`, `strrev`, `chomp` |
| Collections | `length`, `concat`, `flatten`, `compact`, `distinct`, `reverse`, `sort`, `slice`, `element`, `contains` |
| Maps / Objects | `lookup`, `keys`, `values`, `merge`, `zipmap` |
| Numbers | `abs`, `ceil`, `floor`, `max`, `min`, `pow`, `log`, `signum` |
| Types | `tostring`, `tonumber`, `tobool`, `tolist`, `toset`, `tomap`, `toobject` |
| Validation | `can`, `try`, `coalesce`, `coalescelist` |
| Encoding | `jsonencode`, `jsondecode`, `yamlencode`, `yamldecode`, `base64encode`, `base64decode` |
| Files | `file`, `filebase64`, `fileexists`, `templatefile` |
| Time | `timestamp`, `plantimestamp`, `timeadd`, `formatdate` |
| Hashing | `md5`, `sha1`, `sha256`, `filemd5`, `filesha256`, `filebase64sha256` |
| Paths | `basename`, `dirname`, `abspath`, `pathexpand` |
| Networking | `cidrsubnet`, `cidrsubnets`, `cidrhost`, `cidrnetmask`, `cidrcontains` |
| UUID / Crypto | `uuid`, `uuidv5`, `bcrypt` |

> **Note:** Terraform's function catalog is version-dependent. This README focuses on the built-in functions and patterns most useful in day-to-day Terraform and AWS/DevOps work. Always check the official Terraform documentation for your installed Terraform version.

---

# 2. String Functions

## `upper()`

Converts a string to uppercase.

### Syntax

```hcl
upper(string)
```

### Example

```hcl
upper("terraform")
```

**Result:** `TERRAFORM`

---

## `lower()`

Converts a string to lowercase.

```hcl
lower("TERRAFORM")
```

**Result:** `terraform`

---

## `title()`

Capitalizes the first letter of each word.

```hcl
title("terraform functions cheat sheet")
```

**Result:** `Terraform Functions Cheat Sheet`

---

## `trim()`

Removes specified characters from the beginning and end of a string.

```hcl
trim("  terraform  ", " ")
```

**Result:** `terraform`

---

## `trimspace()`

Removes leading and trailing whitespace.

```hcl
trimspace("  terraform  ")
```

**Result:** `terraform`

---

## `trimprefix()`

Removes a prefix when it exists.

```hcl
trimprefix("terraform-dev", "terraform-")
```

**Result:** `dev`

---

## `trimsuffix()`

Removes a suffix when it exists.

```hcl
trimsuffix("terraform.tf", ".tf")
```

**Result:** `terraform`

---

## `replace()`

Replaces text or a regular-expression match.

```hcl
replace("hello-world", "-", "_")
```

**Result:** `hello_world`

Regex example:

```hcl
replace("server-123", "/[0-9]+/", "")
```

**Result:** `server-`

---

## `split()`

Splits a string into a list.

```hcl
split(",", "dev,stage,prod")
```

**Result:**

```hcl
["dev", "stage", "prod"]
```

### AWS example

```hcl
variable "availability_zones" {
  default = "us-east-1a,us-east-1b,us-east-1c"
}

locals {
  azs = split(",", var.availability_zones)
}
```

---

## `join()`

Combines list elements into a string.

```hcl
join("-", ["dev", "web", "01"])
```

**Result:** `dev-web-01`

### AWS naming example

```hcl
locals {
  resource_name = join("-", [
    var.project,
    var.environment,
    "web"
  ])
}
```

---

## `format()`

Creates a formatted string.

```hcl
format("%s-%s-%s", "dev", "web", "01")
```

**Result:** `dev-web-01`

---

## `formatlist()`

Formats every item in a list.

```hcl
formatlist("server-%s", ["01", "02", "03"])
```

**Result:**

```hcl
["server-01", "server-02", "server-03"]
```

---

## `substr()`

Extracts part of a string.

```hcl
substr("terraform", 0, 4)
```

**Result:** `terr`

---

## `strrev()`

Reverses a string.

```hcl
strrev("terraform")
```

**Result:** `mrofsnart`

---

## `chomp()`

Removes newline characters from the end of a string.

```hcl
chomp("hello\n")
```

**Result:** `hello`

---

## `indent()`

Adds indentation to lines of text.

```hcl
indent(4, "hello\nworld")
```

---

# 3. Collection Functions

## `length()`

Returns the number of elements in a collection or characters in a string.

```hcl
length(["dev", "stage", "prod"])
```

**Result:** `3`

```hcl
length("terraform")
```

**Result:** `9`

---

## `concat()`

Combines lists.

```hcl
concat(
  ["subnet-1", "subnet-2"],
  ["subnet-3", "subnet-4"]
)
```

**Result:**

```hcl
["subnet-1", "subnet-2", "subnet-3", "subnet-4"]
```

---

## `flatten()`

Flattens nested lists.

```hcl
flatten([
  ["subnet-1", "subnet-2"],
  ["subnet-3", "subnet-4"]
])
```

**Result:**

```hcl
["subnet-1", "subnet-2", "subnet-3", "subnet-4"]
```

### AWS use case

Useful when multiple environments or VPCs produce nested subnet collections.

---

## `compact()`

Removes empty strings from a list.

```hcl
compact(["dev", "", "prod", "", "stage"])
```

**Result:**

```hcl
["dev", "prod", "stage"]
```

---

## `distinct()`

Removes duplicate values.

```hcl
distinct(["dev", "prod", "dev", "stage"])
```

**Result:**

```hcl
["dev", "prod", "stage"]
```

---

## `reverse()`

Reverses a list.

```hcl
reverse(["a", "b", "c"])
```

**Result:**

```hcl
["c", "b", "a"]
```

---

## `sort()`

Sorts a list of strings.

```hcl
sort(["prod", "dev", "stage"])
```

**Result:**

```hcl
["dev", "prod", "stage"]
```

---

## `slice()`

Extracts a range from a list.

```hcl
slice(["a", "b", "c", "d"], 1, 3)
```

**Result:**

```hcl
["b", "c"]
```

---

## `element()`

Returns an element at an index.

```hcl
element(["a", "b", "c"], 1)
```

**Result:** `b`

> Prefer direct indexing such as `list[0]` when you do not need `element()`'s wraparound behavior.

---

## `contains()`

Checks whether a collection contains a value.

```hcl
contains(["dev", "stage", "prod"], "prod")
```

**Result:** `true`

### Variable validation example

```hcl
variable "environment" {
  type = string

  validation {
    condition     = contains(["dev", "stage", "prod"], var.environment)
    error_message = "Environment must be dev, stage, or prod."
  }
}
```

---

## Set Functions

### `toset()`

```hcl
toset(["dev", "prod", "dev"])
```

Converts the collection to a set and removes duplicates.

### `setunion()`

```hcl
setunion(
  ["dev", "stage"],
  ["stage", "prod"]
)
```

### `setintersection()`

```hcl
setintersection(
  ["dev", "stage"],
  ["stage", "prod"]
)
```

### `setsubtract()`

```hcl
setsubtract(
  ["dev", "stage", "prod"],
  ["stage"]
)
```

### `setproduct()`

Generates combinations from multiple sets.

```hcl
setproduct(
  ["dev", "prod"],
  ["web", "app"]
)
```

---

# 4. Map and Object Functions

## `lookup()`

Returns a value from a map.

### Syntax

```hcl
lookup(map, key, default)
```

### Example

```hcl
variable "instance_types" {
  default = {
    dev  = "t2.micro"
    prod = "t3.large"
  }
}

locals {
  instance_type = lookup(
    var.instance_types,
    var.environment,
    "t2.micro"
  )
}
```

If `var.environment = "prod"`:

```text
t3.large
```

---

## `keys()`

Returns the keys of a map.

```hcl
keys({
  dev  = "t2.micro"
  prod = "t3.large"
})
```

---

## `values()`

Returns the values of a map.

```hcl
values({
  dev  = "t2.micro"
  prod = "t3.large"
})
```

---

## `merge()`

Combines multiple maps/objects.

```hcl
merge(
  {
    Project = "MyApp"
  },
  {
    Environment = "dev"
  }
)
```

### AWS tags example

```hcl
locals {
  common_tags = merge(
    var.common_tags,
    {
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  )
}
```

---

## `zipmap()`

Creates a map from two lists.

```hcl
zipmap(
  ["name", "environment"],
  ["web-server", "prod"]
)
```

**Result:**

```hcl
{
  name        = "web-server"
  environment = "prod"
}
```

---

# 5. Numeric Functions

| Function | Purpose | Example |
|---|---|---|
| `abs()` | Absolute value | `abs(-10)` → `10` |
| `ceil()` | Round up | `ceil(4.2)` → `5` |
| `floor()` | Round down | `floor(4.9)` → `4` |
| `max()` | Largest number | `max(10, 20, 5)` → `20` |
| `min()` | Smallest number | `min(10, 20, 5)` → `5` |
| `pow()` | Exponent | `pow(2, 3)` → `8` |
| `log()` | Logarithm | `log(100, 10)` → `2` |
| `signum()` | Sign of number | `signum(-10)` → `-1` |

### Example

```hcl
locals {
  max_instances = max(
    var.minimum_instances,
    var.desired_instances
  )
}
```

---

# 6. Type Conversion Functions

Terraform's type conversion functions are useful when module inputs come from different sources.

| Function | Converts to | Example |
|---|---|---|
| `tostring()` | String | `tostring(100)` |
| `tonumber()` | Number | `tonumber("100")` |
| `tobool()` | Boolean | `tobool("true")` |
| `tolist()` | List | `tolist(var.values)` |
| `toset()` | Set | `toset(var.values)` |
| `tomap()` | Map | `tomap(var.values)` |
| `toobject()` | Object | `toobject(var.values)` |

### Examples

```hcl
tostring(100)
```

```hcl
tonumber("100")
```

```hcl
tobool("true")
```

```hcl
toset(["dev", "prod", "dev"])
```

---

# 7. Validation and Error-Handling Functions

## `can()`

Checks whether an expression can be evaluated without an error.

```hcl
can(var.environment)
```

### Regex validation example

```hcl
condition = can(regex("^(dev|stage|prod)$", var.environment))
```

---

## `try()`

Returns the first expression that does not produce an error.

```hcl
try(var.config.instance_type, "t2.micro")
```

### Example

```hcl
locals {
  instance_type = try(
    var.config.instance_type,
    "t2.micro"
  )
}
```

This is especially useful with optional or nested attributes.

---

## `coalesce()`

Returns the first non-null value.

```hcl
coalesce(
  var.name,
  "default-name"
)
```

---

## `coalescelist()`

Returns the first non-empty list.

```hcl
coalescelist(
  var.custom_subnets,
  var.default_subnets
)
```

---

# 8. Encoding and Decoding Functions

## JSON

### `jsonencode()`

Converts Terraform values to JSON.

This is especially useful for IAM policies.

```hcl
resource "aws_iam_policy" "example" {
  name = "example-policy"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:GetObject"]
        Resource = "*"
      }
    ]
  })
}
```

### `jsondecode()`

Converts JSON into Terraform values.

```hcl
locals {
  config = jsondecode(file("config.json"))
}
```

---

## YAML

### `yamlencode()`

```hcl
yamlencode({
  environment = "dev"
  application = "web"
})
```

### `yamldecode()`

```hcl
locals {
  config = yamldecode(file("config.yaml"))
}
```

---

## Base64

### `base64encode()`

```hcl
base64encode("Hello Terraform")
```

### `base64decode()`

```hcl
base64decode("SGVsbG8=")
```

### AWS example

```hcl
user_data = base64encode(<<-EOF
#!/bin/bash
echo "Hello from Terraform"
EOF
)
```

> Check the AWS provider/resource documentation for whether the particular argument expects plain text or base64-encoded content. Do not encode a value twice.

---

# 9. File and Template Functions

## `file()`

Reads a file as a string.

```hcl
file("config.txt")
```

### EC2 example

```hcl
user_data = file("${path.module}/scripts/install.sh")
```

---

## `filebase64()`

Reads a file and returns base64-encoded content.

```hcl
filebase64("image.png")
```

---

## `fileexists()`

Checks whether a file exists.

```hcl
fileexists("config.yaml")
```

---

## `templatefile()`

Renders a template using supplied variables.

### Terraform

```hcl
user_data = templatefile(
  "${path.module}/templates/install.sh.tpl",
  {
    environment = var.environment
    region      = var.aws_region
  }
)
```

### `install.sh.tpl`

```bash
#!/bin/bash

echo "Environment: ${environment}"
echo "Region: ${region}"
```

This is one of the most useful functions for EC2 user data and configuration generation.

---

# 10. Date and Time Functions

## `timestamp()`

Returns the current UTC timestamp.

```hcl
timestamp()
```

Example:

```hcl
tags = {
  CreatedAt = timestamp()
}
```

> **Caution:** Using `timestamp()` directly in resource arguments can cause changes on later Terraform operations. Use it intentionally.

---

## `plantimestamp()`

Returns the timestamp when the Terraform plan started.

```hcl
plantimestamp()
```

---

## `timeadd()`

Adds a duration to a timestamp.

```hcl
timeadd(
  "2026-08-22T10:00:00Z",
  "24h"
)
```

**Result:**

```text
2026-08-23T10:00:00Z
```

---

## `formatdate()`

Formats a timestamp.

```hcl
formatdate(
  "YYYY-MM-DD",
  "2026-08-22T10:00:00Z"
)
```

**Result:** `2026-08-22`

---

# 11. Hash and Cryptographic Functions

| Function | Purpose |
|---|---|
| `md5()` | MD5 hash |
| `sha1()` | SHA-1 hash |
| `sha256()` | SHA-256 hash |
| `filemd5()` | MD5 hash of a file |
| `filesha256()` | SHA-256 hash of a file |
| `filebase64sha256()` | Base64-encoded SHA-256 file hash |
| `uuid()` | Generates UUID |
| `uuidv5()` | Generates UUID v5 |
| `bcrypt()` | Generates bcrypt hash |

### Lambda deployment example

A very common AWS pattern is using a source-code hash to make Terraform detect Lambda ZIP changes:

```hcl
resource "aws_lambda_function" "app" {
  function_name    = "my-app"
  filename         = "lambda.zip"
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.12"

  source_code_hash = filebase64sha256("lambda.zip")
}
```

---

# 12. Filesystem Path Functions

## `basename()`

Returns the final component of a path.

```hcl
basename("/home/user/config.yaml")
```

**Result:** `config.yaml`

---

## `dirname()`

Returns the directory portion.

```hcl
dirname("/home/user/config.yaml")
```

**Result:** `/home/user`

---

## `abspath()`

Converts a path to an absolute path.

```hcl
abspath("./terraform")
```

---

## `pathexpand()`

Expands `~` in a path.

```hcl
pathexpand("~/.ssh/id_rsa")
```

---

# 13. IP and CIDR Functions

These are especially important for AWS VPC, subnet, route table, Transit Gateway, and multi-region Terraform projects.

## `cidrsubnet()`

Creates a subnet CIDR from a larger CIDR block.

### Syntax

```hcl
cidrsubnet(prefix, newbits, netnum)
```

### Example

```hcl
cidrsubnet("10.0.0.0/16", 8, 1)
```

**Result:**

```text
10.0.1.0/24
```

Another example:

```hcl
cidrsubnet("10.0.0.0/16", 8, 2)
```

**Result:**

```text
10.0.2.0/24
```

---

## `cidrsubnets()`

Creates multiple subnet CIDRs.

```hcl
cidrsubnets(
  "10.0.0.0/16",
  8, 8, 8
)
```

This produces three `/24` networks.

---

## `cidrhost()`

Returns a host IP inside a CIDR range.

```hcl
cidrhost("10.0.1.0/24", 10)
```

**Result:**

```text
10.0.1.10
```

---

## `cidrnetmask()`

Returns the network mask.

```hcl
cidrnetmask("10.0.1.0/24")
```

**Result:**

```text
255.255.255.0
```

---

## `cidrcontains()`

Checks whether a CIDR contains an IP address or CIDR.

```hcl
cidrcontains(
  "10.0.0.0/16",
  "10.0.1.10"
)
```

**Result:** `true`

---

# 14. AWS-Focused Examples

## 14.1 Dynamic VPC Subnets

```hcl
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

locals {
  public_subnets = [
    cidrsubnet(var.vpc_cidr, 8, 1),
    cidrsubnet(var.vpc_cidr, 8, 2)
  ]

  private_subnets = [
    cidrsubnet(var.vpc_cidr, 8, 11),
    cidrsubnet(var.vpc_cidr, 8, 12)
  ]
}
```

---

## 14.2 Generate Subnets with `for`

```hcl
locals {
  subnet_cidrs = [
    for i in range(3) :
    cidrsubnet(var.vpc_cidr, 8, i + 1)
  ]
}
```

For:

```hcl
var.vpc_cidr = "10.0.0.0/16"
```

the resulting CIDRs are:

```text
10.0.1.0/24
10.0.2.0/24
10.0.3.0/24
```

---

## 14.3 Environment-Based EC2 Instance Type

```hcl
locals {
  instance_type = var.environment == "prod"
    ? "t3.large"
    : "t2.micro"
}
```

---

## 14.4 Environment Map with `lookup()`

```hcl
variable "instance_types" {
  type = map(string)

  default = {
    dev     = "t2.micro"
    staging = "t3.small"
    prod    = "t3.large"
  }
}

locals {
  instance_type = lookup(
    var.instance_types,
    var.environment,
    "t2.micro"
  )
}
```

---

## 14.5 Common AWS Tags with `merge()`

```hcl
variable "common_tags" {
  type = map(string)

  default = {
    Project = "MyApp"
  }
}

locals {
  tags = merge(
    var.common_tags,
    {
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  )
}
```

Use them on resources:

```hcl
resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = local.instance_type

  tags = local.tags
}
```

---

## 14.6 Dynamic Resource Name

```hcl
locals {
  resource_name = format(
    "%s-%s-%s",
    var.project,
    var.environment,
    var.component
  )
}
```

For:

```text
project     = "myapp"
environment = "prod"
component   = "web"
```

Result:

```text
myapp-prod-web
```

---

## 14.7 IAM Policy with `jsonencode()`

```hcl
resource "aws_iam_policy" "lambda_s3" {
  name = "lambda-s3-policy"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "s3:GetObject"
        ]

        Resource = "arn:aws:s3:::my-bucket/*"
      }
    ]
  })
}
```

---

## 14.8 Lambda Deployment with File Hash

```hcl
resource "aws_lambda_function" "app" {
  function_name = "my-app"

  filename = "${path.module}/lambda.zip"

  handler = "lambda_function.lambda_handler"
  runtime = "python3.12"

  source_code_hash = filebase64sha256(
    "${path.module}/lambda.zip"
  )
}
```

---

## 14.9 Optional Configuration with `try()`

```hcl
locals {
  log_retention = try(
    var.config.log_retention_days,
    7
  )
}
```

If the nested attribute does not exist, Terraform uses `7`.

---

## 14.10 Default Value with `coalesce()`

```hcl
locals {
  bucket_name = coalesce(
    var.bucket_name,
    "${var.project}-${var.environment}-bucket"
  )
}
```

---

# 15. Functions to Prioritize for AWS/DevOps

If you're preparing for Terraform/AWS interviews, don't try to memorize every function at once.

### Tier 1 — Must Know

| Function | Why it matters |
|---|---|
| `lookup()` | Environment-specific configuration |
| `merge()` | AWS tags and configuration |
| `length()` | Dynamic resources |
| `concat()` | Combining collections |
| `flatten()` | Nested infrastructure data |
| `distinct()` | Removing duplicates |
| `contains()` | Validation |
| `try()` | Optional attributes |
| `can()` | Validation/error handling |
| `coalesce()` | Defaults |
| `jsonencode()` | IAM policies |
| `templatefile()` | EC2/user-data/configuration |
| `toset()` | `for_each` collections |
| `cidrsubnet()` | VPC subnet calculation |
| `cidrsubnets()` | Multiple subnet calculation |
| `filebase64sha256()` | Lambda deployment changes |

### Tier 2 — Very Useful

- `split()`
- `join()`
- `format()`
- `formatlist()`
- `keys()`
- `values()`
- `zipmap()`
- `sort()`
- `slice()`
- `compact()`
- `setunion()`
- `setintersection()`
- `setsubtract()`
- `range()`
- `regex()`
- `regexall()`
- `yamlencode()`
- `yamldecode()`
- `base64encode()`
- `base64decode()`
- `file()`

### Tier 3 — Know When Needed

- `upper()`
- `lower()`
- `title()`
- `trim()`
- `trimspace()`
- `substr()`
- `strrev()`
- `abs()`
- `ceil()`
- `floor()`
- `max()`
- `min()`
- `pow()`
- `log()`
- `timestamp()`
- `timeadd()`
- `formatdate()`
- `basename()`
- `dirname()`
- `abspath()`
- `pathexpand()`
- hashing functions

---

# 16. Function + Expression Patterns

Terraform functions become much more powerful when combined with expressions.

## `for` + `range()` + `cidrsubnet()`

A realistic VPC pattern:

```hcl
locals {
  subnet_cidrs = [
    for i in range(3) :
    cidrsubnet(var.vpc_cidr, 8, i + 1)
  ]
}
```

---

## `for_each` + `toset()`

```hcl
variable "availability_zones" {
  type = list(string)
}

resource "aws_subnet" "public" {
  for_each = toset(var.availability_zones)

  vpc_id            = aws_vpc.main.id
  availability_zone = each.value
}
```

---

## `for` + `format()`

```hcl
locals {
  subnet_names = [
    for i in range(3) :
    format("public-subnet-%02d", i + 1)
  ]
}
```

---

## `merge()` + `for`

```hcl
locals {
  subnet_tags = {
    for subnet in var.subnets :
    subnet.name => merge(
      var.common_tags,
      {
        Name = subnet.name
        Tier = subnet.tier
      }
    )
  }
}
```

---

# 17. Useful Commands

Use `terraform console` to experiment with functions interactively.

```bash
terraform console
```

Then test:

```hcl
> upper("terraform")
"TERRAFORM"
```

```hcl
> cidrsubnet("10.0.0.0/16", 8, 1)
"10.0.1.0/24"
```

```hcl
> merge({Project = "App"}, {Environment = "dev"})
{
  "Environment" = "dev"
  "Project" = "App"
}
```

This is one of the fastest ways to learn Terraform functions.

---

# 18. Official Documentation

- [Terraform Built-in Functions](https://developer.hashicorp.com/terraform/language/functions)
- [Terraform Language Documentation](https://developer.hashicorp.com/terraform/language)
- [Terraform Expressions](https://developer.hashicorp.com/terraform/language/expressions)
- [Terraform `for` Expressions](https://developer.hashicorp.com/terraform/language/expressions/for)
- [Terraform `for_each`](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each)
- [Terraform `count`](https://developer.hashicorp.com/terraform/language/meta-arguments/count)

---

## Quick Learning Path

```text
String Functions
      ↓
Collection Functions
      ↓
Map / Object Functions
      ↓
Type Conversion
      ↓
try() / can() / coalesce()
      ↓
for Expressions
      ↓
for_each / count
      ↓
cidrsubnet() / cidrsubnets()
      ↓
jsonencode() / templatefile()
      ↓
Real AWS Terraform Projects
```

### Recommended Practice Projects

1. **VPC Module**
   - `cidrsubnet()`
   - `cidrsubnets()`
   - `for`
   - `for_each`
   - `merge()`

2. **Multi-Environment EC2**
   - `lookup()`
   - `coalesce()`
   - `try()`
   - `format()`

3. **Lambda + API Gateway**
   - `filebase64sha256()`
   - `templatefile()`
   - `jsonencode()`

4. **Multi-Region Infrastructure**
   - `for_each`
   - `toset()`
   - `flatten()`
   - `concat()`
   - `merge()`

5. **AWS IAM Automation**
   - `jsonencode()`
   - `for`
   - `merge()`
   - `lookup()`

---

> **Tip:** The goal is not to memorize every Terraform function. Learn how to combine functions with `for` expressions, `for_each`, variables, locals, modules, and conditional expressions. That is where Terraform becomes powerful for real-world AWS automation.

---

**Maintained as a practical Terraform/AWS reference.**
