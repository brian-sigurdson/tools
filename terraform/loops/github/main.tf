data "http" "github_meta_data" {
  url = "https://api.github.com/meta"
}

locals {
  github_meta         = jsondecode(data.http.github_meta_data.body)
  github_ip_set_names = ["hooks"]
  github_meta_ips = flatten([
    for service in local.github_ip_set_names : [
      local.github_meta[service]
    ]
  ])
}

