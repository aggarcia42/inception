<?php
/** The base configuration for WordPress
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 */

/** The name of the database for WordPress */
define('DB_NAME', 'wordpress-files');

/** MySQL database username */
define('DB_USER', 'test');

/** MySQL database password */
define('DB_PASSWORD', 'prueba');

/** MySQL hostname */
define('DB_HOST', 'mariadb');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

//** Redis cache settings. */
define('WP_CACHE', true);
define('WP_CACHE_KEY_SALT', 'aggarcia.42.fr');

// define( 'WP_REDIS_PASSWORD', '$REDIS_PWD' );
define('WP_REDIS_TIMEOUT', 1);
define('WP_REDIS_READ_TIMEOUT', 1);
define('WP_REDIS_DATABASE', 0);


/** Authentication Unique Keys and Salts.
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 */

define('AUTH_KEY',         'EDhtbI=w;P2:e3Q35X=[Q;.Vu[]KwUyDbd.y+jgm@Y4UL ,~`Dx#<w[jvW[hn,^?');
define('SECURE_AUTH_KEY',  'O^JxG+]- 2_,Y:DRu`;S8F]2<{QD=CAqNP(L>*:5t;K|9+[8M<Xci?(~*_ {IJfU');
define('LOGGED_IN_KEY',    '&JVNLj%@7t nC8#Te8t?QQH>dpomkfoVeq@Z=sdnHMj*5a6%F^I_i(<fHqIXO/D}');
define('NONCE_KEY',        'yi56pp%5/A+u[e:woSh+^.J@:$S/c9{wEL:]#9J9l`kP:nL!1sB.P=(&jBbei84B');
define('AUTH_SALT',        'B|hej9R+#5K#]qKE6X-sOfWp;!v!U*[(*@T#t?[cxW^z-#>{boxy-nS0G,7<)3+T');
define('SECURE_AUTH_SALT', '<E|hBCd>lz9$ R}`y)Z~SL-%E{SIM,!An:|D_R:|*LFuSj/<a&Md++$~6#;.1zU-');
define('LOGGED_IN_SALT',   '<y-t&q33@*nQH2%!-%[-5OV@|_K;|WzD&[1#K3W Ii@-eeF-ThsxGa{]D+-uzi9Q');
define('NONCE_SALT',       '|||MHa9s{iH #v?[]h9q{?J+5Hm$pf ~]N*i.E4WVRg|gxR+_fe-Dh!RD39$vm_Z');

/** WordPress Database Table prefix. */
$table_prefix = 'wp_';

/** For developers: WordPress debugging mode. */
define( 'WP_DEBUG', false );

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>