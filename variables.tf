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

variable "update_sources_package_key" {
    description = "The key for the update sources package in the deployment bucket"
    type        = string
    default     = "update-sources-package.jar"
}

variable "validate_words_package_key" {
    description = "The key for the validate words package in the deployment bucket"
    type        = string
    default     = "validate-words-package.jar"
}

variable "update_words_package_key" {
    description = "The key for the update words package in the deployment bucket"
    type        = string
    default     = "update-words-package.jar"
}