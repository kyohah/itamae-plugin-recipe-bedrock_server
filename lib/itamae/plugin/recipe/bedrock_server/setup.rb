# https" =>//minecraft.gamepedia.com/Server.properties

node.validate! do
  {
    bedrock_server: {
      configuration: {
        "server-name" => string,
        "gamemode" =>  match(/^(survival|creative|adventure)$/),
        "difficulty" => match(/^(peaceful|easy|normal|hard)$/),
        "allow-cheats" => boolean,
        "max-players" => integer,
        "online-mode" => boolean,
        "white-list" => boolean,
        "server-port" => integer,
        "server-portv6" => integer,
        "view-distance" => integer,
        "tick-distance" => integer,        
        "player-idle-timeout" => integer,
        "max-threads" => integer,
        "level-name" => string,
        "level-seed" => optional(string),
        "level-type" => match(/^(FLAT|LEGACY|DEFAULT)$/),
        "default-player-permission-level" => match(/^(visitor|member|operator)$/),
        "texturepack-required" => boolean,
        "content-log-file-enabled" => boolean,
        "compression-threshold" => integer,
        "server-authoritative-movement" => match(/^(client-auth|server-auth)$/),
        "player-movement-score-threshold" => integer,
        "player-movement-distance-threshold" => float,
        "player-movement-duration-threshold-in-ms" => integer,
        "correct-player-movement" => boolean
      }
    }
  }
end

hash = YAML.load_file("#{__dir__}/../../../../../recipes/node.yml")

node.reverse_merge!(hash)
