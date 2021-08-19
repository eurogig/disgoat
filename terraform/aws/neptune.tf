resource "aws_neptune_cluster" "default" {
  cluster_identifier                  = var.neptune-dbname
  engine                              = "neptune"
  backup_retention_period             = 5
  preferred_backup_window             = "07:00-09:00"
  skip_final_snapshot                 = true
  iam_database_authentication_enabled = false
  apply_immediately                   = true
  storage_encrypted                   = false
  tags = {
    git_commit           = "5b403ea072f7e71c052a7431d21c59b705d2ca2d"
    git_file             = "terraform/aws/neptune.tf"
    git_last_modified_at = "2021-08-19 12:44:42"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "eurogig"
    git_repo             = "disgoat"
    level                = "development"
    team                 = "seceng"
    yor_trace            = "14f61cb2-ffd9-40f9-8c59-84986a66a740"
  }
}

resource "aws_neptune_cluster_instance" "default" {
  count              = 1
  cluster_identifier = aws_neptune_cluster.default.id
  engine             = "neptune"
  instance_class     = "db.t3.medium" # Smallest instance type listed for neptune https://aws.amazon.com/neptune/pricing/
  apply_immediately  = true
  #publicly_accessible                = true # No longer supported, API returns create error. See https://docs.aws.amazon.com/neptune/latest/userguide/api-instances.html#CreateDBInstance
  tags = {
    git_commit           = "5b403ea072f7e71c052a7431d21c59b705d2ca2d"
    git_file             = "terraform/aws/neptune.tf"
    git_last_modified_at = "2021-08-19 12:44:42"
    git_last_modified_by = "eurogig@gmail.com"
    git_modifiers        = "eurogig"
    git_org              = "eurogig"
    git_repo             = "disgoat"
    level                = "development"
    team                 = "seceng"
    yor_trace            = "215c740b-7ea1-44a3-8283-33c3dec3e057"
  }
}

resource "aws_neptune_cluster_snapshot" "default" {
  db_cluster_identifier          = aws_neptune_cluster.default.id
  db_cluster_snapshot_identifier = "resourcetestsnapshot1"
}

