# S3 resources: bucket + public access block + lifecycle + SSE + policy
# Place in /c:/Users/Gabriel/terraform-aws/s3.tf

resource "random_id" "suffix" {
    byte_length = 4
}

#resource "aws_s3_bucket_policy" "deny_unencrypted_uploads" {
#    bucket = aws_s3_bucket.this.id
#
#    policy = jsonencode({
#        Version = "2012-10-17"
#        Statement = [
#            {
#                Sid = "DenyUnEncryptedObjectUploads"
#                Effect = "Deny"
#                Principal = "*"
#                Action = "s3:PutObject"
#                Resource = "${aws_s3_bucket.this.arn}/*"
#                Condition = {
#                    StringNotEquals = {
#                        "s3:x-amz-server-side-encryption" = "AES256"
#                    }
#                }
#            }
#        ]
#    })
#}