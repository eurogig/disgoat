terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.50.0"
    }
    twilio = {
      source = "twilio/twilio"
      version = "0.5.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.68.0"
    }
  }
}

provider "aws" {
  alias      = "plain_text_access_keys_provider"
  region     = "us-west-1"
  access_key = "AKIAIOSFODNN7EXAMPLE"
  secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
}

provider "azurerm" {
    account_key = "lJzRc1YdHaAA2KCNJJ1tkYwF/+mKK6Ygw0NGe170Xu592euJv2wYUtBlV8z+qnlcNQSnIYVTkLWntUO1F8j8rQ=="
}

variable "stripe_token" {
  default = "sk_live_ReTllpYQYfIZu2Jnf2lAPFjD"
}

provider "twilio" {
    auth_token = "SKxxxxxxxxxxxxxxxxxxxxxxxxxexample"
}

variable "basic_auth" {
    default = "https://username:password@yelp.com"
}

variable "slack_webhook" {
    default = "https://hooks.slack.com/services/Txxxxxxxx/Bxxxxxxxx/xxxxxxxxxxxxxxxxxxxxxxxx"
}

variable "ssh_key" {
    default = <<EOT
-----BEGIN OPENSSH PRIVATE KEY-----
PRIVATE PAIR OF COPIED TO REMOTE HOST WHILE DOCKER INSTALLATION
-----END OPENSSH PRIVATE KEY-----
EOT
}