# Wordlist Infrastructure
IaC for the infrastructure used by Wordlist, hosted in AWS.

This creates the DynamoDB tables, Lambdas, roles, policies & policy assignments, SQS queues, triggers, and the containing application.

## Variables

| Name                             | Description                                                                             | Type   | Default                        |
| -------------------------------- | --------------------------------------------------------------------------------------- | ------ | ------------------------------ |
| `environment`                    | The environment to deploy to (e.g., staging, production)                                | string | `"staging"`                    |
| `project`                        | A prefix to use for naming resources                                                    | string | `"wordlist"`                   |
| `deployment_bucket_name`         | The name of the S3 bucket for deployment artifacts                                      | string | `"deployment-bucket"`          |
| `update_from_source_package_key` | The key for the 'update from source' package in the deployment bucket                   | string | `"updatefromsource.jar"`       |
| `validate_words_package_key`     | The key for the validate words package in the deployment bucket                         | string | `"validate-words-package.jar"` |
| `update_words_package_key`       | The key for the update words package in the deployment bucket                           | string | `"update-words-package.jar"`   |
| `use_dummy_handlers`             | True to use dummy handlers, false to use the handlers deployed to the deployment bucket | bool   | `false`                        |
