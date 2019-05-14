data "local_file" "lifecycle-policy-json" {
  filename = "${path.module}/data/lifecycle-policy.json"
}

resource "aws_ecr_repository" "this-registery" {
  name = "${var.project}/${var.product}"
}

resource "aws_ecr_lifecycle_policy" "registery-lifecycle-policy" {
  repository = "${aws_ecr_repository.this-registery.name}"
  policy     = "${data.local_file.lifecycle-policy-json.content}"
}
