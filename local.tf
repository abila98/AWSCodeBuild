resource "null_resource" "trigger_codebuild" {
  # This resource is just a placeholder to trigger the local-exec provisioner
  provisioner "local-exec" {
    command = <<EOT
      aws codebuild start-build --project-name ${aws_codebuild_project.codebuild_project.name} --region ${var.region}
    EOT
  }

  # Only trigger when certain conditions are met, e.g., after creation
  triggers = {
    codebuild_project_id = aws_codebuild_project.codebuild_project.id
  }
}

