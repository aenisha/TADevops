terraform {
    backend "s3" {
        bucket = "terraform-state-anisha"
        key = "terrform/backend"
        region = "us-east-1"
    }
}
