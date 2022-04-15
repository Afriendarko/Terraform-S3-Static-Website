module "static-website" {
  source     = "./static-website"
  
}

output "endpoint" {
  value = module.static-website.website-endpoint
}

# output "ip" {
#   value = module.static-website.Public_Ip
# }