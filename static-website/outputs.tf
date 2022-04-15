# output "Public_Ip" {
#   value = aws_instance.Ankush_EC2.public_ip
# }

output "website-endpoint" {
    value = aws_s3_bucket.caterraformtest.website_endpoint
}
