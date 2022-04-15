#Creating S3 Bucket
resource "aws_s3_bucket" "caterraformtest"{
    bucket = var.bucketname
    acl = "public-read"
    policy = file("static-website/policy.json")

    website {
        index_document = "index.html"
        error_document = "error.html"
    }

        tags = {
            terraform = "true"
            website-hosting = "true"
            }
  }

resource "aws_s3_bucket_object" "test" {
  for_each = fileset("static-website/html/", "**")
  bucket = var.bucketname
  key = each.value
  source = "static-website/html/${each.value}"
  etag = filemd5("static-website/html/${each.value}")
  depends_on = [
    aws_s3_bucket.caterraformtest
  ]
}

# resource "aws_s3_bucket_object" "index_object" {
#   bucket = var.bucketname
#   key = "index.html"
#   source = "static-website/html/index.html"
#   content_type = "text/html"
#   depends_on = [
#     aws_s3_bucket.caterraformtest
#   ]
# }

# resource "aws_s3_bucket_object" "error_object" {
#   bucket = var.bucketname
#   key = "error.html"
#   source = "static-website/html/error.html"
#   content_type = "text/html"
#   depends_on = [
#     aws_s3_bucket.caterraformtest
#   ]
# }

# resource "aws_s3_bucket_object" "sun_image_object" {
#   bucket = var.bucketname
#   key = "sun.jpg"
#   source = "static-website/html/sun.jpg"
#   depends_on = [
#     aws_s3_bucket.caterraformtest
#   ]
# }

# resource "aws_s3_bucket_object" "error_image_object" {
#   bucket = var.bucketname
#   key = "404.png"
#   source = "static-website/html/404.png"
#   depends_on = [
#     aws_s3_bucket.caterraformtest
#   ]
# }

# output "website-endpoint" {
#     value = aws_s3_bucket.caterraformtest.website_endpoint
# }

# resource "aws_instance" "Ankush_EC2" {
#   ami           = "ami-0c2b8ca1dad447f8a"
#   instance_type = "t2.micro"
# }

# output "Public_Ip" {
#   value = aws_instance.Ankush_EC2.public_ip
# }