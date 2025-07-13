resource "aws_s3_bucket" "medusa_files" {
  bucket = "${var.project_name}-files"
  force_destroy = true
}
