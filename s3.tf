# S3 resources: bucket + public access block + lifecycle + SSE + policy
# Place in /c:/Users/Gabriel/terraform-aws/s3.tf

resource "random_id" "suffix" {
    byte_length = 4
}

resource "aws_s3_bucket" "labpessoal01-bucket-001" {
    bucket = "labpessoal01-bucket-gabrielmelo-${random_id.suffix.hex}"

    tags = {
        Name        = "labpessoal01-bucket-001"
        project     = "lab01"
        ManagedBy   = "terraform"
    }
}

resource "aws_s3_object" "voidjpg" {
    bucket = aws_s3_bucket.labpessoal01-bucket-001.id
    key    = "voidjpg"
    source = "s3files/TheVoid.jpg"
    
    tags = {
        Name      = "voidjpg"
        ManagedBy = "terraform"
    }
}

resource "aws_s3_bucket_public_access_block" "labpessoal01-bucket-001-pab" {
    bucket = aws_s3_bucket.labpessoal01-bucket-001.id

    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
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