resource "aws_s3_bucket" "codebuild_artifacts" {
  bucket = "abila-codebuild-artifacts-bucket"

  versioning {
    enabled = true
  }

}

