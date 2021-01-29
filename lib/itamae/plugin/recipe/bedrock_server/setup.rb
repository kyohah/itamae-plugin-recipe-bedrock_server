hash = {
  'bedrock_server' => {
    'app_dir' => '/opt',
    'environment' => { 'LD_LIBRARY_PATH' => '.' },
    'service_actions' => %i[enable start],
    'configuration' => {
      'server-name' => 'Dedicated Server',
      'gamemode' => 'survival',
      'difficulty' => 'easy',
      'allow-cheats' => false,
      'max-players' => 10,
      'online-mode' => true,
      'white-list' => false,
      'server-port' => 19_132,
      'server-portv6' => 19_133,
      'view-distance' => 32,
      'tick-distance' => 4,
      'player-idle-timeout' => 30,
      'max-threads' => 8,
      'level-name' => 'Bedrock level',
      'level-seed' => '',
      'level-type' => 'DEFAULT',
      'default-player-permission-level' => 'member',
      'texturepack-required' => false,
      'content-log-file-enabled' => false,
      'compression-threshold' => 1,
      'server-authoritative-movement' => 'server-auth',
      'player-movement-score-threshold' => 20,
      'player-movement-distance-threshold' => 0.3,
      'player-movement-duration-threshold-in-ms' => 500,
      'correct-player-movement' => false
    }
  }
}

node.reverse_merge!(hash)

node.validate! do
  {
    bedrock_server: {
      configuration: {
        'server-name' => string,
        'gamemode' => match(/^(survival|creative|adventure)$/),
        'difficulty' => match(/^(peaceful|easy|normal|hard)$/),
        'allow-cheats' => boolean,
        'max-players' => integer,
        'online-mode' => boolean,
        'white-list' => boolean,
        'server-port' => integer,
        'server-portv6' => integer,
        'view-distance' => integer,
        'tick-distance' => integer,
        'player-idle-timeout' => integer,
        'max-threads' => integer,
        'level-name' => string,
        'level-seed' => optional(string),
        'level-type' => match(/^(FLAT|LEGACY|DEFAULT)$/),
        'default-player-permission-level' => match(/^(visitor|member|operator)$/),
        'texturepack-required' => boolean,
        'content-log-file-enabled' => boolean,
        'compression-threshold' => integer,
        'server-authoritative-movement' => match(/^(client-auth|server-auth)$/),
        'player-movement-score-threshold' => integer,
        'player-movement-distance-threshold' => float,
        'player-movement-duration-threshold-in-ms' => integer,
        'correct-player-movement' => boolean
      }
    }
  }
end
