locals {
  test = {
    a = distinct(flatten([
      for k, v in var.outer.inner1 : v
      if length(var.outer.inner1) > 0
    ]))
    b = distinct(flatten([
      for k, v in var.outer.inner1 : v
      if length(var.outer.inner1) > 0
    ]))
  }

  test2 = [for k, v in var.outer.inner1 : v]
  test3 = [for k, v in var.outer.inner2 : v]
}
#=========================================================================
resource "local_file" "foo" {
  for_each = toset(local.test3)
  content  = each.value
  filename = "${path.module}/${each.key}.bar"
}

#=========================================================================
variable "outer" {
}

# variable "mylist" {
#   type = list(any)
# }
# variable "mymap" {
#   type = map(any)
#   default = {
#     module_name = "my_module"
#   }
# }
