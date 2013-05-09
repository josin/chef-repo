name "app_server"
description "An application server"
run_list %w{
  recipe[apt]
  recipe[apache2]
  recipe[passenger_apache2]
  recipe[passenger_apache2::mod_rails]
}
