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

variable "update_from_source_package_key" {
  description = "The key for the update-from-source package in the deployment bucket"
  type        = string
  default     = "updatesource.jar"
}

variable "query_words_package_key" {
  description = "The key for the query-word package in the deployment bucket"
  type        = string
  default     = "querywords.jar"
}

variable "update_batches_package_key" {
  description = "The key for the update-batches package in the deployment bucket"
  type        = string
  default     = "updatebatches.jar"
}

variable "update_batch_status_package_key" {
  description = "The key for the update-batch-status package in the deployment bucket"
  type        = string
  default     = "updatebatchstatus.jar"
}

variable "update_word_package_key" {
  description = "The key for the update-word package in the deployment bucket"
  type        = string
  default     = "updateword.jar"
}

variable "use_dummy_handlers" {
  description = "Flag to use dummy handlers for Lambda functions (e.g. for initial deployment)"
  type        = bool
  default     = false
}