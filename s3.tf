resource "aws_s3_bucket" "codebuild_artifacts" {
  bucket        = "${var.project_name}-codebuild-artifacts-bucket"
  force_destroy = true
  versioning {
    enabled = true
  }

}

