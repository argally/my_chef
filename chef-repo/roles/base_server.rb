name "base_server"
description "Common Server Base Configuration"

run_list(
  "recipe[git]",
  "recipe[python]",
  "recipe[bind-utils]",
  "recipe[yum-epel]"
)
