resource "aws_codebuild_project" "my_project" {
  name        = "my-codebuild-project"
  description = "My AWS CodeBuild project"

  # Environment configuration

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  # Source configuration
  source {
    type      = "CODECOMMIT"
    location  = "https://git-codecommit.us-west-1.amazonaws.com/v1/repos/BucketList"
    buildspec = "buildspec.yml"
  }

  source_version = "refs/heads/master"

  # Service role for CodeBuild
  service_role = aws_iam_role.codebuild_role.arn

  # Artifacts configuration
  artifacts {
    type      = "S3"
    location  = aws_s3_bucket.codebuild_artifacts.bucket
    packaging = "NONE"
  }


}

