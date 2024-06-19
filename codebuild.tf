resource "aws_codebuild_project" "codebuild_project" {
  name        = "${var.project_name}-project"
  description = "My AWS ${var.project_name} CodeBuild project"

  # Environment configuration

  environment {
    compute_type                = var.env_compute_type
    image                       = var.env_image
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  # Source configuration
  source {
    type      = "CODECOMMIT"
    location  = var.source_location
    buildspec = "buildspec.yml"

    git_submodules_config {
      fetch_submodules = false
    }


  }

  source_version = var.source_version

  # Service role for CodeBuild
  service_role = aws_iam_role.codebuild_role.arn

  # Artifacts configuration
  artifacts {
    type      = "S3"
    location  = aws_s3_bucket.codebuild_artifacts.bucket
    packaging = "NONE"
  }

}

