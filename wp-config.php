<?php

/* MySQL settings */
define( 'DB_NAME',     'wordpress' );
define( 'DB_USER',     'root' );
define( 'DB_PASSWORD', '' );
define( 'DB_HOST',     'localhost' );
define( 'DB_CHARSET',  'utf8' );


/* MySQL database table prefix. */
$table_prefix = 'wp_';


/* Authentication Unique Keys and Salts. */
/* https://api.wordpress.org/secret-key/1.1/salt/ */
define( 'AUTH_KEY',         '__AUTH_KEY__' );
define( 'SECURE_AUTH_KEY',  '__SECURE_AUTH_KEY__' );
define( 'LOGGED_IN_KEY',    '__LOGGED_IN_KEY__' );
define( 'NONCE_KEY',        '__NONCE_KEY__' );
define( 'AUTH_SALT',        '__AUTH_SALT__' );
define( 'SECURE_AUTH_SALT', '__SECURE_AUTH_SALT__' );
define( 'LOGGED_IN_SALT',   '__LOGGED_IN_SALT__' );
define( 'NONCE_SALT',       '__NONCE_SALT__' );


/* WordPress Localized Language. */
define( 'WPLANG', '' );


/* Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/* Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
