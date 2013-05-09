name "redis"
description "Redis server"
run_list %w{
  recipe[apt]
  recipe[redis2]
}
