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

## S3 Bucket Policies

S3 bucket policies are similar to IAM policies but are specifically used to control access to S3 buckets and the objects within them. These policies are attached directly to the bucket and define who can access the bucket and what actions they can perform.

>> Key Components of S3 Bucket Policies:

Version: Specifies the version of the policy language. The current version is "2012-10-17".
Statement: A list of individual statements (permissions) within the policy.
Effect: Determines whether the statement allows or denies access. Possible values are "Allow" or "Deny".
Principal: Specifies the user, account, service, or other entity that is allowed or denied access to a resource. This can be an AWS account ID, IAM user, or a wildcard (*).
Action: Specifies the actions that are allowed or denied. Actions are typically in the form of service:action (e.g., s3:GetObject).
Resource: Specifies the ARN of the resource to which the action applies. This can be a specific resource or a wildcard (*).
Condition: (Optional) Specifies conditions under which the policy is in effect. Conditions use operators like StringEquals, IpAddress, etc., to add additional constraints.
