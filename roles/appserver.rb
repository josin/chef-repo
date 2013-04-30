name "appserver"
description "An application server"
run_list %w{
  recipe[apt]
  recipe[apache2]
}
default_attributes(
  "apache" => {
    "listen_ports" => ["80", "443"]
  }
)
