name "mongodb"
description "MongoDB server"
run_list %w{
  recipe[apt]
  recipe[mongodb::10gen_repo]
  recipe[mongodb]
}
default_attributes(
  "mongodb" => {
    "apt_repo" => "ubuntu-upstart"
  }
)
