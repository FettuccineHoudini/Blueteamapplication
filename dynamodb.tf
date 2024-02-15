resource "aws_dynamodb_table" "dynamodb-table" {
  name           = "Scores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 2
  write_capacity = 2
  hash_key       = "UserId"
  range_key      = "GameTitle"
  attribute {
    name = "PlayerId"
    type = "S"
  }
 
  attribute {
    name = "Score"
    type = "N"
  }
  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }
  global_secondary_index {
    name               = "GameTitleIndex"
    hash_key           = "GameTitle"
    range_key          = "Score"
    write_capacity     = 2
    read_capacity      = 2
    projection_type    = "INCLUDE"
    non_key_attributes = ["UserId"]
  }
  tags = {
    "Name" = "${var.default_tags.username}-DynamoDB"
  }
}