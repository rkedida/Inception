<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wordpressuser' );

/** Database password */
define( 'DB_PASSWORD', 'pass' );

/** Database hostname */
define( 'DB_HOST', '172.17.0.1' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'Re$mxCC`n/|V0sHf$YsCNiQ^e[,NB-eY5&[WGy)~HPx{5zEY<5#(`L2$0U_IAD@=' );
define( 'SECURE_AUTH_KEY',  '[Yx2QMka#>h48.[j8})DZ+K$K7=a|gp1=]YD|1nQtr{5.T!O}5LXN=2INGYnJRk`' );
define( 'LOGGED_IN_KEY',    'pbB`MPsTJtSbMUdNJnfH)0;5[w8I)e@03P&t;tIE?H;2oR6.L=ZMD/4gUaDL.S-_' );
define( 'NONCE_KEY',        'B)Ef]4y kvQXQ8.f~b-l :#W94bKc#-KNF2gsijuORDc68x$lFyCW+Gm e}#IWHV' );
define( 'AUTH_SALT',        '_&w,L0{qY0v#<~uFzDU0yu T6lGGo:WY^f^XXlKsUytE}zwot,=p%^&V.&jqaR:F' );
define( 'SECURE_AUTH_SALT', '`c=tiI0%hn;`%Kxm;(x=s!nE+(OU;pDjCqB!ovC>Lq8.tQSVCm.N6qpFq<+WLx`d' );
define( 'LOGGED_IN_SALT',   'vB3Ox2{^dx)rk-p~WTi3K|.5!_`eCfGKoGtBCVi/lUNIlCAL``G-*}Q~+_`TF$Nw' );
define( 'NONCE_SALT',       'U;thc{2RWH_T);0V7V,fE|Ipbwwv$yYDEn={5(/fYr{:/f3e{0HnVqX^a5[5Yi=K' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
