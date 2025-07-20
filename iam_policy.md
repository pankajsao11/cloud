## IAM Policy Syntax (AWS Console or normal json)

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
```

## IAM Policy syntax (Terraform)

```
assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
```

## Element Details

>> Version

Defines policy language version; always set to "2012-10-17".

>> Statement

Contains one or more permission statements. Can be a single object or an array (for multiple statements).

>> Sid

Optional identifier for the individual statement; useful for managing and referencing statements.

>> Effect

"Allow": Grants permission. "Deny": Explicitly refuses permission.

>> Action

Specifies AWS operations (API calls) that are allowed or denied. Can be a single string ("ec2:StartInstances") or an array.

>> Resource

Defines which AWS resources the action applies to, by ARN. Can be a string or array; "*" means any resource.

>> Principal

Specifies the account, user, service, or entity to which the policy is applied. Only needed in resource-based and not identity-based policies.

>> Condition

Allows policies to take effect only if certain conditions are met. Uses operators (e.g., StringEquals, NumericLessThan), keys (context values, like aws:username), and values.

Example:
```
json
"Condition": {
  "StringEquals": {
    "aws:PrincipalTag/Department": "Finance"
  }
}
Global condition keys are prefixed with aws:, service-specific keys use a service prefix.
```
