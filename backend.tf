terraform {
    backend "s3" {
        bucket         = "wordlist-infrastructure-state"
        key            = "terraform/state/terraform.tfstate"
        region         = "eu-west-2"
    }
}
