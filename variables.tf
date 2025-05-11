variable "environment" {
  description = "The environment to deploy to (e.g., staging, production)"
  type        = string
  default     = "staging"
}

variable "project" {
  description = "A prefix to use for naming resources"
  type        = string
  default     = "wordlist"
}

variable "deployment_bucket_name" {
  description = "The name of the S3 bucket for deployment artifacts"
  type        = string
  default     = "deployment-bucket"
}

// Variables are deliberately uppercase as github environments only support uppercase environment variable names.
variable "UPDATE_FROM_SOURCE_PACKAGE_KEY" {
  description = "The key for the update-from-source package in the deployment bucket"
  type        = string
  default     = "updatesource.jar"
}

variable "QUERY_WORDS_PACKAGE_KEY" {
  description = "The key for the query-word package in the deployment bucket"
  type        = string
  default     = "querywords.jar"
}

variable "CHECK_BATCHES_FOR_UPDATE_PACKAGE_KEY" {
  description = "The key for the check-batches-for-update package in the deployment bucket"
  type        = string
  default     = "checkbatchesforupdate.jar"
}

variable "UPDATE_BATCH_STATUS_PACKAGE_KEY" {
  description = "The key for the update-batch-status package in the deployment bucket"
  type        = string
  default     = "updatebatchstatus.jar"
}

variable "UPDATE_WORD_PACKAGE_KEY" {
  description = "The key for the update-word package in the deployment bucket"
  type        = string
  default     = "updateword.jar"
}

variable "use_dummy_handlers" {
  description = "Flag to use dummy handlers for Lambda functions (e.g. for initial deployment)"
  type        = bool
  default     = false
}