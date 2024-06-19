
variable "project_name" {
  description = "Name of the project"
  default     = "my_project"
}

variable "region" {
  description = "Name of the region"
  default     = "us-west-1"
}

variable "env_compute_type" {
  description = "Name of the env compute type"
  default     = "BUILD_GENERAL1_SMALL"
}

variable "env_image" {
  description = "Name of the env image"
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
}

variable "source_location" {
  description = "Repository location/url"
  default     = "https://git-codecommit.us-west-1.amazonaws.com/v1/repos/BucketList"
}

variable "source_version" {
  description = "Source branch"
  default     = "refs/heads/master"
}



