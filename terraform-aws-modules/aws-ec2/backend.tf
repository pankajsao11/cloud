terraform {
  backend "s3" {
    bucket               = "bucket-name"
    key                  = "foldername/terraform.tfstate" #bucket>folder>tfstate file
    region               = "us-east-1"                    #put your required region here
    dynamodynamodb_table = "table-name"                   #put your table name here   
  }
}