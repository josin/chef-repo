name "ci_server"
description "A Continuous Integration Server"
run_list %w{
  recipe[apt]
  recipe[jenkins]
}
