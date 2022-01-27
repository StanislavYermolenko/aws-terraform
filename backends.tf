terraform {
  backend "remote" {
    organization = "terraform-educational_purpose"

    workspaces {
      name = "terraform-education"
    }
  }
}