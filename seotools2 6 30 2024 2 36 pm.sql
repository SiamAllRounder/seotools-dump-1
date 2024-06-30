-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 30, 2024 at 08:36 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seotools2`
--

-- --------------------------------------------------------

--
-- Table structure for table `affiliates_commissions`
--

CREATE TABLE `affiliates_commissions` (
  `affiliate_commission_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `referred_user_id` bigint UNSIGNED DEFAULT NULL,
  `payment_id` bigint UNSIGNED DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `currency` varchar(4) DEFAULT NULL,
  `is_withdrawn` tinyint UNSIGNED DEFAULT '0',
  `datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `affiliates_withdrawals`
--

CREATE TABLE `affiliates_withdrawals` (
  `affiliate_withdrawal_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `currency` varchar(4) DEFAULT NULL,
  `note` varchar(1024) DEFAULT NULL,
  `affiliate_commissions_ids` text,
  `is_paid` tinyint UNSIGNED DEFAULT NULL,
  `datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `blog_post_id` bigint UNSIGNED NOT NULL,
  `blog_posts_category_id` bigint UNSIGNED DEFAULT NULL,
  `url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `language` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_views` bigint UNSIGNED DEFAULT '0',
  `is_published` tinyint DEFAULT '1',
  `datetime` datetime DEFAULT NULL,
  `last_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts_categories`
--

CREATE TABLE `blog_posts_categories` (
  `blog_posts_category_id` bigint UNSIGNED NOT NULL,
  `url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `language` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `last_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `broadcasts`
--

CREATE TABLE `broadcasts` (
  `broadcast_id` bigint UNSIGNED NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `segment` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `users_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `sent_users_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sent_emails` int UNSIGNED DEFAULT '0',
  `total_emails` int UNSIGNED DEFAULT '0',
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` bigint UNSIGNED DEFAULT '0',
  `clicks` bigint UNSIGNED DEFAULT '0',
  `last_sent_email_datetime` datetime DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `last_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `broadcasts_statistics`
--

CREATE TABLE `broadcasts_statistics` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `broadcast_id` bigint UNSIGNED DEFAULT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `codes`
--

CREATE TABLE `codes` (
  `code_id` int UNSIGNED NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `days` int UNSIGNED DEFAULT NULL,
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `discount` int UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL DEFAULT '1',
  `redeemed` int UNSIGNED NOT NULL DEFAULT '0',
  `plans_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `internal_notifications`
--

CREATE TABLE `internal_notifications` (
  `internal_notification_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `for_who` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_who` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint UNSIGNED DEFAULT '0',
  `datetime` datetime DEFAULT NULL,
  `read_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` bigint UNSIGNED NOT NULL,
  `pages_category_id` bigint UNSIGNED DEFAULT NULL,
  `url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `editor` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `position` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open_in_new_tab` tinyint DEFAULT '1',
  `order` int DEFAULT '0',
  `total_views` bigint UNSIGNED DEFAULT '0',
  `is_published` tinyint DEFAULT '1',
  `datetime` datetime DEFAULT NULL,
  `last_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `pages_category_id`, `url`, `title`, `description`, `icon`, `keywords`, `editor`, `content`, `type`, `position`, `language`, `open_in_new_tab`, `order`, `total_views`, `is_published`, `datetime`, `last_datetime`) VALUES
(1, NULL, 'https://altumcode.com/', 'Software by AltumCode', '', NULL, NULL, NULL, '', 'external', 'bottom', NULL, 1, 1, 0, 1, '2024-06-12 05:37:55', '2024-06-12 05:37:55'),
(2, NULL, 'https://altumco.de/66toolkit', 'Built with 66toolkit', '', NULL, NULL, NULL, '', 'external', 'bottom', NULL, 1, 0, 0, 1, '2024-06-12 05:37:55', '2024-06-12 05:37:55');

-- --------------------------------------------------------

--
-- Table structure for table `pages_categories`
--

CREATE TABLE `pages_categories` (
  `pages_category_id` bigint UNSIGNED NOT NULL,
  `url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `language` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `last_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `plan_id` int UNSIGNED DEFAULT NULL,
  `processor` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frequency` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `billing` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `business` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `taxes_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `base_amount` float DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  `total_amount_default_currency` float DEFAULT NULL,
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` float DEFAULT NULL,
  `currency` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_proof` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `plan_id` int UNSIGNED NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `translations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `trial_days` int UNSIGNED NOT NULL DEFAULT '0',
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxes_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `color` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL,
  `order` int UNSIGNED DEFAULT '0',
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `project_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `color` varchar(16) DEFAULT '#000',
  `last_datetime` datetime DEFAULT NULL,
  `datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `redeemed_codes`
--

CREATE TABLE `redeemed_codes` (
  `id` bigint UNSIGNED NOT NULL,
  `code_id` int UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'main', '{\"title\":\"Online Web Tools\",\"default_language\":\"english\",\"default_theme_style\":\"light\",\"default_timezone\":\"UTC\",\"index_url\":\"\",\"terms_and_conditions_url\":\"\",\"privacy_policy_url\":\"\",\"not_found_url\":\"\",\"ai_scraping_is_allowed\":true,\"se_indexing\":true,\"display_index_plans\":true,\"display_index_testimonials\":true,\"display_index_faq\":true,\"display_index_latest_blog_posts\":false,\"default_results_per_page\":100,\"default_order_type\":\"DESC\",\"auto_language_detection_is_enabled\":true,\"blog_is_enabled\":false,\"api_is_enabled\":true,\"theme_style_change_is_enabled\":true,\"logo_light\":\"\",\"logo_dark\":\"\",\"logo_email\":\"\",\"opengraph\":\"\",\"favicon\":\"\",\"openai_api_key\":\"\",\"openai_model\":\"gpt-3.5-turbo\",\"force_https_is_enabled\":0,\"broadcasts_statistics_is_enabled\":false,\"breadcrumbs_is_enabled\":true,\"display_pagination_when_no_pages\":true}'),
(2, 'languages', '{\"english\":{\"status\":\"active\"}}'),
(3, 'users', '{\"email_confirmation\":true,\"welcome_email_is_enabled\":true,\"register_is_enabled\":true,\"register_only_social_logins\":false,\"register_social_login_require_password\":false,\"register_display_newsletter_checkbox\":false,\"login_rememberme_checkbox_is_checked\":false,\"auto_delete_unconfirmed_users\":30,\"auto_delete_inactive_users\":90,\"user_deletion_reminder\":0,\"blacklisted_domains\":\"\",\"blacklisted_countries\":[],\"login_lockout_is_enabled\":true,\"login_lockout_max_retries\":3,\"login_lockout_time\":60,\"lost_password_lockout_is_enabled\":true,\"lost_password_lockout_max_retries\":3,\"lost_password_lockout_time\":60,\"resend_activation_lockout_is_enabled\":true,\"resend_activation_lockout_max_retries\":3,\"resend_activation_lockout_time\":60,\"register_lockout_is_enabled\":true,\"register_lockout_max_registrations\":3,\"register_lockout_time\":10}'),
(4, 'ads', '{\"ad_blocker_detector_is_enabled\":true,\"ad_blocker_detector_lock_is_enabled\":false,\"ad_blocker_detector_delay\":5,\"header\":\"\",\"footer\":\"\",\"header_biolink\":\"\",\"footer_biolink\":\"\",\"header_splash\":\"\",\"footer_splash\":\"\"}'),
(5, 'captcha', '{\"type\":\"basic\",\"recaptcha_public_key\":\"\",\"recaptcha_private_key\":\"\",\"login_is_enabled\":0,\"register_is_enabled\":0,\"lost_password_is_enabled\":0,\"resend_activation_is_enabled\":0}'),
(6, 'cron', '{\"key\": \"3f245d53a5a33ad67232ccb996248ccd\", \"broadcasts_datetime\": \"2024-06-12 00:13:30\"}'),
(7, 'email_notifications', '{\"emails\":\"\",\"new_user\":false,\"delete_user\":false,\"new_payment\":false,\"new_domain\":false,\"new_affiliate_withdrawal\":false,\"contact\":false}'),
(8, 'internal_notifications', '{\"users_is_enabled\":true,\"admins_is_enabled\":true,\"new_user\":true,\"delete_user\":true,\"new_newsletter_subscriber\":true,\"new_payment\":true,\"new_affiliate_withdrawal\":true}'),
(9, 'content', '{\"blog_is_enabled\":true,\"blog_share_is_enabled\":true,\"blog_categories_widget_is_enabled\":true,\"blog_popular_widget_is_enabled\":true,\"blog_views_is_enabled\":true,\"pages_is_enabled\":true,\"pages_share_is_enabled\":true,\"pages_popular_widget_is_enabled\":true,\"pages_views_is_enabled\":true}'),
(10, 'sso', '{\"is_enabled\":true,\"display_menu_items\":true,\"websites\":{}}'),
(11, 'facebook', '{\"is_enabled\":false,\"app_id\":\"\",\"app_secret\":\"\"}'),
(12, 'google', '{\"is_enabled\":false,\"client_id\":\"\",\"client_secret\":\"\"}'),
(13, 'twitter', '{\"is_enabled\":false,\"consumer_api_key\":\"\",\"consumer_api_secret\":\"\"}'),
(14, 'discord', '{\"is_enabled\":false,\"client_id\":\"\",\"client_secret\":\"\"}'),
(15, 'linkedin', '{\"is_enabled\":false,\"client_id\":\"\",\"client_secret\":\"\"}'),
(16, 'microsoft', '{\"is_enabled\":false,\"client_id\":\"\",\"client_secret\":\"\"}');
INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(17, 'plan_custom', '{\"plan_id\":\"custom\",\"name\":\"Custom\",\"description\":\"Contact us for enterprise pricing.\",\"translations\":{\"english\":{\"name\":\"\",\"description\":\"\",\"price\":\"\"}},\"price\":\"Custom\",\"custom_button_url\":\"mailto:sample@example.com\",\"color\":null,\"status\":1,\"settings\":{\"signatures_limit\":0,\"projects_limit\":1,\"teams_limit\":0,\"team_members_limit\":0,\"api_is_enabled\":false,\"affiliate_commission_percentage\":0,\"no_ads\":false,\"enabled_tools\":{\"dns_lookup\":true,\"ip_lookup\":true,\"reverse_ip_lookup\":true,\"ssl_lookup\":true,\"whois_lookup\":true,\"ping\":true,\"http_headers_lookup\":true,\"http2_checker\":true,\"brotli_checker\":true,\"safe_url_checker\":true,\"google_cache_checker\":true,\"url_redirect_checker\":true,\"password_strength_checker\":true,\"meta_tags_checker\":true,\"website_hosting_checker\":true,\"file_mime_type_checker\":true,\"gravatar_checker\":true,\"text_separator\":true,\"email_extractor\":true,\"url_extractor\":true,\"text_size_calculator\":true,\"duplicate_lines_remover\":true,\"text_to_speech\":true,\"idn_punnycode_converter\":true,\"case_converter\":true,\"character_counter\":true,\"list_randomizer\":true,\"reverse_words\":true,\"reverse_letters\":true,\"emojis_remover\":true,\"reverse_list\":true,\"list_alphabetizer\":true,\"upside_down_text_generator\":true,\"old_english_text_generator\":true,\"cursive_text_generator\":true,\"palindrome_checker\":true,\"base64_encoder\":true,\"base64_decoder\":true,\"base64_to_image\":true,\"image_to_base64\":true,\"url_encoder\":true,\"url_decoder\":true,\"color_converter\":true,\"binary_converter\":true,\"hex_converter\":true,\"ascii_converter\":true,\"decimal_converter\":true,\"octal_converter\":true,\"morse_converter\":true,\"number_to_words_converter\":true,\"paypal_link_generator\":true,\"signature_generator\":true,\"mailto_link_generator\":true,\"utm_link_generator\":true,\"whatsapp_link_generator\":true,\"youtube_timestamp_link_generator\":true,\"slug_generator\":true,\"lorem_ipsum_generator\":true,\"password_generator\":true,\"random_number_generator\":true,\"uuid_v4_generator\":true,\"bcrypt_generator\":true,\"md2_generator\":true,\"md4_generator\":true,\"md5_generator\":true,\"whirlpool_generator\":true,\"sha1_generator\":true,\"sha224_generator\":true,\"sha256_generator\":true,\"sha384_generator\":true,\"sha512_generator\":true,\"sha512_224_generator\":true,\"sha512_256_generator\":true,\"sha3_224_generator\":true,\"sha3_256_generator\":true,\"sha3_384_generator\":true,\"sha3_512_generator\":true,\"ripemd128_generator\":true,\"ripemd160_generator\":true,\"ripemd256_generator\":true,\"ripemd320_generator\":true,\"html_minifier\":true,\"css_minifier\":true,\"js_minifier\":true,\"json_validator_beautifier\":true,\"sql_beautifier\":true,\"html_entity_converter\":true,\"bbcode_to_html\":true,\"markdown_to_html\":true,\"html_tags_remover\":true,\"user_agent_parser\":true,\"url_parser\":true,\"image_optimizer\":true,\"png_to_jpg\":true,\"png_to_bmp\":true,\"png_to_ico\":true,\"png_to_gif\":true,\"png_to_webp\":true,\"png_to_avif\":true,\"png_to_tiff\":true,\"png_to_tga\":true,\"jpg_to_png\":true,\"jpg_to_bmp\":true,\"jpg_to_ico\":true,\"jpg_to_gif\":true,\"jpg_to_webp\":true,\"jpg_to_avif\":true,\"jpg_to_tiff\":true,\"jpg_to_tga\":true,\"bmp_to_png\":true,\"bmp_to_jpg\":true,\"bmp_to_ico\":true,\"bmp_to_gif\":true,\"bmp_to_webp\":true,\"bmp_to_avif\":true,\"bmp_to_tiff\":true,\"bmp_to_tga\":true,\"ico_to_png\":true,\"ico_to_jpg\":true,\"ico_to_bmp\":true,\"ico_to_gif\":true,\"ico_to_webp\":true,\"ico_to_avif\":true,\"ico_to_tiff\":true,\"ico_to_tga\":true,\"gif_to_png\":true,\"gif_to_jpg\":true,\"gif_to_bmp\":true,\"gif_to_ico\":true,\"gif_to_webp\":true,\"gif_to_avif\":true,\"gif_to_tiff\":true,\"gif_to_tga\":true,\"webp_to_png\":true,\"webp_to_jpg\":true,\"webp_to_bmp\":true,\"webp_to_ico\":true,\"webp_to_gif\":true,\"webp_to_avif\":true,\"webp_to_tiff\":true,\"webp_to_tga\":true,\"heic_to_png\":true,\"heic_to_jpg\":true,\"heic_to_bmp\":true,\"heic_to_ico\":true,\"heic_to_gif\":true,\"heic_to_webp\":true,\"heic_to_avif\":true,\"heic_to_tiff\":true,\"heic_to_tga\":true,\"avif_to_png\":true,\"avif_to_jpg\":true,\"avif_to_bmp\":true,\"avif_to_ico\":true,\"avif_to_gif\":true,\"avif_to_webp\":true,\"avif_to_tiff\":true,\"avif_to_tga\":true,\"tiff_to_png\":true,\"tiff_to_jpg\":true,\"tiff_to_bmp\":true,\"tiff_to_ico\":true,\"tiff_to_gif\":true,\"tiff_to_webp\":true,\"tiff_to_avif\":true,\"tiff_to_tga\":true,\"youtube_thumbnail_downloader\":false,\"qr_code_reader\":false,\"barcode_reader\":false,\"exif_reader\":false,\"color_picker\":false,\"hex_to_hexa\":false,\"hex_to_rgb\":false,\"hex_to_rgba\":false,\"hex_to_hsv\":false,\"hex_to_hsl\":false,\"hex_to_hsla\":false,\"hexa_to_hex\":false,\"hexa_to_rgb\":false,\"hexa_to_rgba\":false,\"hexa_to_hsv\":false,\"hexa_to_hsl\":false,\"hexa_to_hsla\":false,\"rgb_to_hex\":false,\"rgb_to_hexa\":false,\"rgb_to_rgba\":false,\"rgb_to_hsv\":false,\"rgb_to_hsl\":false,\"rgb_to_hsla\":false,\"rgba_to_hex\":false,\"rgba_to_hexa\":false,\"rgba_to_rgb\":false,\"rgba_to_hsv\":false,\"rgba_to_hsl\":false,\"rgba_to_hsla\":false,\"hsv_to_hex\":false,\"hsv_to_hexa\":false,\"hsv_to_rgb\":false,\"hsv_to_rgba\":false,\"hsv_to_hsl\":false,\"hsv_to_hsla\":false,\"hsl_to_hex\":false,\"hsl_to_hexa\":false,\"hsl_to_rgb\":false,\"hsl_to_rgba\":false,\"hsl_to_hsv\":false,\"hsl_to_hsla\":false,\"hsla_to_hex\":false,\"hsla_to_hexa\":false,\"hsla_to_rgb\":false,\"hsla_to_rgba\":false,\"hsla_to_hsv\":false,\"hsla_to_hsl\":false,\"celsius_to_fahrenheit\":true,\"celsius_to_kelvin\":true,\"fahrenheit_to_celsius\":true,\"fahrenheit_to_kelvin\":true,\"kelvin_to_celsius\":true,\"kelvin_to_fahrenheit\":true,\"miles_per_hour_to_kilometers_per_hour\":true,\"kilometers_per_hour_to_miles_per_hour\":true,\"number_to_roman_numerals\":true,\"roman_numerals_to_number\":true,\"unix_timestamp_to_date\":true,\"date_to_unix_timestamp\":true,\"seconds_to_milliseconds\":true,\"seconds_to_microseconds\":true,\"seconds_to_nanoseconds\":true,\"seconds_to_picoseconds\":true,\"seconds_to_minutes\":true,\"seconds_to_hours\":true,\"seconds_to_days\":true,\"seconds_to_weeks\":true,\"seconds_to_months\":true,\"seconds_to_years\":true,\"milliseconds_to_seconds\":true,\"milliseconds_to_microseconds\":true,\"milliseconds_to_nanoseconds\":true,\"milliseconds_to_picoseconds\":true,\"milliseconds_to_minutes\":true,\"milliseconds_to_hours\":true,\"milliseconds_to_days\":true,\"milliseconds_to_weeks\":true,\"milliseconds_to_months\":true,\"milliseconds_to_years\":true,\"microseconds_to_seconds\":true,\"microseconds_to_milliseconds\":true,\"microseconds_to_nanoseconds\":true,\"microseconds_to_picoseconds\":true,\"microseconds_to_minutes\":true,\"microseconds_to_hours\":true,\"microseconds_to_days\":true,\"microseconds_to_weeks\":true,\"microseconds_to_months\":true,\"microseconds_to_years\":true,\"nanoseconds_to_seconds\":true,\"nanoseconds_to_milliseconds\":true,\"nanoseconds_to_microseconds\":true,\"nanoseconds_to_picoseconds\":true,\"nanoseconds_to_minutes\":true,\"nanoseconds_to_hours\":true,\"nanoseconds_to_days\":true,\"nanoseconds_to_weeks\":true,\"nanoseconds_to_months\":true,\"nanoseconds_to_years\":true,\"picoseconds_to_seconds\":true,\"picoseconds_to_milliseconds\":true,\"picoseconds_to_microseconds\":true,\"picoseconds_to_nanoseconds\":true,\"picoseconds_to_minutes\":true,\"picoseconds_to_hours\":true,\"picoseconds_to_days\":true,\"picoseconds_to_weeks\":true,\"picoseconds_to_months\":true,\"picoseconds_to_years\":true,\"minutes_to_seconds\":true,\"minutes_to_milliseconds\":true,\"minutes_to_microseconds\":true,\"minutes_to_nanoseconds\":true,\"minutes_to_picoseconds\":true,\"minutes_to_hours\":true,\"minutes_to_days\":true,\"minutes_to_weeks\":true,\"minutes_to_months\":true,\"minutes_to_years\":true,\"hours_to_seconds\":true,\"hours_to_milliseconds\":true,\"hours_to_microseconds\":true,\"hours_to_nanoseconds\":true,\"hours_to_picoseconds\":true,\"hours_to_minutes\":true,\"hours_to_days\":true,\"hours_to_weeks\":true,\"hours_to_months\":true,\"hours_to_years\":true,\"days_to_seconds\":true,\"days_to_milliseconds\":true,\"days_to_microseconds\":true,\"days_to_nanoseconds\":true,\"days_to_picoseconds\":true,\"days_to_minutes\":true,\"days_to_hours\":true,\"days_to_weeks\":true,\"days_to_months\":true,\"days_to_years\":true,\"weeks_to_seconds\":true,\"weeks_to_milliseconds\":true,\"weeks_to_microseconds\":true,\"weeks_to_nanoseconds\":true,\"weeks_to_picoseconds\":true,\"weeks_to_minutes\":true,\"weeks_to_hours\":true,\"weeks_to_days\":true,\"weeks_to_months\":true,\"weeks_to_years\":true,\"months_to_seconds\":true,\"months_to_milliseconds\":true,\"months_to_microseconds\":true,\"months_to_nanoseconds\":true,\"months_to_picoseconds\":true,\"months_to_minutes\":true,\"months_to_hours\":true,\"months_to_days\":true,\"months_to_weeks\":true,\"months_to_years\":true,\"years_to_seconds\":true,\"years_to_milliseconds\":true,\"years_to_microseconds\":true,\"years_to_nanoseconds\":true,\"years_to_picoseconds\":true,\"years_to_minutes\":true,\"years_to_hours\":true,\"years_to_days\":true,\"years_to_weeks\":true,\"years_to_months\":true,\"bits_to_nibbles\":true,\"bits_to_bytes\":true,\"bits_to_kilobits\":true,\"bits_to_kibibits\":true,\"bits_to_kibibytes\":true,\"bits_to_kilobytes\":true,\"bits_to_megabits\":true,\"bits_to_mebibits\":true,\"bits_to_megabytes\":true,\"bits_to_mebibytes\":true,\"bits_to_gigabits\":true,\"bits_to_gibibits\":true,\"bits_to_gigabytes\":true,\"bits_to_gibibytes\":true,\"bits_to_terabits\":true,\"bits_to_tebibits\":true,\"bits_to_terabytes\":true,\"bits_to_tebibytes\":true,\"bits_to_petabits\":true,\"bits_to_pebibits\":true,\"bits_to_petabytes\":true,\"bits_to_pebibytes\":true,\"bits_to_exabits\":true,\"bits_to_exbibits\":true,\"bits_to_exabytes\":true,\"bits_to_exbibytes\":true,\"bits_to_zettabits\":true,\"bits_to_zebibits\":true,\"bits_to_zettabytes\":true,\"bits_to_zebibytes\":true,\"bits_to_yottabits\":true,\"bits_to_yobibits\":true,\"bits_to_yottabytes\":true,\"bits_to_yobibytes\":true,\"nibbles_to_bits\":true,\"nibbles_to_bytes\":true,\"nibbles_to_kilobits\":true,\"nibbles_to_kibibits\":true,\"nibbles_to_kibibytes\":true,\"nibbles_to_kilobytes\":true,\"nibbles_to_megabits\":true,\"nibbles_to_mebibits\":true,\"nibbles_to_megabytes\":true,\"nibbles_to_mebibytes\":true,\"nibbles_to_gigabits\":true,\"nibbles_to_gibibits\":true,\"nibbles_to_gigabytes\":true,\"nibbles_to_gibibytes\":true,\"nibbles_to_terabits\":true,\"nibbles_to_tebibits\":true,\"nibbles_to_terabytes\":true,\"nibbles_to_tebibytes\":true,\"nibbles_to_petabits\":true,\"nibbles_to_pebibits\":true,\"nibbles_to_petabytes\":true,\"nibbles_to_pebibytes\":true,\"nibbles_to_exabits\":true,\"nibbles_to_exbibits\":true,\"nibbles_to_exabytes\":true,\"nibbles_to_exbibytes\":true,\"nibbles_to_zettabits\":true,\"nibbles_to_zebibits\":true,\"nibbles_to_zettabytes\":true,\"nibbles_to_zebibytes\":true,\"nibbles_to_yottabits\":true,\"nibbles_to_yobibits\":true,\"nibbles_to_yottabytes\":true,\"nibbles_to_yobibytes\":true,\"bytes_to_bits\":true,\"bytes_to_nibbles\":true,\"bytes_to_kilobits\":true,\"bytes_to_kibibits\":true,\"bytes_to_kibibytes\":true,\"bytes_to_kilobytes\":true,\"bytes_to_megabits\":true,\"bytes_to_mebibits\":true,\"bytes_to_megabytes\":true,\"bytes_to_mebibytes\":true,\"bytes_to_gigabits\":true,\"bytes_to_gibibits\":true,\"bytes_to_gigabytes\":true,\"bytes_to_gibibytes\":true,\"bytes_to_terabits\":true,\"bytes_to_tebibits\":true,\"bytes_to_terabytes\":true,\"bytes_to_tebibytes\":true,\"bytes_to_petabits\":true,\"bytes_to_pebibits\":true,\"bytes_to_petabytes\":true,\"bytes_to_pebibytes\":true,\"bytes_to_exabits\":true,\"bytes_to_exbibits\":true,\"bytes_to_exabytes\":true,\"bytes_to_exbibytes\":true,\"bytes_to_zettabits\":true,\"bytes_to_zebibits\":true,\"bytes_to_zettabytes\":true,\"bytes_to_zebibytes\":true,\"bytes_to_yottabits\":true,\"bytes_to_yobibits\":true,\"bytes_to_yottabytes\":true,\"bytes_to_yobibytes\":true,\"kilobits_to_bits\":true,\"kilobits_to_nibbles\":true,\"kilobits_to_bytes\":true,\"kilobits_to_kibibits\":true,\"kilobits_to_kibibytes\":true,\"kilobits_to_kilobytes\":true,\"kilobits_to_megabits\":true,\"kilobits_to_mebibits\":true,\"kilobits_to_megabytes\":true,\"kilobits_to_mebibytes\":true,\"kilobits_to_gigabits\":true,\"kilobits_to_gibibits\":true,\"kilobits_to_gigabytes\":true,\"kilobits_to_gibibytes\":true,\"kilobits_to_terabits\":true,\"kilobits_to_tebibits\":true,\"kilobits_to_terabytes\":true,\"kilobits_to_tebibytes\":true,\"kilobits_to_petabits\":true,\"kilobits_to_pebibits\":true,\"kilobits_to_petabytes\":true,\"kilobits_to_pebibytes\":true,\"kilobits_to_exabits\":true,\"kilobits_to_exbibits\":true,\"kilobits_to_exabytes\":true,\"kilobits_to_exbibytes\":true,\"kilobits_to_zettabits\":true,\"kilobits_to_zebibits\":true,\"kilobits_to_zettabytes\":true,\"kilobits_to_zebibytes\":true,\"kilobits_to_yottabits\":true,\"kilobits_to_yobibits\":true,\"kilobits_to_yottabytes\":true,\"kilobits_to_yobibytes\":true,\"kibibits_to_bits\":true,\"kibibits_to_nibbles\":true,\"kibibits_to_bytes\":true,\"kibibits_to_kilobits\":true,\"kibibits_to_kibibytes\":true,\"kibibits_to_kilobytes\":true,\"kibibits_to_megabits\":true,\"kibibits_to_mebibits\":true,\"kibibits_to_megabytes\":true,\"kibibits_to_mebibytes\":true,\"kibibits_to_gigabits\":true,\"kibibits_to_gibibits\":true,\"kibibits_to_gigabytes\":true,\"kibibits_to_gibibytes\":true,\"kibibits_to_terabits\":true,\"kibibits_to_tebibits\":true,\"kibibits_to_terabytes\":true,\"kibibits_to_tebibytes\":true,\"kibibits_to_petabits\":true,\"kibibits_to_pebibits\":true,\"kibibits_to_petabytes\":true,\"kibibits_to_pebibytes\":true,\"kibibits_to_exabits\":true,\"kibibits_to_exbibits\":true,\"kibibits_to_exabytes\":true,\"kibibits_to_exbibytes\":true,\"kibibits_to_zettabits\":true,\"kibibits_to_zebibits\":true,\"kibibits_to_zettabytes\":true,\"kibibits_to_zebibytes\":true,\"kibibits_to_yottabits\":true,\"kibibits_to_yobibits\":true,\"kibibits_to_yottabytes\":true,\"kibibits_to_yobibytes\":true,\"kibibytes_to_bits\":true,\"kibibytes_to_nibbles\":true,\"kibibytes_to_bytes\":true,\"kibibytes_to_kilobits\":true,\"kibibytes_to_kibibits\":true,\"kibibytes_to_kilobytes\":true,\"kibibytes_to_megabits\":true,\"kibibytes_to_mebibits\":true,\"kibibytes_to_megabytes\":true,\"kibibytes_to_mebibytes\":true,\"kibibytes_to_gigabits\":true,\"kibibytes_to_gibibits\":true,\"kibibytes_to_gigabytes\":true,\"kibibytes_to_gibibytes\":true,\"kibibytes_to_terabits\":true,\"kibibytes_to_tebibits\":true,\"kibibytes_to_terabytes\":true,\"kibibytes_to_tebibytes\":true,\"kibibytes_to_petabits\":true,\"kibibytes_to_pebibits\":true,\"kibibytes_to_petabytes\":true,\"kibibytes_to_pebibytes\":true,\"kibibytes_to_exabits\":true,\"kibibytes_to_exbibits\":true,\"kibibytes_to_exabytes\":true,\"kibibytes_to_exbibytes\":true,\"kibibytes_to_zettabits\":true,\"kibibytes_to_zebibits\":true,\"kibibytes_to_zettabytes\":true,\"kibibytes_to_zebibytes\":true,\"kibibytes_to_yottabits\":true,\"kibibytes_to_yobibits\":true,\"kibibytes_to_yottabytes\":true,\"kibibytes_to_yobibytes\":true,\"kilobytes_to_bits\":true,\"kilobytes_to_nibbles\":true,\"kilobytes_to_bytes\":true,\"kilobytes_to_kilobits\":true,\"kilobytes_to_kibibits\":true,\"kilobytes_to_kibibytes\":true,\"kilobytes_to_megabits\":true,\"kilobytes_to_mebibits\":true,\"kilobytes_to_megabytes\":true,\"kilobytes_to_mebibytes\":true,\"kilobytes_to_gigabits\":true,\"kilobytes_to_gibibits\":true,\"kilobytes_to_gigabytes\":true,\"kilobytes_to_gibibytes\":true,\"kilobytes_to_terabits\":true,\"kilobytes_to_tebibits\":true,\"kilobytes_to_terabytes\":true,\"kilobytes_to_tebibytes\":true,\"kilobytes_to_petabits\":true,\"kilobytes_to_pebibits\":true,\"kilobytes_to_petabytes\":true,\"kilobytes_to_pebibytes\":true,\"kilobytes_to_exabits\":true,\"kilobytes_to_exbibits\":true,\"kilobytes_to_exabytes\":true,\"kilobytes_to_exbibytes\":true,\"kilobytes_to_zettabits\":true,\"kilobytes_to_zebibits\":true,\"kilobytes_to_zettabytes\":true,\"kilobytes_to_zebibytes\":true,\"kilobytes_to_yottabits\":true,\"kilobytes_to_yobibits\":true,\"kilobytes_to_yottabytes\":true,\"kilobytes_to_yobibytes\":true,\"megabits_to_bits\":true,\"megabits_to_nibbles\":true,\"megabits_to_bytes\":true,\"megabits_to_kilobits\":true,\"megabits_to_kibibits\":true,\"megabits_to_kibibytes\":true,\"megabits_to_kilobytes\":true,\"megabits_to_mebibits\":true,\"megabits_to_megabytes\":true,\"megabits_to_mebibytes\":true,\"megabits_to_gigabits\":true,\"megabits_to_gibibits\":true,\"megabits_to_gigabytes\":true,\"megabits_to_gibibytes\":true,\"megabits_to_terabits\":true,\"megabits_to_tebibits\":true,\"megabits_to_terabytes\":true,\"megabits_to_tebibytes\":true,\"megabits_to_petabits\":true,\"megabits_to_pebibits\":true,\"megabits_to_petabytes\":true,\"megabits_to_pebibytes\":true,\"megabits_to_exabits\":true,\"megabits_to_exbibits\":true,\"megabits_to_exabytes\":true,\"megabits_to_exbibytes\":true,\"megabits_to_zettabits\":true,\"megabits_to_zebibits\":true,\"megabits_to_zettabytes\":true,\"megabits_to_zebibytes\":true,\"megabits_to_yottabits\":true,\"megabits_to_yobibits\":true,\"megabits_to_yottabytes\":true,\"megabits_to_yobibytes\":true,\"mebibits_to_bits\":true,\"mebibits_to_nibbles\":true,\"mebibits_to_bytes\":true,\"mebibits_to_kilobits\":true,\"mebibits_to_kibibits\":true,\"mebibits_to_kibibytes\":true,\"mebibits_to_kilobytes\":true,\"mebibits_to_megabits\":true,\"mebibits_to_megabytes\":true,\"mebibits_to_mebibytes\":true,\"mebibits_to_gigabits\":true,\"mebibits_to_gibibits\":true,\"mebibits_to_gigabytes\":true,\"mebibits_to_gibibytes\":true,\"mebibits_to_terabits\":true,\"mebibits_to_tebibits\":true,\"mebibits_to_terabytes\":true,\"mebibits_to_tebibytes\":true,\"mebibits_to_petabits\":true,\"mebibits_to_pebibits\":true,\"mebibits_to_petabytes\":true,\"mebibits_to_pebibytes\":true,\"mebibits_to_exabits\":true,\"mebibits_to_exbibits\":true,\"mebibits_to_exabytes\":true,\"mebibits_to_exbibytes\":true,\"mebibits_to_zettabits\":true,\"mebibits_to_zebibits\":true,\"mebibits_to_zettabytes\":true,\"mebibits_to_zebibytes\":true,\"mebibits_to_yottabits\":true,\"mebibits_to_yobibits\":true,\"mebibits_to_yottabytes\":true,\"mebibits_to_yobibytes\":true,\"megabytes_to_bits\":true,\"megabytes_to_nibbles\":true,\"megabytes_to_bytes\":true,\"megabytes_to_kilobits\":true,\"megabytes_to_kibibits\":true,\"megabytes_to_kibibytes\":true,\"megabytes_to_kilobytes\":true,\"megabytes_to_megabits\":true,\"megabytes_to_mebibits\":true,\"megabytes_to_mebibytes\":true,\"megabytes_to_gigabits\":true,\"megabytes_to_gibibits\":true,\"megabytes_to_gigabytes\":true,\"megabytes_to_gibibytes\":true,\"megabytes_to_terabits\":true,\"megabytes_to_tebibits\":true,\"megabytes_to_terabytes\":true,\"megabytes_to_tebibytes\":true,\"megabytes_to_petabits\":true,\"megabytes_to_pebibits\":true,\"megabytes_to_petabytes\":true,\"megabytes_to_pebibytes\":true,\"megabytes_to_exabits\":true,\"megabytes_to_exbibits\":true,\"megabytes_to_exabytes\":true,\"megabytes_to_exbibytes\":true,\"megabytes_to_zettabits\":true,\"megabytes_to_zebibits\":true,\"megabytes_to_zettabytes\":true,\"megabytes_to_zebibytes\":true,\"megabytes_to_yottabits\":true,\"megabytes_to_yobibits\":true,\"megabytes_to_yottabytes\":true,\"megabytes_to_yobibytes\":true,\"mebibytes_to_bits\":true,\"mebibytes_to_nibbles\":true,\"mebibytes_to_bytes\":true,\"mebibytes_to_kilobits\":true,\"mebibytes_to_kibibits\":true,\"mebibytes_to_kibibytes\":true,\"mebibytes_to_kilobytes\":true,\"mebibytes_to_megabits\":true,\"mebibytes_to_mebibits\":true,\"mebibytes_to_megabytes\":true,\"mebibytes_to_gigabits\":true,\"mebibytes_to_gibibits\":true,\"mebibytes_to_gigabytes\":true,\"mebibytes_to_gibibytes\":true,\"mebibytes_to_terabits\":true,\"mebibytes_to_tebibits\":true,\"mebibytes_to_terabytes\":true,\"mebibytes_to_tebibytes\":true,\"mebibytes_to_petabits\":true,\"mebibytes_to_pebibits\":true,\"mebibytes_to_petabytes\":true,\"mebibytes_to_pebibytes\":true,\"mebibytes_to_exabits\":true,\"mebibytes_to_exbibits\":true,\"mebibytes_to_exabytes\":true,\"mebibytes_to_exbibytes\":true,\"mebibytes_to_zettabits\":true,\"mebibytes_to_zebibits\":true,\"mebibytes_to_zettabytes\":true,\"mebibytes_to_zebibytes\":true,\"mebibytes_to_yottabits\":true,\"mebibytes_to_yobibits\":true,\"mebibytes_to_yottabytes\":true,\"mebibytes_to_yobibytes\":true,\"gigabits_to_bits\":true,\"gigabits_to_nibbles\":true,\"gigabits_to_bytes\":true,\"gigabits_to_kilobits\":true,\"gigabits_to_kibibits\":true,\"gigabits_to_kibibytes\":true,\"gigabits_to_kilobytes\":true,\"gigabits_to_megabits\":true,\"gigabits_to_mebibits\":true,\"gigabits_to_megabytes\":true,\"gigabits_to_mebibytes\":true,\"gigabits_to_gibibits\":true,\"gigabits_to_gigabytes\":true,\"gigabits_to_gibibytes\":true,\"gigabits_to_terabits\":true,\"gigabits_to_tebibits\":true,\"gigabits_to_terabytes\":true,\"gigabits_to_tebibytes\":true,\"gigabits_to_petabits\":true,\"gigabits_to_pebibits\":true,\"gigabits_to_petabytes\":true,\"gigabits_to_pebibytes\":true,\"gigabits_to_exabits\":true,\"gigabits_to_exbibits\":true,\"gigabits_to_exabytes\":true,\"gigabits_to_exbibytes\":true,\"gigabits_to_zettabits\":true,\"gigabits_to_zebibits\":true,\"gigabits_to_zettabytes\":true,\"gigabits_to_zebibytes\":true,\"gigabits_to_yottabits\":true,\"gigabits_to_yobibits\":true,\"gigabits_to_yottabytes\":true,\"gigabits_to_yobibytes\":true,\"gibibits_to_bits\":true,\"gibibits_to_nibbles\":true,\"gibibits_to_bytes\":true,\"gibibits_to_kilobits\":true,\"gibibits_to_kibibits\":true,\"gibibits_to_kibibytes\":true,\"gibibits_to_kilobytes\":true,\"gibibits_to_megabits\":true,\"gibibits_to_mebibits\":true,\"gibibits_to_megabytes\":true,\"gibibits_to_mebibytes\":true,\"gibibits_to_gigabits\":true,\"gibibits_to_gigabytes\":true,\"gibibits_to_gibibytes\":true,\"gibibits_to_terabits\":true,\"gibibits_to_tebibits\":true,\"gibibits_to_terabytes\":true,\"gibibits_to_tebibytes\":true,\"gibibits_to_petabits\":true,\"gibibits_to_pebibits\":true,\"gibibits_to_petabytes\":true,\"gibibits_to_pebibytes\":true,\"gibibits_to_exabits\":true,\"gibibits_to_exbibits\":true,\"gibibits_to_exabytes\":true,\"gibibits_to_exbibytes\":true,\"gibibits_to_zettabits\":true,\"gibibits_to_zebibits\":true,\"gibibits_to_zettabytes\":true,\"gibibits_to_zebibytes\":true,\"gibibits_to_yottabits\":true,\"gibibits_to_yobibits\":true,\"gibibits_to_yottabytes\":true,\"gibibits_to_yobibytes\":true,\"gigabytes_to_bits\":true,\"gigabytes_to_nibbles\":true,\"gigabytes_to_bytes\":true,\"gigabytes_to_kilobits\":true,\"gigabytes_to_kibibits\":true,\"gigabytes_to_kibibytes\":true,\"gigabytes_to_kilobytes\":true,\"gigabytes_to_megabits\":true,\"gigabytes_to_mebibits\":true,\"gigabytes_to_megabytes\":true,\"gigabytes_to_mebibytes\":true,\"gigabytes_to_gigabits\":true,\"gigabytes_to_gibibits\":true,\"gigabytes_to_gibibytes\":true,\"gigabytes_to_terabits\":true,\"gigabytes_to_tebibits\":true,\"gigabytes_to_terabytes\":true,\"gigabytes_to_tebibytes\":true,\"gigabytes_to_petabits\":true,\"gigabytes_to_pebibits\":true,\"gigabytes_to_petabytes\":true,\"gigabytes_to_pebibytes\":true,\"gigabytes_to_exabits\":true,\"gigabytes_to_exbibits\":true,\"gigabytes_to_exabytes\":true,\"gigabytes_to_exbibytes\":true,\"gigabytes_to_zettabits\":true,\"gigabytes_to_zebibits\":true,\"gigabytes_to_zettabytes\":true,\"gigabytes_to_zebibytes\":true,\"gigabytes_to_yottabits\":true,\"gigabytes_to_yobibits\":true,\"gigabytes_to_yottabytes\":true,\"gigabytes_to_yobibytes\":true,\"gibibytes_to_bits\":true,\"gibibytes_to_nibbles\":true,\"gibibytes_to_bytes\":true,\"gibibytes_to_kilobits\":true,\"gibibytes_to_kibibits\":true,\"gibibytes_to_kibibytes\":true,\"gibibytes_to_kilobytes\":true,\"gibibytes_to_megabits\":true,\"gibibytes_to_mebibits\":true,\"gibibytes_to_megabytes\":true,\"gibibytes_to_mebibytes\":true,\"gibibytes_to_gigabits\":true,\"gibibytes_to_gibibits\":true,\"gibibytes_to_gigabytes\":true,\"gibibytes_to_terabits\":true,\"gibibytes_to_tebibits\":true,\"gibibytes_to_terabytes\":true,\"gibibytes_to_tebibytes\":true,\"gibibytes_to_petabits\":true,\"gibibytes_to_pebibits\":true,\"gibibytes_to_petabytes\":true,\"gibibytes_to_pebibytes\":true,\"gibibytes_to_exabits\":true,\"gibibytes_to_exbibits\":true,\"gibibytes_to_exabytes\":true,\"gibibytes_to_exbibytes\":true,\"gibibytes_to_zettabits\":true,\"gibibytes_to_zebibits\":true,\"gibibytes_to_zettabytes\":true,\"gibibytes_to_zebibytes\":true,\"gibibytes_to_yottabits\":true,\"gibibytes_to_yobibits\":true,\"gibibytes_to_yottabytes\":true,\"gibibytes_to_yobibytes\":true,\"terabits_to_bits\":true,\"terabits_to_nibbles\":true,\"terabits_to_bytes\":true,\"terabits_to_kilobits\":true,\"terabits_to_kibibits\":true,\"terabits_to_kibibytes\":true,\"terabits_to_kilobytes\":true,\"terabits_to_megabits\":true,\"terabits_to_mebibits\":true,\"terabits_to_megabytes\":true,\"terabits_to_mebibytes\":true,\"terabits_to_gigabits\":true,\"terabits_to_gibibits\":true,\"terabits_to_gigabytes\":true,\"terabits_to_gibibytes\":true,\"terabits_to_tebibits\":true,\"terabits_to_terabytes\":true,\"terabits_to_tebibytes\":true,\"terabits_to_petabits\":true,\"terabits_to_pebibits\":true,\"terabits_to_petabytes\":true,\"terabits_to_pebibytes\":true,\"terabits_to_exabits\":true,\"terabits_to_exbibits\":true,\"terabits_to_exabytes\":true,\"terabits_to_exbibytes\":true,\"terabits_to_zettabits\":true,\"terabits_to_zebibits\":true,\"terabits_to_zettabytes\":true,\"terabits_to_zebibytes\":true,\"terabits_to_yottabits\":true,\"terabits_to_yobibits\":true,\"terabits_to_yottabytes\":true,\"terabits_to_yobibytes\":true,\"tebibits_to_bits\":true,\"tebibits_to_nibbles\":true,\"tebibits_to_bytes\":true,\"tebibits_to_kilobits\":true,\"tebibits_to_kibibits\":true,\"tebibits_to_kibibytes\":true,\"tebibits_to_kilobytes\":true,\"tebibits_to_megabits\":true,\"tebibits_to_mebibits\":true,\"tebibits_to_megabytes\":true,\"tebibits_to_mebibytes\":true,\"tebibits_to_gigabits\":true,\"tebibits_to_gibibits\":true,\"tebibits_to_gigabytes\":true,\"tebibits_to_gibibytes\":true,\"tebibits_to_terabits\":true,\"tebibits_to_terabytes\":true,\"tebibits_to_tebibytes\":true,\"tebibits_to_petabits\":true,\"tebibits_to_pebibits\":true,\"tebibits_to_petabytes\":true,\"tebibits_to_pebibytes\":true,\"tebibits_to_exabits\":true,\"tebibits_to_exbibits\":true,\"tebibits_to_exabytes\":true,\"tebibits_to_exbibytes\":true,\"tebibits_to_zettabits\":true,\"tebibits_to_zebibits\":true,\"tebibits_to_zettabytes\":true,\"tebibits_to_zebibytes\":true,\"tebibits_to_yottabits\":true,\"tebibits_to_yobibits\":true,\"tebibits_to_yottabytes\":true,\"tebibits_to_yobibytes\":true,\"terabytes_to_bits\":true,\"terabytes_to_nibbles\":true,\"terabytes_to_bytes\":true,\"terabytes_to_kilobits\":true,\"terabytes_to_kibibits\":true,\"terabytes_to_kibibytes\":true,\"terabytes_to_kilobytes\":true,\"terabytes_to_megabits\":true,\"terabytes_to_mebibits\":true,\"terabytes_to_megabytes\":true,\"terabytes_to_mebibytes\":true,\"terabytes_to_gigabits\":true,\"terabytes_to_gibibits\":true,\"terabytes_to_gigabytes\":true,\"terabytes_to_gibibytes\":true,\"terabytes_to_terabits\":true,\"terabytes_to_tebibits\":true,\"terabytes_to_tebibytes\":true,\"terabytes_to_petabits\":true,\"terabytes_to_pebibits\":true,\"terabytes_to_petabytes\":true,\"terabytes_to_pebibytes\":true,\"terabytes_to_exabits\":true,\"terabytes_to_exbibits\":true,\"terabytes_to_exabytes\":true,\"terabytes_to_exbibytes\":true,\"terabytes_to_zettabits\":true,\"terabytes_to_zebibits\":true,\"terabytes_to_zettabytes\":true,\"terabytes_to_zebibytes\":true,\"terabytes_to_yottabits\":true,\"terabytes_to_yobibits\":true,\"terabytes_to_yottabytes\":true,\"terabytes_to_yobibytes\":true,\"tebibytes_to_bits\":true,\"tebibytes_to_nibbles\":true,\"tebibytes_to_bytes\":true,\"tebibytes_to_kilobits\":true,\"tebibytes_to_kibibits\":true,\"tebibytes_to_kibibytes\":true,\"tebibytes_to_kilobytes\":true,\"tebibytes_to_megabits\":true,\"tebibytes_to_mebibits\":true,\"tebibytes_to_megabytes\":true,\"tebibytes_to_mebibytes\":true,\"tebibytes_to_gigabits\":true,\"tebibytes_to_gibibits\":true,\"tebibytes_to_gigabytes\":true,\"tebibytes_to_gibibytes\":true,\"tebibytes_to_terabits\":true,\"tebibytes_to_tebibits\":true,\"tebibytes_to_terabytes\":true,\"tebibytes_to_petabits\":true,\"tebibytes_to_pebibits\":true,\"tebibytes_to_petabytes\":true,\"tebibytes_to_pebibytes\":true,\"tebibytes_to_exabits\":true,\"tebibytes_to_exbibits\":true,\"tebibytes_to_exabytes\":true,\"tebibytes_to_exbibytes\":true,\"tebibytes_to_zettabits\":true,\"tebibytes_to_zebibits\":true,\"tebibytes_to_zettabytes\":true,\"tebibytes_to_zebibytes\":true,\"tebibytes_to_yottabits\":true,\"tebibytes_to_yobibits\":true,\"tebibytes_to_yottabytes\":true,\"tebibytes_to_yobibytes\":true,\"petabits_to_bits\":true,\"petabits_to_nibbles\":true,\"petabits_to_bytes\":true,\"petabits_to_kilobits\":true,\"petabits_to_kibibits\":true,\"petabits_to_kibibytes\":true,\"petabits_to_kilobytes\":true,\"petabits_to_megabits\":true,\"petabits_to_mebibits\":true,\"petabits_to_megabytes\":true,\"petabits_to_mebibytes\":true,\"petabits_to_gigabits\":true,\"petabits_to_gibibits\":true,\"petabits_to_gigabytes\":true,\"petabits_to_gibibytes\":true,\"petabits_to_terabits\":true,\"petabits_to_tebibits\":true,\"petabits_to_terabytes\":true,\"petabits_to_tebibytes\":true,\"petabits_to_pebibits\":true,\"petabits_to_petabytes\":true,\"petabits_to_pebibytes\":true,\"petabits_to_exabits\":true,\"petabits_to_exbibits\":true,\"petabits_to_exabytes\":true,\"petabits_to_exbibytes\":true,\"petabits_to_zettabits\":true,\"petabits_to_zebibits\":true,\"petabits_to_zettabytes\":true,\"petabits_to_zebibytes\":true,\"petabits_to_yottabits\":true,\"petabits_to_yobibits\":true,\"petabits_to_yottabytes\":true,\"petabits_to_yobibytes\":true,\"pebibits_to_bits\":true,\"pebibits_to_nibbles\":true,\"pebibits_to_bytes\":true,\"pebibits_to_kilobits\":true,\"pebibits_to_kibibits\":true,\"pebibits_to_kibibytes\":true,\"pebibits_to_kilobytes\":true,\"pebibits_to_megabits\":true,\"pebibits_to_mebibits\":true,\"pebibits_to_megabytes\":true,\"pebibits_to_mebibytes\":true,\"pebibits_to_gigabits\":true,\"pebibits_to_gibibits\":true,\"pebibits_to_gigabytes\":true,\"pebibits_to_gibibytes\":true,\"pebibits_to_terabits\":true,\"pebibits_to_tebibits\":true,\"pebibits_to_terabytes\":true,\"pebibits_to_tebibytes\":true,\"pebibits_to_petabits\":true,\"pebibits_to_petabytes\":true,\"pebibits_to_pebibytes\":false,\"pebibits_to_exabits\":false,\"pebibits_to_exbibits\":false,\"pebibits_to_exabytes\":false,\"pebibits_to_exbibytes\":false,\"pebibits_to_zettabits\":false,\"pebibits_to_zebibits\":false,\"pebibits_to_zettabytes\":false,\"pebibits_to_zebibytes\":false,\"pebibits_to_yottabits\":false,\"pebibits_to_yobibits\":false,\"pebibits_to_yottabytes\":false,\"pebibits_to_yobibytes\":false,\"petabytes_to_bits\":false,\"petabytes_to_nibbles\":false,\"petabytes_to_bytes\":false,\"petabytes_to_kilobits\":false,\"petabytes_to_kibibits\":false,\"petabytes_to_kibibytes\":false,\"petabytes_to_kilobytes\":false,\"petabytes_to_megabits\":false,\"petabytes_to_mebibits\":false,\"petabytes_to_megabytes\":false,\"petabytes_to_mebibytes\":false,\"petabytes_to_gigabits\":false,\"petabytes_to_gibibits\":false,\"petabytes_to_gigabytes\":false,\"petabytes_to_gibibytes\":false,\"petabytes_to_terabits\":false,\"petabytes_to_tebibits\":false,\"petabytes_to_terabytes\":false,\"petabytes_to_tebibytes\":false,\"petabytes_to_petabits\":false,\"petabytes_to_pebibits\":false,\"petabytes_to_pebibytes\":false,\"petabytes_to_exabits\":false,\"petabytes_to_exbibits\":false,\"petabytes_to_exabytes\":false,\"petabytes_to_exbibytes\":false,\"petabytes_to_zettabits\":false,\"petabytes_to_zebibits\":false,\"petabytes_to_zettabytes\":false,\"petabytes_to_zebibytes\":false,\"petabytes_to_yottabits\":false,\"petabytes_to_yobibits\":false,\"petabytes_to_yottabytes\":false,\"petabytes_to_yobibytes\":false,\"pebibytes_to_bits\":false,\"pebibytes_to_nibbles\":false,\"pebibytes_to_bytes\":false,\"pebibytes_to_kilobits\":false,\"pebibytes_to_kibibits\":false,\"pebibytes_to_kibibytes\":false,\"pebibytes_to_kilobytes\":false,\"pebibytes_to_megabits\":false,\"pebibytes_to_mebibits\":false,\"pebibytes_to_megabytes\":false,\"pebibytes_to_mebibytes\":false,\"pebibytes_to_gigabits\":false,\"pebibytes_to_gibibits\":false,\"pebibytes_to_gigabytes\":false,\"pebibytes_to_gibibytes\":false,\"pebibytes_to_terabits\":false,\"pebibytes_to_tebibits\":false,\"pebibytes_to_terabytes\":false,\"pebibytes_to_tebibytes\":false,\"pebibytes_to_petabits\":false,\"pebibytes_to_pebibits\":false,\"pebibytes_to_petabytes\":false,\"pebibytes_to_exabits\":false,\"pebibytes_to_exbibits\":false,\"pebibytes_to_exabytes\":false,\"pebibytes_to_exbibytes\":false,\"pebibytes_to_zettabits\":false,\"pebibytes_to_zebibits\":false,\"pebibytes_to_zettabytes\":false,\"pebibytes_to_zebibytes\":false,\"pebibytes_to_yottabits\":false,\"pebibytes_to_yobibits\":false,\"pebibytes_to_yottabytes\":false,\"pebibytes_to_yobibytes\":false,\"exabits_to_bits\":false,\"exabits_to_nibbles\":false,\"exabits_to_bytes\":false,\"exabits_to_kilobits\":false,\"exabits_to_kibibits\":false,\"exabits_to_kibibytes\":false,\"exabits_to_kilobytes\":false,\"exabits_to_megabits\":false,\"exabits_to_mebibits\":false,\"exabits_to_megabytes\":false,\"exabits_to_mebibytes\":false,\"exabits_to_gigabits\":false,\"exabits_to_gibibits\":false,\"exabits_to_gigabytes\":false,\"exabits_to_gibibytes\":false,\"exabits_to_terabits\":false,\"exabits_to_tebibits\":false,\"exabits_to_terabytes\":false,\"exabits_to_tebibytes\":false,\"exabits_to_petabits\":false,\"exabits_to_pebibits\":false,\"exabits_to_petabytes\":false,\"exabits_to_pebibytes\":false,\"exabits_to_exbibits\":false,\"exabits_to_exabytes\":false,\"exabits_to_exbibytes\":false,\"exabits_to_zettabits\":false,\"exabits_to_zebibits\":false,\"exabits_to_zettabytes\":false,\"exabits_to_zebibytes\":false,\"exabits_to_yottabits\":false,\"exabits_to_yobibits\":false,\"exabits_to_yottabytes\":false,\"exabits_to_yobibytes\":false,\"exbibits_to_bits\":false,\"exbibits_to_nibbles\":false,\"exbibits_to_bytes\":false,\"exbibits_to_kilobits\":false,\"exbibits_to_kibibits\":false,\"exbibits_to_kibibytes\":false,\"exbibits_to_kilobytes\":false,\"exbibits_to_megabits\":false,\"exbibits_to_mebibits\":false,\"exbibits_to_megabytes\":false,\"exbibits_to_mebibytes\":false,\"exbibits_to_gigabits\":false,\"exbibits_to_gibibits\":false,\"exbibits_to_gigabytes\":false,\"exbibits_to_gibibytes\":false,\"exbibits_to_terabits\":false,\"exbibits_to_tebibits\":false,\"exbibits_to_terabytes\":false,\"exbibits_to_tebibytes\":false,\"exbibits_to_petabits\":false,\"exbibits_to_pebibits\":false,\"exbibits_to_petabytes\":false,\"exbibits_to_pebibytes\":false,\"exbibits_to_exabits\":false,\"exbibits_to_exabytes\":false,\"exbibits_to_exbibytes\":false,\"exbibits_to_zettabits\":false,\"exbibits_to_zebibits\":false,\"exbibits_to_zettabytes\":false,\"exbibits_to_zebibytes\":false,\"exbibits_to_yottabits\":false,\"exbibits_to_yobibits\":false,\"exbibits_to_yottabytes\":false,\"exbibits_to_yobibytes\":false,\"exabytes_to_bits\":false,\"exabytes_to_nibbles\":false,\"exabytes_to_bytes\":false,\"exabytes_to_kilobits\":false,\"exabytes_to_kibibits\":false,\"exabytes_to_kibibytes\":false,\"exabytes_to_kilobytes\":false,\"exabytes_to_megabits\":false,\"exabytes_to_mebibits\":false,\"exabytes_to_megabytes\":false,\"exabytes_to_mebibytes\":false,\"exabytes_to_gigabits\":false,\"exabytes_to_gibibits\":false,\"exabytes_to_gigabytes\":false,\"exabytes_to_gibibytes\":false,\"exabytes_to_terabits\":false,\"exabytes_to_tebibits\":false,\"exabytes_to_terabytes\":false,\"exabytes_to_tebibytes\":false,\"exabytes_to_petabits\":false,\"exabytes_to_pebibits\":false,\"exabytes_to_petabytes\":false,\"exabytes_to_pebibytes\":false,\"exabytes_to_exabits\":false,\"exabytes_to_exbibits\":false,\"exabytes_to_exbibytes\":false,\"exabytes_to_zettabits\":false,\"exabytes_to_zebibits\":false,\"exabytes_to_zettabytes\":false,\"exabytes_to_zebibytes\":false,\"exabytes_to_yottabits\":false,\"exabytes_to_yobibits\":false,\"exabytes_to_yottabytes\":false,\"exabytes_to_yobibytes\":false,\"exbibytes_to_bits\":false,\"exbibytes_to_nibbles\":false,\"exbibytes_to_bytes\":false,\"exbibytes_to_kilobits\":false,\"exbibytes_to_kibibits\":false,\"exbibytes_to_kibibytes\":false,\"exbibytes_to_kilobytes\":false,\"exbibytes_to_megabits\":false,\"exbibytes_to_mebibits\":false,\"exbibytes_to_megabytes\":false,\"exbibytes_to_mebibytes\":false,\"exbibytes_to_gigabits\":false,\"exbibytes_to_gibibits\":false,\"exbibytes_to_gigabytes\":false,\"exbibytes_to_gibibytes\":false,\"exbibytes_to_terabits\":false,\"exbibytes_to_tebibits\":false,\"exbibytes_to_terabytes\":false,\"exbibytes_to_tebibytes\":false,\"exbibytes_to_petabits\":false,\"exbibytes_to_pebibits\":false,\"exbibytes_to_petabytes\":false,\"exbibytes_to_pebibytes\":false,\"exbibytes_to_exabits\":false,\"exbibytes_to_exbibits\":false,\"exbibytes_to_exabytes\":false,\"exbibytes_to_zettabits\":false,\"exbibytes_to_zebibits\":false,\"exbibytes_to_zettabytes\":false,\"exbibytes_to_zebibytes\":false,\"exbibytes_to_yottabits\":false,\"exbibytes_to_yobibits\":false,\"exbibytes_to_yottabytes\":false,\"exbibytes_to_yobibytes\":false,\"zettabits_to_bits\":false,\"zettabits_to_nibbles\":false,\"zettabits_to_bytes\":false,\"zettabits_to_kilobits\":false,\"zettabits_to_kibibits\":false,\"zettabits_to_kibibytes\":false,\"zettabits_to_kilobytes\":false,\"zettabits_to_megabits\":false,\"zettabits_to_mebibits\":false,\"zettabits_to_megabytes\":false,\"zettabits_to_mebibytes\":false,\"zettabits_to_gigabits\":false,\"zettabits_to_gibibits\":false,\"zettabits_to_gigabytes\":false,\"zettabits_to_gibibytes\":false,\"zettabits_to_terabits\":false,\"zettabits_to_tebibits\":false,\"zettabits_to_terabytes\":false,\"zettabits_to_tebibytes\":false,\"zettabits_to_petabits\":false,\"zettabits_to_pebibits\":false,\"zettabits_to_petabytes\":false,\"zettabits_to_pebibytes\":false,\"zettabits_to_exabits\":false,\"zettabits_to_exbibits\":false,\"zettabits_to_exabytes\":false,\"zettabits_to_exbibytes\":false,\"zettabits_to_zebibits\":false,\"zettabits_to_zettabytes\":false,\"zettabits_to_zebibytes\":false,\"zettabits_to_yottabits\":false,\"zettabits_to_yobibits\":false,\"zettabits_to_yottabytes\":false,\"zettabits_to_yobibytes\":false,\"zebibits_to_bits\":false,\"zebibits_to_nibbles\":false,\"zebibits_to_bytes\":false,\"zebibits_to_kilobits\":false,\"zebibits_to_kibibits\":false,\"zebibits_to_kibibytes\":false,\"zebibits_to_kilobytes\":false,\"zebibits_to_megabits\":false,\"zebibits_to_mebibits\":false,\"zebibits_to_megabytes\":false,\"zebibits_to_mebibytes\":false,\"zebibits_to_gigabits\":false,\"zebibits_to_gibibits\":false,\"zebibits_to_gigabytes\":false,\"zebibits_to_gibibytes\":false,\"zebibits_to_terabits\":false,\"zebibits_to_tebibits\":false,\"zebibits_to_terabytes\":false,\"zebibits_to_tebibytes\":false,\"zebibits_to_petabits\":false,\"zebibits_to_pebibits\":false,\"zebibits_to_petabytes\":false,\"zebibits_to_pebibytes\":false,\"zebibits_to_exabits\":false,\"zebibits_to_exbibits\":false,\"zebibits_to_exabytes\":false,\"zebibits_to_exbibytes\":false,\"zebibits_to_zettabits\":false,\"zebibits_to_zettabytes\":false,\"zebibits_to_zebibytes\":false,\"zebibits_to_yottabits\":false,\"zebibits_to_yobibits\":false,\"zebibits_to_yottabytes\":false,\"zebibits_to_yobibytes\":false,\"zettabytes_to_bits\":false,\"zettabytes_to_nibbles\":false,\"zettabytes_to_bytes\":false,\"zettabytes_to_kilobits\":false,\"zettabytes_to_kibibits\":false,\"zettabytes_to_kibibytes\":false,\"zettabytes_to_kilobytes\":false,\"zettabytes_to_megabits\":false,\"zettabytes_to_mebibits\":false,\"zettabytes_to_megabytes\":false,\"zettabytes_to_mebibytes\":false,\"zettabytes_to_gigabits\":false,\"zettabytes_to_gibibits\":false,\"zettabytes_to_gigabytes\":false,\"zettabytes_to_gibibytes\":false,\"zettabytes_to_terabits\":false,\"zettabytes_to_tebibits\":false,\"zettabytes_to_terabytes\":false,\"zettabytes_to_tebibytes\":false,\"zettabytes_to_petabits\":false,\"zettabytes_to_pebibits\":false,\"zettabytes_to_petabytes\":false,\"zettabytes_to_pebibytes\":false,\"zettabytes_to_exabits\":false,\"zettabytes_to_exbibits\":false,\"zettabytes_to_exabytes\":false,\"zettabytes_to_exbibytes\":false,\"zettabytes_to_zettabits\":false,\"zettabytes_to_zebibits\":false,\"zettabytes_to_zebibytes\":false,\"zettabytes_to_yottabits\":false,\"zettabytes_to_yobibits\":false,\"zettabytes_to_yottabytes\":false,\"zettabytes_to_yobibytes\":false,\"zebibytes_to_bits\":false,\"zebibytes_to_nibbles\":false,\"zebibytes_to_bytes\":false,\"zebibytes_to_kilobits\":false,\"zebibytes_to_kibibits\":false,\"zebibytes_to_kibibytes\":false,\"zebibytes_to_kilobytes\":false,\"zebibytes_to_megabits\":false,\"zebibytes_to_mebibits\":false,\"zebibytes_to_megabytes\":false,\"zebibytes_to_mebibytes\":false,\"zebibytes_to_gigabits\":false,\"zebibytes_to_gibibits\":false,\"zebibytes_to_gigabytes\":false,\"zebibytes_to_gibibytes\":false,\"zebibytes_to_terabits\":false,\"zebibytes_to_tebibits\":false,\"zebibytes_to_terabytes\":false,\"zebibytes_to_tebibytes\":false,\"zebibytes_to_petabits\":false,\"zebibytes_to_pebibits\":false,\"zebibytes_to_petabytes\":false,\"zebibytes_to_pebibytes\":false,\"zebibytes_to_exabits\":false,\"zebibytes_to_exbibits\":false,\"zebibytes_to_exabytes\":false,\"zebibytes_to_exbibytes\":false,\"zebibytes_to_zettabits\":false,\"zebibytes_to_zebibits\":false,\"zebibytes_to_zettabytes\":false,\"zebibytes_to_yottabits\":false,\"zebibytes_to_yobibits\":false,\"zebibytes_to_yottabytes\":false,\"zebibytes_to_yobibytes\":false,\"yottabits_to_bits\":false,\"yottabits_to_nibbles\":false,\"yottabits_to_bytes\":false,\"yottabits_to_kilobits\":false,\"yottabits_to_kibibits\":false,\"yottabits_to_kibibytes\":false,\"yottabits_to_kilobytes\":false,\"yottabits_to_megabits\":false,\"yottabits_to_mebibits\":false,\"yottabits_to_megabytes\":false,\"yottabits_to_mebibytes\":false,\"yottabits_to_gigabits\":false,\"yottabits_to_gibibits\":false,\"yottabits_to_gigabytes\":false,\"yottabits_to_gibibytes\":false,\"yottabits_to_terabits\":false,\"yottabits_to_tebibits\":false,\"yottabits_to_terabytes\":false,\"yottabits_to_tebibytes\":false,\"yottabits_to_petabits\":false,\"yottabits_to_pebibits\":false,\"yottabits_to_petabytes\":false,\"yottabits_to_pebibytes\":false,\"yottabits_to_exabits\":false,\"yottabits_to_exbibits\":false,\"yottabits_to_exabytes\":false,\"yottabits_to_exbibytes\":false,\"yottabits_to_zettabits\":false,\"yottabits_to_zebibits\":false,\"yottabits_to_zettabytes\":false,\"yottabits_to_zebibytes\":false,\"yottabits_to_yobibits\":false,\"yottabits_to_yottabytes\":false,\"yottabits_to_yobibytes\":false,\"yobibits_to_bits\":false,\"yobibits_to_nibbles\":false,\"yobibits_to_bytes\":false,\"yobibits_to_kilobits\":false,\"yobibits_to_kibibits\":false,\"yobibits_to_kibibytes\":false,\"yobibits_to_kilobytes\":false,\"yobibits_to_megabits\":false,\"yobibits_to_mebibits\":false,\"yobibits_to_megabytes\":false,\"yobibits_to_mebibytes\":false,\"yobibits_to_gigabits\":false,\"yobibits_to_gibibits\":false,\"yobibits_to_gigabytes\":false,\"yobibits_to_gibibytes\":false,\"yobibits_to_terabits\":false,\"yobibits_to_tebibits\":false,\"yobibits_to_terabytes\":false,\"yobibits_to_tebibytes\":false,\"yobibits_to_petabits\":false,\"yobibits_to_pebibits\":false,\"yobibits_to_petabytes\":false,\"yobibits_to_pebibytes\":false,\"yobibits_to_exabits\":false,\"yobibits_to_exbibits\":false,\"yobibits_to_exabytes\":false,\"yobibits_to_exbibytes\":false,\"yobibits_to_zettabits\":false,\"yobibits_to_zebibits\":false,\"yobibits_to_zettabytes\":false,\"yobibits_to_zebibytes\":false,\"yobibits_to_yottabits\":false,\"yobibits_to_yottabytes\":false,\"yobibits_to_yobibytes\":false,\"yottabytes_to_bits\":false,\"yottabytes_to_nibbles\":false,\"yottabytes_to_bytes\":false,\"yottabytes_to_kilobits\":false,\"yottabytes_to_kibibits\":false,\"yottabytes_to_kibibytes\":false,\"yottabytes_to_kilobytes\":false,\"yottabytes_to_megabits\":false,\"yottabytes_to_mebibits\":false,\"yottabytes_to_megabytes\":false,\"yottabytes_to_mebibytes\":false,\"yottabytes_to_gigabits\":false,\"yottabytes_to_gibibits\":false,\"yottabytes_to_gigabytes\":false,\"yottabytes_to_gibibytes\":false,\"yottabytes_to_terabits\":false,\"yottabytes_to_tebibits\":false,\"yottabytes_to_terabytes\":false,\"yottabytes_to_tebibytes\":false,\"yottabytes_to_petabits\":false,\"yottabytes_to_pebibits\":false,\"yottabytes_to_petabytes\":false,\"yottabytes_to_pebibytes\":false,\"yottabytes_to_exabits\":false,\"yottabytes_to_exbibits\":false,\"yottabytes_to_exabytes\":false,\"yottabytes_to_exbibytes\":false,\"yottabytes_to_zettabits\":false,\"yottabytes_to_zebibits\":false,\"yottabytes_to_zettabytes\":false,\"yottabytes_to_zebibytes\":false,\"yottabytes_to_yottabits\":false,\"yottabytes_to_yobibits\":false,\"yottabytes_to_yobibytes\":false,\"yobibytes_to_bits\":false,\"yobibytes_to_nibbles\":false,\"yobibytes_to_bytes\":false,\"yobibytes_to_kilobits\":false,\"yobibytes_to_kibibits\":false,\"yobibytes_to_kibibytes\":false,\"yobibytes_to_kilobytes\":false,\"yobibytes_to_megabits\":false,\"yobibytes_to_mebibits\":false,\"yobibytes_to_megabytes\":false,\"yobibytes_to_mebibytes\":false,\"yobibytes_to_gigabits\":false,\"yobibytes_to_gibibits\":false,\"yobibytes_to_gigabytes\":false,\"yobibytes_to_gibibytes\":false,\"yobibytes_to_terabits\":false,\"yobibytes_to_tebibits\":false,\"yobibytes_to_terabytes\":false,\"yobibytes_to_tebibytes\":false,\"yobibytes_to_petabits\":false,\"yobibytes_to_pebibits\":false,\"yobibytes_to_petabytes\":false,\"yobibytes_to_pebibytes\":false,\"yobibytes_to_exabits\":false,\"yobibytes_to_exbibits\":false,\"yobibytes_to_exabytes\":false,\"yobibytes_to_exbibytes\":false,\"yobibytes_to_zettabits\":false,\"yobibytes_to_zebibits\":false,\"yobibytes_to_zettabytes\":false,\"yobibytes_to_zebibytes\":false,\"yobibytes_to_yottabits\":false,\"yobibytes_to_yobibits\":false,\"yobibytes_to_yottabytes\":false},\"removable_branding\":false,\"exclusive_personal_api_keys\":false,\"documents_model\":null,\"documents_per_month_limit\":0,\"words_per_month_limit\":0,\"images_api\":null,\"images_per_month_limit\":0,\"transcriptions_per_month_limit\":0,\"transcriptions_file_size_limit\":0,\"chats_model\":null,\"chats_per_month_limit\":0,\"chat_messages_per_chat_limit\":0,\"chat_image_size_limit\":0,\"syntheses_api\":null,\"syntheses_per_month_limit\":0,\"synthesized_characters_per_month_limit\":0}}');
INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(18, 'plan_free', '{\"plan_id\":\"free\",\"name\":\"Free\",\"description\":\"\",\"translations\":{\"english\":{\"name\":\"\",\"description\":\"\",\"price\":\"\"}},\"price\":\"Free\",\"color\":null,\"status\":1,\"settings\":{\"signatures_limit\":0,\"projects_limit\":1,\"teams_limit\":0,\"team_members_limit\":0,\"api_is_enabled\":false,\"affiliate_commission_percentage\":0,\"no_ads\":false,\"enabled_tools\":{\"dns_lookup\":true,\"ip_lookup\":true,\"reverse_ip_lookup\":true,\"ssl_lookup\":true,\"whois_lookup\":true,\"ping\":true,\"http_headers_lookup\":true,\"http2_checker\":true,\"brotli_checker\":true,\"safe_url_checker\":true,\"google_cache_checker\":true,\"url_redirect_checker\":true,\"password_strength_checker\":true,\"meta_tags_checker\":true,\"website_hosting_checker\":true,\"file_mime_type_checker\":true,\"gravatar_checker\":true,\"text_separator\":true,\"email_extractor\":true,\"url_extractor\":true,\"text_size_calculator\":true,\"duplicate_lines_remover\":true,\"text_to_speech\":true,\"idn_punnycode_converter\":true,\"case_converter\":true,\"character_counter\":true,\"list_randomizer\":true,\"reverse_words\":true,\"reverse_letters\":true,\"emojis_remover\":true,\"reverse_list\":true,\"list_alphabetizer\":true,\"upside_down_text_generator\":true,\"old_english_text_generator\":true,\"cursive_text_generator\":true,\"palindrome_checker\":true,\"base64_encoder\":true,\"base64_decoder\":true,\"base64_to_image\":true,\"image_to_base64\":true,\"url_encoder\":true,\"url_decoder\":true,\"color_converter\":true,\"binary_converter\":true,\"hex_converter\":true,\"ascii_converter\":true,\"decimal_converter\":true,\"octal_converter\":true,\"morse_converter\":true,\"number_to_words_converter\":true,\"paypal_link_generator\":true,\"signature_generator\":true,\"mailto_link_generator\":true,\"utm_link_generator\":true,\"whatsapp_link_generator\":true,\"youtube_timestamp_link_generator\":true,\"slug_generator\":true,\"lorem_ipsum_generator\":true,\"password_generator\":true,\"random_number_generator\":true,\"uuid_v4_generator\":true,\"bcrypt_generator\":true,\"md2_generator\":true,\"md4_generator\":true,\"md5_generator\":true,\"whirlpool_generator\":true,\"sha1_generator\":true,\"sha224_generator\":true,\"sha256_generator\":true,\"sha384_generator\":true,\"sha512_generator\":true,\"sha512_224_generator\":true,\"sha512_256_generator\":true,\"sha3_224_generator\":true,\"sha3_256_generator\":true,\"sha3_384_generator\":true,\"sha3_512_generator\":true,\"ripemd128_generator\":true,\"ripemd160_generator\":true,\"ripemd256_generator\":true,\"ripemd320_generator\":true,\"html_minifier\":true,\"css_minifier\":true,\"js_minifier\":true,\"json_validator_beautifier\":true,\"sql_beautifier\":true,\"html_entity_converter\":true,\"bbcode_to_html\":true,\"markdown_to_html\":true,\"html_tags_remover\":true,\"user_agent_parser\":true,\"url_parser\":true,\"image_optimizer\":true,\"png_to_jpg\":true,\"png_to_bmp\":true,\"png_to_ico\":true,\"png_to_gif\":true,\"png_to_webp\":true,\"png_to_avif\":true,\"png_to_tiff\":true,\"png_to_tga\":true,\"jpg_to_png\":true,\"jpg_to_bmp\":true,\"jpg_to_ico\":true,\"jpg_to_gif\":true,\"jpg_to_webp\":true,\"jpg_to_avif\":true,\"jpg_to_tiff\":true,\"jpg_to_tga\":true,\"bmp_to_png\":true,\"bmp_to_jpg\":true,\"bmp_to_ico\":true,\"bmp_to_gif\":true,\"bmp_to_webp\":true,\"bmp_to_avif\":true,\"bmp_to_tiff\":true,\"bmp_to_tga\":true,\"ico_to_png\":true,\"ico_to_jpg\":true,\"ico_to_bmp\":true,\"ico_to_gif\":true,\"ico_to_webp\":true,\"ico_to_avif\":true,\"ico_to_tiff\":true,\"ico_to_tga\":true,\"gif_to_png\":true,\"gif_to_jpg\":true,\"gif_to_bmp\":true,\"gif_to_ico\":true,\"gif_to_webp\":true,\"gif_to_avif\":true,\"gif_to_tiff\":true,\"gif_to_tga\":true,\"webp_to_png\":true,\"webp_to_jpg\":true,\"webp_to_bmp\":true,\"webp_to_ico\":true,\"webp_to_gif\":true,\"webp_to_avif\":true,\"webp_to_tiff\":true,\"webp_to_tga\":true,\"heic_to_png\":true,\"heic_to_jpg\":true,\"heic_to_bmp\":true,\"heic_to_ico\":true,\"heic_to_gif\":true,\"heic_to_webp\":true,\"heic_to_avif\":true,\"heic_to_tiff\":true,\"heic_to_tga\":true,\"avif_to_png\":true,\"avif_to_jpg\":true,\"avif_to_bmp\":true,\"avif_to_ico\":true,\"avif_to_gif\":true,\"avif_to_webp\":true,\"avif_to_tiff\":true,\"avif_to_tga\":true,\"tiff_to_png\":true,\"tiff_to_jpg\":true,\"tiff_to_bmp\":true,\"tiff_to_ico\":true,\"tiff_to_gif\":true,\"tiff_to_webp\":true,\"tiff_to_avif\":true,\"tiff_to_tga\":true,\"youtube_thumbnail_downloader\":false,\"qr_code_reader\":false,\"barcode_reader\":false,\"exif_reader\":false,\"color_picker\":false,\"hex_to_hexa\":false,\"hex_to_rgb\":false,\"hex_to_rgba\":false,\"hex_to_hsv\":false,\"hex_to_hsl\":false,\"hex_to_hsla\":false,\"hexa_to_hex\":false,\"hexa_to_rgb\":false,\"hexa_to_rgba\":false,\"hexa_to_hsv\":false,\"hexa_to_hsl\":false,\"hexa_to_hsla\":false,\"rgb_to_hex\":false,\"rgb_to_hexa\":false,\"rgb_to_rgba\":false,\"rgb_to_hsv\":false,\"rgb_to_hsl\":false,\"rgb_to_hsla\":false,\"rgba_to_hex\":false,\"rgba_to_hexa\":false,\"rgba_to_rgb\":false,\"rgba_to_hsv\":false,\"rgba_to_hsl\":false,\"rgba_to_hsla\":false,\"hsv_to_hex\":false,\"hsv_to_hexa\":false,\"hsv_to_rgb\":false,\"hsv_to_rgba\":false,\"hsv_to_hsl\":false,\"hsv_to_hsla\":false,\"hsl_to_hex\":false,\"hsl_to_hexa\":false,\"hsl_to_rgb\":false,\"hsl_to_rgba\":false,\"hsl_to_hsv\":false,\"hsl_to_hsla\":false,\"hsla_to_hex\":false,\"hsla_to_hexa\":false,\"hsla_to_rgb\":false,\"hsla_to_rgba\":false,\"hsla_to_hsv\":false,\"hsla_to_hsl\":false,\"celsius_to_fahrenheit\":true,\"celsius_to_kelvin\":true,\"fahrenheit_to_celsius\":true,\"fahrenheit_to_kelvin\":true,\"kelvin_to_celsius\":true,\"kelvin_to_fahrenheit\":true,\"miles_per_hour_to_kilometers_per_hour\":true,\"kilometers_per_hour_to_miles_per_hour\":true,\"number_to_roman_numerals\":true,\"roman_numerals_to_number\":true,\"unix_timestamp_to_date\":true,\"date_to_unix_timestamp\":true,\"seconds_to_milliseconds\":true,\"seconds_to_microseconds\":true,\"seconds_to_nanoseconds\":true,\"seconds_to_picoseconds\":true,\"seconds_to_minutes\":true,\"seconds_to_hours\":true,\"seconds_to_days\":true,\"seconds_to_weeks\":true,\"seconds_to_months\":true,\"seconds_to_years\":true,\"milliseconds_to_seconds\":true,\"milliseconds_to_microseconds\":true,\"milliseconds_to_nanoseconds\":true,\"milliseconds_to_picoseconds\":true,\"milliseconds_to_minutes\":true,\"milliseconds_to_hours\":true,\"milliseconds_to_days\":true,\"milliseconds_to_weeks\":true,\"milliseconds_to_months\":true,\"milliseconds_to_years\":true,\"microseconds_to_seconds\":true,\"microseconds_to_milliseconds\":true,\"microseconds_to_nanoseconds\":true,\"microseconds_to_picoseconds\":true,\"microseconds_to_minutes\":true,\"microseconds_to_hours\":true,\"microseconds_to_days\":true,\"microseconds_to_weeks\":true,\"microseconds_to_months\":true,\"microseconds_to_years\":true,\"nanoseconds_to_seconds\":true,\"nanoseconds_to_milliseconds\":true,\"nanoseconds_to_microseconds\":true,\"nanoseconds_to_picoseconds\":true,\"nanoseconds_to_minutes\":true,\"nanoseconds_to_hours\":true,\"nanoseconds_to_days\":true,\"nanoseconds_to_weeks\":true,\"nanoseconds_to_months\":true,\"nanoseconds_to_years\":true,\"picoseconds_to_seconds\":true,\"picoseconds_to_milliseconds\":true,\"picoseconds_to_microseconds\":true,\"picoseconds_to_nanoseconds\":true,\"picoseconds_to_minutes\":true,\"picoseconds_to_hours\":true,\"picoseconds_to_days\":true,\"picoseconds_to_weeks\":true,\"picoseconds_to_months\":true,\"picoseconds_to_years\":true,\"minutes_to_seconds\":true,\"minutes_to_milliseconds\":true,\"minutes_to_microseconds\":true,\"minutes_to_nanoseconds\":true,\"minutes_to_picoseconds\":true,\"minutes_to_hours\":true,\"minutes_to_days\":true,\"minutes_to_weeks\":true,\"minutes_to_months\":true,\"minutes_to_years\":true,\"hours_to_seconds\":true,\"hours_to_milliseconds\":true,\"hours_to_microseconds\":true,\"hours_to_nanoseconds\":true,\"hours_to_picoseconds\":true,\"hours_to_minutes\":true,\"hours_to_days\":true,\"hours_to_weeks\":true,\"hours_to_months\":true,\"hours_to_years\":true,\"days_to_seconds\":true,\"days_to_milliseconds\":true,\"days_to_microseconds\":true,\"days_to_nanoseconds\":true,\"days_to_picoseconds\":true,\"days_to_minutes\":true,\"days_to_hours\":true,\"days_to_weeks\":true,\"days_to_months\":true,\"days_to_years\":true,\"weeks_to_seconds\":true,\"weeks_to_milliseconds\":true,\"weeks_to_microseconds\":true,\"weeks_to_nanoseconds\":true,\"weeks_to_picoseconds\":true,\"weeks_to_minutes\":true,\"weeks_to_hours\":true,\"weeks_to_days\":true,\"weeks_to_months\":true,\"weeks_to_years\":true,\"months_to_seconds\":true,\"months_to_milliseconds\":true,\"months_to_microseconds\":true,\"months_to_nanoseconds\":true,\"months_to_picoseconds\":true,\"months_to_minutes\":true,\"months_to_hours\":true,\"months_to_days\":true,\"months_to_weeks\":true,\"months_to_years\":true,\"years_to_seconds\":true,\"years_to_milliseconds\":true,\"years_to_microseconds\":true,\"years_to_nanoseconds\":true,\"years_to_picoseconds\":true,\"years_to_minutes\":true,\"years_to_hours\":true,\"years_to_days\":true,\"years_to_weeks\":true,\"years_to_months\":true,\"bits_to_nibbles\":true,\"bits_to_bytes\":true,\"bits_to_kilobits\":true,\"bits_to_kibibits\":true,\"bits_to_kibibytes\":true,\"bits_to_kilobytes\":true,\"bits_to_megabits\":true,\"bits_to_mebibits\":true,\"bits_to_megabytes\":true,\"bits_to_mebibytes\":true,\"bits_to_gigabits\":true,\"bits_to_gibibits\":true,\"bits_to_gigabytes\":true,\"bits_to_gibibytes\":true,\"bits_to_terabits\":true,\"bits_to_tebibits\":true,\"bits_to_terabytes\":true,\"bits_to_tebibytes\":true,\"bits_to_petabits\":true,\"bits_to_pebibits\":true,\"bits_to_petabytes\":true,\"bits_to_pebibytes\":true,\"bits_to_exabits\":true,\"bits_to_exbibits\":true,\"bits_to_exabytes\":true,\"bits_to_exbibytes\":true,\"bits_to_zettabits\":true,\"bits_to_zebibits\":true,\"bits_to_zettabytes\":true,\"bits_to_zebibytes\":true,\"bits_to_yottabits\":true,\"bits_to_yobibits\":true,\"bits_to_yottabytes\":true,\"bits_to_yobibytes\":true,\"nibbles_to_bits\":true,\"nibbles_to_bytes\":true,\"nibbles_to_kilobits\":true,\"nibbles_to_kibibits\":true,\"nibbles_to_kibibytes\":true,\"nibbles_to_kilobytes\":true,\"nibbles_to_megabits\":true,\"nibbles_to_mebibits\":true,\"nibbles_to_megabytes\":true,\"nibbles_to_mebibytes\":true,\"nibbles_to_gigabits\":true,\"nibbles_to_gibibits\":true,\"nibbles_to_gigabytes\":true,\"nibbles_to_gibibytes\":true,\"nibbles_to_terabits\":true,\"nibbles_to_tebibits\":true,\"nibbles_to_terabytes\":true,\"nibbles_to_tebibytes\":true,\"nibbles_to_petabits\":true,\"nibbles_to_pebibits\":true,\"nibbles_to_petabytes\":true,\"nibbles_to_pebibytes\":true,\"nibbles_to_exabits\":true,\"nibbles_to_exbibits\":true,\"nibbles_to_exabytes\":true,\"nibbles_to_exbibytes\":true,\"nibbles_to_zettabits\":true,\"nibbles_to_zebibits\":true,\"nibbles_to_zettabytes\":true,\"nibbles_to_zebibytes\":true,\"nibbles_to_yottabits\":true,\"nibbles_to_yobibits\":true,\"nibbles_to_yottabytes\":true,\"nibbles_to_yobibytes\":true,\"bytes_to_bits\":true,\"bytes_to_nibbles\":true,\"bytes_to_kilobits\":true,\"bytes_to_kibibits\":true,\"bytes_to_kibibytes\":true,\"bytes_to_kilobytes\":true,\"bytes_to_megabits\":true,\"bytes_to_mebibits\":true,\"bytes_to_megabytes\":true,\"bytes_to_mebibytes\":true,\"bytes_to_gigabits\":true,\"bytes_to_gibibits\":true,\"bytes_to_gigabytes\":true,\"bytes_to_gibibytes\":true,\"bytes_to_terabits\":true,\"bytes_to_tebibits\":true,\"bytes_to_terabytes\":true,\"bytes_to_tebibytes\":true,\"bytes_to_petabits\":true,\"bytes_to_pebibits\":true,\"bytes_to_petabytes\":true,\"bytes_to_pebibytes\":true,\"bytes_to_exabits\":true,\"bytes_to_exbibits\":true,\"bytes_to_exabytes\":true,\"bytes_to_exbibytes\":true,\"bytes_to_zettabits\":true,\"bytes_to_zebibits\":true,\"bytes_to_zettabytes\":true,\"bytes_to_zebibytes\":true,\"bytes_to_yottabits\":true,\"bytes_to_yobibits\":true,\"bytes_to_yottabytes\":true,\"bytes_to_yobibytes\":true,\"kilobits_to_bits\":true,\"kilobits_to_nibbles\":true,\"kilobits_to_bytes\":true,\"kilobits_to_kibibits\":true,\"kilobits_to_kibibytes\":true,\"kilobits_to_kilobytes\":true,\"kilobits_to_megabits\":true,\"kilobits_to_mebibits\":true,\"kilobits_to_megabytes\":true,\"kilobits_to_mebibytes\":true,\"kilobits_to_gigabits\":true,\"kilobits_to_gibibits\":true,\"kilobits_to_gigabytes\":true,\"kilobits_to_gibibytes\":true,\"kilobits_to_terabits\":true,\"kilobits_to_tebibits\":true,\"kilobits_to_terabytes\":true,\"kilobits_to_tebibytes\":true,\"kilobits_to_petabits\":true,\"kilobits_to_pebibits\":true,\"kilobits_to_petabytes\":true,\"kilobits_to_pebibytes\":true,\"kilobits_to_exabits\":true,\"kilobits_to_exbibits\":true,\"kilobits_to_exabytes\":true,\"kilobits_to_exbibytes\":true,\"kilobits_to_zettabits\":true,\"kilobits_to_zebibits\":true,\"kilobits_to_zettabytes\":true,\"kilobits_to_zebibytes\":true,\"kilobits_to_yottabits\":true,\"kilobits_to_yobibits\":true,\"kilobits_to_yottabytes\":true,\"kilobits_to_yobibytes\":true,\"kibibits_to_bits\":true,\"kibibits_to_nibbles\":true,\"kibibits_to_bytes\":true,\"kibibits_to_kilobits\":true,\"kibibits_to_kibibytes\":true,\"kibibits_to_kilobytes\":true,\"kibibits_to_megabits\":true,\"kibibits_to_mebibits\":true,\"kibibits_to_megabytes\":true,\"kibibits_to_mebibytes\":true,\"kibibits_to_gigabits\":true,\"kibibits_to_gibibits\":true,\"kibibits_to_gigabytes\":true,\"kibibits_to_gibibytes\":true,\"kibibits_to_terabits\":true,\"kibibits_to_tebibits\":true,\"kibibits_to_terabytes\":true,\"kibibits_to_tebibytes\":true,\"kibibits_to_petabits\":true,\"kibibits_to_pebibits\":true,\"kibibits_to_petabytes\":true,\"kibibits_to_pebibytes\":true,\"kibibits_to_exabits\":true,\"kibibits_to_exbibits\":true,\"kibibits_to_exabytes\":true,\"kibibits_to_exbibytes\":true,\"kibibits_to_zettabits\":true,\"kibibits_to_zebibits\":true,\"kibibits_to_zettabytes\":true,\"kibibits_to_zebibytes\":true,\"kibibits_to_yottabits\":true,\"kibibits_to_yobibits\":true,\"kibibits_to_yottabytes\":true,\"kibibits_to_yobibytes\":true,\"kibibytes_to_bits\":true,\"kibibytes_to_nibbles\":true,\"kibibytes_to_bytes\":true,\"kibibytes_to_kilobits\":true,\"kibibytes_to_kibibits\":true,\"kibibytes_to_kilobytes\":true,\"kibibytes_to_megabits\":true,\"kibibytes_to_mebibits\":true,\"kibibytes_to_megabytes\":true,\"kibibytes_to_mebibytes\":true,\"kibibytes_to_gigabits\":true,\"kibibytes_to_gibibits\":true,\"kibibytes_to_gigabytes\":true,\"kibibytes_to_gibibytes\":true,\"kibibytes_to_terabits\":true,\"kibibytes_to_tebibits\":true,\"kibibytes_to_terabytes\":true,\"kibibytes_to_tebibytes\":true,\"kibibytes_to_petabits\":true,\"kibibytes_to_pebibits\":true,\"kibibytes_to_petabytes\":true,\"kibibytes_to_pebibytes\":true,\"kibibytes_to_exabits\":true,\"kibibytes_to_exbibits\":true,\"kibibytes_to_exabytes\":true,\"kibibytes_to_exbibytes\":true,\"kibibytes_to_zettabits\":true,\"kibibytes_to_zebibits\":true,\"kibibytes_to_zettabytes\":true,\"kibibytes_to_zebibytes\":true,\"kibibytes_to_yottabits\":true,\"kibibytes_to_yobibits\":true,\"kibibytes_to_yottabytes\":true,\"kibibytes_to_yobibytes\":true,\"kilobytes_to_bits\":true,\"kilobytes_to_nibbles\":true,\"kilobytes_to_bytes\":true,\"kilobytes_to_kilobits\":true,\"kilobytes_to_kibibits\":true,\"kilobytes_to_kibibytes\":true,\"kilobytes_to_megabits\":true,\"kilobytes_to_mebibits\":true,\"kilobytes_to_megabytes\":true,\"kilobytes_to_mebibytes\":true,\"kilobytes_to_gigabits\":true,\"kilobytes_to_gibibits\":true,\"kilobytes_to_gigabytes\":true,\"kilobytes_to_gibibytes\":true,\"kilobytes_to_terabits\":true,\"kilobytes_to_tebibits\":true,\"kilobytes_to_terabytes\":true,\"kilobytes_to_tebibytes\":true,\"kilobytes_to_petabits\":true,\"kilobytes_to_pebibits\":true,\"kilobytes_to_petabytes\":true,\"kilobytes_to_pebibytes\":true,\"kilobytes_to_exabits\":true,\"kilobytes_to_exbibits\":true,\"kilobytes_to_exabytes\":true,\"kilobytes_to_exbibytes\":true,\"kilobytes_to_zettabits\":true,\"kilobytes_to_zebibits\":true,\"kilobytes_to_zettabytes\":true,\"kilobytes_to_zebibytes\":true,\"kilobytes_to_yottabits\":true,\"kilobytes_to_yobibits\":true,\"kilobytes_to_yottabytes\":true,\"kilobytes_to_yobibytes\":true,\"megabits_to_bits\":true,\"megabits_to_nibbles\":true,\"megabits_to_bytes\":true,\"megabits_to_kilobits\":true,\"megabits_to_kibibits\":true,\"megabits_to_kibibytes\":true,\"megabits_to_kilobytes\":true,\"megabits_to_mebibits\":true,\"megabits_to_megabytes\":true,\"megabits_to_mebibytes\":true,\"megabits_to_gigabits\":true,\"megabits_to_gibibits\":true,\"megabits_to_gigabytes\":true,\"megabits_to_gibibytes\":true,\"megabits_to_terabits\":true,\"megabits_to_tebibits\":true,\"megabits_to_terabytes\":true,\"megabits_to_tebibytes\":true,\"megabits_to_petabits\":true,\"megabits_to_pebibits\":true,\"megabits_to_petabytes\":true,\"megabits_to_pebibytes\":true,\"megabits_to_exabits\":true,\"megabits_to_exbibits\":true,\"megabits_to_exabytes\":true,\"megabits_to_exbibytes\":true,\"megabits_to_zettabits\":true,\"megabits_to_zebibits\":true,\"megabits_to_zettabytes\":true,\"megabits_to_zebibytes\":true,\"megabits_to_yottabits\":true,\"megabits_to_yobibits\":true,\"megabits_to_yottabytes\":true,\"megabits_to_yobibytes\":true,\"mebibits_to_bits\":true,\"mebibits_to_nibbles\":true,\"mebibits_to_bytes\":true,\"mebibits_to_kilobits\":true,\"mebibits_to_kibibits\":true,\"mebibits_to_kibibytes\":true,\"mebibits_to_kilobytes\":true,\"mebibits_to_megabits\":true,\"mebibits_to_megabytes\":true,\"mebibits_to_mebibytes\":true,\"mebibits_to_gigabits\":true,\"mebibits_to_gibibits\":true,\"mebibits_to_gigabytes\":true,\"mebibits_to_gibibytes\":true,\"mebibits_to_terabits\":true,\"mebibits_to_tebibits\":true,\"mebibits_to_terabytes\":true,\"mebibits_to_tebibytes\":true,\"mebibits_to_petabits\":true,\"mebibits_to_pebibits\":true,\"mebibits_to_petabytes\":true,\"mebibits_to_pebibytes\":true,\"mebibits_to_exabits\":true,\"mebibits_to_exbibits\":true,\"mebibits_to_exabytes\":true,\"mebibits_to_exbibytes\":true,\"mebibits_to_zettabits\":true,\"mebibits_to_zebibits\":true,\"mebibits_to_zettabytes\":true,\"mebibits_to_zebibytes\":true,\"mebibits_to_yottabits\":true,\"mebibits_to_yobibits\":true,\"mebibits_to_yottabytes\":true,\"mebibits_to_yobibytes\":true,\"megabytes_to_bits\":true,\"megabytes_to_nibbles\":true,\"megabytes_to_bytes\":true,\"megabytes_to_kilobits\":true,\"megabytes_to_kibibits\":true,\"megabytes_to_kibibytes\":true,\"megabytes_to_kilobytes\":true,\"megabytes_to_megabits\":true,\"megabytes_to_mebibits\":true,\"megabytes_to_mebibytes\":true,\"megabytes_to_gigabits\":true,\"megabytes_to_gibibits\":true,\"megabytes_to_gigabytes\":true,\"megabytes_to_gibibytes\":true,\"megabytes_to_terabits\":true,\"megabytes_to_tebibits\":true,\"megabytes_to_terabytes\":true,\"megabytes_to_tebibytes\":true,\"megabytes_to_petabits\":true,\"megabytes_to_pebibits\":true,\"megabytes_to_petabytes\":true,\"megabytes_to_pebibytes\":true,\"megabytes_to_exabits\":true,\"megabytes_to_exbibits\":true,\"megabytes_to_exabytes\":true,\"megabytes_to_exbibytes\":true,\"megabytes_to_zettabits\":true,\"megabytes_to_zebibits\":true,\"megabytes_to_zettabytes\":true,\"megabytes_to_zebibytes\":true,\"megabytes_to_yottabits\":true,\"megabytes_to_yobibits\":true,\"megabytes_to_yottabytes\":true,\"megabytes_to_yobibytes\":true,\"mebibytes_to_bits\":true,\"mebibytes_to_nibbles\":true,\"mebibytes_to_bytes\":true,\"mebibytes_to_kilobits\":true,\"mebibytes_to_kibibits\":true,\"mebibytes_to_kibibytes\":true,\"mebibytes_to_kilobytes\":true,\"mebibytes_to_megabits\":true,\"mebibytes_to_mebibits\":true,\"mebibytes_to_megabytes\":true,\"mebibytes_to_gigabits\":true,\"mebibytes_to_gibibits\":true,\"mebibytes_to_gigabytes\":true,\"mebibytes_to_gibibytes\":true,\"mebibytes_to_terabits\":true,\"mebibytes_to_tebibits\":true,\"mebibytes_to_terabytes\":true,\"mebibytes_to_tebibytes\":true,\"mebibytes_to_petabits\":true,\"mebibytes_to_pebibits\":true,\"mebibytes_to_petabytes\":true,\"mebibytes_to_pebibytes\":true,\"mebibytes_to_exabits\":true,\"mebibytes_to_exbibits\":true,\"mebibytes_to_exabytes\":true,\"mebibytes_to_exbibytes\":true,\"mebibytes_to_zettabits\":true,\"mebibytes_to_zebibits\":true,\"mebibytes_to_zettabytes\":true,\"mebibytes_to_zebibytes\":true,\"mebibytes_to_yottabits\":true,\"mebibytes_to_yobibits\":true,\"mebibytes_to_yottabytes\":true,\"mebibytes_to_yobibytes\":true,\"gigabits_to_bits\":true,\"gigabits_to_nibbles\":true,\"gigabits_to_bytes\":true,\"gigabits_to_kilobits\":true,\"gigabits_to_kibibits\":true,\"gigabits_to_kibibytes\":true,\"gigabits_to_kilobytes\":true,\"gigabits_to_megabits\":true,\"gigabits_to_mebibits\":true,\"gigabits_to_megabytes\":true,\"gigabits_to_mebibytes\":true,\"gigabits_to_gibibits\":true,\"gigabits_to_gigabytes\":true,\"gigabits_to_gibibytes\":true,\"gigabits_to_terabits\":true,\"gigabits_to_tebibits\":true,\"gigabits_to_terabytes\":true,\"gigabits_to_tebibytes\":true,\"gigabits_to_petabits\":true,\"gigabits_to_pebibits\":true,\"gigabits_to_petabytes\":true,\"gigabits_to_pebibytes\":true,\"gigabits_to_exabits\":true,\"gigabits_to_exbibits\":true,\"gigabits_to_exabytes\":true,\"gigabits_to_exbibytes\":true,\"gigabits_to_zettabits\":true,\"gigabits_to_zebibits\":true,\"gigabits_to_zettabytes\":true,\"gigabits_to_zebibytes\":true,\"gigabits_to_yottabits\":true,\"gigabits_to_yobibits\":true,\"gigabits_to_yottabytes\":true,\"gigabits_to_yobibytes\":true,\"gibibits_to_bits\":true,\"gibibits_to_nibbles\":true,\"gibibits_to_bytes\":true,\"gibibits_to_kilobits\":true,\"gibibits_to_kibibits\":true,\"gibibits_to_kibibytes\":true,\"gibibits_to_kilobytes\":true,\"gibibits_to_megabits\":true,\"gibibits_to_mebibits\":true,\"gibibits_to_megabytes\":true,\"gibibits_to_mebibytes\":true,\"gibibits_to_gigabits\":true,\"gibibits_to_gigabytes\":true,\"gibibits_to_gibibytes\":true,\"gibibits_to_terabits\":true,\"gibibits_to_tebibits\":true,\"gibibits_to_terabytes\":true,\"gibibits_to_tebibytes\":true,\"gibibits_to_petabits\":true,\"gibibits_to_pebibits\":true,\"gibibits_to_petabytes\":true,\"gibibits_to_pebibytes\":true,\"gibibits_to_exabits\":true,\"gibibits_to_exbibits\":true,\"gibibits_to_exabytes\":true,\"gibibits_to_exbibytes\":true,\"gibibits_to_zettabits\":true,\"gibibits_to_zebibits\":true,\"gibibits_to_zettabytes\":true,\"gibibits_to_zebibytes\":true,\"gibibits_to_yottabits\":true,\"gibibits_to_yobibits\":true,\"gibibits_to_yottabytes\":true,\"gibibits_to_yobibytes\":true,\"gigabytes_to_bits\":true,\"gigabytes_to_nibbles\":true,\"gigabytes_to_bytes\":true,\"gigabytes_to_kilobits\":true,\"gigabytes_to_kibibits\":true,\"gigabytes_to_kibibytes\":true,\"gigabytes_to_kilobytes\":true,\"gigabytes_to_megabits\":true,\"gigabytes_to_mebibits\":true,\"gigabytes_to_megabytes\":true,\"gigabytes_to_mebibytes\":true,\"gigabytes_to_gigabits\":true,\"gigabytes_to_gibibits\":true,\"gigabytes_to_gibibytes\":true,\"gigabytes_to_terabits\":true,\"gigabytes_to_tebibits\":true,\"gigabytes_to_terabytes\":true,\"gigabytes_to_tebibytes\":true,\"gigabytes_to_petabits\":true,\"gigabytes_to_pebibits\":true,\"gigabytes_to_petabytes\":true,\"gigabytes_to_pebibytes\":true,\"gigabytes_to_exabits\":true,\"gigabytes_to_exbibits\":true,\"gigabytes_to_exabytes\":true,\"gigabytes_to_exbibytes\":true,\"gigabytes_to_zettabits\":true,\"gigabytes_to_zebibits\":true,\"gigabytes_to_zettabytes\":true,\"gigabytes_to_zebibytes\":true,\"gigabytes_to_yottabits\":true,\"gigabytes_to_yobibits\":true,\"gigabytes_to_yottabytes\":true,\"gigabytes_to_yobibytes\":true,\"gibibytes_to_bits\":true,\"gibibytes_to_nibbles\":true,\"gibibytes_to_bytes\":true,\"gibibytes_to_kilobits\":true,\"gibibytes_to_kibibits\":true,\"gibibytes_to_kibibytes\":true,\"gibibytes_to_kilobytes\":true,\"gibibytes_to_megabits\":true,\"gibibytes_to_mebibits\":true,\"gibibytes_to_megabytes\":true,\"gibibytes_to_mebibytes\":true,\"gibibytes_to_gigabits\":true,\"gibibytes_to_gibibits\":true,\"gibibytes_to_gigabytes\":true,\"gibibytes_to_terabits\":true,\"gibibytes_to_tebibits\":true,\"gibibytes_to_terabytes\":true,\"gibibytes_to_tebibytes\":true,\"gibibytes_to_petabits\":true,\"gibibytes_to_pebibits\":true,\"gibibytes_to_petabytes\":true,\"gibibytes_to_pebibytes\":true,\"gibibytes_to_exabits\":true,\"gibibytes_to_exbibits\":true,\"gibibytes_to_exabytes\":true,\"gibibytes_to_exbibytes\":true,\"gibibytes_to_zettabits\":true,\"gibibytes_to_zebibits\":true,\"gibibytes_to_zettabytes\":true,\"gibibytes_to_zebibytes\":true,\"gibibytes_to_yottabits\":true,\"gibibytes_to_yobibits\":true,\"gibibytes_to_yottabytes\":true,\"gibibytes_to_yobibytes\":true,\"terabits_to_bits\":true,\"terabits_to_nibbles\":true,\"terabits_to_bytes\":true,\"terabits_to_kilobits\":true,\"terabits_to_kibibits\":true,\"terabits_to_kibibytes\":true,\"terabits_to_kilobytes\":true,\"terabits_to_megabits\":true,\"terabits_to_mebibits\":true,\"terabits_to_megabytes\":true,\"terabits_to_mebibytes\":true,\"terabits_to_gigabits\":true,\"terabits_to_gibibits\":true,\"terabits_to_gigabytes\":true,\"terabits_to_gibibytes\":true,\"terabits_to_tebibits\":true,\"terabits_to_terabytes\":true,\"terabits_to_tebibytes\":true,\"terabits_to_petabits\":true,\"terabits_to_pebibits\":true,\"terabits_to_petabytes\":true,\"terabits_to_pebibytes\":true,\"terabits_to_exabits\":true,\"terabits_to_exbibits\":true,\"terabits_to_exabytes\":true,\"terabits_to_exbibytes\":true,\"terabits_to_zettabits\":true,\"terabits_to_zebibits\":true,\"terabits_to_zettabytes\":true,\"terabits_to_zebibytes\":true,\"terabits_to_yottabits\":true,\"terabits_to_yobibits\":true,\"terabits_to_yottabytes\":true,\"terabits_to_yobibytes\":true,\"tebibits_to_bits\":true,\"tebibits_to_nibbles\":true,\"tebibits_to_bytes\":true,\"tebibits_to_kilobits\":true,\"tebibits_to_kibibits\":true,\"tebibits_to_kibibytes\":true,\"tebibits_to_kilobytes\":true,\"tebibits_to_megabits\":true,\"tebibits_to_mebibits\":true,\"tebibits_to_megabytes\":true,\"tebibits_to_mebibytes\":true,\"tebibits_to_gigabits\":true,\"tebibits_to_gibibits\":true,\"tebibits_to_gigabytes\":true,\"tebibits_to_gibibytes\":true,\"tebibits_to_terabits\":true,\"tebibits_to_terabytes\":true,\"tebibits_to_tebibytes\":true,\"tebibits_to_petabits\":true,\"tebibits_to_pebibits\":true,\"tebibits_to_petabytes\":true,\"tebibits_to_pebibytes\":true,\"tebibits_to_exabits\":true,\"tebibits_to_exbibits\":true,\"tebibits_to_exabytes\":true,\"tebibits_to_exbibytes\":true,\"tebibits_to_zettabits\":true,\"tebibits_to_zebibits\":true,\"tebibits_to_zettabytes\":true,\"tebibits_to_zebibytes\":true,\"tebibits_to_yottabits\":true,\"tebibits_to_yobibits\":true,\"tebibits_to_yottabytes\":true,\"tebibits_to_yobibytes\":true,\"terabytes_to_bits\":true,\"terabytes_to_nibbles\":true,\"terabytes_to_bytes\":true,\"terabytes_to_kilobits\":true,\"terabytes_to_kibibits\":true,\"terabytes_to_kibibytes\":true,\"terabytes_to_kilobytes\":true,\"terabytes_to_megabits\":true,\"terabytes_to_mebibits\":true,\"terabytes_to_megabytes\":true,\"terabytes_to_mebibytes\":true,\"terabytes_to_gigabits\":true,\"terabytes_to_gibibits\":true,\"terabytes_to_gigabytes\":true,\"terabytes_to_gibibytes\":true,\"terabytes_to_terabits\":true,\"terabytes_to_tebibits\":true,\"terabytes_to_tebibytes\":true,\"terabytes_to_petabits\":true,\"terabytes_to_pebibits\":true,\"terabytes_to_petabytes\":true,\"terabytes_to_pebibytes\":true,\"terabytes_to_exabits\":true,\"terabytes_to_exbibits\":true,\"terabytes_to_exabytes\":true,\"terabytes_to_exbibytes\":true,\"terabytes_to_zettabits\":true,\"terabytes_to_zebibits\":true,\"terabytes_to_zettabytes\":true,\"terabytes_to_zebibytes\":true,\"terabytes_to_yottabits\":true,\"terabytes_to_yobibits\":true,\"terabytes_to_yottabytes\":true,\"terabytes_to_yobibytes\":true,\"tebibytes_to_bits\":true,\"tebibytes_to_nibbles\":true,\"tebibytes_to_bytes\":true,\"tebibytes_to_kilobits\":true,\"tebibytes_to_kibibits\":true,\"tebibytes_to_kibibytes\":true,\"tebibytes_to_kilobytes\":true,\"tebibytes_to_megabits\":true,\"tebibytes_to_mebibits\":true,\"tebibytes_to_megabytes\":true,\"tebibytes_to_mebibytes\":true,\"tebibytes_to_gigabits\":true,\"tebibytes_to_gibibits\":true,\"tebibytes_to_gigabytes\":true,\"tebibytes_to_gibibytes\":true,\"tebibytes_to_terabits\":true,\"tebibytes_to_tebibits\":true,\"tebibytes_to_terabytes\":true,\"tebibytes_to_petabits\":true,\"tebibytes_to_pebibits\":true,\"tebibytes_to_petabytes\":true,\"tebibytes_to_pebibytes\":true,\"tebibytes_to_exabits\":true,\"tebibytes_to_exbibits\":true,\"tebibytes_to_exabytes\":true,\"tebibytes_to_exbibytes\":true,\"tebibytes_to_zettabits\":true,\"tebibytes_to_zebibits\":true,\"tebibytes_to_zettabytes\":true,\"tebibytes_to_zebibytes\":true,\"tebibytes_to_yottabits\":true,\"tebibytes_to_yobibits\":true,\"tebibytes_to_yottabytes\":true,\"tebibytes_to_yobibytes\":true,\"petabits_to_bits\":true,\"petabits_to_nibbles\":true,\"petabits_to_bytes\":true,\"petabits_to_kilobits\":true,\"petabits_to_kibibits\":true,\"petabits_to_kibibytes\":true,\"petabits_to_kilobytes\":true,\"petabits_to_megabits\":true,\"petabits_to_mebibits\":true,\"petabits_to_megabytes\":true,\"petabits_to_mebibytes\":true,\"petabits_to_gigabits\":true,\"petabits_to_gibibits\":true,\"petabits_to_gigabytes\":true,\"petabits_to_gibibytes\":true,\"petabits_to_terabits\":true,\"petabits_to_tebibits\":true,\"petabits_to_terabytes\":true,\"petabits_to_tebibytes\":true,\"petabits_to_pebibits\":true,\"petabits_to_petabytes\":true,\"petabits_to_pebibytes\":true,\"petabits_to_exabits\":true,\"petabits_to_exbibits\":true,\"petabits_to_exabytes\":true,\"petabits_to_exbibytes\":true,\"petabits_to_zettabits\":true,\"petabits_to_zebibits\":true,\"petabits_to_zettabytes\":true,\"petabits_to_zebibytes\":true,\"petabits_to_yottabits\":true,\"petabits_to_yobibits\":true,\"petabits_to_yottabytes\":true,\"petabits_to_yobibytes\":true,\"pebibits_to_bits\":true,\"pebibits_to_nibbles\":true,\"pebibits_to_bytes\":true,\"pebibits_to_kilobits\":true,\"pebibits_to_kibibits\":true,\"pebibits_to_kibibytes\":true,\"pebibits_to_kilobytes\":true,\"pebibits_to_megabits\":true,\"pebibits_to_mebibits\":true,\"pebibits_to_megabytes\":true,\"pebibits_to_mebibytes\":true,\"pebibits_to_gigabits\":true,\"pebibits_to_gibibits\":true,\"pebibits_to_gigabytes\":true,\"pebibits_to_gibibytes\":true,\"pebibits_to_terabits\":true,\"pebibits_to_tebibits\":true,\"pebibits_to_terabytes\":true,\"pebibits_to_tebibytes\":true,\"pebibits_to_petabits\":true,\"pebibits_to_petabytes\":true,\"pebibits_to_pebibytes\":true,\"pebibits_to_exabits\":false,\"pebibits_to_exbibits\":false,\"pebibits_to_exabytes\":false,\"pebibits_to_exbibytes\":false,\"pebibits_to_zettabits\":false,\"pebibits_to_zebibits\":false,\"pebibits_to_zettabytes\":false,\"pebibits_to_zebibytes\":false,\"pebibits_to_yottabits\":false,\"pebibits_to_yobibits\":false,\"pebibits_to_yottabytes\":false,\"pebibits_to_yobibytes\":false,\"petabytes_to_bits\":false,\"petabytes_to_nibbles\":false,\"petabytes_to_bytes\":false,\"petabytes_to_kilobits\":false,\"petabytes_to_kibibits\":false,\"petabytes_to_kibibytes\":false,\"petabytes_to_kilobytes\":false,\"petabytes_to_megabits\":false,\"petabytes_to_mebibits\":false,\"petabytes_to_megabytes\":false,\"petabytes_to_mebibytes\":false,\"petabytes_to_gigabits\":false,\"petabytes_to_gibibits\":false,\"petabytes_to_gigabytes\":false,\"petabytes_to_gibibytes\":false,\"petabytes_to_terabits\":false,\"petabytes_to_tebibits\":false,\"petabytes_to_terabytes\":false,\"petabytes_to_tebibytes\":false,\"petabytes_to_petabits\":false,\"petabytes_to_pebibits\":false,\"petabytes_to_pebibytes\":false,\"petabytes_to_exabits\":false,\"petabytes_to_exbibits\":false,\"petabytes_to_exabytes\":false,\"petabytes_to_exbibytes\":false,\"petabytes_to_zettabits\":false,\"petabytes_to_zebibits\":false,\"petabytes_to_zettabytes\":false,\"petabytes_to_zebibytes\":false,\"petabytes_to_yottabits\":false,\"petabytes_to_yobibits\":false,\"petabytes_to_yottabytes\":false,\"petabytes_to_yobibytes\":false,\"pebibytes_to_bits\":false,\"pebibytes_to_nibbles\":false,\"pebibytes_to_bytes\":false,\"pebibytes_to_kilobits\":false,\"pebibytes_to_kibibits\":false,\"pebibytes_to_kibibytes\":false,\"pebibytes_to_kilobytes\":false,\"pebibytes_to_megabits\":false,\"pebibytes_to_mebibits\":false,\"pebibytes_to_megabytes\":false,\"pebibytes_to_mebibytes\":false,\"pebibytes_to_gigabits\":false,\"pebibytes_to_gibibits\":false,\"pebibytes_to_gigabytes\":false,\"pebibytes_to_gibibytes\":false,\"pebibytes_to_terabits\":false,\"pebibytes_to_tebibits\":false,\"pebibytes_to_terabytes\":false,\"pebibytes_to_tebibytes\":false,\"pebibytes_to_petabits\":false,\"pebibytes_to_pebibits\":false,\"pebibytes_to_petabytes\":false,\"pebibytes_to_exabits\":false,\"pebibytes_to_exbibits\":false,\"pebibytes_to_exabytes\":false,\"pebibytes_to_exbibytes\":false,\"pebibytes_to_zettabits\":false,\"pebibytes_to_zebibits\":false,\"pebibytes_to_zettabytes\":false,\"pebibytes_to_zebibytes\":false,\"pebibytes_to_yottabits\":false,\"pebibytes_to_yobibits\":false,\"pebibytes_to_yottabytes\":false,\"pebibytes_to_yobibytes\":false,\"exabits_to_bits\":false,\"exabits_to_nibbles\":false,\"exabits_to_bytes\":false,\"exabits_to_kilobits\":false,\"exabits_to_kibibits\":false,\"exabits_to_kibibytes\":false,\"exabits_to_kilobytes\":false,\"exabits_to_megabits\":false,\"exabits_to_mebibits\":false,\"exabits_to_megabytes\":false,\"exabits_to_mebibytes\":false,\"exabits_to_gigabits\":false,\"exabits_to_gibibits\":false,\"exabits_to_gigabytes\":false,\"exabits_to_gibibytes\":false,\"exabits_to_terabits\":false,\"exabits_to_tebibits\":false,\"exabits_to_terabytes\":false,\"exabits_to_tebibytes\":false,\"exabits_to_petabits\":false,\"exabits_to_pebibits\":false,\"exabits_to_petabytes\":false,\"exabits_to_pebibytes\":false,\"exabits_to_exbibits\":false,\"exabits_to_exabytes\":false,\"exabits_to_exbibytes\":false,\"exabits_to_zettabits\":false,\"exabits_to_zebibits\":false,\"exabits_to_zettabytes\":false,\"exabits_to_zebibytes\":false,\"exabits_to_yottabits\":false,\"exabits_to_yobibits\":false,\"exabits_to_yottabytes\":false,\"exabits_to_yobibytes\":false,\"exbibits_to_bits\":false,\"exbibits_to_nibbles\":false,\"exbibits_to_bytes\":false,\"exbibits_to_kilobits\":false,\"exbibits_to_kibibits\":false,\"exbibits_to_kibibytes\":false,\"exbibits_to_kilobytes\":false,\"exbibits_to_megabits\":false,\"exbibits_to_mebibits\":false,\"exbibits_to_megabytes\":false,\"exbibits_to_mebibytes\":false,\"exbibits_to_gigabits\":false,\"exbibits_to_gibibits\":false,\"exbibits_to_gigabytes\":false,\"exbibits_to_gibibytes\":false,\"exbibits_to_terabits\":false,\"exbibits_to_tebibits\":false,\"exbibits_to_terabytes\":false,\"exbibits_to_tebibytes\":false,\"exbibits_to_petabits\":false,\"exbibits_to_pebibits\":false,\"exbibits_to_petabytes\":false,\"exbibits_to_pebibytes\":false,\"exbibits_to_exabits\":false,\"exbibits_to_exabytes\":false,\"exbibits_to_exbibytes\":false,\"exbibits_to_zettabits\":false,\"exbibits_to_zebibits\":false,\"exbibits_to_zettabytes\":false,\"exbibits_to_zebibytes\":false,\"exbibits_to_yottabits\":false,\"exbibits_to_yobibits\":false,\"exbibits_to_yottabytes\":false,\"exbibits_to_yobibytes\":false,\"exabytes_to_bits\":false,\"exabytes_to_nibbles\":false,\"exabytes_to_bytes\":false,\"exabytes_to_kilobits\":false,\"exabytes_to_kibibits\":false,\"exabytes_to_kibibytes\":false,\"exabytes_to_kilobytes\":false,\"exabytes_to_megabits\":false,\"exabytes_to_mebibits\":false,\"exabytes_to_megabytes\":false,\"exabytes_to_mebibytes\":false,\"exabytes_to_gigabits\":false,\"exabytes_to_gibibits\":false,\"exabytes_to_gigabytes\":false,\"exabytes_to_gibibytes\":false,\"exabytes_to_terabits\":false,\"exabytes_to_tebibits\":false,\"exabytes_to_terabytes\":false,\"exabytes_to_tebibytes\":false,\"exabytes_to_petabits\":false,\"exabytes_to_pebibits\":false,\"exabytes_to_petabytes\":false,\"exabytes_to_pebibytes\":false,\"exabytes_to_exabits\":false,\"exabytes_to_exbibits\":false,\"exabytes_to_exbibytes\":false,\"exabytes_to_zettabits\":false,\"exabytes_to_zebibits\":false,\"exabytes_to_zettabytes\":false,\"exabytes_to_zebibytes\":false,\"exabytes_to_yottabits\":false,\"exabytes_to_yobibits\":false,\"exabytes_to_yottabytes\":false,\"exabytes_to_yobibytes\":false,\"exbibytes_to_bits\":false,\"exbibytes_to_nibbles\":false,\"exbibytes_to_bytes\":false,\"exbibytes_to_kilobits\":false,\"exbibytes_to_kibibits\":false,\"exbibytes_to_kibibytes\":false,\"exbibytes_to_kilobytes\":false,\"exbibytes_to_megabits\":false,\"exbibytes_to_mebibits\":false,\"exbibytes_to_megabytes\":false,\"exbibytes_to_mebibytes\":false,\"exbibytes_to_gigabits\":false,\"exbibytes_to_gibibits\":false,\"exbibytes_to_gigabytes\":false,\"exbibytes_to_gibibytes\":false,\"exbibytes_to_terabits\":false,\"exbibytes_to_tebibits\":false,\"exbibytes_to_terabytes\":false,\"exbibytes_to_tebibytes\":false,\"exbibytes_to_petabits\":false,\"exbibytes_to_pebibits\":false,\"exbibytes_to_petabytes\":false,\"exbibytes_to_pebibytes\":false,\"exbibytes_to_exabits\":false,\"exbibytes_to_exbibits\":false,\"exbibytes_to_exabytes\":false,\"exbibytes_to_zettabits\":false,\"exbibytes_to_zebibits\":false,\"exbibytes_to_zettabytes\":false,\"exbibytes_to_zebibytes\":false,\"exbibytes_to_yottabits\":false,\"exbibytes_to_yobibits\":false,\"exbibytes_to_yottabytes\":false,\"exbibytes_to_yobibytes\":false,\"zettabits_to_bits\":false,\"zettabits_to_nibbles\":false,\"zettabits_to_bytes\":false,\"zettabits_to_kilobits\":false,\"zettabits_to_kibibits\":false,\"zettabits_to_kibibytes\":false,\"zettabits_to_kilobytes\":false,\"zettabits_to_megabits\":false,\"zettabits_to_mebibits\":false,\"zettabits_to_megabytes\":false,\"zettabits_to_mebibytes\":false,\"zettabits_to_gigabits\":false,\"zettabits_to_gibibits\":false,\"zettabits_to_gigabytes\":false,\"zettabits_to_gibibytes\":false,\"zettabits_to_terabits\":false,\"zettabits_to_tebibits\":false,\"zettabits_to_terabytes\":false,\"zettabits_to_tebibytes\":false,\"zettabits_to_petabits\":false,\"zettabits_to_pebibits\":false,\"zettabits_to_petabytes\":false,\"zettabits_to_pebibytes\":false,\"zettabits_to_exabits\":false,\"zettabits_to_exbibits\":false,\"zettabits_to_exabytes\":false,\"zettabits_to_exbibytes\":false,\"zettabits_to_zebibits\":false,\"zettabits_to_zettabytes\":false,\"zettabits_to_zebibytes\":false,\"zettabits_to_yottabits\":false,\"zettabits_to_yobibits\":false,\"zettabits_to_yottabytes\":false,\"zettabits_to_yobibytes\":false,\"zebibits_to_bits\":false,\"zebibits_to_nibbles\":false,\"zebibits_to_bytes\":false,\"zebibits_to_kilobits\":false,\"zebibits_to_kibibits\":false,\"zebibits_to_kibibytes\":false,\"zebibits_to_kilobytes\":false,\"zebibits_to_megabits\":false,\"zebibits_to_mebibits\":false,\"zebibits_to_megabytes\":false,\"zebibits_to_mebibytes\":false,\"zebibits_to_gigabits\":false,\"zebibits_to_gibibits\":false,\"zebibits_to_gigabytes\":false,\"zebibits_to_gibibytes\":false,\"zebibits_to_terabits\":false,\"zebibits_to_tebibits\":false,\"zebibits_to_terabytes\":false,\"zebibits_to_tebibytes\":false,\"zebibits_to_petabits\":false,\"zebibits_to_pebibits\":false,\"zebibits_to_petabytes\":false,\"zebibits_to_pebibytes\":false,\"zebibits_to_exabits\":false,\"zebibits_to_exbibits\":false,\"zebibits_to_exabytes\":false,\"zebibits_to_exbibytes\":false,\"zebibits_to_zettabits\":false,\"zebibits_to_zettabytes\":false,\"zebibits_to_zebibytes\":false,\"zebibits_to_yottabits\":false,\"zebibits_to_yobibits\":false,\"zebibits_to_yottabytes\":false,\"zebibits_to_yobibytes\":false,\"zettabytes_to_bits\":false,\"zettabytes_to_nibbles\":false,\"zettabytes_to_bytes\":false,\"zettabytes_to_kilobits\":false,\"zettabytes_to_kibibits\":false,\"zettabytes_to_kibibytes\":false,\"zettabytes_to_kilobytes\":false,\"zettabytes_to_megabits\":false,\"zettabytes_to_mebibits\":false,\"zettabytes_to_megabytes\":false,\"zettabytes_to_mebibytes\":false,\"zettabytes_to_gigabits\":false,\"zettabytes_to_gibibits\":false,\"zettabytes_to_gigabytes\":false,\"zettabytes_to_gibibytes\":false,\"zettabytes_to_terabits\":false,\"zettabytes_to_tebibits\":false,\"zettabytes_to_terabytes\":false,\"zettabytes_to_tebibytes\":false,\"zettabytes_to_petabits\":false,\"zettabytes_to_pebibits\":false,\"zettabytes_to_petabytes\":false,\"zettabytes_to_pebibytes\":false,\"zettabytes_to_exabits\":false,\"zettabytes_to_exbibits\":false,\"zettabytes_to_exabytes\":false,\"zettabytes_to_exbibytes\":false,\"zettabytes_to_zettabits\":false,\"zettabytes_to_zebibits\":false,\"zettabytes_to_zebibytes\":false,\"zettabytes_to_yottabits\":false,\"zettabytes_to_yobibits\":false,\"zettabytes_to_yottabytes\":false,\"zettabytes_to_yobibytes\":false,\"zebibytes_to_bits\":false,\"zebibytes_to_nibbles\":false,\"zebibytes_to_bytes\":false,\"zebibytes_to_kilobits\":false,\"zebibytes_to_kibibits\":false,\"zebibytes_to_kibibytes\":false,\"zebibytes_to_kilobytes\":false,\"zebibytes_to_megabits\":false,\"zebibytes_to_mebibits\":false,\"zebibytes_to_megabytes\":false,\"zebibytes_to_mebibytes\":false,\"zebibytes_to_gigabits\":false,\"zebibytes_to_gibibits\":false,\"zebibytes_to_gigabytes\":false,\"zebibytes_to_gibibytes\":false,\"zebibytes_to_terabits\":false,\"zebibytes_to_tebibits\":false,\"zebibytes_to_terabytes\":false,\"zebibytes_to_tebibytes\":false,\"zebibytes_to_petabits\":false,\"zebibytes_to_pebibits\":false,\"zebibytes_to_petabytes\":false,\"zebibytes_to_pebibytes\":false,\"zebibytes_to_exabits\":false,\"zebibytes_to_exbibits\":false,\"zebibytes_to_exabytes\":false,\"zebibytes_to_exbibytes\":false,\"zebibytes_to_zettabits\":false,\"zebibytes_to_zebibits\":false,\"zebibytes_to_zettabytes\":false,\"zebibytes_to_yottabits\":false,\"zebibytes_to_yobibits\":false,\"zebibytes_to_yottabytes\":false,\"zebibytes_to_yobibytes\":false,\"yottabits_to_bits\":false,\"yottabits_to_nibbles\":false,\"yottabits_to_bytes\":false,\"yottabits_to_kilobits\":false,\"yottabits_to_kibibits\":false,\"yottabits_to_kibibytes\":false,\"yottabits_to_kilobytes\":false,\"yottabits_to_megabits\":false,\"yottabits_to_mebibits\":false,\"yottabits_to_megabytes\":false,\"yottabits_to_mebibytes\":false,\"yottabits_to_gigabits\":false,\"yottabits_to_gibibits\":false,\"yottabits_to_gigabytes\":false,\"yottabits_to_gibibytes\":false,\"yottabits_to_terabits\":false,\"yottabits_to_tebibits\":false,\"yottabits_to_terabytes\":false,\"yottabits_to_tebibytes\":false,\"yottabits_to_petabits\":false,\"yottabits_to_pebibits\":false,\"yottabits_to_petabytes\":false,\"yottabits_to_pebibytes\":false,\"yottabits_to_exabits\":false,\"yottabits_to_exbibits\":false,\"yottabits_to_exabytes\":false,\"yottabits_to_exbibytes\":false,\"yottabits_to_zettabits\":false,\"yottabits_to_zebibits\":false,\"yottabits_to_zettabytes\":false,\"yottabits_to_zebibytes\":false,\"yottabits_to_yobibits\":false,\"yottabits_to_yottabytes\":false,\"yottabits_to_yobibytes\":false,\"yobibits_to_bits\":false,\"yobibits_to_nibbles\":false,\"yobibits_to_bytes\":false,\"yobibits_to_kilobits\":false,\"yobibits_to_kibibits\":false,\"yobibits_to_kibibytes\":false,\"yobibits_to_kilobytes\":false,\"yobibits_to_megabits\":false,\"yobibits_to_mebibits\":false,\"yobibits_to_megabytes\":false,\"yobibits_to_mebibytes\":false,\"yobibits_to_gigabits\":false,\"yobibits_to_gibibits\":false,\"yobibits_to_gigabytes\":false,\"yobibits_to_gibibytes\":false,\"yobibits_to_terabits\":false,\"yobibits_to_tebibits\":false,\"yobibits_to_terabytes\":false,\"yobibits_to_tebibytes\":false,\"yobibits_to_petabits\":false,\"yobibits_to_pebibits\":false,\"yobibits_to_petabytes\":false,\"yobibits_to_pebibytes\":false,\"yobibits_to_exabits\":false,\"yobibits_to_exbibits\":false,\"yobibits_to_exabytes\":false,\"yobibits_to_exbibytes\":false,\"yobibits_to_zettabits\":false,\"yobibits_to_zebibits\":false,\"yobibits_to_zettabytes\":false,\"yobibits_to_zebibytes\":false,\"yobibits_to_yottabits\":false,\"yobibits_to_yottabytes\":false,\"yobibits_to_yobibytes\":false,\"yottabytes_to_bits\":false,\"yottabytes_to_nibbles\":false,\"yottabytes_to_bytes\":false,\"yottabytes_to_kilobits\":false,\"yottabytes_to_kibibits\":false,\"yottabytes_to_kibibytes\":false,\"yottabytes_to_kilobytes\":false,\"yottabytes_to_megabits\":false,\"yottabytes_to_mebibits\":false,\"yottabytes_to_megabytes\":false,\"yottabytes_to_mebibytes\":false,\"yottabytes_to_gigabits\":false,\"yottabytes_to_gibibits\":false,\"yottabytes_to_gigabytes\":false,\"yottabytes_to_gibibytes\":false,\"yottabytes_to_terabits\":false,\"yottabytes_to_tebibits\":false,\"yottabytes_to_terabytes\":false,\"yottabytes_to_tebibytes\":false,\"yottabytes_to_petabits\":false,\"yottabytes_to_pebibits\":false,\"yottabytes_to_petabytes\":false,\"yottabytes_to_pebibytes\":false,\"yottabytes_to_exabits\":false,\"yottabytes_to_exbibits\":false,\"yottabytes_to_exabytes\":false,\"yottabytes_to_exbibytes\":false,\"yottabytes_to_zettabits\":false,\"yottabytes_to_zebibits\":false,\"yottabytes_to_zettabytes\":false,\"yottabytes_to_zebibytes\":false,\"yottabytes_to_yottabits\":false,\"yottabytes_to_yobibits\":false,\"yottabytes_to_yobibytes\":false,\"yobibytes_to_bits\":false,\"yobibytes_to_nibbles\":false,\"yobibytes_to_bytes\":false,\"yobibytes_to_kilobits\":false,\"yobibytes_to_kibibits\":false,\"yobibytes_to_kibibytes\":false,\"yobibytes_to_kilobytes\":false,\"yobibytes_to_megabits\":false,\"yobibytes_to_mebibits\":false,\"yobibytes_to_megabytes\":false,\"yobibytes_to_mebibytes\":false,\"yobibytes_to_gigabits\":false,\"yobibytes_to_gibibits\":false,\"yobibytes_to_gigabytes\":false,\"yobibytes_to_gibibytes\":false,\"yobibytes_to_terabits\":false,\"yobibytes_to_tebibits\":false,\"yobibytes_to_terabytes\":false,\"yobibytes_to_tebibytes\":false,\"yobibytes_to_petabits\":false,\"yobibytes_to_pebibits\":false,\"yobibytes_to_petabytes\":false,\"yobibytes_to_pebibytes\":false,\"yobibytes_to_exabits\":false,\"yobibytes_to_exbibits\":false,\"yobibytes_to_exabytes\":false,\"yobibytes_to_exbibytes\":false,\"yobibytes_to_zettabits\":false,\"yobibytes_to_zebibits\":false,\"yobibytes_to_zettabytes\":false,\"yobibytes_to_zebibytes\":false,\"yobibytes_to_yottabits\":false,\"yobibytes_to_yobibits\":false,\"yobibytes_to_yottabytes\":false},\"removable_branding\":false,\"exclusive_personal_api_keys\":false,\"documents_model\":null,\"documents_per_month_limit\":0,\"words_per_month_limit\":0,\"images_api\":null,\"images_per_month_limit\":0,\"transcriptions_per_month_limit\":0,\"transcriptions_file_size_limit\":0,\"chats_model\":null,\"chats_per_month_limit\":0,\"chat_messages_per_chat_limit\":0,\"chat_image_size_limit\":0,\"syntheses_api\":null,\"syntheses_per_month_limit\":0,\"synthesized_characters_per_month_limit\":0}}');
INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(19, 'plan_guest', '{\"plan_id\":\"guest\",\"name\":\"Guest\",\"description\":\"\",\"translations\":{\"english\":{\"name\":\"\",\"description\":\"\",\"price\":\"\"}},\"price\":\"Free\",\"color\":null,\"status\":1,\"settings\":{\"exclusive_personal_api_keys\":false,\"documents_model\":null,\"documents_per_month_limit\":0,\"words_per_month_limit\":0,\"images_api\":null,\"images_per_month_limit\":0,\"transcriptions_per_month_limit\":0,\"transcriptions_file_size_limit\":0,\"chats_model\":null,\"chats_per_month_limit\":0,\"chat_messages_per_chat_limit\":0,\"chat_image_size_limit\":0,\"syntheses_api\":null,\"syntheses_per_month_limit\":0,\"synthesized_characters_per_month_limit\":0,\"signatures_limit\":0,\"projects_limit\":0,\"teams_limit\":0,\"team_members_limit\":0,\"affiliate_commission_percentage\":0,\"api_is_enabled\":false,\"no_ads\":false,\"enabled_tools\":{\"dns_lookup\":true,\"ip_lookup\":true,\"reverse_ip_lookup\":true,\"ssl_lookup\":true,\"whois_lookup\":true,\"ping\":true,\"http_headers_lookup\":true,\"http2_checker\":true,\"brotli_checker\":true,\"safe_url_checker\":true,\"google_cache_checker\":true,\"url_redirect_checker\":true,\"password_strength_checker\":true,\"meta_tags_checker\":true,\"website_hosting_checker\":true,\"file_mime_type_checker\":true,\"gravatar_checker\":true,\"text_separator\":true,\"email_extractor\":true,\"url_extractor\":true,\"text_size_calculator\":true,\"duplicate_lines_remover\":true,\"text_to_speech\":true,\"idn_punnycode_converter\":true,\"case_converter\":true,\"character_counter\":true,\"list_randomizer\":true,\"reverse_words\":true,\"reverse_letters\":true,\"emojis_remover\":true,\"reverse_list\":true,\"list_alphabetizer\":true,\"upside_down_text_generator\":true,\"old_english_text_generator\":true,\"cursive_text_generator\":true,\"palindrome_checker\":true,\"base64_encoder\":true,\"base64_decoder\":true,\"base64_to_image\":true,\"image_to_base64\":true,\"url_encoder\":true,\"url_decoder\":true,\"color_converter\":true,\"binary_converter\":true,\"hex_converter\":true,\"ascii_converter\":true,\"decimal_converter\":true,\"octal_converter\":true,\"morse_converter\":true,\"number_to_words_converter\":true,\"paypal_link_generator\":true,\"signature_generator\":true,\"mailto_link_generator\":true,\"utm_link_generator\":true,\"whatsapp_link_generator\":true,\"youtube_timestamp_link_generator\":true,\"slug_generator\":true,\"lorem_ipsum_generator\":true,\"password_generator\":true,\"random_number_generator\":true,\"uuid_v4_generator\":true,\"bcrypt_generator\":true,\"md2_generator\":true,\"md4_generator\":true,\"md5_generator\":true,\"whirlpool_generator\":true,\"sha1_generator\":true,\"sha224_generator\":true,\"sha256_generator\":true,\"sha384_generator\":true,\"sha512_generator\":true,\"sha512_224_generator\":true,\"sha512_256_generator\":true,\"sha3_224_generator\":true,\"sha3_256_generator\":true,\"sha3_384_generator\":true,\"sha3_512_generator\":true,\"ripemd128_generator\":true,\"ripemd160_generator\":true,\"ripemd256_generator\":true,\"ripemd320_generator\":true,\"html_minifier\":true,\"css_minifier\":true,\"js_minifier\":true,\"json_validator_beautifier\":true,\"sql_beautifier\":true,\"html_entity_converter\":true,\"bbcode_to_html\":true,\"markdown_to_html\":true,\"html_tags_remover\":true,\"user_agent_parser\":true,\"url_parser\":true,\"image_optimizer\":true,\"png_to_jpg\":true,\"png_to_bmp\":true,\"png_to_ico\":true,\"png_to_gif\":true,\"png_to_webp\":true,\"png_to_avif\":true,\"png_to_tiff\":true,\"png_to_tga\":true,\"jpg_to_png\":true,\"jpg_to_bmp\":true,\"jpg_to_ico\":true,\"jpg_to_gif\":true,\"jpg_to_webp\":true,\"jpg_to_avif\":true,\"jpg_to_tiff\":true,\"jpg_to_tga\":true,\"bmp_to_png\":true,\"bmp_to_jpg\":true,\"bmp_to_ico\":true,\"bmp_to_gif\":true,\"bmp_to_webp\":true,\"bmp_to_avif\":true,\"bmp_to_tiff\":true,\"bmp_to_tga\":true,\"ico_to_png\":true,\"ico_to_jpg\":true,\"ico_to_bmp\":true,\"ico_to_gif\":true,\"ico_to_webp\":true,\"ico_to_avif\":true,\"ico_to_tiff\":true,\"ico_to_tga\":true,\"gif_to_png\":true,\"gif_to_jpg\":true,\"gif_to_bmp\":true,\"gif_to_ico\":true,\"gif_to_webp\":true,\"gif_to_avif\":true,\"gif_to_tiff\":true,\"gif_to_tga\":true,\"webp_to_png\":true,\"webp_to_jpg\":true,\"webp_to_bmp\":true,\"webp_to_ico\":true,\"webp_to_gif\":true,\"webp_to_avif\":true,\"webp_to_tiff\":true,\"webp_to_tga\":true,\"heic_to_png\":true,\"heic_to_jpg\":true,\"heic_to_bmp\":true,\"heic_to_ico\":true,\"heic_to_gif\":true,\"heic_to_webp\":true,\"heic_to_avif\":true,\"heic_to_tiff\":true,\"heic_to_tga\":true,\"avif_to_png\":true,\"avif_to_jpg\":true,\"avif_to_bmp\":true,\"avif_to_ico\":true,\"avif_to_gif\":true,\"avif_to_webp\":true,\"avif_to_tiff\":true,\"avif_to_tga\":true,\"tiff_to_png\":true,\"tiff_to_jpg\":true,\"tiff_to_bmp\":true,\"tiff_to_ico\":true,\"tiff_to_gif\":true,\"tiff_to_webp\":true,\"tiff_to_avif\":true,\"tiff_to_tga\":true,\"youtube_thumbnail_downloader\":true,\"qr_code_reader\":false,\"barcode_reader\":false,\"exif_reader\":false,\"color_picker\":false,\"hex_to_hexa\":false,\"hex_to_rgb\":false,\"hex_to_rgba\":false,\"hex_to_hsv\":false,\"hex_to_hsl\":false,\"hex_to_hsla\":false,\"hexa_to_hex\":false,\"hexa_to_rgb\":false,\"hexa_to_rgba\":false,\"hexa_to_hsv\":false,\"hexa_to_hsl\":false,\"hexa_to_hsla\":false,\"rgb_to_hex\":false,\"rgb_to_hexa\":false,\"rgb_to_rgba\":false,\"rgb_to_hsv\":false,\"rgb_to_hsl\":false,\"rgb_to_hsla\":false,\"rgba_to_hex\":false,\"rgba_to_hexa\":false,\"rgba_to_rgb\":false,\"rgba_to_hsv\":false,\"rgba_to_hsl\":false,\"rgba_to_hsla\":false,\"hsv_to_hex\":false,\"hsv_to_hexa\":false,\"hsv_to_rgb\":false,\"hsv_to_rgba\":false,\"hsv_to_hsl\":false,\"hsv_to_hsla\":false,\"hsl_to_hex\":false,\"hsl_to_hexa\":false,\"hsl_to_rgb\":false,\"hsl_to_rgba\":false,\"hsl_to_hsv\":false,\"hsl_to_hsla\":false,\"hsla_to_hex\":false,\"hsla_to_hexa\":false,\"hsla_to_rgb\":false,\"hsla_to_rgba\":false,\"hsla_to_hsv\":false,\"hsla_to_hsl\":false,\"celsius_to_fahrenheit\":true,\"celsius_to_kelvin\":true,\"fahrenheit_to_celsius\":true,\"fahrenheit_to_kelvin\":true,\"kelvin_to_celsius\":true,\"kelvin_to_fahrenheit\":true,\"miles_per_hour_to_kilometers_per_hour\":true,\"kilometers_per_hour_to_miles_per_hour\":true,\"number_to_roman_numerals\":true,\"roman_numerals_to_number\":true,\"unix_timestamp_to_date\":true,\"date_to_unix_timestamp\":true,\"seconds_to_milliseconds\":true,\"seconds_to_microseconds\":true,\"seconds_to_nanoseconds\":true,\"seconds_to_picoseconds\":true,\"seconds_to_minutes\":true,\"seconds_to_hours\":true,\"seconds_to_days\":true,\"seconds_to_weeks\":true,\"seconds_to_months\":true,\"seconds_to_years\":true,\"milliseconds_to_seconds\":true,\"milliseconds_to_microseconds\":true,\"milliseconds_to_nanoseconds\":true,\"milliseconds_to_picoseconds\":true,\"milliseconds_to_minutes\":true,\"milliseconds_to_hours\":true,\"milliseconds_to_days\":true,\"milliseconds_to_weeks\":true,\"milliseconds_to_months\":true,\"milliseconds_to_years\":true,\"microseconds_to_seconds\":true,\"microseconds_to_milliseconds\":true,\"microseconds_to_nanoseconds\":true,\"microseconds_to_picoseconds\":true,\"microseconds_to_minutes\":true,\"microseconds_to_hours\":true,\"microseconds_to_days\":true,\"microseconds_to_weeks\":true,\"microseconds_to_months\":true,\"microseconds_to_years\":true,\"nanoseconds_to_seconds\":true,\"nanoseconds_to_milliseconds\":true,\"nanoseconds_to_microseconds\":true,\"nanoseconds_to_picoseconds\":true,\"nanoseconds_to_minutes\":true,\"nanoseconds_to_hours\":true,\"nanoseconds_to_days\":true,\"nanoseconds_to_weeks\":true,\"nanoseconds_to_months\":true,\"nanoseconds_to_years\":true,\"picoseconds_to_seconds\":true,\"picoseconds_to_milliseconds\":true,\"picoseconds_to_microseconds\":true,\"picoseconds_to_nanoseconds\":true,\"picoseconds_to_minutes\":true,\"picoseconds_to_hours\":true,\"picoseconds_to_days\":true,\"picoseconds_to_weeks\":true,\"picoseconds_to_months\":true,\"picoseconds_to_years\":true,\"minutes_to_seconds\":true,\"minutes_to_milliseconds\":true,\"minutes_to_microseconds\":true,\"minutes_to_nanoseconds\":true,\"minutes_to_picoseconds\":true,\"minutes_to_hours\":true,\"minutes_to_days\":true,\"minutes_to_weeks\":true,\"minutes_to_months\":true,\"minutes_to_years\":true,\"hours_to_seconds\":true,\"hours_to_milliseconds\":true,\"hours_to_microseconds\":true,\"hours_to_nanoseconds\":true,\"hours_to_picoseconds\":true,\"hours_to_minutes\":true,\"hours_to_days\":true,\"hours_to_weeks\":true,\"hours_to_months\":true,\"hours_to_years\":true,\"days_to_seconds\":true,\"days_to_milliseconds\":true,\"days_to_microseconds\":true,\"days_to_nanoseconds\":true,\"days_to_picoseconds\":true,\"days_to_minutes\":true,\"days_to_hours\":true,\"days_to_weeks\":true,\"days_to_months\":true,\"days_to_years\":true,\"weeks_to_seconds\":true,\"weeks_to_milliseconds\":true,\"weeks_to_microseconds\":true,\"weeks_to_nanoseconds\":true,\"weeks_to_picoseconds\":true,\"weeks_to_minutes\":true,\"weeks_to_hours\":true,\"weeks_to_days\":true,\"weeks_to_months\":true,\"weeks_to_years\":true,\"months_to_seconds\":true,\"months_to_milliseconds\":true,\"months_to_microseconds\":true,\"months_to_nanoseconds\":true,\"months_to_picoseconds\":true,\"months_to_minutes\":true,\"months_to_hours\":true,\"months_to_days\":true,\"months_to_weeks\":true,\"months_to_years\":true,\"years_to_seconds\":true,\"years_to_milliseconds\":true,\"years_to_microseconds\":true,\"years_to_nanoseconds\":true,\"years_to_picoseconds\":true,\"years_to_minutes\":true,\"years_to_hours\":true,\"years_to_days\":true,\"years_to_weeks\":true,\"years_to_months\":true,\"bits_to_nibbles\":true,\"bits_to_bytes\":true,\"bits_to_kilobits\":true,\"bits_to_kibibits\":true,\"bits_to_kibibytes\":true,\"bits_to_kilobytes\":true,\"bits_to_megabits\":true,\"bits_to_mebibits\":true,\"bits_to_megabytes\":true,\"bits_to_mebibytes\":true,\"bits_to_gigabits\":true,\"bits_to_gibibits\":true,\"bits_to_gigabytes\":true,\"bits_to_gibibytes\":true,\"bits_to_terabits\":true,\"bits_to_tebibits\":true,\"bits_to_terabytes\":true,\"bits_to_tebibytes\":true,\"bits_to_petabits\":true,\"bits_to_pebibits\":true,\"bits_to_petabytes\":true,\"bits_to_pebibytes\":true,\"bits_to_exabits\":true,\"bits_to_exbibits\":true,\"bits_to_exabytes\":true,\"bits_to_exbibytes\":true,\"bits_to_zettabits\":true,\"bits_to_zebibits\":true,\"bits_to_zettabytes\":true,\"bits_to_zebibytes\":true,\"bits_to_yottabits\":true,\"bits_to_yobibits\":true,\"bits_to_yottabytes\":true,\"bits_to_yobibytes\":true,\"nibbles_to_bits\":true,\"nibbles_to_bytes\":true,\"nibbles_to_kilobits\":true,\"nibbles_to_kibibits\":true,\"nibbles_to_kibibytes\":true,\"nibbles_to_kilobytes\":true,\"nibbles_to_megabits\":true,\"nibbles_to_mebibits\":true,\"nibbles_to_megabytes\":true,\"nibbles_to_mebibytes\":true,\"nibbles_to_gigabits\":true,\"nibbles_to_gibibits\":true,\"nibbles_to_gigabytes\":true,\"nibbles_to_gibibytes\":true,\"nibbles_to_terabits\":true,\"nibbles_to_tebibits\":true,\"nibbles_to_terabytes\":true,\"nibbles_to_tebibytes\":true,\"nibbles_to_petabits\":true,\"nibbles_to_pebibits\":true,\"nibbles_to_petabytes\":true,\"nibbles_to_pebibytes\":true,\"nibbles_to_exabits\":true,\"nibbles_to_exbibits\":true,\"nibbles_to_exabytes\":true,\"nibbles_to_exbibytes\":true,\"nibbles_to_zettabits\":true,\"nibbles_to_zebibits\":true,\"nibbles_to_zettabytes\":true,\"nibbles_to_zebibytes\":true,\"nibbles_to_yottabits\":true,\"nibbles_to_yobibits\":true,\"nibbles_to_yottabytes\":true,\"nibbles_to_yobibytes\":true,\"bytes_to_bits\":true,\"bytes_to_nibbles\":true,\"bytes_to_kilobits\":true,\"bytes_to_kibibits\":true,\"bytes_to_kibibytes\":true,\"bytes_to_kilobytes\":true,\"bytes_to_megabits\":true,\"bytes_to_mebibits\":true,\"bytes_to_megabytes\":true,\"bytes_to_mebibytes\":true,\"bytes_to_gigabits\":true,\"bytes_to_gibibits\":true,\"bytes_to_gigabytes\":true,\"bytes_to_gibibytes\":true,\"bytes_to_terabits\":true,\"bytes_to_tebibits\":true,\"bytes_to_terabytes\":true,\"bytes_to_tebibytes\":true,\"bytes_to_petabits\":true,\"bytes_to_pebibits\":true,\"bytes_to_petabytes\":true,\"bytes_to_pebibytes\":true,\"bytes_to_exabits\":true,\"bytes_to_exbibits\":true,\"bytes_to_exabytes\":true,\"bytes_to_exbibytes\":true,\"bytes_to_zettabits\":true,\"bytes_to_zebibits\":true,\"bytes_to_zettabytes\":true,\"bytes_to_zebibytes\":true,\"bytes_to_yottabits\":true,\"bytes_to_yobibits\":true,\"bytes_to_yottabytes\":true,\"bytes_to_yobibytes\":true,\"kilobits_to_bits\":true,\"kilobits_to_nibbles\":true,\"kilobits_to_bytes\":true,\"kilobits_to_kibibits\":true,\"kilobits_to_kibibytes\":true,\"kilobits_to_kilobytes\":true,\"kilobits_to_megabits\":true,\"kilobits_to_mebibits\":true,\"kilobits_to_megabytes\":true,\"kilobits_to_mebibytes\":true,\"kilobits_to_gigabits\":true,\"kilobits_to_gibibits\":true,\"kilobits_to_gigabytes\":true,\"kilobits_to_gibibytes\":true,\"kilobits_to_terabits\":true,\"kilobits_to_tebibits\":true,\"kilobits_to_terabytes\":true,\"kilobits_to_tebibytes\":true,\"kilobits_to_petabits\":true,\"kilobits_to_pebibits\":true,\"kilobits_to_petabytes\":true,\"kilobits_to_pebibytes\":true,\"kilobits_to_exabits\":true,\"kilobits_to_exbibits\":true,\"kilobits_to_exabytes\":true,\"kilobits_to_exbibytes\":true,\"kilobits_to_zettabits\":true,\"kilobits_to_zebibits\":true,\"kilobits_to_zettabytes\":true,\"kilobits_to_zebibytes\":true,\"kilobits_to_yottabits\":true,\"kilobits_to_yobibits\":true,\"kilobits_to_yottabytes\":true,\"kilobits_to_yobibytes\":true,\"kibibits_to_bits\":true,\"kibibits_to_nibbles\":true,\"kibibits_to_bytes\":true,\"kibibits_to_kilobits\":true,\"kibibits_to_kibibytes\":true,\"kibibits_to_kilobytes\":true,\"kibibits_to_megabits\":true,\"kibibits_to_mebibits\":true,\"kibibits_to_megabytes\":true,\"kibibits_to_mebibytes\":true,\"kibibits_to_gigabits\":true,\"kibibits_to_gibibits\":true,\"kibibits_to_gigabytes\":true,\"kibibits_to_gibibytes\":true,\"kibibits_to_terabits\":true,\"kibibits_to_tebibits\":true,\"kibibits_to_terabytes\":true,\"kibibits_to_tebibytes\":true,\"kibibits_to_petabits\":true,\"kibibits_to_pebibits\":true,\"kibibits_to_petabytes\":true,\"kibibits_to_pebibytes\":true,\"kibibits_to_exabits\":true,\"kibibits_to_exbibits\":true,\"kibibits_to_exabytes\":true,\"kibibits_to_exbibytes\":true,\"kibibits_to_zettabits\":true,\"kibibits_to_zebibits\":true,\"kibibits_to_zettabytes\":true,\"kibibits_to_zebibytes\":true,\"kibibits_to_yottabits\":true,\"kibibits_to_yobibits\":true,\"kibibits_to_yottabytes\":true,\"kibibits_to_yobibytes\":true,\"kibibytes_to_bits\":true,\"kibibytes_to_nibbles\":true,\"kibibytes_to_bytes\":true,\"kibibytes_to_kilobits\":true,\"kibibytes_to_kibibits\":true,\"kibibytes_to_kilobytes\":true,\"kibibytes_to_megabits\":true,\"kibibytes_to_mebibits\":true,\"kibibytes_to_megabytes\":true,\"kibibytes_to_mebibytes\":true,\"kibibytes_to_gigabits\":true,\"kibibytes_to_gibibits\":true,\"kibibytes_to_gigabytes\":true,\"kibibytes_to_gibibytes\":true,\"kibibytes_to_terabits\":true,\"kibibytes_to_tebibits\":true,\"kibibytes_to_terabytes\":true,\"kibibytes_to_tebibytes\":true,\"kibibytes_to_petabits\":true,\"kibibytes_to_pebibits\":true,\"kibibytes_to_petabytes\":true,\"kibibytes_to_pebibytes\":true,\"kibibytes_to_exabits\":true,\"kibibytes_to_exbibits\":true,\"kibibytes_to_exabytes\":true,\"kibibytes_to_exbibytes\":true,\"kibibytes_to_zettabits\":true,\"kibibytes_to_zebibits\":true,\"kibibytes_to_zettabytes\":true,\"kibibytes_to_zebibytes\":true,\"kibibytes_to_yottabits\":true,\"kibibytes_to_yobibits\":true,\"kibibytes_to_yottabytes\":true,\"kibibytes_to_yobibytes\":true,\"kilobytes_to_bits\":true,\"kilobytes_to_nibbles\":true,\"kilobytes_to_bytes\":true,\"kilobytes_to_kilobits\":true,\"kilobytes_to_kibibits\":true,\"kilobytes_to_kibibytes\":true,\"kilobytes_to_megabits\":true,\"kilobytes_to_mebibits\":true,\"kilobytes_to_megabytes\":true,\"kilobytes_to_mebibytes\":true,\"kilobytes_to_gigabits\":true,\"kilobytes_to_gibibits\":true,\"kilobytes_to_gigabytes\":true,\"kilobytes_to_gibibytes\":true,\"kilobytes_to_terabits\":true,\"kilobytes_to_tebibits\":true,\"kilobytes_to_terabytes\":true,\"kilobytes_to_tebibytes\":true,\"kilobytes_to_petabits\":true,\"kilobytes_to_pebibits\":true,\"kilobytes_to_petabytes\":true,\"kilobytes_to_pebibytes\":true,\"kilobytes_to_exabits\":true,\"kilobytes_to_exbibits\":true,\"kilobytes_to_exabytes\":true,\"kilobytes_to_exbibytes\":true,\"kilobytes_to_zettabits\":true,\"kilobytes_to_zebibits\":true,\"kilobytes_to_zettabytes\":true,\"kilobytes_to_zebibytes\":true,\"kilobytes_to_yottabits\":true,\"kilobytes_to_yobibits\":true,\"kilobytes_to_yottabytes\":true,\"kilobytes_to_yobibytes\":true,\"megabits_to_bits\":true,\"megabits_to_nibbles\":true,\"megabits_to_bytes\":true,\"megabits_to_kilobits\":true,\"megabits_to_kibibits\":true,\"megabits_to_kibibytes\":true,\"megabits_to_kilobytes\":true,\"megabits_to_mebibits\":true,\"megabits_to_megabytes\":true,\"megabits_to_mebibytes\":true,\"megabits_to_gigabits\":true,\"megabits_to_gibibits\":true,\"megabits_to_gigabytes\":true,\"megabits_to_gibibytes\":true,\"megabits_to_terabits\":true,\"megabits_to_tebibits\":true,\"megabits_to_terabytes\":true,\"megabits_to_tebibytes\":true,\"megabits_to_petabits\":true,\"megabits_to_pebibits\":true,\"megabits_to_petabytes\":true,\"megabits_to_pebibytes\":true,\"megabits_to_exabits\":true,\"megabits_to_exbibits\":true,\"megabits_to_exabytes\":true,\"megabits_to_exbibytes\":true,\"megabits_to_zettabits\":true,\"megabits_to_zebibits\":true,\"megabits_to_zettabytes\":true,\"megabits_to_zebibytes\":true,\"megabits_to_yottabits\":true,\"megabits_to_yobibits\":true,\"megabits_to_yottabytes\":true,\"megabits_to_yobibytes\":true,\"mebibits_to_bits\":true,\"mebibits_to_nibbles\":true,\"mebibits_to_bytes\":true,\"mebibits_to_kilobits\":true,\"mebibits_to_kibibits\":true,\"mebibits_to_kibibytes\":true,\"mebibits_to_kilobytes\":true,\"mebibits_to_megabits\":true,\"mebibits_to_megabytes\":true,\"mebibits_to_mebibytes\":true,\"mebibits_to_gigabits\":true,\"mebibits_to_gibibits\":true,\"mebibits_to_gigabytes\":true,\"mebibits_to_gibibytes\":true,\"mebibits_to_terabits\":true,\"mebibits_to_tebibits\":true,\"mebibits_to_terabytes\":true,\"mebibits_to_tebibytes\":true,\"mebibits_to_petabits\":true,\"mebibits_to_pebibits\":true,\"mebibits_to_petabytes\":true,\"mebibits_to_pebibytes\":true,\"mebibits_to_exabits\":true,\"mebibits_to_exbibits\":true,\"mebibits_to_exabytes\":true,\"mebibits_to_exbibytes\":true,\"mebibits_to_zettabits\":true,\"mebibits_to_zebibits\":true,\"mebibits_to_zettabytes\":true,\"mebibits_to_zebibytes\":true,\"mebibits_to_yottabits\":true,\"mebibits_to_yobibits\":true,\"mebibits_to_yottabytes\":true,\"mebibits_to_yobibytes\":true,\"megabytes_to_bits\":true,\"megabytes_to_nibbles\":true,\"megabytes_to_bytes\":true,\"megabytes_to_kilobits\":true,\"megabytes_to_kibibits\":true,\"megabytes_to_kibibytes\":true,\"megabytes_to_kilobytes\":true,\"megabytes_to_megabits\":true,\"megabytes_to_mebibits\":true,\"megabytes_to_mebibytes\":true,\"megabytes_to_gigabits\":true,\"megabytes_to_gibibits\":true,\"megabytes_to_gigabytes\":true,\"megabytes_to_gibibytes\":true,\"megabytes_to_terabits\":true,\"megabytes_to_tebibits\":true,\"megabytes_to_terabytes\":true,\"megabytes_to_tebibytes\":true,\"megabytes_to_petabits\":true,\"megabytes_to_pebibits\":true,\"megabytes_to_petabytes\":true,\"megabytes_to_pebibytes\":true,\"megabytes_to_exabits\":true,\"megabytes_to_exbibits\":true,\"megabytes_to_exabytes\":true,\"megabytes_to_exbibytes\":true,\"megabytes_to_zettabits\":true,\"megabytes_to_zebibits\":true,\"megabytes_to_zettabytes\":true,\"megabytes_to_zebibytes\":true,\"megabytes_to_yottabits\":true,\"megabytes_to_yobibits\":true,\"megabytes_to_yottabytes\":true,\"megabytes_to_yobibytes\":true,\"mebibytes_to_bits\":true,\"mebibytes_to_nibbles\":true,\"mebibytes_to_bytes\":true,\"mebibytes_to_kilobits\":true,\"mebibytes_to_kibibits\":true,\"mebibytes_to_kibibytes\":true,\"mebibytes_to_kilobytes\":true,\"mebibytes_to_megabits\":true,\"mebibytes_to_mebibits\":true,\"mebibytes_to_megabytes\":true,\"mebibytes_to_gigabits\":true,\"mebibytes_to_gibibits\":true,\"mebibytes_to_gigabytes\":true,\"mebibytes_to_gibibytes\":true,\"mebibytes_to_terabits\":true,\"mebibytes_to_tebibits\":true,\"mebibytes_to_terabytes\":true,\"mebibytes_to_tebibytes\":true,\"mebibytes_to_petabits\":true,\"mebibytes_to_pebibits\":true,\"mebibytes_to_petabytes\":true,\"mebibytes_to_pebibytes\":true,\"mebibytes_to_exabits\":true,\"mebibytes_to_exbibits\":true,\"mebibytes_to_exabytes\":true,\"mebibytes_to_exbibytes\":true,\"mebibytes_to_zettabits\":true,\"mebibytes_to_zebibits\":true,\"mebibytes_to_zettabytes\":true,\"mebibytes_to_zebibytes\":true,\"mebibytes_to_yottabits\":true,\"mebibytes_to_yobibits\":true,\"mebibytes_to_yottabytes\":true,\"mebibytes_to_yobibytes\":true,\"gigabits_to_bits\":true,\"gigabits_to_nibbles\":true,\"gigabits_to_bytes\":true,\"gigabits_to_kilobits\":true,\"gigabits_to_kibibits\":true,\"gigabits_to_kibibytes\":true,\"gigabits_to_kilobytes\":true,\"gigabits_to_megabits\":true,\"gigabits_to_mebibits\":true,\"gigabits_to_megabytes\":true,\"gigabits_to_mebibytes\":true,\"gigabits_to_gibibits\":true,\"gigabits_to_gigabytes\":true,\"gigabits_to_gibibytes\":true,\"gigabits_to_terabits\":true,\"gigabits_to_tebibits\":true,\"gigabits_to_terabytes\":true,\"gigabits_to_tebibytes\":true,\"gigabits_to_petabits\":true,\"gigabits_to_pebibits\":true,\"gigabits_to_petabytes\":true,\"gigabits_to_pebibytes\":true,\"gigabits_to_exabits\":true,\"gigabits_to_exbibits\":true,\"gigabits_to_exabytes\":true,\"gigabits_to_exbibytes\":true,\"gigabits_to_zettabits\":true,\"gigabits_to_zebibits\":true,\"gigabits_to_zettabytes\":true,\"gigabits_to_zebibytes\":true,\"gigabits_to_yottabits\":true,\"gigabits_to_yobibits\":true,\"gigabits_to_yottabytes\":true,\"gigabits_to_yobibytes\":true,\"gibibits_to_bits\":true,\"gibibits_to_nibbles\":true,\"gibibits_to_bytes\":true,\"gibibits_to_kilobits\":true,\"gibibits_to_kibibits\":true,\"gibibits_to_kibibytes\":true,\"gibibits_to_kilobytes\":true,\"gibibits_to_megabits\":true,\"gibibits_to_mebibits\":true,\"gibibits_to_megabytes\":true,\"gibibits_to_mebibytes\":true,\"gibibits_to_gigabits\":true,\"gibibits_to_gigabytes\":true,\"gibibits_to_gibibytes\":true,\"gibibits_to_terabits\":true,\"gibibits_to_tebibits\":true,\"gibibits_to_terabytes\":true,\"gibibits_to_tebibytes\":true,\"gibibits_to_petabits\":true,\"gibibits_to_pebibits\":true,\"gibibits_to_petabytes\":true,\"gibibits_to_pebibytes\":true,\"gibibits_to_exabits\":true,\"gibibits_to_exbibits\":true,\"gibibits_to_exabytes\":true,\"gibibits_to_exbibytes\":true,\"gibibits_to_zettabits\":true,\"gibibits_to_zebibits\":true,\"gibibits_to_zettabytes\":true,\"gibibits_to_zebibytes\":true,\"gibibits_to_yottabits\":true,\"gibibits_to_yobibits\":true,\"gibibits_to_yottabytes\":true,\"gibibits_to_yobibytes\":true,\"gigabytes_to_bits\":true,\"gigabytes_to_nibbles\":true,\"gigabytes_to_bytes\":true,\"gigabytes_to_kilobits\":true,\"gigabytes_to_kibibits\":true,\"gigabytes_to_kibibytes\":true,\"gigabytes_to_kilobytes\":true,\"gigabytes_to_megabits\":true,\"gigabytes_to_mebibits\":true,\"gigabytes_to_megabytes\":true,\"gigabytes_to_mebibytes\":true,\"gigabytes_to_gigabits\":true,\"gigabytes_to_gibibits\":true,\"gigabytes_to_gibibytes\":true,\"gigabytes_to_terabits\":true,\"gigabytes_to_tebibits\":true,\"gigabytes_to_terabytes\":true,\"gigabytes_to_tebibytes\":true,\"gigabytes_to_petabits\":true,\"gigabytes_to_pebibits\":true,\"gigabytes_to_petabytes\":true,\"gigabytes_to_pebibytes\":true,\"gigabytes_to_exabits\":true,\"gigabytes_to_exbibits\":true,\"gigabytes_to_exabytes\":true,\"gigabytes_to_exbibytes\":true,\"gigabytes_to_zettabits\":true,\"gigabytes_to_zebibits\":true,\"gigabytes_to_zettabytes\":true,\"gigabytes_to_zebibytes\":true,\"gigabytes_to_yottabits\":true,\"gigabytes_to_yobibits\":true,\"gigabytes_to_yottabytes\":true,\"gigabytes_to_yobibytes\":true,\"gibibytes_to_bits\":true,\"gibibytes_to_nibbles\":true,\"gibibytes_to_bytes\":true,\"gibibytes_to_kilobits\":true,\"gibibytes_to_kibibits\":true,\"gibibytes_to_kibibytes\":true,\"gibibytes_to_kilobytes\":true,\"gibibytes_to_megabits\":true,\"gibibytes_to_mebibits\":true,\"gibibytes_to_megabytes\":true,\"gibibytes_to_mebibytes\":true,\"gibibytes_to_gigabits\":true,\"gibibytes_to_gibibits\":true,\"gibibytes_to_gigabytes\":true,\"gibibytes_to_terabits\":true,\"gibibytes_to_tebibits\":true,\"gibibytes_to_terabytes\":true,\"gibibytes_to_tebibytes\":true,\"gibibytes_to_petabits\":true,\"gibibytes_to_pebibits\":true,\"gibibytes_to_petabytes\":true,\"gibibytes_to_pebibytes\":true,\"gibibytes_to_exabits\":true,\"gibibytes_to_exbibits\":true,\"gibibytes_to_exabytes\":true,\"gibibytes_to_exbibytes\":true,\"gibibytes_to_zettabits\":true,\"gibibytes_to_zebibits\":true,\"gibibytes_to_zettabytes\":true,\"gibibytes_to_zebibytes\":true,\"gibibytes_to_yottabits\":true,\"gibibytes_to_yobibits\":true,\"gibibytes_to_yottabytes\":true,\"gibibytes_to_yobibytes\":true,\"terabits_to_bits\":true,\"terabits_to_nibbles\":true,\"terabits_to_bytes\":true,\"terabits_to_kilobits\":true,\"terabits_to_kibibits\":true,\"terabits_to_kibibytes\":true,\"terabits_to_kilobytes\":true,\"terabits_to_megabits\":true,\"terabits_to_mebibits\":true,\"terabits_to_megabytes\":true,\"terabits_to_mebibytes\":true,\"terabits_to_gigabits\":true,\"terabits_to_gibibits\":true,\"terabits_to_gigabytes\":true,\"terabits_to_gibibytes\":true,\"terabits_to_tebibits\":true,\"terabits_to_terabytes\":true,\"terabits_to_tebibytes\":true,\"terabits_to_petabits\":true,\"terabits_to_pebibits\":true,\"terabits_to_petabytes\":true,\"terabits_to_pebibytes\":true,\"terabits_to_exabits\":true,\"terabits_to_exbibits\":true,\"terabits_to_exabytes\":true,\"terabits_to_exbibytes\":true,\"terabits_to_zettabits\":true,\"terabits_to_zebibits\":true,\"terabits_to_zettabytes\":true,\"terabits_to_zebibytes\":true,\"terabits_to_yottabits\":true,\"terabits_to_yobibits\":true,\"terabits_to_yottabytes\":true,\"terabits_to_yobibytes\":true,\"tebibits_to_bits\":true,\"tebibits_to_nibbles\":true,\"tebibits_to_bytes\":true,\"tebibits_to_kilobits\":true,\"tebibits_to_kibibits\":true,\"tebibits_to_kibibytes\":true,\"tebibits_to_kilobytes\":true,\"tebibits_to_megabits\":true,\"tebibits_to_mebibits\":true,\"tebibits_to_megabytes\":true,\"tebibits_to_mebibytes\":true,\"tebibits_to_gigabits\":true,\"tebibits_to_gibibits\":true,\"tebibits_to_gigabytes\":true,\"tebibits_to_gibibytes\":true,\"tebibits_to_terabits\":true,\"tebibits_to_terabytes\":true,\"tebibits_to_tebibytes\":true,\"tebibits_to_petabits\":true,\"tebibits_to_pebibits\":true,\"tebibits_to_petabytes\":true,\"tebibits_to_pebibytes\":true,\"tebibits_to_exabits\":true,\"tebibits_to_exbibits\":true,\"tebibits_to_exabytes\":true,\"tebibits_to_exbibytes\":true,\"tebibits_to_zettabits\":true,\"tebibits_to_zebibits\":true,\"tebibits_to_zettabytes\":true,\"tebibits_to_zebibytes\":true,\"tebibits_to_yottabits\":true,\"tebibits_to_yobibits\":true,\"tebibits_to_yottabytes\":true,\"tebibits_to_yobibytes\":true,\"terabytes_to_bits\":true,\"terabytes_to_nibbles\":true,\"terabytes_to_bytes\":true,\"terabytes_to_kilobits\":true,\"terabytes_to_kibibits\":true,\"terabytes_to_kibibytes\":true,\"terabytes_to_kilobytes\":true,\"terabytes_to_megabits\":true,\"terabytes_to_mebibits\":true,\"terabytes_to_megabytes\":true,\"terabytes_to_mebibytes\":true,\"terabytes_to_gigabits\":true,\"terabytes_to_gibibits\":true,\"terabytes_to_gigabytes\":true,\"terabytes_to_gibibytes\":true,\"terabytes_to_terabits\":true,\"terabytes_to_tebibits\":true,\"terabytes_to_tebibytes\":true,\"terabytes_to_petabits\":true,\"terabytes_to_pebibits\":true,\"terabytes_to_petabytes\":true,\"terabytes_to_pebibytes\":true,\"terabytes_to_exabits\":true,\"terabytes_to_exbibits\":true,\"terabytes_to_exabytes\":true,\"terabytes_to_exbibytes\":true,\"terabytes_to_zettabits\":true,\"terabytes_to_zebibits\":true,\"terabytes_to_zettabytes\":true,\"terabytes_to_zebibytes\":true,\"terabytes_to_yottabits\":true,\"terabytes_to_yobibits\":true,\"terabytes_to_yottabytes\":true,\"terabytes_to_yobibytes\":true,\"tebibytes_to_bits\":true,\"tebibytes_to_nibbles\":true,\"tebibytes_to_bytes\":true,\"tebibytes_to_kilobits\":true,\"tebibytes_to_kibibits\":true,\"tebibytes_to_kibibytes\":true,\"tebibytes_to_kilobytes\":true,\"tebibytes_to_megabits\":true,\"tebibytes_to_mebibits\":true,\"tebibytes_to_megabytes\":true,\"tebibytes_to_mebibytes\":true,\"tebibytes_to_gigabits\":true,\"tebibytes_to_gibibits\":true,\"tebibytes_to_gigabytes\":true,\"tebibytes_to_gibibytes\":true,\"tebibytes_to_terabits\":true,\"tebibytes_to_tebibits\":true,\"tebibytes_to_terabytes\":true,\"tebibytes_to_petabits\":true,\"tebibytes_to_pebibits\":true,\"tebibytes_to_petabytes\":true,\"tebibytes_to_pebibytes\":true,\"tebibytes_to_exabits\":true,\"tebibytes_to_exbibits\":true,\"tebibytes_to_exabytes\":true,\"tebibytes_to_exbibytes\":true,\"tebibytes_to_zettabits\":true,\"tebibytes_to_zebibits\":true,\"tebibytes_to_zettabytes\":true,\"tebibytes_to_zebibytes\":true,\"tebibytes_to_yottabits\":true,\"tebibytes_to_yobibits\":true,\"tebibytes_to_yottabytes\":true,\"tebibytes_to_yobibytes\":true,\"petabits_to_bits\":true,\"petabits_to_nibbles\":true,\"petabits_to_bytes\":true,\"petabits_to_kilobits\":true,\"petabits_to_kibibits\":true,\"petabits_to_kibibytes\":true,\"petabits_to_kilobytes\":true,\"petabits_to_megabits\":true,\"petabits_to_mebibits\":true,\"petabits_to_megabytes\":true,\"petabits_to_mebibytes\":true,\"petabits_to_gigabits\":true,\"petabits_to_gibibits\":true,\"petabits_to_gigabytes\":true,\"petabits_to_gibibytes\":true,\"petabits_to_terabits\":true,\"petabits_to_tebibits\":true,\"petabits_to_terabytes\":true,\"petabits_to_tebibytes\":true,\"petabits_to_pebibits\":true,\"petabits_to_petabytes\":true,\"petabits_to_pebibytes\":true,\"petabits_to_exabits\":true,\"petabits_to_exbibits\":true,\"petabits_to_exabytes\":true,\"petabits_to_exbibytes\":true,\"petabits_to_zettabits\":true,\"petabits_to_zebibits\":true,\"petabits_to_zettabytes\":true,\"petabits_to_zebibytes\":true,\"petabits_to_yottabits\":true,\"petabits_to_yobibits\":true,\"petabits_to_yottabytes\":true,\"petabits_to_yobibytes\":true,\"pebibits_to_bits\":true,\"pebibits_to_nibbles\":true,\"pebibits_to_bytes\":true,\"pebibits_to_kilobits\":true,\"pebibits_to_kibibits\":true,\"pebibits_to_kibibytes\":true,\"pebibits_to_kilobytes\":true,\"pebibits_to_megabits\":true,\"pebibits_to_mebibits\":true,\"pebibits_to_megabytes\":true,\"pebibits_to_mebibytes\":true,\"pebibits_to_gigabits\":true,\"pebibits_to_gibibits\":true,\"pebibits_to_gigabytes\":true,\"pebibits_to_gibibytes\":true,\"pebibits_to_terabits\":true,\"pebibits_to_tebibits\":true,\"pebibits_to_terabytes\":true,\"pebibits_to_tebibytes\":true,\"pebibits_to_petabits\":true,\"pebibits_to_petabytes\":true,\"pebibits_to_pebibytes\":true,\"pebibits_to_exabits\":false,\"pebibits_to_exbibits\":false,\"pebibits_to_exabytes\":false,\"pebibits_to_exbibytes\":false,\"pebibits_to_zettabits\":false,\"pebibits_to_zebibits\":false,\"pebibits_to_zettabytes\":false,\"pebibits_to_zebibytes\":false,\"pebibits_to_yottabits\":false,\"pebibits_to_yobibits\":false,\"pebibits_to_yottabytes\":false,\"pebibits_to_yobibytes\":false,\"petabytes_to_bits\":false,\"petabytes_to_nibbles\":false,\"petabytes_to_bytes\":false,\"petabytes_to_kilobits\":false,\"petabytes_to_kibibits\":false,\"petabytes_to_kibibytes\":false,\"petabytes_to_kilobytes\":false,\"petabytes_to_megabits\":false,\"petabytes_to_mebibits\":false,\"petabytes_to_megabytes\":false,\"petabytes_to_mebibytes\":false,\"petabytes_to_gigabits\":false,\"petabytes_to_gibibits\":false,\"petabytes_to_gigabytes\":false,\"petabytes_to_gibibytes\":false,\"petabytes_to_terabits\":false,\"petabytes_to_tebibits\":false,\"petabytes_to_terabytes\":false,\"petabytes_to_tebibytes\":false,\"petabytes_to_petabits\":false,\"petabytes_to_pebibits\":false,\"petabytes_to_pebibytes\":false,\"petabytes_to_exabits\":false,\"petabytes_to_exbibits\":false,\"petabytes_to_exabytes\":false,\"petabytes_to_exbibytes\":false,\"petabytes_to_zettabits\":false,\"petabytes_to_zebibits\":false,\"petabytes_to_zettabytes\":false,\"petabytes_to_zebibytes\":false,\"petabytes_to_yottabits\":false,\"petabytes_to_yobibits\":false,\"petabytes_to_yottabytes\":false,\"petabytes_to_yobibytes\":false,\"pebibytes_to_bits\":false,\"pebibytes_to_nibbles\":false,\"pebibytes_to_bytes\":false,\"pebibytes_to_kilobits\":false,\"pebibytes_to_kibibits\":false,\"pebibytes_to_kibibytes\":false,\"pebibytes_to_kilobytes\":false,\"pebibytes_to_megabits\":false,\"pebibytes_to_mebibits\":false,\"pebibytes_to_megabytes\":false,\"pebibytes_to_mebibytes\":false,\"pebibytes_to_gigabits\":false,\"pebibytes_to_gibibits\":false,\"pebibytes_to_gigabytes\":false,\"pebibytes_to_gibibytes\":false,\"pebibytes_to_terabits\":false,\"pebibytes_to_tebibits\":false,\"pebibytes_to_terabytes\":false,\"pebibytes_to_tebibytes\":false,\"pebibytes_to_petabits\":false,\"pebibytes_to_pebibits\":false,\"pebibytes_to_petabytes\":false,\"pebibytes_to_exabits\":false,\"pebibytes_to_exbibits\":false,\"pebibytes_to_exabytes\":false,\"pebibytes_to_exbibytes\":false,\"pebibytes_to_zettabits\":false,\"pebibytes_to_zebibits\":false,\"pebibytes_to_zettabytes\":false,\"pebibytes_to_zebibytes\":false,\"pebibytes_to_yottabits\":false,\"pebibytes_to_yobibits\":false,\"pebibytes_to_yottabytes\":false,\"pebibytes_to_yobibytes\":false,\"exabits_to_bits\":false,\"exabits_to_nibbles\":false,\"exabits_to_bytes\":false,\"exabits_to_kilobits\":false,\"exabits_to_kibibits\":false,\"exabits_to_kibibytes\":false,\"exabits_to_kilobytes\":false,\"exabits_to_megabits\":false,\"exabits_to_mebibits\":false,\"exabits_to_megabytes\":false,\"exabits_to_mebibytes\":false,\"exabits_to_gigabits\":false,\"exabits_to_gibibits\":false,\"exabits_to_gigabytes\":false,\"exabits_to_gibibytes\":false,\"exabits_to_terabits\":false,\"exabits_to_tebibits\":false,\"exabits_to_terabytes\":false,\"exabits_to_tebibytes\":false,\"exabits_to_petabits\":false,\"exabits_to_pebibits\":false,\"exabits_to_petabytes\":false,\"exabits_to_pebibytes\":false,\"exabits_to_exbibits\":false,\"exabits_to_exabytes\":false,\"exabits_to_exbibytes\":false,\"exabits_to_zettabits\":false,\"exabits_to_zebibits\":false,\"exabits_to_zettabytes\":false,\"exabits_to_zebibytes\":false,\"exabits_to_yottabits\":false,\"exabits_to_yobibits\":false,\"exabits_to_yottabytes\":false,\"exabits_to_yobibytes\":false,\"exbibits_to_bits\":false,\"exbibits_to_nibbles\":false,\"exbibits_to_bytes\":false,\"exbibits_to_kilobits\":false,\"exbibits_to_kibibits\":false,\"exbibits_to_kibibytes\":false,\"exbibits_to_kilobytes\":false,\"exbibits_to_megabits\":false,\"exbibits_to_mebibits\":false,\"exbibits_to_megabytes\":false,\"exbibits_to_mebibytes\":false,\"exbibits_to_gigabits\":false,\"exbibits_to_gibibits\":false,\"exbibits_to_gigabytes\":false,\"exbibits_to_gibibytes\":false,\"exbibits_to_terabits\":false,\"exbibits_to_tebibits\":false,\"exbibits_to_terabytes\":false,\"exbibits_to_tebibytes\":false,\"exbibits_to_petabits\":false,\"exbibits_to_pebibits\":false,\"exbibits_to_petabytes\":false,\"exbibits_to_pebibytes\":false,\"exbibits_to_exabits\":false,\"exbibits_to_exabytes\":false,\"exbibits_to_exbibytes\":false,\"exbibits_to_zettabits\":false,\"exbibits_to_zebibits\":false,\"exbibits_to_zettabytes\":false,\"exbibits_to_zebibytes\":false,\"exbibits_to_yottabits\":false,\"exbibits_to_yobibits\":false,\"exbibits_to_yottabytes\":false,\"exbibits_to_yobibytes\":false,\"exabytes_to_bits\":false,\"exabytes_to_nibbles\":false,\"exabytes_to_bytes\":false,\"exabytes_to_kilobits\":false,\"exabytes_to_kibibits\":false,\"exabytes_to_kibibytes\":false,\"exabytes_to_kilobytes\":false,\"exabytes_to_megabits\":false,\"exabytes_to_mebibits\":false,\"exabytes_to_megabytes\":false,\"exabytes_to_mebibytes\":false,\"exabytes_to_gigabits\":false,\"exabytes_to_gibibits\":false,\"exabytes_to_gigabytes\":false,\"exabytes_to_gibibytes\":false,\"exabytes_to_terabits\":false,\"exabytes_to_tebibits\":false,\"exabytes_to_terabytes\":false,\"exabytes_to_tebibytes\":false,\"exabytes_to_petabits\":false,\"exabytes_to_pebibits\":false,\"exabytes_to_petabytes\":false,\"exabytes_to_pebibytes\":false,\"exabytes_to_exabits\":false,\"exabytes_to_exbibits\":false,\"exabytes_to_exbibytes\":false,\"exabytes_to_zettabits\":false,\"exabytes_to_zebibits\":false,\"exabytes_to_zettabytes\":false,\"exabytes_to_zebibytes\":false,\"exabytes_to_yottabits\":false,\"exabytes_to_yobibits\":false,\"exabytes_to_yottabytes\":false,\"exabytes_to_yobibytes\":false,\"exbibytes_to_bits\":false,\"exbibytes_to_nibbles\":false,\"exbibytes_to_bytes\":false,\"exbibytes_to_kilobits\":false,\"exbibytes_to_kibibits\":false,\"exbibytes_to_kibibytes\":false,\"exbibytes_to_kilobytes\":false,\"exbibytes_to_megabits\":false,\"exbibytes_to_mebibits\":false,\"exbibytes_to_megabytes\":false,\"exbibytes_to_mebibytes\":false,\"exbibytes_to_gigabits\":false,\"exbibytes_to_gibibits\":false,\"exbibytes_to_gigabytes\":false,\"exbibytes_to_gibibytes\":false,\"exbibytes_to_terabits\":false,\"exbibytes_to_tebibits\":false,\"exbibytes_to_terabytes\":false,\"exbibytes_to_tebibytes\":false,\"exbibytes_to_petabits\":false,\"exbibytes_to_pebibits\":false,\"exbibytes_to_petabytes\":false,\"exbibytes_to_pebibytes\":false,\"exbibytes_to_exabits\":false,\"exbibytes_to_exbibits\":false,\"exbibytes_to_exabytes\":false,\"exbibytes_to_zettabits\":false,\"exbibytes_to_zebibits\":false,\"exbibytes_to_zettabytes\":false,\"exbibytes_to_zebibytes\":false,\"exbibytes_to_yottabits\":false,\"exbibytes_to_yobibits\":false,\"exbibytes_to_yottabytes\":false,\"exbibytes_to_yobibytes\":false,\"zettabits_to_bits\":false,\"zettabits_to_nibbles\":false,\"zettabits_to_bytes\":false,\"zettabits_to_kilobits\":false,\"zettabits_to_kibibits\":false,\"zettabits_to_kibibytes\":false,\"zettabits_to_kilobytes\":false,\"zettabits_to_megabits\":false,\"zettabits_to_mebibits\":false,\"zettabits_to_megabytes\":false,\"zettabits_to_mebibytes\":false,\"zettabits_to_gigabits\":false,\"zettabits_to_gibibits\":false,\"zettabits_to_gigabytes\":false,\"zettabits_to_gibibytes\":false,\"zettabits_to_terabits\":false,\"zettabits_to_tebibits\":false,\"zettabits_to_terabytes\":false,\"zettabits_to_tebibytes\":false,\"zettabits_to_petabits\":false,\"zettabits_to_pebibits\":false,\"zettabits_to_petabytes\":false,\"zettabits_to_pebibytes\":false,\"zettabits_to_exabits\":false,\"zettabits_to_exbibits\":false,\"zettabits_to_exabytes\":false,\"zettabits_to_exbibytes\":false,\"zettabits_to_zebibits\":false,\"zettabits_to_zettabytes\":false,\"zettabits_to_zebibytes\":false,\"zettabits_to_yottabits\":false,\"zettabits_to_yobibits\":false,\"zettabits_to_yottabytes\":false,\"zettabits_to_yobibytes\":false,\"zebibits_to_bits\":false,\"zebibits_to_nibbles\":false,\"zebibits_to_bytes\":false,\"zebibits_to_kilobits\":false,\"zebibits_to_kibibits\":false,\"zebibits_to_kibibytes\":false,\"zebibits_to_kilobytes\":false,\"zebibits_to_megabits\":false,\"zebibits_to_mebibits\":false,\"zebibits_to_megabytes\":false,\"zebibits_to_mebibytes\":false,\"zebibits_to_gigabits\":false,\"zebibits_to_gibibits\":false,\"zebibits_to_gigabytes\":false,\"zebibits_to_gibibytes\":false,\"zebibits_to_terabits\":false,\"zebibits_to_tebibits\":false,\"zebibits_to_terabytes\":false,\"zebibits_to_tebibytes\":false,\"zebibits_to_petabits\":false,\"zebibits_to_pebibits\":false,\"zebibits_to_petabytes\":false,\"zebibits_to_pebibytes\":false,\"zebibits_to_exabits\":false,\"zebibits_to_exbibits\":false,\"zebibits_to_exabytes\":false,\"zebibits_to_exbibytes\":false,\"zebibits_to_zettabits\":false,\"zebibits_to_zettabytes\":false,\"zebibits_to_zebibytes\":false,\"zebibits_to_yottabits\":false,\"zebibits_to_yobibits\":false,\"zebibits_to_yottabytes\":false,\"zebibits_to_yobibytes\":false,\"zettabytes_to_bits\":false,\"zettabytes_to_nibbles\":false,\"zettabytes_to_bytes\":false,\"zettabytes_to_kilobits\":false,\"zettabytes_to_kibibits\":false,\"zettabytes_to_kibibytes\":false,\"zettabytes_to_kilobytes\":false,\"zettabytes_to_megabits\":false,\"zettabytes_to_mebibits\":false,\"zettabytes_to_megabytes\":false,\"zettabytes_to_mebibytes\":false,\"zettabytes_to_gigabits\":false,\"zettabytes_to_gibibits\":false,\"zettabytes_to_gigabytes\":false,\"zettabytes_to_gibibytes\":false,\"zettabytes_to_terabits\":false,\"zettabytes_to_tebibits\":false,\"zettabytes_to_terabytes\":false,\"zettabytes_to_tebibytes\":false,\"zettabytes_to_petabits\":false,\"zettabytes_to_pebibits\":false,\"zettabytes_to_petabytes\":false,\"zettabytes_to_pebibytes\":false,\"zettabytes_to_exabits\":false,\"zettabytes_to_exbibits\":false,\"zettabytes_to_exabytes\":false,\"zettabytes_to_exbibytes\":false,\"zettabytes_to_zettabits\":false,\"zettabytes_to_zebibits\":false,\"zettabytes_to_zebibytes\":false,\"zettabytes_to_yottabits\":false,\"zettabytes_to_yobibits\":false,\"zettabytes_to_yottabytes\":false,\"zettabytes_to_yobibytes\":false,\"zebibytes_to_bits\":false,\"zebibytes_to_nibbles\":false,\"zebibytes_to_bytes\":false,\"zebibytes_to_kilobits\":false,\"zebibytes_to_kibibits\":false,\"zebibytes_to_kibibytes\":false,\"zebibytes_to_kilobytes\":false,\"zebibytes_to_megabits\":false,\"zebibytes_to_mebibits\":false,\"zebibytes_to_megabytes\":false,\"zebibytes_to_mebibytes\":false,\"zebibytes_to_gigabits\":false,\"zebibytes_to_gibibits\":false,\"zebibytes_to_gigabytes\":false,\"zebibytes_to_gibibytes\":false,\"zebibytes_to_terabits\":false,\"zebibytes_to_tebibits\":false,\"zebibytes_to_terabytes\":false,\"zebibytes_to_tebibytes\":false,\"zebibytes_to_petabits\":false,\"zebibytes_to_pebibits\":false,\"zebibytes_to_petabytes\":false,\"zebibytes_to_pebibytes\":false,\"zebibytes_to_exabits\":false,\"zebibytes_to_exbibits\":false,\"zebibytes_to_exabytes\":false,\"zebibytes_to_exbibytes\":false,\"zebibytes_to_zettabits\":false,\"zebibytes_to_zebibits\":false,\"zebibytes_to_zettabytes\":false,\"zebibytes_to_yottabits\":false,\"zebibytes_to_yobibits\":false,\"zebibytes_to_yottabytes\":false,\"zebibytes_to_yobibytes\":false,\"yottabits_to_bits\":false,\"yottabits_to_nibbles\":false,\"yottabits_to_bytes\":false,\"yottabits_to_kilobits\":false,\"yottabits_to_kibibits\":false,\"yottabits_to_kibibytes\":false,\"yottabits_to_kilobytes\":false,\"yottabits_to_megabits\":false,\"yottabits_to_mebibits\":false,\"yottabits_to_megabytes\":false,\"yottabits_to_mebibytes\":false,\"yottabits_to_gigabits\":false,\"yottabits_to_gibibits\":false,\"yottabits_to_gigabytes\":false,\"yottabits_to_gibibytes\":false,\"yottabits_to_terabits\":false,\"yottabits_to_tebibits\":false,\"yottabits_to_terabytes\":false,\"yottabits_to_tebibytes\":false,\"yottabits_to_petabits\":false,\"yottabits_to_pebibits\":false,\"yottabits_to_petabytes\":false,\"yottabits_to_pebibytes\":false,\"yottabits_to_exabits\":false,\"yottabits_to_exbibits\":false,\"yottabits_to_exabytes\":false,\"yottabits_to_exbibytes\":false,\"yottabits_to_zettabits\":false,\"yottabits_to_zebibits\":false,\"yottabits_to_zettabytes\":false,\"yottabits_to_zebibytes\":false,\"yottabits_to_yobibits\":false,\"yottabits_to_yottabytes\":false,\"yottabits_to_yobibytes\":false,\"yobibits_to_bits\":false,\"yobibits_to_nibbles\":false,\"yobibits_to_bytes\":false,\"yobibits_to_kilobits\":false,\"yobibits_to_kibibits\":false,\"yobibits_to_kibibytes\":false,\"yobibits_to_kilobytes\":false,\"yobibits_to_megabits\":false,\"yobibits_to_mebibits\":false,\"yobibits_to_megabytes\":false,\"yobibits_to_mebibytes\":false,\"yobibits_to_gigabits\":false,\"yobibits_to_gibibits\":false,\"yobibits_to_gigabytes\":false,\"yobibits_to_gibibytes\":false,\"yobibits_to_terabits\":false,\"yobibits_to_tebibits\":false,\"yobibits_to_terabytes\":false,\"yobibits_to_tebibytes\":false,\"yobibits_to_petabits\":false,\"yobibits_to_pebibits\":false,\"yobibits_to_petabytes\":false,\"yobibits_to_pebibytes\":false,\"yobibits_to_exabits\":false,\"yobibits_to_exbibits\":false,\"yobibits_to_exabytes\":false,\"yobibits_to_exbibytes\":false,\"yobibits_to_zettabits\":false,\"yobibits_to_zebibits\":false,\"yobibits_to_zettabytes\":false,\"yobibits_to_zebibytes\":false,\"yobibits_to_yottabits\":false,\"yobibits_to_yottabytes\":false,\"yobibits_to_yobibytes\":false,\"yottabytes_to_bits\":false,\"yottabytes_to_nibbles\":false,\"yottabytes_to_bytes\":false,\"yottabytes_to_kilobits\":false,\"yottabytes_to_kibibits\":false,\"yottabytes_to_kibibytes\":false,\"yottabytes_to_kilobytes\":false,\"yottabytes_to_megabits\":false,\"yottabytes_to_mebibits\":false,\"yottabytes_to_megabytes\":false,\"yottabytes_to_mebibytes\":false,\"yottabytes_to_gigabits\":false,\"yottabytes_to_gibibits\":false,\"yottabytes_to_gigabytes\":false,\"yottabytes_to_gibibytes\":false,\"yottabytes_to_terabits\":false,\"yottabytes_to_tebibits\":false,\"yottabytes_to_terabytes\":false,\"yottabytes_to_tebibytes\":false,\"yottabytes_to_petabits\":false,\"yottabytes_to_pebibits\":false,\"yottabytes_to_petabytes\":false,\"yottabytes_to_pebibytes\":false,\"yottabytes_to_exabits\":false,\"yottabytes_to_exbibits\":false,\"yottabytes_to_exabytes\":false,\"yottabytes_to_exbibytes\":false,\"yottabytes_to_zettabits\":false,\"yottabytes_to_zebibits\":false,\"yottabytes_to_zettabytes\":false,\"yottabytes_to_zebibytes\":false,\"yottabytes_to_yottabits\":false,\"yottabytes_to_yobibits\":false,\"yottabytes_to_yobibytes\":false,\"yobibytes_to_bits\":false,\"yobibytes_to_nibbles\":false,\"yobibytes_to_bytes\":false,\"yobibytes_to_kilobits\":false,\"yobibytes_to_kibibits\":false,\"yobibytes_to_kibibytes\":false,\"yobibytes_to_kilobytes\":false,\"yobibytes_to_megabits\":false,\"yobibytes_to_mebibits\":false,\"yobibytes_to_megabytes\":false,\"yobibytes_to_mebibytes\":false,\"yobibytes_to_gigabits\":false,\"yobibytes_to_gibibits\":false,\"yobibytes_to_gigabytes\":false,\"yobibytes_to_gibibytes\":false,\"yobibytes_to_terabits\":false,\"yobibytes_to_tebibits\":false,\"yobibytes_to_terabytes\":false,\"yobibytes_to_tebibytes\":false,\"yobibytes_to_petabits\":false,\"yobibytes_to_pebibits\":false,\"yobibytes_to_petabytes\":false,\"yobibytes_to_pebibytes\":false,\"yobibytes_to_exabits\":false,\"yobibytes_to_exbibits\":false,\"yobibytes_to_exabytes\":false,\"yobibytes_to_exbibytes\":false,\"yobibytes_to_zettabits\":false,\"yobibytes_to_zebibits\":false,\"yobibytes_to_zettabytes\":false,\"yobibytes_to_zebibytes\":false,\"yobibytes_to_yottabits\":false,\"yobibytes_to_yobibits\":false,\"yobibytes_to_yottabytes\":false},\"removable_branding\":false}}'),
(20, 'payment', '{\"is_enabled\":false,\"type\":\"both\",\"default_payment_frequency\":\"monthly\",\"currencies\":{\"USD\":{\"code\":\"USD\",\"symbol\":\"$\",\"default_payment_processor\":\"offline_payment\"}},\"default_currency\":\"USD\",\"codes_is_enabled\":true,\"taxes_and_billing_is_enabled\":true,\"invoice_is_enabled\":true,\"user_plan_expiry_reminder\":0,\"user_plan_expiry_checker_is_enabled\":0,\"currency_exchange_api_key\":\"\"}'),
(21, 'paypal', '{\"is_enabled\":\"0\",\"mode\":\"sandbox\",\"client_id\":\"\",\"secret\":\"\"}'),
(22, 'stripe', '{\"is_enabled\":\"0\",\"publishable_key\":\"\",\"secret_key\":\"\",\"webhook_secret\":\"\"}'),
(23, 'offline_payment', '{\"is_enabled\":\"0\",\"instructions\":\"Your offline payment instructions go here..\"}'),
(24, 'coinbase', '{\"is_enabled\":false,\"api_key\":\"\",\"webhook_secret\":\"\",\"currencies\":[\"USD\"]}'),
(25, 'payu', '{\"is_enabled\":false,\"mode\":\"sandbox\",\"merchant_pos_id\":\"\",\"signature_key\":\"\",\"oauth_client_id\":\"\",\"oauth_client_secret\":\"\",\"currencies\":[\"USD\"]}'),
(26, 'iyzico', '{\"is_enabled\":false,\"mode\":\"live\",\"api_key\":\"\",\"secret_key\":\"\",\"currencies\":[\"USD\"]}'),
(27, 'paystack', '{\"is_enabled\":false,\"public_key\":\"\",\"secret_key\":\"\",\"currencies\":[\"USD\"]}'),
(28, 'razorpay', '{\"is_enabled\":false,\"key_id\":\"\",\"key_secret\":\"\",\"webhook_secret\":\"\",\"currencies\":[\"USD\"]}'),
(29, 'mollie', '{\"is_enabled\":false,\"api_key\":\"\"}'),
(30, 'yookassa', '{\"is_enabled\":false,\"shop_id\":\"\",\"secret_key\":\"\"}'),
(31, 'crypto_com', '{\"is_enabled\":false,\"publishable_key\":\"\",\"secret_key\":\"\",\"webhook_secret\":\"\"}'),
(32, 'paddle', '{\"is_enabled\":false,\"mode\":\"sandbox\",\"vendor_id\":\"\",\"api_key\":\"\",\"public_key\":\"\",\"currencies\":[\"USD\"]}'),
(33, 'mercadopago', '{\"is_enabled\":false,\"access_token\":\"\",\"currencies\":[\"USD\"]}'),
(34, 'midtrans', '{\"is_enabled\":false,\"server_key\":\"\",\"mode\":\"sandbox\",\"currencies\":[\"USD\"]}'),
(35, 'flutterwave', '{\"is_enabled\":false,\"secret_key\":\"\",\"currencies\":[\"USD\"]}'),
(36, 'smtp', '{\"from_name\":\"\",\"from\":\"\",\"host\":\"\",\"encryption\":\"tls\",\"port\":\"\",\"auth\":false,\"username\":\"\",\"password\":\"\",\"display_socials\":false,\"company_details\":\"\"}'),
(37, 'theme', '{\"light_is_enabled\": false, \"dark_is_enabled\": false}'),
(38, 'custom', '{\"head_js\":\"\",\"head_css\":\"\",\"head_js_biolink\":\"\",\"head_css_biolink\":\"\",\"head_js_splash_page\":\"\",\"head_css_splash_page\":\"\"}'),
(39, 'socials', '{\"threads\":\"\",\"youtube\":\"\",\"facebook\":\"\",\"x\":\"\",\"instagram\":\"\",\"tiktok\":\"\",\"linkedin\":\"\",\"whatsapp\":\"\",\"email\":\"\"}'),
(40, 'announcements', '{\"guests_id\":\"16e2fdd0e771da32ec9e557c491fe17d\",\"guests_content\":\"\",\"guests_text_color\":\"#ffffff\",\"guests_background_color\":\"#000000\",\"users_id\":\"16e2fdd0e771da32ec9e557c491fe17d\",\"users_content\":\"\",\"users_text_color\":\"#dbebff\",\"users_background_color\":\"#000000\"}'),
(41, 'business', '{\"brand_name\":\"SEOeTools\",\"invoice_nr_prefix\":\"INVOICE-\",\"name\":\"\",\"address\":\"\",\"city\":\"\",\"county\":\"\",\"zip\":\"\",\"country\":\"AF\",\"email\":\"\",\"phone\":\"\",\"tax_type\":\"\",\"tax_id\":\"\",\"custom_key_one\":\"\",\"custom_value_one\":\"\",\"custom_key_two\":\"\",\"custom_value_two\":\"\"}');
INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(42, 'webhooks', '{\"user_new\":\"\",\"user_delete\":\"\",\"payment_new\":\"\",\"code_redeemed\":\"\",\"contact\":\"\",\"cron_start\":\"\",\"cron_end\":\"\",\"domain_new\":\"\",\"domain_update\":\"\"}'),
(43, 'tools', '{\"extra_content_is_enabled\":true,\"share_is_enabled\":true,\"popular_widget_is_enabled\":true,\"similar_widget_is_enabled\":true,\"views_is_enabled\":true,\"available_tools\":{\"dns_lookup\":true,\"ip_lookup\":true,\"reverse_ip_lookup\":true,\"ssl_lookup\":true,\"whois_lookup\":true,\"ping\":true,\"http_headers_lookup\":true,\"http2_checker\":true,\"brotli_checker\":true,\"safe_url_checker\":true,\"google_cache_checker\":true,\"url_redirect_checker\":true,\"password_strength_checker\":true,\"meta_tags_checker\":true,\"website_hosting_checker\":true,\"file_mime_type_checker\":true,\"gravatar_checker\":true,\"text_separator\":true,\"email_extractor\":true,\"url_extractor\":true,\"text_size_calculator\":true,\"duplicate_lines_remover\":true,\"text_to_speech\":true,\"idn_punnycode_converter\":true,\"case_converter\":true,\"character_counter\":true,\"list_randomizer\":true,\"reverse_words\":true,\"reverse_letters\":true,\"emojis_remover\":true,\"reverse_list\":true,\"list_alphabetizer\":true,\"upside_down_text_generator\":true,\"old_english_text_generator\":true,\"cursive_text_generator\":true,\"palindrome_checker\":true,\"base64_encoder\":true,\"base64_decoder\":true,\"base64_to_image\":true,\"image_to_base64\":true,\"url_encoder\":true,\"url_decoder\":true,\"color_converter\":true,\"binary_converter\":true,\"hex_converter\":true,\"ascii_converter\":true,\"decimal_converter\":true,\"octal_converter\":true,\"morse_converter\":true,\"number_to_words_converter\":true,\"paypal_link_generator\":true,\"signature_generator\":true,\"mailto_link_generator\":true,\"utm_link_generator\":true,\"whatsapp_link_generator\":true,\"youtube_timestamp_link_generator\":true,\"slug_generator\":true,\"lorem_ipsum_generator\":true,\"password_generator\":true,\"random_number_generator\":true,\"uuid_v4_generator\":true,\"bcrypt_generator\":true,\"md2_generator\":true,\"md4_generator\":true,\"md5_generator\":true,\"whirlpool_generator\":true,\"sha1_generator\":true,\"sha224_generator\":true,\"sha256_generator\":true,\"sha384_generator\":true,\"sha512_generator\":true,\"sha512_224_generator\":true,\"sha512_256_generator\":true,\"sha3_224_generator\":true,\"sha3_256_generator\":true,\"sha3_384_generator\":true,\"sha3_512_generator\":true,\"ripemd128_generator\":true,\"ripemd160_generator\":true,\"ripemd256_generator\":true,\"ripemd320_generator\":true,\"html_minifier\":true,\"css_minifier\":true,\"js_minifier\":true,\"json_validator_beautifier\":true,\"sql_beautifier\":true,\"html_entity_converter\":true,\"bbcode_to_html\":true,\"markdown_to_html\":true,\"html_tags_remover\":true,\"user_agent_parser\":true,\"url_parser\":true,\"image_optimizer\":true,\"png_to_jpg\":true,\"png_to_bmp\":true,\"png_to_ico\":true,\"png_to_gif\":true,\"png_to_webp\":true,\"png_to_avif\":true,\"png_to_tiff\":true,\"png_to_tga\":true,\"jpg_to_png\":true,\"jpg_to_bmp\":true,\"jpg_to_ico\":true,\"jpg_to_gif\":true,\"jpg_to_webp\":true,\"jpg_to_avif\":true,\"jpg_to_tiff\":true,\"jpg_to_tga\":true,\"bmp_to_png\":true,\"bmp_to_jpg\":true,\"bmp_to_ico\":true,\"bmp_to_gif\":true,\"bmp_to_webp\":true,\"bmp_to_avif\":true,\"bmp_to_tiff\":true,\"bmp_to_tga\":true,\"ico_to_png\":true,\"ico_to_jpg\":true,\"ico_to_bmp\":true,\"ico_to_gif\":true,\"ico_to_webp\":true,\"ico_to_avif\":true,\"ico_to_tiff\":true,\"ico_to_tga\":true,\"gif_to_png\":true,\"gif_to_jpg\":true,\"gif_to_bmp\":true,\"gif_to_ico\":true,\"gif_to_webp\":true,\"gif_to_avif\":true,\"gif_to_tiff\":true,\"gif_to_tga\":true,\"webp_to_png\":true,\"webp_to_jpg\":true,\"webp_to_bmp\":true,\"webp_to_ico\":true,\"webp_to_gif\":true,\"webp_to_avif\":true,\"webp_to_tiff\":true,\"webp_to_tga\":true,\"heic_to_png\":true,\"heic_to_jpg\":true,\"heic_to_bmp\":true,\"heic_to_ico\":true,\"heic_to_gif\":true,\"heic_to_webp\":true,\"heic_to_avif\":true,\"heic_to_tiff\":true,\"heic_to_tga\":true,\"avif_to_png\":true,\"avif_to_jpg\":true,\"avif_to_bmp\":true,\"avif_to_ico\":true,\"avif_to_gif\":true,\"avif_to_webp\":true,\"avif_to_tiff\":true,\"avif_to_tga\":true,\"tiff_to_png\":true,\"tiff_to_jpg\":true,\"tiff_to_bmp\":true,\"tiff_to_ico\":true,\"tiff_to_gif\":true,\"tiff_to_webp\":true,\"tiff_to_avif\":true,\"tiff_to_tga\":true,\"youtube_thumbnail_downloader\":false,\"qr_code_reader\":false,\"barcode_reader\":false,\"exif_reader\":false,\"color_picker\":false,\"hex_to_hexa\":false,\"hex_to_rgb\":false,\"hex_to_rgba\":false,\"hex_to_hsv\":false,\"hex_to_hsl\":false,\"hex_to_hsla\":false,\"hexa_to_hex\":false,\"hexa_to_rgb\":false,\"hexa_to_rgba\":false,\"hexa_to_hsv\":false,\"hexa_to_hsl\":false,\"hexa_to_hsla\":false,\"rgb_to_hex\":false,\"rgb_to_hexa\":false,\"rgb_to_rgba\":false,\"rgb_to_hsv\":false,\"rgb_to_hsl\":false,\"rgb_to_hsla\":false,\"rgba_to_hex\":false,\"rgba_to_hexa\":false,\"rgba_to_rgb\":false,\"rgba_to_hsv\":false,\"rgba_to_hsl\":false,\"rgba_to_hsla\":false,\"hsv_to_hex\":false,\"hsv_to_hexa\":false,\"hsv_to_rgb\":false,\"hsv_to_rgba\":false,\"hsv_to_hsl\":false,\"hsv_to_hsla\":false,\"hsl_to_hex\":false,\"hsl_to_hexa\":false,\"hsl_to_rgb\":false,\"hsl_to_rgba\":false,\"hsl_to_hsv\":false,\"hsl_to_hsla\":false,\"hsla_to_hex\":false,\"hsla_to_hexa\":false,\"hsla_to_rgb\":false,\"hsla_to_rgba\":false,\"hsla_to_hsv\":false,\"hsla_to_hsl\":false,\"celsius_to_fahrenheit\":true,\"celsius_to_kelvin\":true,\"fahrenheit_to_celsius\":true,\"fahrenheit_to_kelvin\":true,\"kelvin_to_celsius\":true,\"kelvin_to_fahrenheit\":true,\"miles_per_hour_to_kilometers_per_hour\":true,\"kilometers_per_hour_to_miles_per_hour\":true,\"number_to_roman_numerals\":true,\"roman_numerals_to_number\":true,\"unix_timestamp_to_date\":true,\"date_to_unix_timestamp\":true,\"seconds_to_milliseconds\":true,\"seconds_to_microseconds\":true,\"seconds_to_nanoseconds\":true,\"seconds_to_picoseconds\":true,\"seconds_to_minutes\":true,\"seconds_to_hours\":true,\"seconds_to_days\":true,\"seconds_to_weeks\":true,\"seconds_to_months\":true,\"seconds_to_years\":true,\"milliseconds_to_seconds\":true,\"milliseconds_to_microseconds\":true,\"milliseconds_to_nanoseconds\":true,\"milliseconds_to_picoseconds\":true,\"milliseconds_to_minutes\":true,\"milliseconds_to_hours\":true,\"milliseconds_to_days\":true,\"milliseconds_to_weeks\":true,\"milliseconds_to_months\":true,\"milliseconds_to_years\":true,\"microseconds_to_seconds\":true,\"microseconds_to_milliseconds\":true,\"microseconds_to_nanoseconds\":true,\"microseconds_to_picoseconds\":true,\"microseconds_to_minutes\":true,\"microseconds_to_hours\":true,\"microseconds_to_days\":true,\"microseconds_to_weeks\":true,\"microseconds_to_months\":true,\"microseconds_to_years\":true,\"nanoseconds_to_seconds\":true,\"nanoseconds_to_milliseconds\":true,\"nanoseconds_to_microseconds\":true,\"nanoseconds_to_picoseconds\":true,\"nanoseconds_to_minutes\":true,\"nanoseconds_to_hours\":true,\"nanoseconds_to_days\":true,\"nanoseconds_to_weeks\":true,\"nanoseconds_to_months\":true,\"nanoseconds_to_years\":true,\"picoseconds_to_seconds\":true,\"picoseconds_to_milliseconds\":true,\"picoseconds_to_microseconds\":true,\"picoseconds_to_nanoseconds\":true,\"picoseconds_to_minutes\":true,\"picoseconds_to_hours\":true,\"picoseconds_to_days\":true,\"picoseconds_to_weeks\":true,\"picoseconds_to_months\":true,\"picoseconds_to_years\":true,\"minutes_to_seconds\":true,\"minutes_to_milliseconds\":true,\"minutes_to_microseconds\":true,\"minutes_to_nanoseconds\":true,\"minutes_to_picoseconds\":true,\"minutes_to_hours\":true,\"minutes_to_days\":true,\"minutes_to_weeks\":true,\"minutes_to_months\":true,\"minutes_to_years\":true,\"hours_to_seconds\":true,\"hours_to_milliseconds\":true,\"hours_to_microseconds\":true,\"hours_to_nanoseconds\":true,\"hours_to_picoseconds\":true,\"hours_to_minutes\":true,\"hours_to_days\":true,\"hours_to_weeks\":true,\"hours_to_months\":true,\"hours_to_years\":true,\"days_to_seconds\":true,\"days_to_milliseconds\":true,\"days_to_microseconds\":true,\"days_to_nanoseconds\":true,\"days_to_picoseconds\":true,\"days_to_minutes\":true,\"days_to_hours\":true,\"days_to_weeks\":true,\"days_to_months\":true,\"days_to_years\":true,\"weeks_to_seconds\":true,\"weeks_to_milliseconds\":true,\"weeks_to_microseconds\":true,\"weeks_to_nanoseconds\":true,\"weeks_to_picoseconds\":true,\"weeks_to_minutes\":true,\"weeks_to_hours\":true,\"weeks_to_days\":true,\"weeks_to_months\":true,\"weeks_to_years\":true,\"months_to_seconds\":true,\"months_to_milliseconds\":true,\"months_to_microseconds\":true,\"months_to_nanoseconds\":true,\"months_to_picoseconds\":true,\"months_to_minutes\":true,\"months_to_hours\":true,\"months_to_days\":true,\"months_to_weeks\":true,\"months_to_years\":true,\"years_to_seconds\":true,\"years_to_milliseconds\":true,\"years_to_microseconds\":true,\"years_to_nanoseconds\":true,\"years_to_picoseconds\":true,\"years_to_minutes\":true,\"years_to_hours\":true,\"years_to_days\":true,\"years_to_weeks\":true,\"years_to_months\":true,\"bits_to_nibbles\":true,\"bits_to_bytes\":true,\"bits_to_kilobits\":true,\"bits_to_kibibits\":true,\"bits_to_kibibytes\":true,\"bits_to_kilobytes\":true,\"bits_to_megabits\":true,\"bits_to_mebibits\":true,\"bits_to_megabytes\":true,\"bits_to_mebibytes\":true,\"bits_to_gigabits\":true,\"bits_to_gibibits\":true,\"bits_to_gigabytes\":true,\"bits_to_gibibytes\":true,\"bits_to_terabits\":true,\"bits_to_tebibits\":true,\"bits_to_terabytes\":true,\"bits_to_tebibytes\":true,\"bits_to_petabits\":true,\"bits_to_pebibits\":true,\"bits_to_petabytes\":true,\"bits_to_pebibytes\":true,\"bits_to_exabits\":true,\"bits_to_exbibits\":true,\"bits_to_exabytes\":true,\"bits_to_exbibytes\":true,\"bits_to_zettabits\":true,\"bits_to_zebibits\":true,\"bits_to_zettabytes\":true,\"bits_to_zebibytes\":true,\"bits_to_yottabits\":true,\"bits_to_yobibits\":true,\"bits_to_yottabytes\":true,\"bits_to_yobibytes\":true,\"nibbles_to_bits\":true,\"nibbles_to_bytes\":true,\"nibbles_to_kilobits\":true,\"nibbles_to_kibibits\":true,\"nibbles_to_kibibytes\":true,\"nibbles_to_kilobytes\":true,\"nibbles_to_megabits\":true,\"nibbles_to_mebibits\":true,\"nibbles_to_megabytes\":true,\"nibbles_to_mebibytes\":true,\"nibbles_to_gigabits\":true,\"nibbles_to_gibibits\":true,\"nibbles_to_gigabytes\":true,\"nibbles_to_gibibytes\":true,\"nibbles_to_terabits\":true,\"nibbles_to_tebibits\":true,\"nibbles_to_terabytes\":true,\"nibbles_to_tebibytes\":true,\"nibbles_to_petabits\":true,\"nibbles_to_pebibits\":true,\"nibbles_to_petabytes\":true,\"nibbles_to_pebibytes\":true,\"nibbles_to_exabits\":true,\"nibbles_to_exbibits\":true,\"nibbles_to_exabytes\":true,\"nibbles_to_exbibytes\":true,\"nibbles_to_zettabits\":true,\"nibbles_to_zebibits\":true,\"nibbles_to_zettabytes\":true,\"nibbles_to_zebibytes\":true,\"nibbles_to_yottabits\":true,\"nibbles_to_yobibits\":true,\"nibbles_to_yottabytes\":true,\"nibbles_to_yobibytes\":true,\"bytes_to_bits\":true,\"bytes_to_nibbles\":true,\"bytes_to_kilobits\":true,\"bytes_to_kibibits\":true,\"bytes_to_kibibytes\":true,\"bytes_to_kilobytes\":true,\"bytes_to_megabits\":true,\"bytes_to_mebibits\":true,\"bytes_to_megabytes\":true,\"bytes_to_mebibytes\":true,\"bytes_to_gigabits\":true,\"bytes_to_gibibits\":true,\"bytes_to_gigabytes\":true,\"bytes_to_gibibytes\":true,\"bytes_to_terabits\":true,\"bytes_to_tebibits\":true,\"bytes_to_terabytes\":true,\"bytes_to_tebibytes\":true,\"bytes_to_petabits\":true,\"bytes_to_pebibits\":true,\"bytes_to_petabytes\":true,\"bytes_to_pebibytes\":true,\"bytes_to_exabits\":true,\"bytes_to_exbibits\":true,\"bytes_to_exabytes\":true,\"bytes_to_exbibytes\":true,\"bytes_to_zettabits\":true,\"bytes_to_zebibits\":true,\"bytes_to_zettabytes\":true,\"bytes_to_zebibytes\":true,\"bytes_to_yottabits\":true,\"bytes_to_yobibits\":true,\"bytes_to_yottabytes\":true,\"bytes_to_yobibytes\":true,\"kilobits_to_bits\":true,\"kilobits_to_nibbles\":true,\"kilobits_to_bytes\":true,\"kilobits_to_kibibits\":true,\"kilobits_to_kibibytes\":true,\"kilobits_to_kilobytes\":true,\"kilobits_to_megabits\":true,\"kilobits_to_mebibits\":true,\"kilobits_to_megabytes\":true,\"kilobits_to_mebibytes\":true,\"kilobits_to_gigabits\":true,\"kilobits_to_gibibits\":true,\"kilobits_to_gigabytes\":true,\"kilobits_to_gibibytes\":true,\"kilobits_to_terabits\":true,\"kilobits_to_tebibits\":true,\"kilobits_to_terabytes\":true,\"kilobits_to_tebibytes\":true,\"kilobits_to_petabits\":true,\"kilobits_to_pebibits\":true,\"kilobits_to_petabytes\":true,\"kilobits_to_pebibytes\":true,\"kilobits_to_exabits\":true,\"kilobits_to_exbibits\":true,\"kilobits_to_exabytes\":true,\"kilobits_to_exbibytes\":true,\"kilobits_to_zettabits\":true,\"kilobits_to_zebibits\":true,\"kilobits_to_zettabytes\":true,\"kilobits_to_zebibytes\":true,\"kilobits_to_yottabits\":true,\"kilobits_to_yobibits\":true,\"kilobits_to_yottabytes\":true,\"kilobits_to_yobibytes\":true,\"kibibits_to_bits\":true,\"kibibits_to_nibbles\":true,\"kibibits_to_bytes\":true,\"kibibits_to_kilobits\":true,\"kibibits_to_kibibytes\":true,\"kibibits_to_kilobytes\":true,\"kibibits_to_megabits\":true,\"kibibits_to_mebibits\":true,\"kibibits_to_megabytes\":true,\"kibibits_to_mebibytes\":true,\"kibibits_to_gigabits\":true,\"kibibits_to_gibibits\":true,\"kibibits_to_gigabytes\":true,\"kibibits_to_gibibytes\":true,\"kibibits_to_terabits\":true,\"kibibits_to_tebibits\":true,\"kibibits_to_terabytes\":true,\"kibibits_to_tebibytes\":true,\"kibibits_to_petabits\":true,\"kibibits_to_pebibits\":true,\"kibibits_to_petabytes\":true,\"kibibits_to_pebibytes\":true,\"kibibits_to_exabits\":true,\"kibibits_to_exbibits\":true,\"kibibits_to_exabytes\":true,\"kibibits_to_exbibytes\":true,\"kibibits_to_zettabits\":true,\"kibibits_to_zebibits\":true,\"kibibits_to_zettabytes\":true,\"kibibits_to_zebibytes\":true,\"kibibits_to_yottabits\":true,\"kibibits_to_yobibits\":true,\"kibibits_to_yottabytes\":true,\"kibibits_to_yobibytes\":true,\"kibibytes_to_bits\":true,\"kibibytes_to_nibbles\":true,\"kibibytes_to_bytes\":true,\"kibibytes_to_kilobits\":true,\"kibibytes_to_kibibits\":true,\"kibibytes_to_kilobytes\":true,\"kibibytes_to_megabits\":true,\"kibibytes_to_mebibits\":true,\"kibibytes_to_megabytes\":true,\"kibibytes_to_mebibytes\":true,\"kibibytes_to_gigabits\":true,\"kibibytes_to_gibibits\":true,\"kibibytes_to_gigabytes\":true,\"kibibytes_to_gibibytes\":true,\"kibibytes_to_terabits\":true,\"kibibytes_to_tebibits\":true,\"kibibytes_to_terabytes\":true,\"kibibytes_to_tebibytes\":true,\"kibibytes_to_petabits\":true,\"kibibytes_to_pebibits\":true,\"kibibytes_to_petabytes\":true,\"kibibytes_to_pebibytes\":true,\"kibibytes_to_exabits\":true,\"kibibytes_to_exbibits\":true,\"kibibytes_to_exabytes\":true,\"kibibytes_to_exbibytes\":true,\"kibibytes_to_zettabits\":true,\"kibibytes_to_zebibits\":true,\"kibibytes_to_zettabytes\":true,\"kibibytes_to_zebibytes\":true,\"kibibytes_to_yottabits\":true,\"kibibytes_to_yobibits\":true,\"kibibytes_to_yottabytes\":true,\"kibibytes_to_yobibytes\":true,\"kilobytes_to_bits\":true,\"kilobytes_to_nibbles\":true,\"kilobytes_to_bytes\":true,\"kilobytes_to_kilobits\":true,\"kilobytes_to_kibibits\":true,\"kilobytes_to_kibibytes\":true,\"kilobytes_to_megabits\":true,\"kilobytes_to_mebibits\":true,\"kilobytes_to_megabytes\":true,\"kilobytes_to_mebibytes\":true,\"kilobytes_to_gigabits\":true,\"kilobytes_to_gibibits\":true,\"kilobytes_to_gigabytes\":true,\"kilobytes_to_gibibytes\":true,\"kilobytes_to_terabits\":true,\"kilobytes_to_tebibits\":true,\"kilobytes_to_terabytes\":true,\"kilobytes_to_tebibytes\":true,\"kilobytes_to_petabits\":true,\"kilobytes_to_pebibits\":true,\"kilobytes_to_petabytes\":true,\"kilobytes_to_pebibytes\":true,\"kilobytes_to_exabits\":true,\"kilobytes_to_exbibits\":true,\"kilobytes_to_exabytes\":true,\"kilobytes_to_exbibytes\":true,\"kilobytes_to_zettabits\":true,\"kilobytes_to_zebibits\":true,\"kilobytes_to_zettabytes\":true,\"kilobytes_to_zebibytes\":true,\"kilobytes_to_yottabits\":true,\"kilobytes_to_yobibits\":true,\"kilobytes_to_yottabytes\":true,\"kilobytes_to_yobibytes\":true,\"megabits_to_bits\":true,\"megabits_to_nibbles\":true,\"megabits_to_bytes\":true,\"megabits_to_kilobits\":true,\"megabits_to_kibibits\":true,\"megabits_to_kibibytes\":true,\"megabits_to_kilobytes\":true,\"megabits_to_mebibits\":true,\"megabits_to_megabytes\":true,\"megabits_to_mebibytes\":true,\"megabits_to_gigabits\":true,\"megabits_to_gibibits\":true,\"megabits_to_gigabytes\":true,\"megabits_to_gibibytes\":true,\"megabits_to_terabits\":true,\"megabits_to_tebibits\":true,\"megabits_to_terabytes\":true,\"megabits_to_tebibytes\":true,\"megabits_to_petabits\":true,\"megabits_to_pebibits\":true,\"megabits_to_petabytes\":true,\"megabits_to_pebibytes\":true,\"megabits_to_exabits\":true,\"megabits_to_exbibits\":true,\"megabits_to_exabytes\":true,\"megabits_to_exbibytes\":true,\"megabits_to_zettabits\":true,\"megabits_to_zebibits\":true,\"megabits_to_zettabytes\":true,\"megabits_to_zebibytes\":true,\"megabits_to_yottabits\":true,\"megabits_to_yobibits\":true,\"megabits_to_yottabytes\":true,\"megabits_to_yobibytes\":true,\"mebibits_to_bits\":true,\"mebibits_to_nibbles\":true,\"mebibits_to_bytes\":true,\"mebibits_to_kilobits\":true,\"mebibits_to_kibibits\":true,\"mebibits_to_kibibytes\":true,\"mebibits_to_kilobytes\":true,\"mebibits_to_megabits\":true,\"mebibits_to_megabytes\":true,\"mebibits_to_mebibytes\":true,\"mebibits_to_gigabits\":true,\"mebibits_to_gibibits\":true,\"mebibits_to_gigabytes\":true,\"mebibits_to_gibibytes\":true,\"mebibits_to_terabits\":true,\"mebibits_to_tebibits\":true,\"mebibits_to_terabytes\":true,\"mebibits_to_tebibytes\":true,\"mebibits_to_petabits\":true,\"mebibits_to_pebibits\":true,\"mebibits_to_petabytes\":true,\"mebibits_to_pebibytes\":true,\"mebibits_to_exabits\":true,\"mebibits_to_exbibits\":true,\"mebibits_to_exabytes\":true,\"mebibits_to_exbibytes\":true,\"mebibits_to_zettabits\":true,\"mebibits_to_zebibits\":true,\"mebibits_to_zettabytes\":true,\"mebibits_to_zebibytes\":true,\"mebibits_to_yottabits\":true,\"mebibits_to_yobibits\":true,\"mebibits_to_yottabytes\":true,\"mebibits_to_yobibytes\":true,\"megabytes_to_bits\":true,\"megabytes_to_nibbles\":true,\"megabytes_to_bytes\":true,\"megabytes_to_kilobits\":true,\"megabytes_to_kibibits\":true,\"megabytes_to_kibibytes\":true,\"megabytes_to_kilobytes\":true,\"megabytes_to_megabits\":true,\"megabytes_to_mebibits\":true,\"megabytes_to_mebibytes\":true,\"megabytes_to_gigabits\":true,\"megabytes_to_gibibits\":true,\"megabytes_to_gigabytes\":true,\"megabytes_to_gibibytes\":true,\"megabytes_to_terabits\":true,\"megabytes_to_tebibits\":true,\"megabytes_to_terabytes\":true,\"megabytes_to_tebibytes\":true,\"megabytes_to_petabits\":true,\"megabytes_to_pebibits\":true,\"megabytes_to_petabytes\":true,\"megabytes_to_pebibytes\":true,\"megabytes_to_exabits\":true,\"megabytes_to_exbibits\":true,\"megabytes_to_exabytes\":true,\"megabytes_to_exbibytes\":true,\"megabytes_to_zettabits\":true,\"megabytes_to_zebibits\":true,\"megabytes_to_zettabytes\":true,\"megabytes_to_zebibytes\":true,\"megabytes_to_yottabits\":true,\"megabytes_to_yobibits\":true,\"megabytes_to_yottabytes\":true,\"megabytes_to_yobibytes\":true,\"mebibytes_to_bits\":true,\"mebibytes_to_nibbles\":true,\"mebibytes_to_bytes\":true,\"mebibytes_to_kilobits\":true,\"mebibytes_to_kibibits\":true,\"mebibytes_to_kibibytes\":true,\"mebibytes_to_kilobytes\":true,\"mebibytes_to_megabits\":true,\"mebibytes_to_mebibits\":true,\"mebibytes_to_megabytes\":true,\"mebibytes_to_gigabits\":true,\"mebibytes_to_gibibits\":true,\"mebibytes_to_gigabytes\":true,\"mebibytes_to_gibibytes\":true,\"mebibytes_to_terabits\":true,\"mebibytes_to_tebibits\":true,\"mebibytes_to_terabytes\":true,\"mebibytes_to_tebibytes\":true,\"mebibytes_to_petabits\":true,\"mebibytes_to_pebibits\":true,\"mebibytes_to_petabytes\":true,\"mebibytes_to_pebibytes\":true,\"mebibytes_to_exabits\":true,\"mebibytes_to_exbibits\":true,\"mebibytes_to_exabytes\":true,\"mebibytes_to_exbibytes\":true,\"mebibytes_to_zettabits\":true,\"mebibytes_to_zebibits\":true,\"mebibytes_to_zettabytes\":true,\"mebibytes_to_zebibytes\":true,\"mebibytes_to_yottabits\":true,\"mebibytes_to_yobibits\":true,\"mebibytes_to_yottabytes\":true,\"mebibytes_to_yobibytes\":true,\"gigabits_to_bits\":true,\"gigabits_to_nibbles\":true,\"gigabits_to_bytes\":true,\"gigabits_to_kilobits\":true,\"gigabits_to_kibibits\":true,\"gigabits_to_kibibytes\":true,\"gigabits_to_kilobytes\":true,\"gigabits_to_megabits\":true,\"gigabits_to_mebibits\":true,\"gigabits_to_megabytes\":true,\"gigabits_to_mebibytes\":true,\"gigabits_to_gibibits\":true,\"gigabits_to_gigabytes\":true,\"gigabits_to_gibibytes\":true,\"gigabits_to_terabits\":true,\"gigabits_to_tebibits\":true,\"gigabits_to_terabytes\":true,\"gigabits_to_tebibytes\":true,\"gigabits_to_petabits\":true,\"gigabits_to_pebibits\":true,\"gigabits_to_petabytes\":true,\"gigabits_to_pebibytes\":true,\"gigabits_to_exabits\":true,\"gigabits_to_exbibits\":true,\"gigabits_to_exabytes\":true,\"gigabits_to_exbibytes\":true,\"gigabits_to_zettabits\":true,\"gigabits_to_zebibits\":true,\"gigabits_to_zettabytes\":true,\"gigabits_to_zebibytes\":true,\"gigabits_to_yottabits\":true,\"gigabits_to_yobibits\":true,\"gigabits_to_yottabytes\":true,\"gigabits_to_yobibytes\":true,\"gibibits_to_bits\":true,\"gibibits_to_nibbles\":true,\"gibibits_to_bytes\":true,\"gibibits_to_kilobits\":true,\"gibibits_to_kibibits\":true,\"gibibits_to_kibibytes\":true,\"gibibits_to_kilobytes\":true,\"gibibits_to_megabits\":true,\"gibibits_to_mebibits\":true,\"gibibits_to_megabytes\":true,\"gibibits_to_mebibytes\":true,\"gibibits_to_gigabits\":true,\"gibibits_to_gigabytes\":true,\"gibibits_to_gibibytes\":true,\"gibibits_to_terabits\":true,\"gibibits_to_tebibits\":true,\"gibibits_to_terabytes\":true,\"gibibits_to_tebibytes\":true,\"gibibits_to_petabits\":true,\"gibibits_to_pebibits\":true,\"gibibits_to_petabytes\":true,\"gibibits_to_pebibytes\":true,\"gibibits_to_exabits\":true,\"gibibits_to_exbibits\":true,\"gibibits_to_exabytes\":true,\"gibibits_to_exbibytes\":true,\"gibibits_to_zettabits\":true,\"gibibits_to_zebibits\":true,\"gibibits_to_zettabytes\":true,\"gibibits_to_zebibytes\":true,\"gibibits_to_yottabits\":true,\"gibibits_to_yobibits\":true,\"gibibits_to_yottabytes\":true,\"gibibits_to_yobibytes\":true,\"gigabytes_to_bits\":true,\"gigabytes_to_nibbles\":true,\"gigabytes_to_bytes\":true,\"gigabytes_to_kilobits\":true,\"gigabytes_to_kibibits\":true,\"gigabytes_to_kibibytes\":true,\"gigabytes_to_kilobytes\":true,\"gigabytes_to_megabits\":true,\"gigabytes_to_mebibits\":true,\"gigabytes_to_megabytes\":true,\"gigabytes_to_mebibytes\":true,\"gigabytes_to_gigabits\":true,\"gigabytes_to_gibibits\":true,\"gigabytes_to_gibibytes\":true,\"gigabytes_to_terabits\":true,\"gigabytes_to_tebibits\":true,\"gigabytes_to_terabytes\":true,\"gigabytes_to_tebibytes\":true,\"gigabytes_to_petabits\":true,\"gigabytes_to_pebibits\":true,\"gigabytes_to_petabytes\":true,\"gigabytes_to_pebibytes\":true,\"gigabytes_to_exabits\":true,\"gigabytes_to_exbibits\":true,\"gigabytes_to_exabytes\":true,\"gigabytes_to_exbibytes\":true,\"gigabytes_to_zettabits\":true,\"gigabytes_to_zebibits\":true,\"gigabytes_to_zettabytes\":true,\"gigabytes_to_zebibytes\":true,\"gigabytes_to_yottabits\":true,\"gigabytes_to_yobibits\":true,\"gigabytes_to_yottabytes\":true,\"gigabytes_to_yobibytes\":true,\"gibibytes_to_bits\":true,\"gibibytes_to_nibbles\":true,\"gibibytes_to_bytes\":true,\"gibibytes_to_kilobits\":true,\"gibibytes_to_kibibits\":true,\"gibibytes_to_kibibytes\":true,\"gibibytes_to_kilobytes\":true,\"gibibytes_to_megabits\":true,\"gibibytes_to_mebibits\":true,\"gibibytes_to_megabytes\":true,\"gibibytes_to_mebibytes\":true,\"gibibytes_to_gigabits\":true,\"gibibytes_to_gibibits\":true,\"gibibytes_to_gigabytes\":true,\"gibibytes_to_terabits\":true,\"gibibytes_to_tebibits\":true,\"gibibytes_to_terabytes\":true,\"gibibytes_to_tebibytes\":true,\"gibibytes_to_petabits\":true,\"gibibytes_to_pebibits\":true,\"gibibytes_to_petabytes\":true,\"gibibytes_to_pebibytes\":true,\"gibibytes_to_exabits\":true,\"gibibytes_to_exbibits\":true,\"gibibytes_to_exabytes\":true,\"gibibytes_to_exbibytes\":true,\"gibibytes_to_zettabits\":true,\"gibibytes_to_zebibits\":true,\"gibibytes_to_zettabytes\":true,\"gibibytes_to_zebibytes\":true,\"gibibytes_to_yottabits\":true,\"gibibytes_to_yobibits\":true,\"gibibytes_to_yottabytes\":true,\"gibibytes_to_yobibytes\":true,\"terabits_to_bits\":true,\"terabits_to_nibbles\":true,\"terabits_to_bytes\":true,\"terabits_to_kilobits\":true,\"terabits_to_kibibits\":true,\"terabits_to_kibibytes\":true,\"terabits_to_kilobytes\":true,\"terabits_to_megabits\":true,\"terabits_to_mebibits\":true,\"terabits_to_megabytes\":true,\"terabits_to_mebibytes\":true,\"terabits_to_gigabits\":true,\"terabits_to_gibibits\":true,\"terabits_to_gigabytes\":true,\"terabits_to_gibibytes\":true,\"terabits_to_tebibits\":true,\"terabits_to_terabytes\":true,\"terabits_to_tebibytes\":true,\"terabits_to_petabits\":true,\"terabits_to_pebibits\":true,\"terabits_to_petabytes\":true,\"terabits_to_pebibytes\":true,\"terabits_to_exabits\":true,\"terabits_to_exbibits\":true,\"terabits_to_exabytes\":true,\"terabits_to_exbibytes\":true,\"terabits_to_zettabits\":true,\"terabits_to_zebibits\":true,\"terabits_to_zettabytes\":true,\"terabits_to_zebibytes\":true,\"terabits_to_yottabits\":true,\"terabits_to_yobibits\":true,\"terabits_to_yottabytes\":true,\"terabits_to_yobibytes\":true,\"tebibits_to_bits\":true,\"tebibits_to_nibbles\":true,\"tebibits_to_bytes\":true,\"tebibits_to_kilobits\":true,\"tebibits_to_kibibits\":true,\"tebibits_to_kibibytes\":true,\"tebibits_to_kilobytes\":true,\"tebibits_to_megabits\":true,\"tebibits_to_mebibits\":true,\"tebibits_to_megabytes\":true,\"tebibits_to_mebibytes\":true,\"tebibits_to_gigabits\":true,\"tebibits_to_gibibits\":true,\"tebibits_to_gigabytes\":true,\"tebibits_to_gibibytes\":true,\"tebibits_to_terabits\":true,\"tebibits_to_terabytes\":true,\"tebibits_to_tebibytes\":true,\"tebibits_to_petabits\":true,\"tebibits_to_pebibits\":true,\"tebibits_to_petabytes\":true,\"tebibits_to_pebibytes\":true,\"tebibits_to_exabits\":true,\"tebibits_to_exbibits\":true,\"tebibits_to_exabytes\":true,\"tebibits_to_exbibytes\":true,\"tebibits_to_zettabits\":true,\"tebibits_to_zebibits\":true,\"tebibits_to_zettabytes\":true,\"tebibits_to_zebibytes\":true,\"tebibits_to_yottabits\":true,\"tebibits_to_yobibits\":true,\"tebibits_to_yottabytes\":true,\"tebibits_to_yobibytes\":true,\"terabytes_to_bits\":true,\"terabytes_to_nibbles\":true,\"terabytes_to_bytes\":true,\"terabytes_to_kilobits\":true,\"terabytes_to_kibibits\":true,\"terabytes_to_kibibytes\":true,\"terabytes_to_kilobytes\":true,\"terabytes_to_megabits\":true,\"terabytes_to_mebibits\":true,\"terabytes_to_megabytes\":true,\"terabytes_to_mebibytes\":true,\"terabytes_to_gigabits\":true,\"terabytes_to_gibibits\":true,\"terabytes_to_gigabytes\":true,\"terabytes_to_gibibytes\":true,\"terabytes_to_terabits\":true,\"terabytes_to_tebibits\":true,\"terabytes_to_tebibytes\":true,\"terabytes_to_petabits\":true,\"terabytes_to_pebibits\":true,\"terabytes_to_petabytes\":true,\"terabytes_to_pebibytes\":true,\"terabytes_to_exabits\":true,\"terabytes_to_exbibits\":true,\"terabytes_to_exabytes\":true,\"terabytes_to_exbibytes\":true,\"terabytes_to_zettabits\":true,\"terabytes_to_zebibits\":true,\"terabytes_to_zettabytes\":true,\"terabytes_to_zebibytes\":true,\"terabytes_to_yottabits\":true,\"terabytes_to_yobibits\":true,\"terabytes_to_yottabytes\":true,\"terabytes_to_yobibytes\":true,\"tebibytes_to_bits\":true,\"tebibytes_to_nibbles\":true,\"tebibytes_to_bytes\":true,\"tebibytes_to_kilobits\":true,\"tebibytes_to_kibibits\":true,\"tebibytes_to_kibibytes\":true,\"tebibytes_to_kilobytes\":true,\"tebibytes_to_megabits\":true,\"tebibytes_to_mebibits\":true,\"tebibytes_to_megabytes\":true,\"tebibytes_to_mebibytes\":true,\"tebibytes_to_gigabits\":true,\"tebibytes_to_gibibits\":true,\"tebibytes_to_gigabytes\":true,\"tebibytes_to_gibibytes\":true,\"tebibytes_to_terabits\":true,\"tebibytes_to_tebibits\":true,\"tebibytes_to_terabytes\":true,\"tebibytes_to_petabits\":true,\"tebibytes_to_pebibits\":true,\"tebibytes_to_petabytes\":true,\"tebibytes_to_pebibytes\":true,\"tebibytes_to_exabits\":true,\"tebibytes_to_exbibits\":true,\"tebibytes_to_exabytes\":true,\"tebibytes_to_exbibytes\":true,\"tebibytes_to_zettabits\":true,\"tebibytes_to_zebibits\":true,\"tebibytes_to_zettabytes\":true,\"tebibytes_to_zebibytes\":true,\"tebibytes_to_yottabits\":true,\"tebibytes_to_yobibits\":true,\"tebibytes_to_yottabytes\":true,\"tebibytes_to_yobibytes\":true,\"petabits_to_bits\":true,\"petabits_to_nibbles\":true,\"petabits_to_bytes\":true,\"petabits_to_kilobits\":true,\"petabits_to_kibibits\":true,\"petabits_to_kibibytes\":true,\"petabits_to_kilobytes\":true,\"petabits_to_megabits\":true,\"petabits_to_mebibits\":true,\"petabits_to_megabytes\":true,\"petabits_to_mebibytes\":true,\"petabits_to_gigabits\":true,\"petabits_to_gibibits\":true,\"petabits_to_gigabytes\":true,\"petabits_to_gibibytes\":true,\"petabits_to_terabits\":true,\"petabits_to_tebibits\":true,\"petabits_to_terabytes\":true,\"petabits_to_tebibytes\":true,\"petabits_to_pebibits\":true,\"petabits_to_petabytes\":true,\"petabits_to_pebibytes\":true,\"petabits_to_exabits\":true,\"petabits_to_exbibits\":true,\"petabits_to_exabytes\":true,\"petabits_to_exbibytes\":true,\"petabits_to_zettabits\":true,\"petabits_to_zebibits\":true,\"petabits_to_zettabytes\":true,\"petabits_to_zebibytes\":true,\"petabits_to_yottabits\":true,\"petabits_to_yobibits\":true,\"petabits_to_yottabytes\":true,\"petabits_to_yobibytes\":true,\"pebibits_to_bits\":true,\"pebibits_to_nibbles\":true,\"pebibits_to_bytes\":true,\"pebibits_to_kilobits\":true,\"pebibits_to_kibibits\":true,\"pebibits_to_kibibytes\":true,\"pebibits_to_kilobytes\":true,\"pebibits_to_megabits\":true,\"pebibits_to_mebibits\":true,\"pebibits_to_megabytes\":true,\"pebibits_to_mebibytes\":true,\"pebibits_to_gigabits\":true,\"pebibits_to_gibibits\":true,\"pebibits_to_gigabytes\":true,\"pebibits_to_gibibytes\":true,\"pebibits_to_terabits\":true,\"pebibits_to_tebibits\":true,\"pebibits_to_terabytes\":true,\"pebibits_to_tebibytes\":true,\"pebibits_to_petabits\":true,\"pebibits_to_petabytes\":true,\"pebibits_to_pebibytes\":true,\"pebibits_to_exabits\":true,\"pebibits_to_exbibits\":true,\"pebibits_to_exabytes\":true,\"pebibits_to_exbibytes\":false,\"pebibits_to_zettabits\":false,\"pebibits_to_zebibits\":false,\"pebibits_to_zettabytes\":false,\"pebibits_to_zebibytes\":false,\"pebibits_to_yottabits\":false,\"pebibits_to_yobibits\":false,\"pebibits_to_yottabytes\":false,\"pebibits_to_yobibytes\":false,\"petabytes_to_bits\":false,\"petabytes_to_nibbles\":false,\"petabytes_to_bytes\":false,\"petabytes_to_kilobits\":false,\"petabytes_to_kibibits\":false,\"petabytes_to_kibibytes\":false,\"petabytes_to_kilobytes\":false,\"petabytes_to_megabits\":false,\"petabytes_to_mebibits\":false,\"petabytes_to_megabytes\":false,\"petabytes_to_mebibytes\":false,\"petabytes_to_gigabits\":false,\"petabytes_to_gibibits\":false,\"petabytes_to_gigabytes\":false,\"petabytes_to_gibibytes\":false,\"petabytes_to_terabits\":false,\"petabytes_to_tebibits\":false,\"petabytes_to_terabytes\":false,\"petabytes_to_tebibytes\":false,\"petabytes_to_petabits\":false,\"petabytes_to_pebibits\":false,\"petabytes_to_pebibytes\":false,\"petabytes_to_exabits\":false,\"petabytes_to_exbibits\":false,\"petabytes_to_exabytes\":false,\"petabytes_to_exbibytes\":false,\"petabytes_to_zettabits\":false,\"petabytes_to_zebibits\":false,\"petabytes_to_zettabytes\":false,\"petabytes_to_zebibytes\":false,\"petabytes_to_yottabits\":false,\"petabytes_to_yobibits\":false,\"petabytes_to_yottabytes\":false,\"petabytes_to_yobibytes\":false,\"pebibytes_to_bits\":false,\"pebibytes_to_nibbles\":false,\"pebibytes_to_bytes\":false,\"pebibytes_to_kilobits\":false,\"pebibytes_to_kibibits\":false,\"pebibytes_to_kibibytes\":false,\"pebibytes_to_kilobytes\":false,\"pebibytes_to_megabits\":false,\"pebibytes_to_mebibits\":false,\"pebibytes_to_megabytes\":false,\"pebibytes_to_mebibytes\":false,\"pebibytes_to_gigabits\":false,\"pebibytes_to_gibibits\":false,\"pebibytes_to_gigabytes\":false,\"pebibytes_to_gibibytes\":false,\"pebibytes_to_terabits\":false,\"pebibytes_to_tebibits\":false,\"pebibytes_to_terabytes\":false,\"pebibytes_to_tebibytes\":false,\"pebibytes_to_petabits\":false,\"pebibytes_to_pebibits\":false,\"pebibytes_to_petabytes\":false,\"pebibytes_to_exabits\":false,\"pebibytes_to_exbibits\":false,\"pebibytes_to_exabytes\":false,\"pebibytes_to_exbibytes\":false,\"pebibytes_to_zettabits\":false,\"pebibytes_to_zebibits\":false,\"pebibytes_to_zettabytes\":false,\"pebibytes_to_zebibytes\":false,\"pebibytes_to_yottabits\":false,\"pebibytes_to_yobibits\":false,\"pebibytes_to_yottabytes\":false,\"pebibytes_to_yobibytes\":false,\"exabits_to_bits\":false,\"exabits_to_nibbles\":false,\"exabits_to_bytes\":false,\"exabits_to_kilobits\":false,\"exabits_to_kibibits\":false,\"exabits_to_kibibytes\":false,\"exabits_to_kilobytes\":false,\"exabits_to_megabits\":false,\"exabits_to_mebibits\":false,\"exabits_to_megabytes\":false,\"exabits_to_mebibytes\":false,\"exabits_to_gigabits\":false,\"exabits_to_gibibits\":false,\"exabits_to_gigabytes\":false,\"exabits_to_gibibytes\":false,\"exabits_to_terabits\":false,\"exabits_to_tebibits\":false,\"exabits_to_terabytes\":false,\"exabits_to_tebibytes\":false,\"exabits_to_petabits\":false,\"exabits_to_pebibits\":false,\"exabits_to_petabytes\":false,\"exabits_to_pebibytes\":false,\"exabits_to_exbibits\":false,\"exabits_to_exabytes\":false,\"exabits_to_exbibytes\":false,\"exabits_to_zettabits\":false,\"exabits_to_zebibits\":false,\"exabits_to_zettabytes\":false,\"exabits_to_zebibytes\":false,\"exabits_to_yottabits\":false,\"exabits_to_yobibits\":false,\"exabits_to_yottabytes\":false,\"exabits_to_yobibytes\":false,\"exbibits_to_bits\":false,\"exbibits_to_nibbles\":false,\"exbibits_to_bytes\":false,\"exbibits_to_kilobits\":false,\"exbibits_to_kibibits\":false,\"exbibits_to_kibibytes\":false,\"exbibits_to_kilobytes\":false,\"exbibits_to_megabits\":false,\"exbibits_to_mebibits\":false,\"exbibits_to_megabytes\":false,\"exbibits_to_mebibytes\":false,\"exbibits_to_gigabits\":false,\"exbibits_to_gibibits\":false,\"exbibits_to_gigabytes\":false,\"exbibits_to_gibibytes\":false,\"exbibits_to_terabits\":false,\"exbibits_to_tebibits\":false,\"exbibits_to_terabytes\":false,\"exbibits_to_tebibytes\":false,\"exbibits_to_petabits\":false,\"exbibits_to_pebibits\":false,\"exbibits_to_petabytes\":false,\"exbibits_to_pebibytes\":false,\"exbibits_to_exabits\":false,\"exbibits_to_exabytes\":false,\"exbibits_to_exbibytes\":false,\"exbibits_to_zettabits\":false,\"exbibits_to_zebibits\":false,\"exbibits_to_zettabytes\":false,\"exbibits_to_zebibytes\":false,\"exbibits_to_yottabits\":false,\"exbibits_to_yobibits\":false,\"exbibits_to_yottabytes\":false,\"exbibits_to_yobibytes\":false,\"exabytes_to_bits\":false,\"exabytes_to_nibbles\":false,\"exabytes_to_bytes\":false,\"exabytes_to_kilobits\":false,\"exabytes_to_kibibits\":false,\"exabytes_to_kibibytes\":false,\"exabytes_to_kilobytes\":false,\"exabytes_to_megabits\":false,\"exabytes_to_mebibits\":false,\"exabytes_to_megabytes\":false,\"exabytes_to_mebibytes\":false,\"exabytes_to_gigabits\":false,\"exabytes_to_gibibits\":false,\"exabytes_to_gigabytes\":false,\"exabytes_to_gibibytes\":false,\"exabytes_to_terabits\":false,\"exabytes_to_tebibits\":false,\"exabytes_to_terabytes\":false,\"exabytes_to_tebibytes\":false,\"exabytes_to_petabits\":false,\"exabytes_to_pebibits\":false,\"exabytes_to_petabytes\":false,\"exabytes_to_pebibytes\":false,\"exabytes_to_exabits\":false,\"exabytes_to_exbibits\":false,\"exabytes_to_exbibytes\":false,\"exabytes_to_zettabits\":false,\"exabytes_to_zebibits\":false,\"exabytes_to_zettabytes\":false,\"exabytes_to_zebibytes\":false,\"exabytes_to_yottabits\":false,\"exabytes_to_yobibits\":false,\"exabytes_to_yottabytes\":false,\"exabytes_to_yobibytes\":false,\"exbibytes_to_bits\":false,\"exbibytes_to_nibbles\":false,\"exbibytes_to_bytes\":false,\"exbibytes_to_kilobits\":false,\"exbibytes_to_kibibits\":false,\"exbibytes_to_kibibytes\":false,\"exbibytes_to_kilobytes\":false,\"exbibytes_to_megabits\":false,\"exbibytes_to_mebibits\":false,\"exbibytes_to_megabytes\":false,\"exbibytes_to_mebibytes\":false,\"exbibytes_to_gigabits\":false,\"exbibytes_to_gibibits\":false,\"exbibytes_to_gigabytes\":false,\"exbibytes_to_gibibytes\":false,\"exbibytes_to_terabits\":false,\"exbibytes_to_tebibits\":false,\"exbibytes_to_terabytes\":false,\"exbibytes_to_tebibytes\":false,\"exbibytes_to_petabits\":false,\"exbibytes_to_pebibits\":false,\"exbibytes_to_petabytes\":false,\"exbibytes_to_pebibytes\":false,\"exbibytes_to_exabits\":false,\"exbibytes_to_exbibits\":false,\"exbibytes_to_exabytes\":false,\"exbibytes_to_zettabits\":false,\"exbibytes_to_zebibits\":false,\"exbibytes_to_zettabytes\":false,\"exbibytes_to_zebibytes\":false,\"exbibytes_to_yottabits\":false,\"exbibytes_to_yobibits\":false,\"exbibytes_to_yottabytes\":false,\"exbibytes_to_yobibytes\":false,\"zettabits_to_bits\":false,\"zettabits_to_nibbles\":false,\"zettabits_to_bytes\":false,\"zettabits_to_kilobits\":false,\"zettabits_to_kibibits\":false,\"zettabits_to_kibibytes\":false,\"zettabits_to_kilobytes\":false,\"zettabits_to_megabits\":false,\"zettabits_to_mebibits\":false,\"zettabits_to_megabytes\":false,\"zettabits_to_mebibytes\":false,\"zettabits_to_gigabits\":false,\"zettabits_to_gibibits\":false,\"zettabits_to_gigabytes\":false,\"zettabits_to_gibibytes\":false,\"zettabits_to_terabits\":false,\"zettabits_to_tebibits\":false,\"zettabits_to_terabytes\":false,\"zettabits_to_tebibytes\":false,\"zettabits_to_petabits\":false,\"zettabits_to_pebibits\":false,\"zettabits_to_petabytes\":false,\"zettabits_to_pebibytes\":false,\"zettabits_to_exabits\":false,\"zettabits_to_exbibits\":false,\"zettabits_to_exabytes\":false,\"zettabits_to_exbibytes\":false,\"zettabits_to_zebibits\":false,\"zettabits_to_zettabytes\":false,\"zettabits_to_zebibytes\":false,\"zettabits_to_yottabits\":false,\"zettabits_to_yobibits\":false,\"zettabits_to_yottabytes\":false,\"zettabits_to_yobibytes\":false,\"zebibits_to_bits\":false,\"zebibits_to_nibbles\":false,\"zebibits_to_bytes\":false,\"zebibits_to_kilobits\":false,\"zebibits_to_kibibits\":false,\"zebibits_to_kibibytes\":false,\"zebibits_to_kilobytes\":false,\"zebibits_to_megabits\":false,\"zebibits_to_mebibits\":false,\"zebibits_to_megabytes\":false,\"zebibits_to_mebibytes\":false,\"zebibits_to_gigabits\":false,\"zebibits_to_gibibits\":false,\"zebibits_to_gigabytes\":false,\"zebibits_to_gibibytes\":false,\"zebibits_to_terabits\":false,\"zebibits_to_tebibits\":false,\"zebibits_to_terabytes\":false,\"zebibits_to_tebibytes\":false,\"zebibits_to_petabits\":false,\"zebibits_to_pebibits\":false,\"zebibits_to_petabytes\":false,\"zebibits_to_pebibytes\":false,\"zebibits_to_exabits\":false,\"zebibits_to_exbibits\":false,\"zebibits_to_exabytes\":false,\"zebibits_to_exbibytes\":false,\"zebibits_to_zettabits\":false,\"zebibits_to_zettabytes\":false,\"zebibits_to_zebibytes\":false,\"zebibits_to_yottabits\":false,\"zebibits_to_yobibits\":false,\"zebibits_to_yottabytes\":false,\"zebibits_to_yobibytes\":false,\"zettabytes_to_bits\":false,\"zettabytes_to_nibbles\":false,\"zettabytes_to_bytes\":false,\"zettabytes_to_kilobits\":false,\"zettabytes_to_kibibits\":false,\"zettabytes_to_kibibytes\":false,\"zettabytes_to_kilobytes\":false,\"zettabytes_to_megabits\":false,\"zettabytes_to_mebibits\":false,\"zettabytes_to_megabytes\":false,\"zettabytes_to_mebibytes\":false,\"zettabytes_to_gigabits\":false,\"zettabytes_to_gibibits\":false,\"zettabytes_to_gigabytes\":false,\"zettabytes_to_gibibytes\":false,\"zettabytes_to_terabits\":false,\"zettabytes_to_tebibits\":false,\"zettabytes_to_terabytes\":false,\"zettabytes_to_tebibytes\":false,\"zettabytes_to_petabits\":false,\"zettabytes_to_pebibits\":false,\"zettabytes_to_petabytes\":false,\"zettabytes_to_pebibytes\":false,\"zettabytes_to_exabits\":false,\"zettabytes_to_exbibits\":false,\"zettabytes_to_exabytes\":false,\"zettabytes_to_exbibytes\":false,\"zettabytes_to_zettabits\":false,\"zettabytes_to_zebibits\":false,\"zettabytes_to_zebibytes\":false,\"zettabytes_to_yottabits\":false,\"zettabytes_to_yobibits\":false,\"zettabytes_to_yottabytes\":false,\"zettabytes_to_yobibytes\":false,\"zebibytes_to_bits\":false,\"zebibytes_to_nibbles\":false,\"zebibytes_to_bytes\":false,\"zebibytes_to_kilobits\":false,\"zebibytes_to_kibibits\":false,\"zebibytes_to_kibibytes\":false,\"zebibytes_to_kilobytes\":false,\"zebibytes_to_megabits\":false,\"zebibytes_to_mebibits\":false,\"zebibytes_to_megabytes\":false,\"zebibytes_to_mebibytes\":false,\"zebibytes_to_gigabits\":false,\"zebibytes_to_gibibits\":false,\"zebibytes_to_gigabytes\":false,\"zebibytes_to_gibibytes\":false,\"zebibytes_to_terabits\":false,\"zebibytes_to_tebibits\":false,\"zebibytes_to_terabytes\":false,\"zebibytes_to_tebibytes\":false,\"zebibytes_to_petabits\":false,\"zebibytes_to_pebibits\":false,\"zebibytes_to_petabytes\":false,\"zebibytes_to_pebibytes\":false,\"zebibytes_to_exabits\":false,\"zebibytes_to_exbibits\":false,\"zebibytes_to_exabytes\":false,\"zebibytes_to_exbibytes\":false,\"zebibytes_to_zettabits\":false,\"zebibytes_to_zebibits\":false,\"zebibytes_to_zettabytes\":false,\"zebibytes_to_yottabits\":false,\"zebibytes_to_yobibits\":false,\"zebibytes_to_yottabytes\":false,\"zebibytes_to_yobibytes\":false,\"yottabits_to_bits\":false,\"yottabits_to_nibbles\":false,\"yottabits_to_bytes\":false,\"yottabits_to_kilobits\":false,\"yottabits_to_kibibits\":false,\"yottabits_to_kibibytes\":false,\"yottabits_to_kilobytes\":false,\"yottabits_to_megabits\":false,\"yottabits_to_mebibits\":false,\"yottabits_to_megabytes\":false,\"yottabits_to_mebibytes\":false,\"yottabits_to_gigabits\":false,\"yottabits_to_gibibits\":false,\"yottabits_to_gigabytes\":false,\"yottabits_to_gibibytes\":false,\"yottabits_to_terabits\":false,\"yottabits_to_tebibits\":false,\"yottabits_to_terabytes\":false,\"yottabits_to_tebibytes\":false,\"yottabits_to_petabits\":false,\"yottabits_to_pebibits\":false,\"yottabits_to_petabytes\":false,\"yottabits_to_pebibytes\":false,\"yottabits_to_exabits\":false,\"yottabits_to_exbibits\":false,\"yottabits_to_exabytes\":false,\"yottabits_to_exbibytes\":false,\"yottabits_to_zettabits\":false,\"yottabits_to_zebibits\":false,\"yottabits_to_zettabytes\":false,\"yottabits_to_zebibytes\":false,\"yottabits_to_yobibits\":false,\"yottabits_to_yottabytes\":false,\"yottabits_to_yobibytes\":false,\"yobibits_to_bits\":false,\"yobibits_to_nibbles\":false,\"yobibits_to_bytes\":false,\"yobibits_to_kilobits\":false,\"yobibits_to_kibibits\":false,\"yobibits_to_kibibytes\":false,\"yobibits_to_kilobytes\":false,\"yobibits_to_megabits\":false,\"yobibits_to_mebibits\":false,\"yobibits_to_megabytes\":false,\"yobibits_to_mebibytes\":false,\"yobibits_to_gigabits\":false,\"yobibits_to_gibibits\":false,\"yobibits_to_gigabytes\":false,\"yobibits_to_gibibytes\":false,\"yobibits_to_terabits\":false,\"yobibits_to_tebibits\":false,\"yobibits_to_terabytes\":false,\"yobibits_to_tebibytes\":false,\"yobibits_to_petabits\":false,\"yobibits_to_pebibits\":false,\"yobibits_to_petabytes\":false,\"yobibits_to_pebibytes\":false,\"yobibits_to_exabits\":false,\"yobibits_to_exbibits\":false,\"yobibits_to_exabytes\":false,\"yobibits_to_exbibytes\":false,\"yobibits_to_zettabits\":false,\"yobibits_to_zebibits\":false,\"yobibits_to_zettabytes\":false,\"yobibits_to_zebibytes\":false,\"yobibits_to_yottabits\":false,\"yobibits_to_yottabytes\":false,\"yobibits_to_yobibytes\":false,\"yottabytes_to_bits\":false,\"yottabytes_to_nibbles\":false,\"yottabytes_to_bytes\":false,\"yottabytes_to_kilobits\":false,\"yottabytes_to_kibibits\":false,\"yottabytes_to_kibibytes\":false,\"yottabytes_to_kilobytes\":false,\"yottabytes_to_megabits\":false,\"yottabytes_to_mebibits\":false,\"yottabytes_to_megabytes\":false,\"yottabytes_to_mebibytes\":false,\"yottabytes_to_gigabits\":false,\"yottabytes_to_gibibits\":false,\"yottabytes_to_gigabytes\":false,\"yottabytes_to_gibibytes\":false,\"yottabytes_to_terabits\":false,\"yottabytes_to_tebibits\":false,\"yottabytes_to_terabytes\":false,\"yottabytes_to_tebibytes\":false,\"yottabytes_to_petabits\":false,\"yottabytes_to_pebibits\":false,\"yottabytes_to_petabytes\":false,\"yottabytes_to_pebibytes\":false,\"yottabytes_to_exabits\":false,\"yottabytes_to_exbibits\":false,\"yottabytes_to_exabytes\":false,\"yottabytes_to_exbibytes\":false,\"yottabytes_to_zettabits\":false,\"yottabytes_to_zebibits\":false,\"yottabytes_to_zettabytes\":false,\"yottabytes_to_zebibytes\":false,\"yottabytes_to_yottabits\":false,\"yottabytes_to_yobibits\":false,\"yottabytes_to_yobibytes\":false,\"yobibytes_to_bits\":false,\"yobibytes_to_nibbles\":false,\"yobibytes_to_bytes\":false,\"yobibytes_to_kilobits\":false,\"yobibytes_to_kibibits\":false,\"yobibytes_to_kibibytes\":false,\"yobibytes_to_kilobytes\":false,\"yobibytes_to_megabits\":false,\"yobibytes_to_mebibits\":false,\"yobibytes_to_megabytes\":false,\"yobibytes_to_mebibytes\":false,\"yobibytes_to_gigabits\":false,\"yobibytes_to_gibibits\":false,\"yobibytes_to_gigabytes\":false,\"yobibytes_to_gibibytes\":false,\"yobibytes_to_terabits\":false,\"yobibytes_to_tebibits\":false,\"yobibytes_to_terabytes\":false,\"yobibytes_to_tebibytes\":false,\"yobibytes_to_petabits\":false,\"yobibytes_to_pebibits\":false,\"yobibytes_to_petabytes\":false,\"yobibytes_to_pebibytes\":false,\"yobibytes_to_exabits\":false,\"yobibytes_to_exbibits\":false,\"yobibytes_to_exabytes\":false,\"yobibytes_to_exbibytes\":false,\"yobibytes_to_zettabits\":false,\"yobibytes_to_zebibits\":false,\"yobibytes_to_zettabytes\":false,\"yobibytes_to_zebibytes\":false,\"yobibytes_to_yottabits\":false,\"yobibytes_to_yobibits\":false,\"yobibytes_to_yottabytes\":false},\"google_safe_browsing_is_enabled\":0,\"google_safe_browsing_api_key\":\"\"}'),
(44, 'cookie_consent', '{\"is_enabled\":false,\"logging_is_enabled\":false,\"necessary_is_enabled\":true,\"analytics_is_enabled\":true,\"targeting_is_enabled\":true,\"layout\":\"bar\",\"position_y\":\"middle\",\"position_x\":\"center\"}'),
(45, 'license', '{\"license\":\"xxxxxxxxxxxxx\",\"type\":\"Extended License\"}'),
(46, 'product_info', '{\"version\":\"26.0.0\", \"code\":\"2600\"}');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `tax_id` int UNSIGNED NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` int DEFAULT NULL,
  `value_type` enum('percentage','fixed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('inclusive','exclusive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_type` enum('personal','business','both') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `countries` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tools_usage`
--

CREATE TABLE `tools_usage` (
  `id` bigint UNSIGNED NOT NULL,
  `tool_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_views` bigint UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tools_usage`
--

INSERT INTO `tools_usage` (`id`, `tool_id`, `total_views`) VALUES
(1, 'youtube_thumbnail_downloader', 2),
(2, 'nibbles_to_pebibytes', 20),
(3, 'url_decoder', 24),
(4, 'sha512_224_generator', 24),
(5, 'utm_link_generator', 24),
(6, 'days_to_months', 16),
(7, 'days_to_weeks', 17),
(8, 'hours_to_days', 23),
(9, 'hours_to_seconds', 18),
(10, 'minutes_to_days', 18),
(11, 'minutes_to_hours', 18),
(12, 'minutes_to_months', 18),
(13, 'minutes_to_seconds', 18),
(14, 'hours_to_years', 16),
(15, 'minutes_to_weeks', 18),
(16, 'minutes_to_years', 18),
(17, 'months_to_seconds', 16),
(18, 'months_to_years', 16),
(19, 'seconds_to_weeks', 18),
(20, 'weeks_to_hours', 16),
(21, 'weeks_to_minutes', 16),
(22, 'weeks_to_seconds', 16),
(23, 'weeks_to_years', 21),
(24, 'years_to_hours', 16),
(25, 'years_to_seconds', 19),
(26, 'years_to_weeks', 19),
(27, 'months_to_weeks', 19),
(28, 'seconds_to_months', 18),
(29, 'nibbles_to_yobibytes', 19),
(30, 'png_to_webp', 21),
(31, 'html_minifier', 25),
(32, 'dns_lookup', 31),
(33, 'md4_generator', 23),
(34, 'ip_lookup', 25),
(35, 'ping', 24),
(36, 'ssl_lookup', 24),
(37, 'reverse_ip_lookup', 26),
(38, 'nibbles_to_gibibytes', 18),
(39, 'text_size_calculator', 23),
(40, 'bits_to_gibibytes', 18),
(41, 'list_randomizer', 22),
(42, 'jpg_to_webp', 21),
(43, 'bits_to_bytes', 18),
(44, 'jpg_to_png', 20),
(45, 'kilometers_per_hour_to_miles_per_hour', 25),
(58, 'whois_lookup', 21),
(60, 'http_headers_lookup', 22),
(61, 'http2_checker', 21),
(62, 'brotli_checker', 22),
(63, 'safe_url_checker', 22),
(64, 'google_cache_checker', 24),
(65, 'url_redirect_checker', 23),
(66, 'password_strength_checker', 22),
(67, 'meta_tags_checker', 22),
(68, 'website_hosting_checker', 21),
(69, 'file_mime_type_checker', 22),
(70, 'gravatar_checker', 22),
(71, 'text_separator', 22),
(72, 'email_extractor', 24),
(73, 'url_extractor', 23),
(75, 'duplicate_lines_remover', 22),
(76, 'text_to_speech', 24),
(77, 'idn_punnycode_converter', 22),
(78, 'case_converter', 22),
(79, 'character_counter', 22),
(81, 'reverse_words', 22),
(82, 'reverse_letters', 22),
(83, 'emojis_remover', 23),
(84, 'reverse_list', 22),
(85, 'list_alphabetizer', 22),
(86, 'upside_down_text_generator', 22),
(87, 'old_english_text_generator', 22),
(88, 'cursive_text_generator', 22),
(89, 'palindrome_checker', 24),
(90, 'base64_encoder', 22),
(91, 'base64_decoder', 22),
(92, 'base64_to_image', 22),
(93, 'image_to_base64', 22),
(94, 'url_encoder', 22),
(96, 'color_converter', 22),
(97, 'binary_converter', 23),
(98, 'hex_converter', 22),
(99, 'ascii_converter', 22),
(100, 'decimal_converter', 22),
(101, 'octal_converter', 22),
(102, 'morse_converter', 26),
(103, 'number_to_words_converter', 22),
(104, 'paypal_link_generator', 22),
(105, 'signature_generator', 22),
(106, 'mailto_link_generator', 22),
(108, 'whatsapp_link_generator', 23),
(109, 'youtube_timestamp_link_generator', 22),
(110, 'slug_generator', 25),
(111, 'lorem_ipsum_generator', 22),
(112, 'password_generator', 22),
(113, 'random_number_generator', 25),
(114, 'uuid_v4_generator', 22),
(115, 'bcrypt_generator', 22),
(116, 'md2_generator', 22),
(118, 'md5_generator', 22),
(119, 'whirlpool_generator', 22),
(120, 'sha1_generator', 22),
(121, 'sha224_generator', 22),
(122, 'sha256_generator', 22),
(123, 'sha384_generator', 23),
(124, 'sha512_generator', 22),
(126, 'sha512_256_generator', 22),
(127, 'sha3_224_generator', 22),
(128, 'sha3_256_generator', 22),
(129, 'sha3_384_generator', 22),
(130, 'sha3_512_generator', 23),
(131, 'ripemd128_generator', 23),
(132, 'ripemd160_generator', 22),
(133, 'ripemd256_generator', 24),
(134, 'ripemd320_generator', 23),
(136, 'css_minifier', 23),
(137, 'js_minifier', 23),
(138, 'json_validator_beautifier', 23),
(139, 'sql_beautifier', 22),
(140, 'html_entity_converter', 22),
(141, 'bbcode_to_html', 22),
(142, 'markdown_to_html', 21),
(143, 'html_tags_remover', 22),
(144, 'user_agent_parser', 22),
(145, 'url_parser', 21),
(146, 'image_optimizer', 22),
(147, 'png_to_jpg', 21),
(148, 'png_to_bmp', 21),
(149, 'png_to_ico', 20),
(150, 'png_to_gif', 20),
(152, 'png_to_avif', 21),
(153, 'png_to_tiff', 20),
(154, 'png_to_tga', 20),
(156, 'jpg_to_bmp', 21),
(157, 'jpg_to_ico', 20),
(158, 'jpg_to_gif', 20),
(160, 'jpg_to_avif', 20),
(161, 'jpg_to_tiff', 20),
(162, 'jpg_to_tga', 21),
(163, 'bmp_to_png', 23),
(164, 'bmp_to_jpg', 20),
(165, 'bmp_to_ico', 20),
(166, 'bmp_to_gif', 20),
(167, 'bmp_to_webp', 20),
(168, 'bmp_to_avif', 22),
(169, 'bmp_to_tiff', 20),
(170, 'bmp_to_tga', 20),
(171, 'ico_to_png', 20),
(172, 'ico_to_jpg', 20),
(173, 'ico_to_bmp', 20),
(174, 'ico_to_gif', 20),
(175, 'ico_to_webp', 22),
(176, 'ico_to_avif', 20),
(177, 'ico_to_tiff', 20),
(178, 'ico_to_tga', 22),
(179, 'gif_to_png', 20),
(180, 'gif_to_jpg', 20),
(181, 'gif_to_bmp', 21),
(182, 'gif_to_ico', 21),
(183, 'gif_to_webp', 21),
(184, 'gif_to_avif', 20),
(185, 'gif_to_tiff', 19),
(186, 'gif_to_tga', 19),
(187, 'webp_to_png', 20),
(188, 'webp_to_jpg', 21),
(189, 'webp_to_bmp', 30),
(190, 'webp_to_ico', 20),
(191, 'webp_to_gif', 21),
(192, 'webp_to_avif', 20),
(193, 'webp_to_tiff', 20),
(194, 'webp_to_tga', 21),
(195, 'heic_to_png', 22),
(196, 'heic_to_jpg', 20),
(197, 'heic_to_bmp', 20),
(198, 'heic_to_ico', 21),
(199, 'heic_to_gif', 20),
(200, 'heic_to_webp', 20),
(201, 'heic_to_avif', 21),
(202, 'heic_to_tiff', 21),
(203, 'heic_to_tga', 20),
(204, 'avif_to_png', 20),
(205, 'avif_to_jpg', 20),
(206, 'avif_to_bmp', 24),
(207, 'avif_to_ico', 20),
(208, 'avif_to_gif', 21),
(209, 'avif_to_webp', 20),
(210, 'avif_to_tiff', 21),
(211, 'avif_to_tga', 20),
(212, 'tiff_to_png', 20),
(213, 'tiff_to_jpg', 21),
(214, 'tiff_to_bmp', 21),
(215, 'tiff_to_ico', 20),
(216, 'tiff_to_gif', 21),
(217, 'tiff_to_webp', 20),
(218, 'tiff_to_avif', 21),
(219, 'tiff_to_tga', 20),
(220, 'celsius_to_fahrenheit', 30),
(221, 'celsius_to_kelvin', 20),
(222, 'fahrenheit_to_celsius', 20),
(223, 'fahrenheit_to_kelvin', 21),
(224, 'kelvin_to_celsius', 21),
(225, 'kelvin_to_fahrenheit', 20),
(226, 'miles_per_hour_to_kilometers_per_hour', 20),
(227, 'number_to_roman_numerals', 20),
(228, 'roman_numerals_to_number', 21),
(229, 'unix_timestamp_to_date', 20),
(230, 'date_to_unix_timestamp', 21),
(231, 'seconds_to_milliseconds', 18),
(232, 'seconds_to_microseconds', 18),
(233, 'seconds_to_nanoseconds', 18),
(234, 'seconds_to_picoseconds', 18),
(235, 'seconds_to_minutes', 17),
(236, 'seconds_to_hours', 17),
(237, 'seconds_to_days', 17),
(240, 'seconds_to_years', 18),
(241, 'milliseconds_to_seconds', 18),
(242, 'milliseconds_to_microseconds', 18),
(243, 'milliseconds_to_nanoseconds', 18),
(244, 'milliseconds_to_picoseconds', 21),
(245, 'milliseconds_to_minutes', 18),
(246, 'milliseconds_to_hours', 22),
(247, 'milliseconds_to_days', 18),
(248, 'milliseconds_to_weeks', 34),
(249, 'milliseconds_to_months', 18),
(250, 'milliseconds_to_years', 22),
(251, 'microseconds_to_seconds', 18),
(252, 'microseconds_to_milliseconds', 18),
(253, 'microseconds_to_nanoseconds', 18),
(254, 'microseconds_to_picoseconds', 18),
(255, 'microseconds_to_minutes', 19),
(256, 'microseconds_to_hours', 18),
(257, 'microseconds_to_days', 18),
(258, 'microseconds_to_weeks', 18),
(259, 'microseconds_to_months', 18),
(260, 'microseconds_to_years', 18),
(261, 'nanoseconds_to_seconds', 18),
(262, 'nanoseconds_to_milliseconds', 18),
(263, 'nanoseconds_to_microseconds', 18),
(264, 'nanoseconds_to_picoseconds', 18),
(265, 'nanoseconds_to_minutes', 18),
(266, 'nanoseconds_to_hours', 18),
(267, 'nanoseconds_to_days', 18),
(268, 'nanoseconds_to_weeks', 18),
(269, 'nanoseconds_to_months', 21),
(270, 'nanoseconds_to_years', 18),
(271, 'picoseconds_to_seconds', 18),
(272, 'picoseconds_to_milliseconds', 18),
(273, 'picoseconds_to_microseconds', 18),
(274, 'picoseconds_to_nanoseconds', 18),
(275, 'picoseconds_to_minutes', 18),
(276, 'picoseconds_to_hours', 18),
(277, 'picoseconds_to_days', 20),
(278, 'picoseconds_to_weeks', 19),
(279, 'picoseconds_to_months', 20),
(280, 'picoseconds_to_years', 20),
(282, 'minutes_to_milliseconds', 18),
(283, 'minutes_to_microseconds', 18),
(284, 'minutes_to_nanoseconds', 18),
(285, 'minutes_to_picoseconds', 18),
(620, 'hours_to_milliseconds', 19),
(623, 'hours_to_microseconds', 16),
(624, 'hours_to_nanoseconds', 16),
(627, 'hours_to_picoseconds', 16),
(629, 'hours_to_minutes', 15),
(630, 'hours_to_weeks', 15),
(633, 'hours_to_months', 15),
(637, 'days_to_seconds', 15),
(639, 'days_to_milliseconds', 16),
(642, 'days_to_microseconds', 16),
(645, 'days_to_nanoseconds', 17),
(650, 'days_to_picoseconds', 16),
(652, 'days_to_minutes', 15),
(655, 'days_to_hours', 15),
(668, 'days_to_years', 15),
(682, 'weeks_to_milliseconds', 16),
(686, 'weeks_to_microseconds', 16),
(695, 'weeks_to_nanoseconds', 16),
(699, 'weeks_to_picoseconds', 17),
(715, 'weeks_to_days', 15),
(719, 'weeks_to_months', 15),
(733, 'months_to_milliseconds', 17),
(734, 'months_to_microseconds', 17),
(745, 'months_to_nanoseconds', 16),
(749, 'months_to_picoseconds', 16),
(751, 'months_to_minutes', 15),
(761, 'months_to_hours', 16),
(764, 'months_to_days', 15),
(777, 'years_to_milliseconds', 16),
(781, 'years_to_microseconds', 16),
(784, 'years_to_nanoseconds', 16),
(793, 'years_to_picoseconds', 16),
(796, 'years_to_minutes', 15),
(808, 'years_to_days', 16),
(812, 'years_to_months', 15),
(816, 'bits_to_nibbles', 18),
(820, 'bits_to_kibibits', 19),
(823, 'bits_to_kibibytes', 18),
(828, 'bits_to_kilobytes', 19),
(830, 'bits_to_kilobits', 19),
(831, 'bits_to_megabits', 18),
(834, 'bits_to_mebibits', 18),
(836, 'bits_to_megabytes', 21),
(837, 'bits_to_mebibytes', 19),
(841, 'bits_to_gigabits', 18),
(842, 'bits_to_gibibits', 18),
(843, 'bits_to_gigabytes', 19),
(847, 'bits_to_terabits', 18),
(849, 'bits_to_tebibits', 18),
(852, 'bits_to_terabytes', 19),
(855, 'bits_to_tebibytes', 19),
(856, 'bits_to_petabits', 18),
(858, 'bits_to_pebibits', 19),
(860, 'bits_to_petabytes', 18),
(861, 'bits_to_pebibytes', 20),
(864, 'bits_to_exabits', 19),
(865, 'bits_to_exbibits', 18),
(867, 'bits_to_exabytes', 18),
(870, 'bits_to_exbibytes', 19),
(871, 'bits_to_zettabits', 20),
(873, 'bits_to_zebibits', 19),
(876, 'bits_to_zettabytes', 18),
(877, 'bits_to_zebibytes', 18),
(879, 'bits_to_yottabits', 18),
(881, 'bits_to_yobibits', 20),
(883, 'bits_to_yottabytes', 18),
(885, 'bits_to_yobibytes', 18),
(887, 'nibbles_to_bits', 18),
(888, 'nibbles_to_bytes', 18),
(890, 'nibbles_to_kilobits', 20),
(893, 'nibbles_to_kibibits', 18),
(895, 'nibbles_to_kibibytes', 21),
(896, 'nibbles_to_kilobytes', 19),
(898, 'nibbles_to_megabits', 18),
(901, 'nibbles_to_mebibits', 18),
(902, 'nibbles_to_megabytes', 19),
(905, 'nibbles_to_mebibytes', 18),
(907, 'nibbles_to_gigabits', 18),
(908, 'nibbles_to_gibibits', 18),
(910, 'nibbles_to_gigabytes', 25),
(913, 'nibbles_to_terabits', 18),
(916, 'nibbles_to_tebibits', 18),
(918, 'nibbles_to_terabytes', 18),
(919, 'nibbles_to_tebibytes', 18),
(923, 'nibbles_to_petabits', 18),
(924, 'nibbles_to_pebibits', 18),
(925, 'nibbles_to_petabytes', 18),
(929, 'nibbles_to_exabits', 18),
(930, 'nibbles_to_exbibits', 18),
(934, 'nibbles_to_exabytes', 19),
(935, 'nibbles_to_exbibytes', 20),
(937, 'nibbles_to_zettabits', 20),
(940, 'nibbles_to_zebibits', 18),
(941, 'nibbles_to_zettabytes', 18),
(943, 'nibbles_to_zebibytes', 19),
(945, 'nibbles_to_yottabits', 18),
(947, 'nibbles_to_yobibits', 19),
(948, 'nibbles_to_yottabytes', 18),
(952, 'bytes_to_bits', 20),
(954, 'bytes_to_nibbles', 18),
(958, 'bytes_to_kilobits', 19),
(959, 'bytes_to_kibibits', 18),
(960, 'bytes_to_kibibytes', 19),
(963, 'bytes_to_kilobytes', 18),
(964, 'bytes_to_megabits', 19),
(966, 'bytes_to_mebibits', 18),
(968, 'bytes_to_megabytes', 18),
(971, 'bytes_to_mebibytes', 18),
(973, 'bytes_to_gigabits', 18),
(976, 'bytes_to_gibibits', 20),
(977, 'bytes_to_gigabytes', 19),
(978, 'bytes_to_gibibytes', 19),
(981, 'bytes_to_terabits', 19),
(982, 'bytes_to_tebibits', 18),
(984, 'bytes_to_terabytes', 19),
(1283, 'bytes_to_tebibytes', 17),
(1284, 'bytes_to_petabits', 17),
(1285, 'bytes_to_pebibits', 18),
(1286, 'bytes_to_petabytes', 18),
(1287, 'bytes_to_pebibytes', 17),
(1288, 'bytes_to_exabits', 18),
(1289, 'bytes_to_exbibits', 18),
(1290, 'bytes_to_exabytes', 17),
(1291, 'bytes_to_exbibytes', 17),
(1292, 'bytes_to_zettabits', 18),
(1293, 'bytes_to_zebibits', 17),
(1294, 'bytes_to_zettabytes', 17),
(1295, 'bytes_to_zebibytes', 17),
(1296, 'bytes_to_yottabits', 18),
(1297, 'bytes_to_yobibits', 17),
(1298, 'bytes_to_yottabytes', 17),
(1300, 'bytes_to_yobibytes', 18),
(1301, 'kilobits_to_bits', 17),
(1302, 'kilobits_to_nibbles', 18),
(1303, 'kilobits_to_bytes', 18),
(1304, 'kilobits_to_kibibits', 17),
(1306, 'kilobits_to_kibibytes', 17),
(1307, 'kilobits_to_kilobytes', 20),
(1308, 'kilobits_to_megabits', 17),
(1309, 'kilobits_to_mebibits', 20),
(1311, 'kilobits_to_megabytes', 19),
(1312, 'kilobits_to_mebibytes', 18),
(1313, 'kilobits_to_gigabits', 17),
(1314, 'kilobits_to_gibibits', 18),
(1315, 'kilobits_to_gigabytes', 17),
(1317, 'kilobits_to_gibibytes', 17),
(1318, 'kilobits_to_terabits', 17),
(1319, 'kilobits_to_tebibits', 18),
(1320, 'kilobits_to_terabytes', 17),
(1321, 'kilobits_to_tebibytes', 17),
(1323, 'kilobits_to_petabits', 17),
(1324, 'kilobits_to_pebibits', 17),
(1325, 'kilobits_to_petabytes', 17),
(1326, 'kilobits_to_pebibytes', 17),
(1327, 'kilobits_to_exabits', 20),
(1328, 'kilobits_to_exbibits', 18),
(1330, 'kilobits_to_exabytes', 18),
(1331, 'kilobits_to_exbibytes', 18),
(1332, 'kilobits_to_zettabits', 18),
(1333, 'kilobits_to_zebibits', 18),
(1334, 'kilobits_to_zettabytes', 18),
(1336, 'kilobits_to_zebibytes', 17),
(1337, 'kilobits_to_yottabits', 17),
(1338, 'kilobits_to_yobibits', 17),
(1339, 'kilobits_to_yottabytes', 18),
(1341, 'kilobits_to_yobibytes', 18),
(1342, 'kibibits_to_bits', 17),
(1343, 'kibibits_to_nibbles', 17),
(1344, 'kibibits_to_bytes', 17),
(1345, 'kibibits_to_kilobits', 17),
(1347, 'kibibits_to_kibibytes', 19),
(1348, 'kibibits_to_kilobytes', 18),
(1349, 'kibibits_to_megabits', 18),
(1350, 'kibibits_to_mebibits', 17),
(1351, 'kibibits_to_megabytes', 17),
(1353, 'kibibits_to_mebibytes', 18),
(1354, 'kibibits_to_gigabits', 20),
(1355, 'kibibits_to_gibibits', 18),
(1356, 'kibibits_to_gigabytes', 17),
(1357, 'kibibits_to_gibibytes', 18),
(1359, 'kibibits_to_terabits', 17),
(1360, 'kibibits_to_tebibits', 18),
(1361, 'kibibits_to_terabytes', 17),
(1362, 'kibibits_to_tebibytes', 19),
(1363, 'kibibits_to_petabits', 17),
(1365, 'kibibits_to_pebibits', 20),
(1366, 'kibibits_to_petabytes', 18),
(1367, 'kibibits_to_pebibytes', 17),
(1368, 'kibibits_to_exabits', 17),
(1369, 'kibibits_to_exbibits', 17),
(1371, 'kibibits_to_exabytes', 17),
(1372, 'kibibits_to_exbibytes', 19),
(1373, 'kibibits_to_zettabits', 17),
(1374, 'kibibits_to_zebibits', 20),
(1375, 'kibibits_to_zettabytes', 17),
(1377, 'kibibits_to_zebibytes', 17),
(1378, 'kibibits_to_yottabits', 18),
(1379, 'kibibits_to_yobibits', 17),
(1380, 'kibibits_to_yottabytes', 17),
(1381, 'kibibits_to_yobibytes', 17),
(1382, 'kibibytes_to_bits', 17),
(1384, 'kibibytes_to_nibbles', 17),
(1385, 'kibibytes_to_bytes', 20),
(1386, 'kibibytes_to_kilobits', 17),
(1387, 'kibibytes_to_kibibits', 17),
(1389, 'kibibytes_to_kilobytes', 19),
(1390, 'kibibytes_to_megabits', 17),
(1391, 'kibibytes_to_mebibits', 17),
(1392, 'kibibytes_to_megabytes', 18),
(1394, 'kibibytes_to_mebibytes', 17),
(1395, 'kibibytes_to_gigabits', 18),
(1396, 'kibibytes_to_gibibits', 17),
(1397, 'kibibytes_to_gigabytes', 20),
(1398, 'kibibytes_to_gibibytes', 17),
(1400, 'kibibytes_to_terabits', 17),
(1401, 'kibibytes_to_tebibits', 17),
(1402, 'kibibytes_to_terabytes', 17),
(1403, 'kibibytes_to_tebibytes', 19),
(1404, 'kibibytes_to_petabits', 17),
(1406, 'kibibytes_to_pebibits', 17),
(1407, 'kibibytes_to_petabytes', 19),
(1408, 'kibibytes_to_pebibytes', 17),
(1409, 'kibibytes_to_exabits', 18),
(1411, 'kibibytes_to_exbibits', 17),
(1412, 'kibibytes_to_exabytes', 18),
(1413, 'kibibytes_to_exbibytes', 17),
(1414, 'kibibytes_to_zettabits', 17),
(1415, 'kibibytes_to_zebibits', 17),
(1417, 'kibibytes_to_zettabytes', 20),
(1418, 'kibibytes_to_zebibytes', 17),
(1419, 'kibibytes_to_yottabits', 17),
(1420, 'kibibytes_to_yobibits', 17),
(1422, 'kibibytes_to_yottabytes', 18),
(1423, 'kibibytes_to_yobibytes', 17),
(1424, 'kilobytes_to_bits', 17),
(1425, 'kilobytes_to_nibbles', 19),
(1427, 'kilobytes_to_bytes', 17),
(1428, 'kilobytes_to_kilobits', 17),
(1430, 'kilobytes_to_kibibits', 18),
(1431, 'kilobytes_to_kibibytes', 18),
(1433, 'kilobytes_to_megabits', 17),
(1434, 'kilobytes_to_mebibits', 17),
(1435, 'kilobytes_to_megabytes', 18),
(1436, 'kilobytes_to_mebibytes', 17),
(1437, 'kilobytes_to_gigabits', 17),
(1439, 'kilobytes_to_gibibits', 18),
(1440, 'kilobytes_to_gigabytes', 17),
(1441, 'kilobytes_to_gibibytes', 19),
(1442, 'kilobytes_to_terabits', 18),
(1443, 'kilobytes_to_tebibits', 18),
(1445, 'kilobytes_to_terabytes', 19),
(1446, 'kilobytes_to_tebibytes', 17),
(1447, 'kilobytes_to_petabits', 19),
(1448, 'kilobytes_to_pebibits', 17),
(1449, 'kilobytes_to_petabytes', 17),
(1451, 'kilobytes_to_pebibytes', 17),
(1452, 'kilobytes_to_exabits', 17),
(1453, 'kilobytes_to_exbibits', 17),
(1454, 'kilobytes_to_exabytes', 17),
(1455, 'kilobytes_to_exbibytes', 17),
(1457, 'kilobytes_to_zettabits', 17),
(1458, 'kilobytes_to_zebibits', 18),
(1459, 'kilobytes_to_zettabytes', 17),
(1460, 'kilobytes_to_zebibytes', 18),
(1461, 'kilobytes_to_yottabits', 17),
(1463, 'kilobytes_to_yobibits', 17),
(1464, 'kilobytes_to_yottabytes', 18),
(1465, 'kilobytes_to_yobibytes', 19),
(1466, 'megabits_to_bits', 17),
(1467, 'megabits_to_nibbles', 17),
(1469, 'megabits_to_bytes', 18),
(1470, 'megabits_to_kilobits', 17),
(1471, 'megabits_to_kibibits', 17),
(1472, 'megabits_to_kibibytes', 17),
(1473, 'megabits_to_kilobytes', 17),
(1475, 'megabits_to_mebibits', 19),
(1476, 'megabits_to_megabytes', 17),
(1477, 'megabits_to_mebibytes', 18),
(1478, 'megabits_to_gigabits', 17),
(1479, 'megabits_to_gibibits', 17),
(1481, 'megabits_to_gigabytes', 17),
(1482, 'megabits_to_gibibytes', 17),
(1483, 'megabits_to_terabits', 18),
(1484, 'megabits_to_tebibits', 17),
(1485, 'megabits_to_terabytes', 17),
(1487, 'megabits_to_tebibytes', 17),
(1488, 'megabits_to_petabits', 18),
(1489, 'megabits_to_pebibits', 18),
(1490, 'megabits_to_petabytes', 17),
(1492, 'megabits_to_pebibytes', 17),
(1493, 'megabits_to_exabits', 17),
(1494, 'megabits_to_exbibits', 17),
(1495, 'megabits_to_exabytes', 21),
(1496, 'megabits_to_exbibytes', 19),
(1498, 'megabits_to_zettabits', 17),
(1499, 'megabits_to_zebibits', 19),
(1500, 'megabits_to_zettabytes', 20),
(1501, 'megabits_to_zebibytes', 17),
(1502, 'megabits_to_yottabits', 18),
(1504, 'megabits_to_yobibits', 17),
(1506, 'megabits_to_yottabytes', 17),
(1507, 'megabits_to_yobibytes', 18),
(1508, 'mebibits_to_bits', 19),
(1509, 'mebibits_to_nibbles', 17),
(1510, 'mebibits_to_bytes', 17),
(1512, 'mebibits_to_kilobits', 17),
(1513, 'mebibits_to_kibibits', 19),
(1514, 'mebibits_to_kibibytes', 18),
(1515, 'mebibits_to_kilobytes', 17),
(1517, 'mebibits_to_megabits', 17),
(1518, 'mebibits_to_megabytes', 17),
(1519, 'mebibits_to_mebibytes', 17),
(1520, 'mebibits_to_gigabits', 17),
(1521, 'mebibits_to_gibibits', 17),
(1522, 'mebibits_to_gigabytes', 20),
(1524, 'mebibits_to_gibibytes', 17),
(1525, 'mebibits_to_terabits', 20),
(1526, 'mebibits_to_tebibits', 18),
(1527, 'mebibits_to_terabytes', 17),
(1528, 'mebibits_to_tebibytes', 18),
(1530, 'mebibits_to_petabits', 17),
(1531, 'mebibits_to_pebibits', 17),
(1532, 'mebibits_to_petabytes', 17),
(1533, 'mebibits_to_pebibytes', 17),
(1535, 'mebibits_to_exabits', 18),
(1536, 'mebibits_to_exbibits', 17),
(1537, 'mebibits_to_exabytes', 17),
(1538, 'mebibits_to_exbibytes', 19),
(1539, 'mebibits_to_zettabits', 19),
(1541, 'mebibits_to_zebibits', 17),
(1542, 'mebibits_to_zettabytes', 19),
(1543, 'mebibits_to_zebibytes', 17),
(1544, 'mebibits_to_yottabits', 17),
(1546, 'mebibits_to_yobibits', 17),
(1547, 'mebibits_to_yottabytes', 17),
(1548, 'mebibits_to_yobibytes', 17),
(1549, 'megabytes_to_bits', 17),
(1551, 'megabytes_to_nibbles', 18),
(1552, 'megabytes_to_bytes', 17),
(1553, 'megabytes_to_kilobits', 18),
(1554, 'megabytes_to_kibibits', 19),
(1555, 'megabytes_to_kibibytes', 17),
(1557, 'megabytes_to_kilobytes', 17),
(1558, 'megabytes_to_megabits', 20),
(1559, 'megabytes_to_mebibits', 17),
(1560, 'megabytes_to_mebibytes', 18),
(1561, 'megabytes_to_gigabits', 17),
(1563, 'megabytes_to_gibibits', 17),
(1564, 'megabytes_to_gigabytes', 18),
(2158, 'mebibytes_to_zebibytes', 12),
(2160, 'gigabytes_to_yottabytes', 12),
(2162, 'petabits_to_megabits', 12),
(2173, 'terabits_to_gigabits', 12),
(2175, 'terabytes_to_zettabits', 12),
(2177, 'tebibytes_to_yottabits', 13),
(2195, 'mebibytes_to_pebibits', 13),
(2208, 'tebibytes_to_nibbles', 13),
(2212, 'gibibits_to_gigabits', 12),
(2230, 'mebibytes_to_gibibits', 12),
(2234, 'gigabits_to_mebibytes', 12),
(2240, 'megabytes_to_terabits', 14),
(2246, 'pebibits_to_gibibits', 12),
(2251, 'mebibytes_to_bytes', 12),
(2253, 'gigabytes_to_bytes', 13),
(2257, 'gibibytes_to_mebibytes', 12),
(2262, 'gigabytes_to_exabytes', 12),
(2274, 'gigabits_to_terabits', 12),
(2281, 'gigabits_to_megabytes', 12),
(2283, 'gigabytes_to_kilobits', 13),
(2285, 'terabytes_to_pebibytes', 13),
(2287, 'gigabytes_to_zebibits', 13),
(2296, 'tebibytes_to_petabytes', 12),
(2298, 'gigabits_to_yottabytes', 12),
(2300, 'pebibits_to_kilobits', 12),
(2302, 'gibibytes_to_zebibytes', 12),
(2309, 'petabits_to_kibibits', 13),
(2313, 'terabits_to_exabytes', 12),
(2318, 'gigabytes_to_gigabits', 12),
(2326, 'mebibytes_to_yobibits', 14),
(2330, 'pebibits_to_bytes', 12),
(2335, 'gigabits_to_tebibits', 12),
(2337, 'gibibytes_to_pebibits', 12),
(2341, 'gigabytes_to_mebibits', 12),
(2343, 'terabits_to_kibibytes', 13),
(2350, 'tebibits_to_kilobits', 12),
(2352, 'terabytes_to_gibibits', 12),
(2355, 'petabits_to_yobibits', 14),
(2359, 'gibibytes_to_megabits', 14),
(2368, 'tebibytes_to_mebibits', 12),
(2375, 'tebibytes_to_exabits', 12),
(2388, 'gigabits_to_zebibits', 12),
(2390, 'gibibytes_to_gibibits', 12),
(2392, 'gigabits_to_tebibytes', 12),
(2396, 'terabits_to_exabits', 12),
(2405, 'megabytes_to_yobibytes', 12),
(2416, 'tebibytes_to_terabytes', 12),
(2420, 'petabits_to_exabits', 12),
(2423, 'gibibits_to_terabytes', 12),
(2431, 'tebibits_to_exbibytes', 12),
(2440, 'petabits_to_terabytes', 12),
(2459, 'tebibytes_to_megabits', 12),
(2466, 'gigabits_to_yottabits', 12),
(2470, 'gigabits_to_gibibits', 12),
(2472, 'gibibytes_to_zettabits', 12),
(2476, 'mebibytes_to_exabits', 12),
(2481, 'terabytes_to_yottabytes', 12),
(2485, 'tebibits_to_zebibytes', 13),
(2489, 'gigabytes_to_zettabits', 13),
(2491, 'gibibytes_to_tebibits', 12),
(2493, 'gigabytes_to_terabits', 12),
(2496, 'gigabits_to_exabytes', 12),
(2498, 'terabits_to_yottabytes', 13),
(2500, 'tebibits_to_mebibytes', 12),
(2506, 'gibibits_to_bytes', 13),
(2517, 'terabytes_to_yottabits', 14),
(2535, 'terabits_to_exbibytes', 14),
(2541, 'pebibits_to_nibbles', 12),
(2543, 'petabits_to_megabytes', 12),
(2548, 'petabits_to_tebibits', 13),
(2550, 'mebibytes_to_petabits', 12),
(2554, 'gibibytes_to_gigabytes', 12),
(2558, 'tebibits_to_yottabytes', 13),
(2560, 'pebibits_to_terabits', 13),
(2563, 'petabits_to_mebibits', 13),
(2565, 'tebibits_to_petabytes', 13),
(2567, 'pebibits_to_petabytes', 12),
(2573, 'gigabits_to_zettabits', 12),
(2582, 'megabytes_to_tebibytes', 12),
(2586, 'gibibytes_to_kibibytes', 12),
(2589, 'tebibits_to_gibibits', 12),
(2595, 'terabits_to_petabytes', 12),
(2597, 'tebibits_to_zettabits', 12),
(2608, 'gigabytes_to_megabits', 12),
(2610, 'mebibytes_to_zettabits', 13),
(2615, 'terabytes_to_pebibits', 12),
(2619, 'tebibits_to_tebibytes', 12),
(2627, 'gibibytes_to_pebibytes', 12),
(2630, 'petabits_to_kilobits', 12),
(2634, 'pebibits_to_pebibytes', 12),
(2642, 'gibibytes_to_yottabits', 12),
(2645, 'terabits_to_bits', 12),
(2649, 'petabits_to_zettabytes', 13),
(2651, 'tebibytes_to_gibibits', 15),
(2655, 'terabits_to_kibibits', 12),
(2657, 'tebibits_to_megabytes', 12),
(2662, 'megabytes_to_pebibytes', 12),
(2668, 'gibibytes_to_megabytes', 12),
(2670, 'gigabytes_to_zettabytes', 12),
(2681, 'tebibytes_to_yobibytes', 12),
(2688, 'terabits_to_bytes', 13),
(2694, 'mebibytes_to_petabytes', 12),
(2705, 'tebibytes_to_gibibytes', 14),
(2716, 'terabytes_to_yobibytes', 13),
(2720, 'petabits_to_petabytes', 12),
(2727, 'terabits_to_tebibits', 12),
(2729, 'tebibits_to_gibibytes', 12),
(2731, 'petabits_to_zebibytes', 12),
(2738, 'gibibits_to_zebibits', 13),
(2740, 'tebibits_to_mebibits', 12),
(2744, 'gibibytes_to_petabits', 12),
(2748, 'tebibytes_to_zettabytes', 13),
(2751, 'gibibits_to_exabytes', 12),
(2753, 'mebibytes_to_megabytes', 12),
(2761, 'gigabytes_to_bits', 12),
(2768, 'gibibits_to_kibibytes', 12),
(2783, 'pebibits_to_tebibits', 12),
(2789, 'gibibits_to_megabytes', 12),
(2792, 'petabits_to_yobibytes', 12),
(2796, 'gigabits_to_mebibits', 12),
(2798, 'gibibits_to_exbibytes', 14),
(2800, 'tebibytes_to_megabytes', 12),
(2807, 'terabits_to_megabits', 12),
(2822, 'mebibytes_to_tebibits', 13),
(2826, 'gigabits_to_exbibytes', 12),
(2833, 'megabytes_to_exabits', 13),
(2835, 'terabytes_to_megabytes', 13),
(2841, 'terabits_to_kilobytes', 12),
(2848, 'mebibytes_to_exbibits', 12),
(2850, 'tebibits_to_yobibits', 12),
(2856, 'megabytes_to_exbibits', 12),
(2869, 'gibibytes_to_bits', 12),
(2873, 'gigabytes_to_tebibits', 13),
(2884, 'pebibits_to_megabits', 12),
(2895, 'gibibits_to_zettabytes', 12),
(2897, 'terabytes_to_terabits', 12),
(2904, 'tebibytes_to_gigabits', 12),
(2910, 'gibibits_to_petabytes', 12),
(2915, 'terabits_to_megabytes', 13),
(2922, 'gibibits_to_zettabits', 12),
(2935, 'tebibytes_to_kibibits', 12),
(2937, 'tebibits_to_pebibits', 13),
(2939, 'gibibits_to_yobibytes', 12),
(2942, 'gibibits_to_zebibytes', 13),
(2950, 'gibibits_to_yottabytes', 12),
(2954, 'terabits_to_kilobits', 12),
(2957, 'pebibits_to_bits', 12),
(2959, 'tebibits_to_gigabytes', 14),
(2963, 'megabytes_to_yottabits', 12),
(2965, 'tebibytes_to_yottabytes', 12),
(2967, 'gigabits_to_kibibits', 12),
(2972, 'pebibits_to_kilobytes', 12),
(2983, 'gigabits_to_petabytes', 12),
(2985, 'tebibytes_to_zettabits', 13),
(2991, 'gibibytes_to_tebibytes', 14),
(2993, 'petabits_to_yottabytes', 13),
(2996, 'gibibytes_to_exabits', 13),
(3009, 'pebibits_to_gigabits', 13),
(3022, 'megabytes_to_petabytes', 14),
(3024, 'tebibits_to_petabits', 12),
(3026, 'gibibits_to_mebibytes', 12),
(3037, 'gigabits_to_yobibytes', 12),
(3039, 'gibibytes_to_nibbles', 12),
(3041, 'terabits_to_mebibits', 12),
(3052, 'terabytes_to_zebibits', 12),
(3054, 'tebibits_to_kibibits', 13),
(3060, 'gigabytes_to_exbibytes', 13),
(3062, 'gigabits_to_kibibytes', 12),
(3064, 'terabits_to_petabits', 14),
(3071, 'terabits_to_pebibits', 12),
(3073, 'gigabytes_to_pebibytes', 12),
(3080, 'gibibits_to_petabits', 12),
(3082, 'gigabytes_to_zebibytes', 13),
(3084, 'petabits_to_kibibytes', 12),
(3097, 'gigabytes_to_gibibytes', 13),
(3101, 'pebibits_to_kibibits', 12),
(3104, 'mebibytes_to_yottabits', 13),
(3110, 'gibibytes_to_kilobytes', 12),
(3112, 'terabits_to_mebibytes', 12),
(3115, 'terabytes_to_exbibytes', 12),
(3117, 'tebibytes_to_bytes', 12),
(3119, 'gibibytes_to_zettabytes', 13),
(3125, 'tebibytes_to_petabits', 12),
(3127, 'terabits_to_gigabytes', 12),
(3134, 'pebibits_to_mebibits', 12),
(3136, 'tebibytes_to_zebibits', 13),
(3138, 'tebibytes_to_yobibits', 12),
(3140, 'gibibytes_to_terabytes', 12),
(3149, 'petabits_to_bytes', 12),
(3151, 'gibibytes_to_terabits', 12),
(3156, 'terabytes_to_zebibytes', 14),
(3161, 'tebibytes_to_bits', 15),
(3163, 'petabits_to_kilobytes', 12),
(3174, 'megabytes_to_exbibytes', 12),
(3176, 'mebibytes_to_kilobits', 12),
(3178, 'terabytes_to_exabits', 14),
(3180, 'petabits_to_gibibytes', 12),
(3182, 'gigabytes_to_pebibits', 12),
(3193, 'terabytes_to_gigabytes', 12),
(3198, 'mebibytes_to_gigabits', 12),
(3209, 'tebibytes_to_gigabytes', 13),
(3211, 'gibibits_to_gibibytes', 12),
(3229, 'petabits_to_gigabytes', 12),
(3231, 'pebibits_to_gigabytes', 13),
(3246, 'terabytes_to_yobibits', 12),
(3255, 'pebibits_to_kibibytes', 12),
(3268, 'mebibytes_to_mebibits', 12),
(3281, 'gigabytes_to_yottabits', 12),
(3289, 'gigabytes_to_yobibits', 12),
(3291, 'tebibits_to_megabits', 12),
(3294, 'tebibits_to_gigabits', 13),
(3296, 'tebibytes_to_zebibytes', 12),
(3298, 'petabits_to_pebibytes', 15),
(3313, 'gibibits_to_tebibits', 12),
(3315, 'gibibytes_to_bytes', 12),
(3321, 'terabits_to_zettabytes', 13),
(3323, 'gibibytes_to_exbibytes', 12),
(3327, 'tebibytes_to_exbibits', 12),
(3329, 'megabytes_to_tebibits', 12),
(3331, 'terabytes_to_bytes', 13),
(3337, 'gibibytes_to_kilobits', 12),
(3340, 'petabits_to_mebibytes', 12),
(3342, 'megabytes_to_yobibits', 12),
(3344, 'tebibits_to_zebibits', 12),
(3346, 'gibibytes_to_yobibits', 12),
(3350, 'terabytes_to_mebibytes', 12),
(3353, 'megabytes_to_petabits', 12),
(3355, 'petabits_to_zebibits', 12),
(3359, 'terabits_to_yottabits', 12),
(3361, 'megabytes_to_zettabytes', 12),
(3368, 'megabytes_to_gibibytes', 12),
(3370, 'tebibytes_to_exbibytes', 13),
(3372, 'terabytes_to_tebibits', 12),
(3376, 'petabits_to_gibibits', 14),
(3383, 'gigabits_to_yobibits', 14),
(3387, 'terabits_to_zebibits', 12),
(3404, 'megabytes_to_zebibytes', 13),
(3408, 'terabytes_to_gigabits', 12),
(3424, 'tebibytes_to_kibibytes', 12),
(3428, 'megabytes_to_terabytes', 12),
(3430, 'gigabits_to_exabits', 12),
(3437, 'gibibytes_to_mebibits', 12),
(3443, 'gigabytes_to_megabytes', 12),
(3445, 'tebibits_to_bits', 12),
(3449, 'petabits_to_terabits', 14),
(3452, 'mebibytes_to_yobibytes', 12),
(3454, 'mebibytes_to_yottabytes', 12),
(3462, 'tebibits_to_zettabytes', 12),
(3471, 'terabytes_to_megabits', 12),
(3475, 'mebibytes_to_zettabytes', 12),
(3479, 'mebibytes_to_terabits', 12),
(3482, 'gigabits_to_kilobits', 12),
(3486, 'terabits_to_gibibytes', 12),
(3488, 'gibibytes_to_zebibits', 14),
(3497, 'gibibits_to_tebibytes', 14),
(3516, 'terabits_to_zebibytes', 13),
(3518, 'mebibytes_to_exbibytes', 12),
(3542, 'petabits_to_yottabits', 13),
(3544, 'gibibits_to_gigabytes', 13),
(3553, 'terabits_to_terabytes', 13),
(3570, 'terabytes_to_tebibytes', 14),
(3574, 'gibibits_to_pebibytes', 13),
(3578, 'terabytes_to_kilobits', 13),
(3582, 'tebibits_to_yottabits', 13),
(3584, 'petabits_to_exabytes', 14),
(3598, 'gibibits_to_yobibits', 12),
(3604, 'gigabytes_to_mebibytes', 14),
(3608, 'terabytes_to_gibibytes', 12),
(3611, 'tebibytes_to_kilobits', 16),
(3613, 'megabytes_to_exabytes', 13),
(3617, 'mebibytes_to_bits', 12),
(3619, 'gigabytes_to_nibbles', 12),
(3630, 'terabits_to_yobibytes', 12),
(3636, 'terabytes_to_bits', 12),
(3641, 'mebibytes_to_exabytes', 13),
(3643, 'gigabits_to_bytes', 12),
(3654, 'gibibytes_to_exabytes', 12),
(3656, 'gibibits_to_kibibits', 12),
(3660, 'gibibits_to_exbibits', 12),
(3664, 'pebibits_to_gibibytes', 12),
(3669, 'gigabits_to_petabits', 12),
(3686, 'pebibits_to_terabytes', 12),
(3688, 'gibibytes_to_petabytes', 12),
(3690, 'gigabytes_to_kibibytes', 12),
(3692, 'gigabits_to_megabits', 12),
(3697, 'gigabytes_to_petabits', 12),
(3701, 'petabits_to_gigabits', 12),
(3703, 'mebibytes_to_zebibits', 12),
(3705, 'megabytes_to_yottabytes', 13),
(3707, 'megabytes_to_zebibits', 12),
(3729, 'tebibits_to_yobibytes', 12),
(3735, 'petabits_to_bits', 12),
(3740, 'tebibits_to_terabits', 12),
(3746, 'gigabits_to_gibibytes', 12),
(3759, 'gigabits_to_terabytes', 12),
(3761, 'tebibits_to_exabytes', 12),
(3764, 'terabytes_to_kilobytes', 12),
(3774, 'mebibytes_to_gigabytes', 12),
(3802, 'megabytes_to_zettabits', 13),
(3804, 'terabytes_to_exbibits', 12),
(3806, 'terabits_to_exbibits', 12),
(3815, 'gibibits_to_yottabits', 12),
(3819, 'mebibytes_to_nibbles', 13),
(3822, 'terabits_to_zettabits', 13),
(3826, 'megabytes_to_pebibits', 12),
(3830, 'terabits_to_tebibytes', 13),
(3839, 'gibibytes_to_yobibytes', 12),
(3843, 'gibibytes_to_gigabits', 13),
(3846, 'petabits_to_exbibits', 13),
(3854, 'gibibytes_to_yottabytes', 12),
(3856, 'gibibits_to_exabits', 13),
(3859, 'pebibits_to_mebibytes', 15),
(3861, 'mebibytes_to_megabits', 12),
(3863, 'mebibytes_to_kibibytes', 12),
(3865, 'gigabytes_to_gibibits', 12),
(3874, 'tebibits_to_nibbles', 12),
(3876, 'tebibytes_to_terabits', 12),
(3887, 'gigabytes_to_kibibits', 12),
(3889, 'tebibytes_to_exabytes', 14),
(3902, 'gibibits_to_terabits', 12),
(3907, 'pebibits_to_tebibytes', 12),
(3911, 'tebibits_to_exabits', 12),
(3918, 'gigabits_to_nibbles', 13),
(3926, 'mebibytes_to_kibibits', 14),
(3928, 'gigabytes_to_terabytes', 12),
(3931, 'gigabits_to_bits', 12),
(3937, 'gigabytes_to_tebibytes', 12),
(3942, 'terabytes_to_zettabytes', 12),
(3944, 'gigabits_to_pebibytes', 12),
(3946, 'gibibits_to_kilobytes', 12),
(3950, 'gibibytes_to_kibibits', 14),
(3954, 'gigabits_to_exbibits', 13),
(3959, 'mebibytes_to_terabytes', 13),
(3970, 'tebibytes_to_pebibits', 13),
(3972, 'tebibits_to_bytes', 13),
(3985, 'gibibits_to_megabits', 14),
(3989, 'gigabytes_to_petabytes', 12),
(3993, 'gigabytes_to_exabits', 12),
(3998, 'tebibits_to_kibibytes', 12),
(4000, 'terabytes_to_nibbles', 12),
(4004, 'gigabits_to_gigabytes', 12),
(4006, 'petabits_to_tebibytes', 13),
(4008, 'pebibits_to_megabytes', 13),
(4017, 'gibibits_to_kilobits', 12),
(4019, 'terabits_to_pebibytes', 12),
(4024, 'terabytes_to_mebibits', 12),
(4032, 'gibibits_to_mebibits', 14),
(4043, 'gibibits_to_nibbles', 13),
(4052, 'terabytes_to_exabytes', 15),
(4054, 'terabits_to_yobibits', 12),
(4059, 'gibibits_to_pebibits', 12),
(4085, 'gibibytes_to_exbibits', 13),
(4090, 'terabytes_to_kibibits', 12),
(4096, 'mebibytes_to_pebibytes', 13),
(4098, 'tebibytes_to_tebibits', 12),
(4101, 'mebibytes_to_gibibytes', 14),
(4103, 'tebibytes_to_pebibytes', 13),
(4105, 'petabits_to_pebibits', 12),
(4118, 'mebibytes_to_tebibytes', 12),
(4120, 'tebibits_to_terabytes', 12),
(4122, 'gigabits_to_kilobytes', 12),
(4124, 'terabits_to_gibibits', 12),
(4126, 'mebibytes_to_kilobytes', 12),
(4128, 'tebibytes_to_kilobytes', 13),
(4146, 'tebibits_to_kilobytes', 12),
(4152, 'terabytes_to_petabytes', 12),
(4159, 'gigabytes_to_exbibits', 14),
(4167, 'gigabits_to_pebibits', 14),
(4170, 'terabytes_to_kibibytes', 14),
(4172, 'tebibits_to_pebibytes', 12),
(4178, 'gigabits_to_zettabytes', 12),
(4180, 'tebibits_to_exbibits', 12),
(4191, 'tebibytes_to_mebibytes', 12),
(4193, 'petabits_to_zettabits', 12),
(4195, 'gigabytes_to_yobibytes', 12),
(4198, 'gigabits_to_zebibytes', 14),
(4215, 'terabytes_to_petabits', 12),
(4217, 'pebibits_to_petabits', 12),
(4237, 'gibibits_to_bits', 13),
(4245, 'petabits_to_nibbles', 13),
(4254, 'terabits_to_nibbles', 12),
(4274, 'gigabytes_to_kilobytes', 12),
(4276, 'petabits_to_exbibytes', 12);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint UNSIGNED NOT NULL,
  `email` varchar(320) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `api_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twofa_secret` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anti_phishing_code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `one_time_login_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pending_email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_activation_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lost_password_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `is_newsletter_subscribed` tinyint NOT NULL DEFAULT '0',
  `has_pending_internal_notifications` tinyint NOT NULL DEFAULT '0',
  `plan_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `plan_expiration_date` datetime DEFAULT NULL,
  `plan_settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `plan_trial_done` tinyint DEFAULT '0',
  `plan_expiry_reminder` tinyint DEFAULT '0',
  `payment_subscription_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_processor` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_total_amount` float DEFAULT NULL,
  `payment_currency` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referred_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referred_by_has_converted` tinyint DEFAULT '0',
  `language` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'english',
  `currency` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'UTC',
  `preferences` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `datetime` datetime DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `continent_code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser_language` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `total_logins` int DEFAULT '0',
  `user_deletion_reminder` tinyint DEFAULT '0',
  `source` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'direct'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `name`, `billing`, `api_key`, `token_code`, `twofa_secret`, `anti_phishing_code`, `one_time_login_code`, `pending_email`, `email_activation_code`, `lost_password_code`, `type`, `status`, `is_newsletter_subscribed`, `has_pending_internal_notifications`, `plan_id`, `plan_expiration_date`, `plan_settings`, `plan_trial_done`, `plan_expiry_reminder`, `payment_subscription_id`, `payment_processor`, `payment_total_amount`, `payment_currency`, `referral_key`, `referred_by`, `referred_by_has_converted`, `language`, `currency`, `timezone`, `preferences`, `datetime`, `ip`, `continent_code`, `country`, `city_name`, `device_type`, `browser_language`, `browser_name`, `os_name`, `last_activity`, `total_logins`, `user_deletion_reminder`, `source`) VALUES
(1, 'sujonmahmudcse@gmail.com', '$2y$10$gs4bcAgF5Cpp9v.H5iz0cOkgq0xOJAA0ONNtcgVkovs0AoMlEGjXm', 'MD. Sujon Mahmud', '{\"type\":\"personal\",\"name\":\"\",\"address\":\"\",\"city\":\"\",\"county\":\"\",\"zip\":\"\",\"country\":\"AF\",\"phone\":\"\",\"tax_id\":\"\",\"notes\":\"\"}', '71cb0abd30d81601b4e61b3fc12b2249', '751ac1104c57a00926fa803936cd8771', NULL, '', NULL, NULL, NULL, '04397c917d6ccacdc1ec15d180103127', 1, 1, 0, 0, 'custom', '2030-01-01 00:00:00', '{\"signatures_limit\":0,\"projects_limit\":1,\"teams_limit\":0,\"team_members_limit\":0,\"api_is_enabled\":false,\"affiliate_commission_percentage\":0,\"no_ads\":false,\"enabled_tools\":{\"dns_lookup\":true,\"ip_lookup\":true,\"reverse_ip_lookup\":true,\"ssl_lookup\":true,\"whois_lookup\":true,\"ping\":true,\"http_headers_lookup\":true,\"http2_checker\":true,\"brotli_checker\":true,\"safe_url_checker\":true,\"google_cache_checker\":true,\"url_redirect_checker\":true,\"password_strength_checker\":true,\"meta_tags_checker\":true,\"website_hosting_checker\":true,\"file_mime_type_checker\":true,\"gravatar_checker\":true,\"text_separator\":true,\"email_extractor\":true,\"url_extractor\":true,\"text_size_calculator\":true,\"duplicate_lines_remover\":true,\"text_to_speech\":true,\"idn_punnycode_converter\":true,\"case_converter\":true,\"character_counter\":true,\"list_randomizer\":true,\"reverse_words\":true,\"reverse_letters\":true,\"emojis_remover\":true,\"reverse_list\":true,\"list_alphabetizer\":true,\"upside_down_text_generator\":true,\"old_english_text_generator\":true,\"cursive_text_generator\":true,\"palindrome_checker\":true,\"base64_encoder\":true,\"base64_decoder\":true,\"base64_to_image\":true,\"image_to_base64\":true,\"url_encoder\":true,\"url_decoder\":true,\"color_converter\":true,\"binary_converter\":true,\"hex_converter\":true,\"ascii_converter\":true,\"decimal_converter\":true,\"octal_converter\":true,\"morse_converter\":true,\"number_to_words_converter\":true,\"paypal_link_generator\":true,\"signature_generator\":true,\"mailto_link_generator\":true,\"utm_link_generator\":true,\"whatsapp_link_generator\":true,\"youtube_timestamp_link_generator\":true,\"slug_generator\":true,\"lorem_ipsum_generator\":true,\"password_generator\":true,\"random_number_generator\":true,\"uuid_v4_generator\":true,\"bcrypt_generator\":true,\"md2_generator\":true,\"md4_generator\":true,\"md5_generator\":true,\"whirlpool_generator\":true,\"sha1_generator\":true,\"sha224_generator\":true,\"sha256_generator\":true,\"sha384_generator\":true,\"sha512_generator\":true,\"sha512_224_generator\":true,\"sha512_256_generator\":true,\"sha3_224_generator\":true,\"sha3_256_generator\":true,\"sha3_384_generator\":true,\"sha3_512_generator\":true,\"ripemd128_generator\":true,\"ripemd160_generator\":true,\"ripemd256_generator\":true,\"ripemd320_generator\":true,\"html_minifier\":true,\"css_minifier\":true,\"js_minifier\":true,\"json_validator_beautifier\":true,\"sql_beautifier\":true,\"html_entity_converter\":true,\"bbcode_to_html\":true,\"markdown_to_html\":true,\"html_tags_remover\":true,\"user_agent_parser\":true,\"url_parser\":true,\"image_optimizer\":true,\"png_to_jpg\":true,\"png_to_bmp\":true,\"png_to_ico\":true,\"png_to_gif\":true,\"png_to_webp\":true,\"png_to_avif\":true,\"png_to_tiff\":true,\"png_to_tga\":true,\"jpg_to_png\":true,\"jpg_to_bmp\":true,\"jpg_to_ico\":true,\"jpg_to_gif\":true,\"jpg_to_webp\":true,\"jpg_to_avif\":true,\"jpg_to_tiff\":true,\"jpg_to_tga\":true,\"bmp_to_png\":true,\"bmp_to_jpg\":true,\"bmp_to_ico\":true,\"bmp_to_gif\":true,\"bmp_to_webp\":true,\"bmp_to_avif\":true,\"bmp_to_tiff\":true,\"bmp_to_tga\":true,\"ico_to_png\":true,\"ico_to_jpg\":true,\"ico_to_bmp\":true,\"ico_to_gif\":true,\"ico_to_webp\":true,\"ico_to_avif\":true,\"ico_to_tiff\":true,\"ico_to_tga\":true,\"gif_to_png\":true,\"gif_to_jpg\":true,\"gif_to_bmp\":true,\"gif_to_ico\":true,\"gif_to_webp\":true,\"gif_to_avif\":true,\"gif_to_tiff\":true,\"gif_to_tga\":true,\"webp_to_png\":true,\"webp_to_jpg\":true,\"webp_to_bmp\":true,\"webp_to_ico\":true,\"webp_to_gif\":true,\"webp_to_avif\":true,\"webp_to_tiff\":true,\"webp_to_tga\":true,\"heic_to_png\":true,\"heic_to_jpg\":true,\"heic_to_bmp\":true,\"heic_to_ico\":true,\"heic_to_gif\":true,\"heic_to_webp\":true,\"heic_to_avif\":true,\"heic_to_tiff\":true,\"heic_to_tga\":true,\"avif_to_png\":true,\"avif_to_jpg\":true,\"avif_to_bmp\":true,\"avif_to_ico\":true,\"avif_to_gif\":true,\"avif_to_webp\":true,\"avif_to_tiff\":true,\"avif_to_tga\":true,\"tiff_to_png\":true,\"tiff_to_jpg\":true,\"tiff_to_bmp\":true,\"tiff_to_ico\":true,\"tiff_to_gif\":true,\"tiff_to_webp\":true,\"tiff_to_avif\":true,\"tiff_to_tga\":true,\"youtube_thumbnail_downloader\":false,\"qr_code_reader\":false,\"barcode_reader\":false,\"exif_reader\":false,\"color_picker\":false,\"hex_to_hexa\":false,\"hex_to_rgb\":false,\"hex_to_rgba\":false,\"hex_to_hsv\":false,\"hex_to_hsl\":false,\"hex_to_hsla\":false,\"hexa_to_hex\":false,\"hexa_to_rgb\":false,\"hexa_to_rgba\":false,\"hexa_to_hsv\":false,\"hexa_to_hsl\":false,\"hexa_to_hsla\":false,\"rgb_to_hex\":false,\"rgb_to_hexa\":false,\"rgb_to_rgba\":false,\"rgb_to_hsv\":false,\"rgb_to_hsl\":false,\"rgb_to_hsla\":false,\"rgba_to_hex\":false,\"rgba_to_hexa\":false,\"rgba_to_rgb\":false,\"rgba_to_hsv\":false,\"rgba_to_hsl\":false,\"rgba_to_hsla\":false,\"hsv_to_hex\":false,\"hsv_to_hexa\":false,\"hsv_to_rgb\":false,\"hsv_to_rgba\":false,\"hsv_to_hsl\":false,\"hsv_to_hsla\":false,\"hsl_to_hex\":false,\"hsl_to_hexa\":false,\"hsl_to_rgb\":false,\"hsl_to_rgba\":false,\"hsl_to_hsv\":false,\"hsl_to_hsla\":false,\"hsla_to_hex\":false,\"hsla_to_hexa\":false,\"hsla_to_rgb\":false,\"hsla_to_rgba\":false,\"hsla_to_hsv\":false,\"hsla_to_hsl\":false,\"celsius_to_fahrenheit\":true,\"celsius_to_kelvin\":true,\"fahrenheit_to_celsius\":true,\"fahrenheit_to_kelvin\":true,\"kelvin_to_celsius\":true,\"kelvin_to_fahrenheit\":true,\"miles_per_hour_to_kilometers_per_hour\":true,\"kilometers_per_hour_to_miles_per_hour\":true,\"number_to_roman_numerals\":true,\"roman_numerals_to_number\":true,\"unix_timestamp_to_date\":true,\"date_to_unix_timestamp\":true,\"seconds_to_milliseconds\":true,\"seconds_to_microseconds\":true,\"seconds_to_nanoseconds\":true,\"seconds_to_picoseconds\":true,\"seconds_to_minutes\":true,\"seconds_to_hours\":true,\"seconds_to_days\":true,\"seconds_to_weeks\":true,\"seconds_to_months\":true,\"seconds_to_years\":true,\"milliseconds_to_seconds\":true,\"milliseconds_to_microseconds\":true,\"milliseconds_to_nanoseconds\":true,\"milliseconds_to_picoseconds\":true,\"milliseconds_to_minutes\":true,\"milliseconds_to_hours\":true,\"milliseconds_to_days\":true,\"milliseconds_to_weeks\":true,\"milliseconds_to_months\":true,\"milliseconds_to_years\":true,\"microseconds_to_seconds\":true,\"microseconds_to_milliseconds\":true,\"microseconds_to_nanoseconds\":true,\"microseconds_to_picoseconds\":true,\"microseconds_to_minutes\":true,\"microseconds_to_hours\":true,\"microseconds_to_days\":true,\"microseconds_to_weeks\":true,\"microseconds_to_months\":true,\"microseconds_to_years\":true,\"nanoseconds_to_seconds\":true,\"nanoseconds_to_milliseconds\":true,\"nanoseconds_to_microseconds\":true,\"nanoseconds_to_picoseconds\":true,\"nanoseconds_to_minutes\":true,\"nanoseconds_to_hours\":true,\"nanoseconds_to_days\":true,\"nanoseconds_to_weeks\":true,\"nanoseconds_to_months\":true,\"nanoseconds_to_years\":true,\"picoseconds_to_seconds\":true,\"picoseconds_to_milliseconds\":true,\"picoseconds_to_microseconds\":true,\"picoseconds_to_nanoseconds\":true,\"picoseconds_to_minutes\":true,\"picoseconds_to_hours\":true,\"picoseconds_to_days\":true,\"picoseconds_to_weeks\":true,\"picoseconds_to_months\":true,\"picoseconds_to_years\":true,\"minutes_to_seconds\":true,\"minutes_to_milliseconds\":true,\"minutes_to_microseconds\":true,\"minutes_to_nanoseconds\":true,\"minutes_to_picoseconds\":true,\"minutes_to_hours\":true,\"minutes_to_days\":true,\"minutes_to_weeks\":true,\"minutes_to_months\":true,\"minutes_to_years\":true,\"hours_to_seconds\":true,\"hours_to_milliseconds\":true,\"hours_to_microseconds\":true,\"hours_to_nanoseconds\":true,\"hours_to_picoseconds\":true,\"hours_to_minutes\":true,\"hours_to_days\":true,\"hours_to_weeks\":true,\"hours_to_months\":true,\"hours_to_years\":true,\"days_to_seconds\":true,\"days_to_milliseconds\":true,\"days_to_microseconds\":true,\"days_to_nanoseconds\":true,\"days_to_picoseconds\":true,\"days_to_minutes\":true,\"days_to_hours\":true,\"days_to_weeks\":true,\"days_to_months\":true,\"days_to_years\":true,\"weeks_to_seconds\":true,\"weeks_to_milliseconds\":true,\"weeks_to_microseconds\":true,\"weeks_to_nanoseconds\":true,\"weeks_to_picoseconds\":true,\"weeks_to_minutes\":true,\"weeks_to_hours\":true,\"weeks_to_days\":true,\"weeks_to_months\":true,\"weeks_to_years\":true,\"months_to_seconds\":true,\"months_to_milliseconds\":true,\"months_to_microseconds\":true,\"months_to_nanoseconds\":true,\"months_to_picoseconds\":true,\"months_to_minutes\":true,\"months_to_hours\":true,\"months_to_days\":true,\"months_to_weeks\":true,\"months_to_years\":true,\"years_to_seconds\":true,\"years_to_milliseconds\":true,\"years_to_microseconds\":true,\"years_to_nanoseconds\":true,\"years_to_picoseconds\":true,\"years_to_minutes\":true,\"years_to_hours\":true,\"years_to_days\":true,\"years_to_weeks\":true,\"years_to_months\":true,\"bits_to_nibbles\":true,\"bits_to_bytes\":true,\"bits_to_kilobits\":true,\"bits_to_kibibits\":true,\"bits_to_kibibytes\":true,\"bits_to_kilobytes\":true,\"bits_to_megabits\":true,\"bits_to_mebibits\":true,\"bits_to_megabytes\":true,\"bits_to_mebibytes\":true,\"bits_to_gigabits\":true,\"bits_to_gibibits\":true,\"bits_to_gigabytes\":true,\"bits_to_gibibytes\":true,\"bits_to_terabits\":true,\"bits_to_tebibits\":true,\"bits_to_terabytes\":true,\"bits_to_tebibytes\":true,\"bits_to_petabits\":true,\"bits_to_pebibits\":true,\"bits_to_petabytes\":true,\"bits_to_pebibytes\":true,\"bits_to_exabits\":true,\"bits_to_exbibits\":true,\"bits_to_exabytes\":true,\"bits_to_exbibytes\":true,\"bits_to_zettabits\":true,\"bits_to_zebibits\":true,\"bits_to_zettabytes\":true,\"bits_to_zebibytes\":true,\"bits_to_yottabits\":true,\"bits_to_yobibits\":true,\"bits_to_yottabytes\":true,\"bits_to_yobibytes\":true,\"nibbles_to_bits\":true,\"nibbles_to_bytes\":true,\"nibbles_to_kilobits\":true,\"nibbles_to_kibibits\":true,\"nibbles_to_kibibytes\":true,\"nibbles_to_kilobytes\":true,\"nibbles_to_megabits\":true,\"nibbles_to_mebibits\":true,\"nibbles_to_megabytes\":true,\"nibbles_to_mebibytes\":true,\"nibbles_to_gigabits\":true,\"nibbles_to_gibibits\":true,\"nibbles_to_gigabytes\":true,\"nibbles_to_gibibytes\":true,\"nibbles_to_terabits\":true,\"nibbles_to_tebibits\":true,\"nibbles_to_terabytes\":true,\"nibbles_to_tebibytes\":true,\"nibbles_to_petabits\":true,\"nibbles_to_pebibits\":true,\"nibbles_to_petabytes\":true,\"nibbles_to_pebibytes\":true,\"nibbles_to_exabits\":true,\"nibbles_to_exbibits\":true,\"nibbles_to_exabytes\":true,\"nibbles_to_exbibytes\":true,\"nibbles_to_zettabits\":true,\"nibbles_to_zebibits\":true,\"nibbles_to_zettabytes\":true,\"nibbles_to_zebibytes\":true,\"nibbles_to_yottabits\":true,\"nibbles_to_yobibits\":true,\"nibbles_to_yottabytes\":true,\"nibbles_to_yobibytes\":true,\"bytes_to_bits\":true,\"bytes_to_nibbles\":true,\"bytes_to_kilobits\":true,\"bytes_to_kibibits\":true,\"bytes_to_kibibytes\":true,\"bytes_to_kilobytes\":true,\"bytes_to_megabits\":true,\"bytes_to_mebibits\":true,\"bytes_to_megabytes\":true,\"bytes_to_mebibytes\":true,\"bytes_to_gigabits\":true,\"bytes_to_gibibits\":true,\"bytes_to_gigabytes\":true,\"bytes_to_gibibytes\":true,\"bytes_to_terabits\":true,\"bytes_to_tebibits\":true,\"bytes_to_terabytes\":true,\"bytes_to_tebibytes\":true,\"bytes_to_petabits\":true,\"bytes_to_pebibits\":true,\"bytes_to_petabytes\":true,\"bytes_to_pebibytes\":true,\"bytes_to_exabits\":true,\"bytes_to_exbibits\":true,\"bytes_to_exabytes\":true,\"bytes_to_exbibytes\":true,\"bytes_to_zettabits\":true,\"bytes_to_zebibits\":true,\"bytes_to_zettabytes\":true,\"bytes_to_zebibytes\":true,\"bytes_to_yottabits\":true,\"bytes_to_yobibits\":true,\"bytes_to_yottabytes\":true,\"bytes_to_yobibytes\":true,\"kilobits_to_bits\":true,\"kilobits_to_nibbles\":true,\"kilobits_to_bytes\":true,\"kilobits_to_kibibits\":true,\"kilobits_to_kibibytes\":true,\"kilobits_to_kilobytes\":true,\"kilobits_to_megabits\":true,\"kilobits_to_mebibits\":true,\"kilobits_to_megabytes\":true,\"kilobits_to_mebibytes\":true,\"kilobits_to_gigabits\":true,\"kilobits_to_gibibits\":true,\"kilobits_to_gigabytes\":true,\"kilobits_to_gibibytes\":true,\"kilobits_to_terabits\":true,\"kilobits_to_tebibits\":true,\"kilobits_to_terabytes\":true,\"kilobits_to_tebibytes\":true,\"kilobits_to_petabits\":true,\"kilobits_to_pebibits\":true,\"kilobits_to_petabytes\":true,\"kilobits_to_pebibytes\":true,\"kilobits_to_exabits\":true,\"kilobits_to_exbibits\":true,\"kilobits_to_exabytes\":true,\"kilobits_to_exbibytes\":true,\"kilobits_to_zettabits\":true,\"kilobits_to_zebibits\":true,\"kilobits_to_zettabytes\":true,\"kilobits_to_zebibytes\":true,\"kilobits_to_yottabits\":true,\"kilobits_to_yobibits\":true,\"kilobits_to_yottabytes\":true,\"kilobits_to_yobibytes\":true,\"kibibits_to_bits\":true,\"kibibits_to_nibbles\":true,\"kibibits_to_bytes\":true,\"kibibits_to_kilobits\":true,\"kibibits_to_kibibytes\":true,\"kibibits_to_kilobytes\":true,\"kibibits_to_megabits\":true,\"kibibits_to_mebibits\":true,\"kibibits_to_megabytes\":true,\"kibibits_to_mebibytes\":true,\"kibibits_to_gigabits\":true,\"kibibits_to_gibibits\":true,\"kibibits_to_gigabytes\":true,\"kibibits_to_gibibytes\":true,\"kibibits_to_terabits\":true,\"kibibits_to_tebibits\":true,\"kibibits_to_terabytes\":true,\"kibibits_to_tebibytes\":true,\"kibibits_to_petabits\":true,\"kibibits_to_pebibits\":true,\"kibibits_to_petabytes\":true,\"kibibits_to_pebibytes\":true,\"kibibits_to_exabits\":true,\"kibibits_to_exbibits\":true,\"kibibits_to_exabytes\":true,\"kibibits_to_exbibytes\":true,\"kibibits_to_zettabits\":true,\"kibibits_to_zebibits\":true,\"kibibits_to_zettabytes\":true,\"kibibits_to_zebibytes\":true,\"kibibits_to_yottabits\":true,\"kibibits_to_yobibits\":true,\"kibibits_to_yottabytes\":true,\"kibibits_to_yobibytes\":true,\"kibibytes_to_bits\":true,\"kibibytes_to_nibbles\":true,\"kibibytes_to_bytes\":true,\"kibibytes_to_kilobits\":true,\"kibibytes_to_kibibits\":true,\"kibibytes_to_kilobytes\":true,\"kibibytes_to_megabits\":true,\"kibibytes_to_mebibits\":true,\"kibibytes_to_megabytes\":true,\"kibibytes_to_mebibytes\":true,\"kibibytes_to_gigabits\":true,\"kibibytes_to_gibibits\":true,\"kibibytes_to_gigabytes\":true,\"kibibytes_to_gibibytes\":true,\"kibibytes_to_terabits\":true,\"kibibytes_to_tebibits\":true,\"kibibytes_to_terabytes\":true,\"kibibytes_to_tebibytes\":true,\"kibibytes_to_petabits\":true,\"kibibytes_to_pebibits\":true,\"kibibytes_to_petabytes\":true,\"kibibytes_to_pebibytes\":true,\"kibibytes_to_exabits\":true,\"kibibytes_to_exbibits\":true,\"kibibytes_to_exabytes\":true,\"kibibytes_to_exbibytes\":true,\"kibibytes_to_zettabits\":true,\"kibibytes_to_zebibits\":true,\"kibibytes_to_zettabytes\":true,\"kibibytes_to_zebibytes\":true,\"kibibytes_to_yottabits\":true,\"kibibytes_to_yobibits\":true,\"kibibytes_to_yottabytes\":true,\"kibibytes_to_yobibytes\":true,\"kilobytes_to_bits\":true,\"kilobytes_to_nibbles\":true,\"kilobytes_to_bytes\":true,\"kilobytes_to_kilobits\":true,\"kilobytes_to_kibibits\":true,\"kilobytes_to_kibibytes\":true,\"kilobytes_to_megabits\":true,\"kilobytes_to_mebibits\":true,\"kilobytes_to_megabytes\":true,\"kilobytes_to_mebibytes\":true,\"kilobytes_to_gigabits\":true,\"kilobytes_to_gibibits\":true,\"kilobytes_to_gigabytes\":true,\"kilobytes_to_gibibytes\":true,\"kilobytes_to_terabits\":true,\"kilobytes_to_tebibits\":true,\"kilobytes_to_terabytes\":true,\"kilobytes_to_tebibytes\":true,\"kilobytes_to_petabits\":true,\"kilobytes_to_pebibits\":true,\"kilobytes_to_petabytes\":true,\"kilobytes_to_pebibytes\":true,\"kilobytes_to_exabits\":true,\"kilobytes_to_exbibits\":true,\"kilobytes_to_exabytes\":true,\"kilobytes_to_exbibytes\":true,\"kilobytes_to_zettabits\":true,\"kilobytes_to_zebibits\":true,\"kilobytes_to_zettabytes\":true,\"kilobytes_to_zebibytes\":true,\"kilobytes_to_yottabits\":true,\"kilobytes_to_yobibits\":true,\"kilobytes_to_yottabytes\":true,\"kilobytes_to_yobibytes\":true,\"megabits_to_bits\":true,\"megabits_to_nibbles\":true,\"megabits_to_bytes\":true,\"megabits_to_kilobits\":true,\"megabits_to_kibibits\":true,\"megabits_to_kibibytes\":true,\"megabits_to_kilobytes\":true,\"megabits_to_mebibits\":true,\"megabits_to_megabytes\":true,\"megabits_to_mebibytes\":true,\"megabits_to_gigabits\":true,\"megabits_to_gibibits\":true,\"megabits_to_gigabytes\":true,\"megabits_to_gibibytes\":true,\"megabits_to_terabits\":true,\"megabits_to_tebibits\":true,\"megabits_to_terabytes\":true,\"megabits_to_tebibytes\":true,\"megabits_to_petabits\":true,\"megabits_to_pebibits\":true,\"megabits_to_petabytes\":true,\"megabits_to_pebibytes\":true,\"megabits_to_exabits\":true,\"megabits_to_exbibits\":true,\"megabits_to_exabytes\":true,\"megabits_to_exbibytes\":true,\"megabits_to_zettabits\":true,\"megabits_to_zebibits\":true,\"megabits_to_zettabytes\":true,\"megabits_to_zebibytes\":true,\"megabits_to_yottabits\":true,\"megabits_to_yobibits\":true,\"megabits_to_yottabytes\":true,\"megabits_to_yobibytes\":true,\"mebibits_to_bits\":true,\"mebibits_to_nibbles\":true,\"mebibits_to_bytes\":true,\"mebibits_to_kilobits\":true,\"mebibits_to_kibibits\":true,\"mebibits_to_kibibytes\":true,\"mebibits_to_kilobytes\":true,\"mebibits_to_megabits\":true,\"mebibits_to_megabytes\":true,\"mebibits_to_mebibytes\":true,\"mebibits_to_gigabits\":true,\"mebibits_to_gibibits\":true,\"mebibits_to_gigabytes\":true,\"mebibits_to_gibibytes\":true,\"mebibits_to_terabits\":true,\"mebibits_to_tebibits\":true,\"mebibits_to_terabytes\":true,\"mebibits_to_tebibytes\":true,\"mebibits_to_petabits\":true,\"mebibits_to_pebibits\":true,\"mebibits_to_petabytes\":true,\"mebibits_to_pebibytes\":true,\"mebibits_to_exabits\":true,\"mebibits_to_exbibits\":true,\"mebibits_to_exabytes\":true,\"mebibits_to_exbibytes\":true,\"mebibits_to_zettabits\":true,\"mebibits_to_zebibits\":true,\"mebibits_to_zettabytes\":true,\"mebibits_to_zebibytes\":true,\"mebibits_to_yottabits\":true,\"mebibits_to_yobibits\":true,\"mebibits_to_yottabytes\":true,\"mebibits_to_yobibytes\":true,\"megabytes_to_bits\":true,\"megabytes_to_nibbles\":true,\"megabytes_to_bytes\":true,\"megabytes_to_kilobits\":true,\"megabytes_to_kibibits\":true,\"megabytes_to_kibibytes\":true,\"megabytes_to_kilobytes\":true,\"megabytes_to_megabits\":true,\"megabytes_to_mebibits\":true,\"megabytes_to_mebibytes\":true,\"megabytes_to_gigabits\":true,\"megabytes_to_gibibits\":true,\"megabytes_to_gigabytes\":true,\"megabytes_to_gibibytes\":true,\"megabytes_to_terabits\":true,\"megabytes_to_tebibits\":true,\"megabytes_to_terabytes\":true,\"megabytes_to_tebibytes\":true,\"megabytes_to_petabits\":true,\"megabytes_to_pebibits\":true,\"megabytes_to_petabytes\":true,\"megabytes_to_pebibytes\":true,\"megabytes_to_exabits\":true,\"megabytes_to_exbibits\":true,\"megabytes_to_exabytes\":true,\"megabytes_to_exbibytes\":true,\"megabytes_to_zettabits\":true,\"megabytes_to_zebibits\":true,\"megabytes_to_zettabytes\":true,\"megabytes_to_zebibytes\":true,\"megabytes_to_yottabits\":true,\"megabytes_to_yobibits\":true,\"megabytes_to_yottabytes\":true,\"megabytes_to_yobibytes\":true,\"mebibytes_to_bits\":true,\"mebibytes_to_nibbles\":true,\"mebibytes_to_bytes\":true,\"mebibytes_to_kilobits\":true,\"mebibytes_to_kibibits\":true,\"mebibytes_to_kibibytes\":true,\"mebibytes_to_kilobytes\":true,\"mebibytes_to_megabits\":true,\"mebibytes_to_mebibits\":true,\"mebibytes_to_megabytes\":true,\"mebibytes_to_gigabits\":true,\"mebibytes_to_gibibits\":true,\"mebibytes_to_gigabytes\":true,\"mebibytes_to_gibibytes\":true,\"mebibytes_to_terabits\":true,\"mebibytes_to_tebibits\":true,\"mebibytes_to_terabytes\":true,\"mebibytes_to_tebibytes\":true,\"mebibytes_to_petabits\":true,\"mebibytes_to_pebibits\":true,\"mebibytes_to_petabytes\":true,\"mebibytes_to_pebibytes\":true,\"mebibytes_to_exabits\":true,\"mebibytes_to_exbibits\":true,\"mebibytes_to_exabytes\":true,\"mebibytes_to_exbibytes\":true,\"mebibytes_to_zettabits\":true,\"mebibytes_to_zebibits\":true,\"mebibytes_to_zettabytes\":true,\"mebibytes_to_zebibytes\":true,\"mebibytes_to_yottabits\":true,\"mebibytes_to_yobibits\":true,\"mebibytes_to_yottabytes\":true,\"mebibytes_to_yobibytes\":true,\"gigabits_to_bits\":true,\"gigabits_to_nibbles\":true,\"gigabits_to_bytes\":true,\"gigabits_to_kilobits\":true,\"gigabits_to_kibibits\":true,\"gigabits_to_kibibytes\":true,\"gigabits_to_kilobytes\":true,\"gigabits_to_megabits\":true,\"gigabits_to_mebibits\":true,\"gigabits_to_megabytes\":true,\"gigabits_to_mebibytes\":true,\"gigabits_to_gibibits\":true,\"gigabits_to_gigabytes\":true,\"gigabits_to_gibibytes\":true,\"gigabits_to_terabits\":true,\"gigabits_to_tebibits\":true,\"gigabits_to_terabytes\":true,\"gigabits_to_tebibytes\":true,\"gigabits_to_petabits\":true,\"gigabits_to_pebibits\":true,\"gigabits_to_petabytes\":true,\"gigabits_to_pebibytes\":true,\"gigabits_to_exabits\":true,\"gigabits_to_exbibits\":true,\"gigabits_to_exabytes\":true,\"gigabits_to_exbibytes\":true,\"gigabits_to_zettabits\":true,\"gigabits_to_zebibits\":true,\"gigabits_to_zettabytes\":true,\"gigabits_to_zebibytes\":true,\"gigabits_to_yottabits\":true,\"gigabits_to_yobibits\":true,\"gigabits_to_yottabytes\":true,\"gigabits_to_yobibytes\":true,\"gibibits_to_bits\":true,\"gibibits_to_nibbles\":true,\"gibibits_to_bytes\":true,\"gibibits_to_kilobits\":true,\"gibibits_to_kibibits\":true,\"gibibits_to_kibibytes\":true,\"gibibits_to_kilobytes\":true,\"gibibits_to_megabits\":true,\"gibibits_to_mebibits\":true,\"gibibits_to_megabytes\":true,\"gibibits_to_mebibytes\":true,\"gibibits_to_gigabits\":true,\"gibibits_to_gigabytes\":true,\"gibibits_to_gibibytes\":true,\"gibibits_to_terabits\":true,\"gibibits_to_tebibits\":true,\"gibibits_to_terabytes\":true,\"gibibits_to_tebibytes\":true,\"gibibits_to_petabits\":true,\"gibibits_to_pebibits\":true,\"gibibits_to_petabytes\":true,\"gibibits_to_pebibytes\":true,\"gibibits_to_exabits\":true,\"gibibits_to_exbibits\":true,\"gibibits_to_exabytes\":true,\"gibibits_to_exbibytes\":true,\"gibibits_to_zettabits\":true,\"gibibits_to_zebibits\":true,\"gibibits_to_zettabytes\":true,\"gibibits_to_zebibytes\":true,\"gibibits_to_yottabits\":true,\"gibibits_to_yobibits\":true,\"gibibits_to_yottabytes\":true,\"gibibits_to_yobibytes\":true,\"gigabytes_to_bits\":true,\"gigabytes_to_nibbles\":true,\"gigabytes_to_bytes\":true,\"gigabytes_to_kilobits\":true,\"gigabytes_to_kibibits\":true,\"gigabytes_to_kibibytes\":true,\"gigabytes_to_kilobytes\":true,\"gigabytes_to_megabits\":true,\"gigabytes_to_mebibits\":true,\"gigabytes_to_megabytes\":true,\"gigabytes_to_mebibytes\":true,\"gigabytes_to_gigabits\":true,\"gigabytes_to_gibibits\":true,\"gigabytes_to_gibibytes\":true,\"gigabytes_to_terabits\":true,\"gigabytes_to_tebibits\":true,\"gigabytes_to_terabytes\":true,\"gigabytes_to_tebibytes\":true,\"gigabytes_to_petabits\":true,\"gigabytes_to_pebibits\":true,\"gigabytes_to_petabytes\":true,\"gigabytes_to_pebibytes\":true,\"gigabytes_to_exabits\":true,\"gigabytes_to_exbibits\":true,\"gigabytes_to_exabytes\":true,\"gigabytes_to_exbibytes\":true,\"gigabytes_to_zettabits\":true,\"gigabytes_to_zebibits\":true,\"gigabytes_to_zettabytes\":true,\"gigabytes_to_zebibytes\":true,\"gigabytes_to_yottabits\":true,\"gigabytes_to_yobibits\":true,\"gigabytes_to_yottabytes\":true,\"gigabytes_to_yobibytes\":true,\"gibibytes_to_bits\":true,\"gibibytes_to_nibbles\":true,\"gibibytes_to_bytes\":true,\"gibibytes_to_kilobits\":true,\"gibibytes_to_kibibits\":true,\"gibibytes_to_kibibytes\":true,\"gibibytes_to_kilobytes\":true,\"gibibytes_to_megabits\":true,\"gibibytes_to_mebibits\":true,\"gibibytes_to_megabytes\":true,\"gibibytes_to_mebibytes\":true,\"gibibytes_to_gigabits\":true,\"gibibytes_to_gibibits\":true,\"gibibytes_to_gigabytes\":true,\"gibibytes_to_terabits\":true,\"gibibytes_to_tebibits\":true,\"gibibytes_to_terabytes\":true,\"gibibytes_to_tebibytes\":true,\"gibibytes_to_petabits\":true,\"gibibytes_to_pebibits\":true,\"gibibytes_to_petabytes\":true,\"gibibytes_to_pebibytes\":true,\"gibibytes_to_exabits\":true,\"gibibytes_to_exbibits\":true,\"gibibytes_to_exabytes\":true,\"gibibytes_to_exbibytes\":true,\"gibibytes_to_zettabits\":true,\"gibibytes_to_zebibits\":true,\"gibibytes_to_zettabytes\":true,\"gibibytes_to_zebibytes\":true,\"gibibytes_to_yottabits\":true,\"gibibytes_to_yobibits\":true,\"gibibytes_to_yottabytes\":true,\"gibibytes_to_yobibytes\":true,\"terabits_to_bits\":true,\"terabits_to_nibbles\":true,\"terabits_to_bytes\":true,\"terabits_to_kilobits\":true,\"terabits_to_kibibits\":true,\"terabits_to_kibibytes\":true,\"terabits_to_kilobytes\":true,\"terabits_to_megabits\":true,\"terabits_to_mebibits\":true,\"terabits_to_megabytes\":true,\"terabits_to_mebibytes\":true,\"terabits_to_gigabits\":true,\"terabits_to_gibibits\":true,\"terabits_to_gigabytes\":true,\"terabits_to_gibibytes\":true,\"terabits_to_tebibits\":true,\"terabits_to_terabytes\":true,\"terabits_to_tebibytes\":true,\"terabits_to_petabits\":true,\"terabits_to_pebibits\":true,\"terabits_to_petabytes\":true,\"terabits_to_pebibytes\":true,\"terabits_to_exabits\":true,\"terabits_to_exbibits\":true,\"terabits_to_exabytes\":true,\"terabits_to_exbibytes\":true,\"terabits_to_zettabits\":true,\"terabits_to_zebibits\":true,\"terabits_to_zettabytes\":true,\"terabits_to_zebibytes\":true,\"terabits_to_yottabits\":true,\"terabits_to_yobibits\":true,\"terabits_to_yottabytes\":true,\"terabits_to_yobibytes\":true,\"tebibits_to_bits\":true,\"tebibits_to_nibbles\":true,\"tebibits_to_bytes\":true,\"tebibits_to_kilobits\":true,\"tebibits_to_kibibits\":true,\"tebibits_to_kibibytes\":true,\"tebibits_to_kilobytes\":true,\"tebibits_to_megabits\":true,\"tebibits_to_mebibits\":true,\"tebibits_to_megabytes\":true,\"tebibits_to_mebibytes\":true,\"tebibits_to_gigabits\":true,\"tebibits_to_gibibits\":true,\"tebibits_to_gigabytes\":true,\"tebibits_to_gibibytes\":true,\"tebibits_to_terabits\":true,\"tebibits_to_terabytes\":true,\"tebibits_to_tebibytes\":true,\"tebibits_to_petabits\":true,\"tebibits_to_pebibits\":true,\"tebibits_to_petabytes\":true,\"tebibits_to_pebibytes\":true,\"tebibits_to_exabits\":true,\"tebibits_to_exbibits\":true,\"tebibits_to_exabytes\":true,\"tebibits_to_exbibytes\":true,\"tebibits_to_zettabits\":true,\"tebibits_to_zebibits\":true,\"tebibits_to_zettabytes\":true,\"tebibits_to_zebibytes\":true,\"tebibits_to_yottabits\":true,\"tebibits_to_yobibits\":true,\"tebibits_to_yottabytes\":true,\"tebibits_to_yobibytes\":true,\"terabytes_to_bits\":true,\"terabytes_to_nibbles\":true,\"terabytes_to_bytes\":true,\"terabytes_to_kilobits\":true,\"terabytes_to_kibibits\":true,\"terabytes_to_kibibytes\":true,\"terabytes_to_kilobytes\":true,\"terabytes_to_megabits\":true,\"terabytes_to_mebibits\":true,\"terabytes_to_megabytes\":true,\"terabytes_to_mebibytes\":true,\"terabytes_to_gigabits\":true,\"terabytes_to_gibibits\":true,\"terabytes_to_gigabytes\":true,\"terabytes_to_gibibytes\":true,\"terabytes_to_terabits\":true,\"terabytes_to_tebibits\":true,\"terabytes_to_tebibytes\":true,\"terabytes_to_petabits\":true,\"terabytes_to_pebibits\":true,\"terabytes_to_petabytes\":true,\"terabytes_to_pebibytes\":true,\"terabytes_to_exabits\":true,\"terabytes_to_exbibits\":true,\"terabytes_to_exabytes\":true,\"terabytes_to_exbibytes\":true,\"terabytes_to_zettabits\":true,\"terabytes_to_zebibits\":true,\"terabytes_to_zettabytes\":true,\"terabytes_to_zebibytes\":true,\"terabytes_to_yottabits\":true,\"terabytes_to_yobibits\":true,\"terabytes_to_yottabytes\":true,\"terabytes_to_yobibytes\":true,\"tebibytes_to_bits\":true,\"tebibytes_to_nibbles\":true,\"tebibytes_to_bytes\":true,\"tebibytes_to_kilobits\":true,\"tebibytes_to_kibibits\":true,\"tebibytes_to_kibibytes\":true,\"tebibytes_to_kilobytes\":true,\"tebibytes_to_megabits\":true,\"tebibytes_to_mebibits\":true,\"tebibytes_to_megabytes\":true,\"tebibytes_to_mebibytes\":true,\"tebibytes_to_gigabits\":true,\"tebibytes_to_gibibits\":true,\"tebibytes_to_gigabytes\":true,\"tebibytes_to_gibibytes\":true,\"tebibytes_to_terabits\":true,\"tebibytes_to_tebibits\":true,\"tebibytes_to_terabytes\":true,\"tebibytes_to_petabits\":true,\"tebibytes_to_pebibits\":true,\"tebibytes_to_petabytes\":true,\"tebibytes_to_pebibytes\":true,\"tebibytes_to_exabits\":true,\"tebibytes_to_exbibits\":true,\"tebibytes_to_exabytes\":true,\"tebibytes_to_exbibytes\":true,\"tebibytes_to_zettabits\":true,\"tebibytes_to_zebibits\":true,\"tebibytes_to_zettabytes\":true,\"tebibytes_to_zebibytes\":true,\"tebibytes_to_yottabits\":true,\"tebibytes_to_yobibits\":true,\"tebibytes_to_yottabytes\":true,\"tebibytes_to_yobibytes\":true,\"petabits_to_bits\":true,\"petabits_to_nibbles\":true,\"petabits_to_bytes\":true,\"petabits_to_kilobits\":true,\"petabits_to_kibibits\":true,\"petabits_to_kibibytes\":true,\"petabits_to_kilobytes\":true,\"petabits_to_megabits\":true,\"petabits_to_mebibits\":true,\"petabits_to_megabytes\":true,\"petabits_to_mebibytes\":true,\"petabits_to_gigabits\":true,\"petabits_to_gibibits\":true,\"petabits_to_gigabytes\":true,\"petabits_to_gibibytes\":true,\"petabits_to_terabits\":true,\"petabits_to_tebibits\":true,\"petabits_to_terabytes\":true,\"petabits_to_tebibytes\":true,\"petabits_to_pebibits\":true,\"petabits_to_petabytes\":true,\"petabits_to_pebibytes\":true,\"petabits_to_exabits\":true,\"petabits_to_exbibits\":true,\"petabits_to_exabytes\":true,\"petabits_to_exbibytes\":true,\"petabits_to_zettabits\":true,\"petabits_to_zebibits\":true,\"petabits_to_zettabytes\":true,\"petabits_to_zebibytes\":true,\"petabits_to_yottabits\":true,\"petabits_to_yobibits\":true,\"petabits_to_yottabytes\":true,\"petabits_to_yobibytes\":true,\"pebibits_to_bits\":true,\"pebibits_to_nibbles\":true,\"pebibits_to_bytes\":true,\"pebibits_to_kilobits\":true,\"pebibits_to_kibibits\":true,\"pebibits_to_kibibytes\":true,\"pebibits_to_kilobytes\":true,\"pebibits_to_megabits\":true,\"pebibits_to_mebibits\":true,\"pebibits_to_megabytes\":true,\"pebibits_to_mebibytes\":true,\"pebibits_to_gigabits\":true,\"pebibits_to_gibibits\":true,\"pebibits_to_gigabytes\":true,\"pebibits_to_gibibytes\":true,\"pebibits_to_terabits\":true,\"pebibits_to_tebibits\":true,\"pebibits_to_terabytes\":true,\"pebibits_to_tebibytes\":true,\"pebibits_to_petabits\":true,\"pebibits_to_petabytes\":true,\"pebibits_to_pebibytes\":true,\"pebibits_to_exabits\":true,\"pebibits_to_exbibits\":true,\"pebibits_to_exabytes\":false,\"pebibits_to_exbibytes\":false,\"pebibits_to_zettabits\":false,\"pebibits_to_zebibits\":false,\"pebibits_to_zettabytes\":false,\"pebibits_to_zebibytes\":false,\"pebibits_to_yottabits\":false,\"pebibits_to_yobibits\":false,\"pebibits_to_yottabytes\":false,\"pebibits_to_yobibytes\":false,\"petabytes_to_bits\":false,\"petabytes_to_nibbles\":false,\"petabytes_to_bytes\":false,\"petabytes_to_kilobits\":false,\"petabytes_to_kibibits\":false,\"petabytes_to_kibibytes\":false,\"petabytes_to_kilobytes\":false,\"petabytes_to_megabits\":false,\"petabytes_to_mebibits\":false,\"petabytes_to_megabytes\":false,\"petabytes_to_mebibytes\":false,\"petabytes_to_gigabits\":false,\"petabytes_to_gibibits\":false,\"petabytes_to_gigabytes\":false,\"petabytes_to_gibibytes\":false,\"petabytes_to_terabits\":false,\"petabytes_to_tebibits\":false,\"petabytes_to_terabytes\":false,\"petabytes_to_tebibytes\":false,\"petabytes_to_petabits\":false,\"petabytes_to_pebibits\":false,\"petabytes_to_pebibytes\":false,\"petabytes_to_exabits\":false,\"petabytes_to_exbibits\":false,\"petabytes_to_exabytes\":false,\"petabytes_to_exbibytes\":false,\"petabytes_to_zettabits\":false,\"petabytes_to_zebibits\":false,\"petabytes_to_zettabytes\":false,\"petabytes_to_zebibytes\":false,\"petabytes_to_yottabits\":false,\"petabytes_to_yobibits\":false,\"petabytes_to_yottabytes\":false,\"petabytes_to_yobibytes\":false,\"pebibytes_to_bits\":false,\"pebibytes_to_nibbles\":false,\"pebibytes_to_bytes\":false,\"pebibytes_to_kilobits\":false,\"pebibytes_to_kibibits\":false,\"pebibytes_to_kibibytes\":false,\"pebibytes_to_kilobytes\":false,\"pebibytes_to_megabits\":false,\"pebibytes_to_mebibits\":false,\"pebibytes_to_megabytes\":false,\"pebibytes_to_mebibytes\":false,\"pebibytes_to_gigabits\":false,\"pebibytes_to_gibibits\":false,\"pebibytes_to_gigabytes\":false,\"pebibytes_to_gibibytes\":false,\"pebibytes_to_terabits\":false,\"pebibytes_to_tebibits\":false,\"pebibytes_to_terabytes\":false,\"pebibytes_to_tebibytes\":false,\"pebibytes_to_petabits\":false,\"pebibytes_to_pebibits\":false,\"pebibytes_to_petabytes\":false,\"pebibytes_to_exabits\":false,\"pebibytes_to_exbibits\":false,\"pebibytes_to_exabytes\":false,\"pebibytes_to_exbibytes\":false,\"pebibytes_to_zettabits\":false,\"pebibytes_to_zebibits\":false,\"pebibytes_to_zettabytes\":false,\"pebibytes_to_zebibytes\":false,\"pebibytes_to_yottabits\":false,\"pebibytes_to_yobibits\":false,\"pebibytes_to_yottabytes\":false,\"pebibytes_to_yobibytes\":false,\"exabits_to_bits\":false,\"exabits_to_nibbles\":false,\"exabits_to_bytes\":false,\"exabits_to_kilobits\":false,\"exabits_to_kibibits\":false,\"exabits_to_kibibytes\":false,\"exabits_to_kilobytes\":false,\"exabits_to_megabits\":false,\"exabits_to_mebibits\":false,\"exabits_to_megabytes\":false,\"exabits_to_mebibytes\":false,\"exabits_to_gigabits\":false,\"exabits_to_gibibits\":false,\"exabits_to_gigabytes\":false,\"exabits_to_gibibytes\":false,\"exabits_to_terabits\":false,\"exabits_to_tebibits\":false,\"exabits_to_terabytes\":false,\"exabits_to_tebibytes\":false,\"exabits_to_petabits\":false,\"exabits_to_pebibits\":false,\"exabits_to_petabytes\":false,\"exabits_to_pebibytes\":false,\"exabits_to_exbibits\":false,\"exabits_to_exabytes\":false,\"exabits_to_exbibytes\":false,\"exabits_to_zettabits\":false,\"exabits_to_zebibits\":false,\"exabits_to_zettabytes\":false,\"exabits_to_zebibytes\":false,\"exabits_to_yottabits\":false,\"exabits_to_yobibits\":false,\"exabits_to_yottabytes\":false,\"exabits_to_yobibytes\":false,\"exbibits_to_bits\":false,\"exbibits_to_nibbles\":false,\"exbibits_to_bytes\":false,\"exbibits_to_kilobits\":false,\"exbibits_to_kibibits\":false,\"exbibits_to_kibibytes\":false,\"exbibits_to_kilobytes\":false,\"exbibits_to_megabits\":false,\"exbibits_to_mebibits\":false,\"exbibits_to_megabytes\":false,\"exbibits_to_mebibytes\":false,\"exbibits_to_gigabits\":false,\"exbibits_to_gibibits\":false,\"exbibits_to_gigabytes\":false,\"exbibits_to_gibibytes\":false,\"exbibits_to_terabits\":false,\"exbibits_to_tebibits\":false,\"exbibits_to_terabytes\":false,\"exbibits_to_tebibytes\":false,\"exbibits_to_petabits\":false,\"exbibits_to_pebibits\":false,\"exbibits_to_petabytes\":false,\"exbibits_to_pebibytes\":false,\"exbibits_to_exabits\":false,\"exbibits_to_exabytes\":false,\"exbibits_to_exbibytes\":false,\"exbibits_to_zettabits\":false,\"exbibits_to_zebibits\":false,\"exbibits_to_zettabytes\":false,\"exbibits_to_zebibytes\":false,\"exbibits_to_yottabits\":false,\"exbibits_to_yobibits\":false,\"exbibits_to_yottabytes\":false,\"exbibits_to_yobibytes\":false,\"exabytes_to_bits\":false,\"exabytes_to_nibbles\":false,\"exabytes_to_bytes\":false,\"exabytes_to_kilobits\":false,\"exabytes_to_kibibits\":false,\"exabytes_to_kibibytes\":false,\"exabytes_to_kilobytes\":false,\"exabytes_to_megabits\":false,\"exabytes_to_mebibits\":false,\"exabytes_to_megabytes\":false,\"exabytes_to_mebibytes\":false,\"exabytes_to_gigabits\":false,\"exabytes_to_gibibits\":false,\"exabytes_to_gigabytes\":false,\"exabytes_to_gibibytes\":false,\"exabytes_to_terabits\":false,\"exabytes_to_tebibits\":false,\"exabytes_to_terabytes\":false,\"exabytes_to_tebibytes\":false,\"exabytes_to_petabits\":false,\"exabytes_to_pebibits\":false,\"exabytes_to_petabytes\":false,\"exabytes_to_pebibytes\":false,\"exabytes_to_exabits\":false,\"exabytes_to_exbibits\":false,\"exabytes_to_exbibytes\":false,\"exabytes_to_zettabits\":false,\"exabytes_to_zebibits\":false,\"exabytes_to_zettabytes\":false,\"exabytes_to_zebibytes\":false,\"exabytes_to_yottabits\":false,\"exabytes_to_yobibits\":false,\"exabytes_to_yottabytes\":false,\"exabytes_to_yobibytes\":false,\"exbibytes_to_bits\":false,\"exbibytes_to_nibbles\":false,\"exbibytes_to_bytes\":false,\"exbibytes_to_kilobits\":false,\"exbibytes_to_kibibits\":false,\"exbibytes_to_kibibytes\":false,\"exbibytes_to_kilobytes\":false,\"exbibytes_to_megabits\":false,\"exbibytes_to_mebibits\":false,\"exbibytes_to_megabytes\":false,\"exbibytes_to_mebibytes\":false,\"exbibytes_to_gigabits\":false,\"exbibytes_to_gibibits\":false,\"exbibytes_to_gigabytes\":false,\"exbibytes_to_gibibytes\":false,\"exbibytes_to_terabits\":false,\"exbibytes_to_tebibits\":false,\"exbibytes_to_terabytes\":false,\"exbibytes_to_tebibytes\":false,\"exbibytes_to_petabits\":false,\"exbibytes_to_pebibits\":false,\"exbibytes_to_petabytes\":false,\"exbibytes_to_pebibytes\":false,\"exbibytes_to_exabits\":false,\"exbibytes_to_exbibits\":false,\"exbibytes_to_exabytes\":false,\"exbibytes_to_zettabits\":false,\"exbibytes_to_zebibits\":false,\"exbibytes_to_zettabytes\":false,\"exbibytes_to_zebibytes\":false,\"exbibytes_to_yottabits\":false,\"exbibytes_to_yobibits\":false,\"exbibytes_to_yottabytes\":false,\"exbibytes_to_yobibytes\":false,\"zettabits_to_bits\":false,\"zettabits_to_nibbles\":false,\"zettabits_to_bytes\":false,\"zettabits_to_kilobits\":false,\"zettabits_to_kibibits\":false,\"zettabits_to_kibibytes\":false,\"zettabits_to_kilobytes\":false,\"zettabits_to_megabits\":false,\"zettabits_to_mebibits\":false,\"zettabits_to_megabytes\":false,\"zettabits_to_mebibytes\":false,\"zettabits_to_gigabits\":false,\"zettabits_to_gibibits\":false,\"zettabits_to_gigabytes\":false,\"zettabits_to_gibibytes\":false,\"zettabits_to_terabits\":false,\"zettabits_to_tebibits\":false,\"zettabits_to_terabytes\":false,\"zettabits_to_tebibytes\":false,\"zettabits_to_petabits\":false,\"zettabits_to_pebibits\":false,\"zettabits_to_petabytes\":false,\"zettabits_to_pebibytes\":false,\"zettabits_to_exabits\":false,\"zettabits_to_exbibits\":false,\"zettabits_to_exabytes\":false,\"zettabits_to_exbibytes\":false,\"zettabits_to_zebibits\":false,\"zettabits_to_zettabytes\":false,\"zettabits_to_zebibytes\":false,\"zettabits_to_yottabits\":false,\"zettabits_to_yobibits\":false,\"zettabits_to_yottabytes\":false,\"zettabits_to_yobibytes\":false,\"zebibits_to_bits\":false,\"zebibits_to_nibbles\":false,\"zebibits_to_bytes\":false,\"zebibits_to_kilobits\":false,\"zebibits_to_kibibits\":false,\"zebibits_to_kibibytes\":false,\"zebibits_to_kilobytes\":false,\"zebibits_to_megabits\":false,\"zebibits_to_mebibits\":false,\"zebibits_to_megabytes\":false,\"zebibits_to_mebibytes\":false,\"zebibits_to_gigabits\":false,\"zebibits_to_gibibits\":false,\"zebibits_to_gigabytes\":false,\"zebibits_to_gibibytes\":false,\"zebibits_to_terabits\":false,\"zebibits_to_tebibits\":false,\"zebibits_to_terabytes\":false,\"zebibits_to_tebibytes\":false,\"zebibits_to_petabits\":false,\"zebibits_to_pebibits\":false,\"zebibits_to_petabytes\":false,\"zebibits_to_pebibytes\":false,\"zebibits_to_exabits\":false,\"zebibits_to_exbibits\":false,\"zebibits_to_exabytes\":false,\"zebibits_to_exbibytes\":false,\"zebibits_to_zettabits\":false,\"zebibits_to_zettabytes\":false,\"zebibits_to_zebibytes\":false,\"zebibits_to_yottabits\":false,\"zebibits_to_yobibits\":false,\"zebibits_to_yottabytes\":false,\"zebibits_to_yobibytes\":false,\"zettabytes_to_bits\":false,\"zettabytes_to_nibbles\":false,\"zettabytes_to_bytes\":false,\"zettabytes_to_kilobits\":false,\"zettabytes_to_kibibits\":false,\"zettabytes_to_kibibytes\":false,\"zettabytes_to_kilobytes\":false,\"zettabytes_to_megabits\":false,\"zettabytes_to_mebibits\":false,\"zettabytes_to_megabytes\":false,\"zettabytes_to_mebibytes\":false,\"zettabytes_to_gigabits\":false,\"zettabytes_to_gibibits\":false,\"zettabytes_to_gigabytes\":false,\"zettabytes_to_gibibytes\":false,\"zettabytes_to_terabits\":false,\"zettabytes_to_tebibits\":false,\"zettabytes_to_terabytes\":false,\"zettabytes_to_tebibytes\":false,\"zettabytes_to_petabits\":false,\"zettabytes_to_pebibits\":false,\"zettabytes_to_petabytes\":false,\"zettabytes_to_pebibytes\":false,\"zettabytes_to_exabits\":false,\"zettabytes_to_exbibits\":false,\"zettabytes_to_exabytes\":false,\"zettabytes_to_exbibytes\":false,\"zettabytes_to_zettabits\":false,\"zettabytes_to_zebibits\":false,\"zettabytes_to_zebibytes\":false,\"zettabytes_to_yottabits\":false,\"zettabytes_to_yobibits\":false,\"zettabytes_to_yottabytes\":false,\"zettabytes_to_yobibytes\":false,\"zebibytes_to_bits\":false,\"zebibytes_to_nibbles\":false,\"zebibytes_to_bytes\":false,\"zebibytes_to_kilobits\":false,\"zebibytes_to_kibibits\":false,\"zebibytes_to_kibibytes\":false,\"zebibytes_to_kilobytes\":false,\"zebibytes_to_megabits\":false,\"zebibytes_to_mebibits\":false,\"zebibytes_to_megabytes\":false,\"zebibytes_to_mebibytes\":false,\"zebibytes_to_gigabits\":false,\"zebibytes_to_gibibits\":false,\"zebibytes_to_gigabytes\":false,\"zebibytes_to_gibibytes\":false,\"zebibytes_to_terabits\":false,\"zebibytes_to_tebibits\":false,\"zebibytes_to_terabytes\":false,\"zebibytes_to_tebibytes\":false,\"zebibytes_to_petabits\":false,\"zebibytes_to_pebibits\":false,\"zebibytes_to_petabytes\":false,\"zebibytes_to_pebibytes\":false,\"zebibytes_to_exabits\":false,\"zebibytes_to_exbibits\":false,\"zebibytes_to_exabytes\":false,\"zebibytes_to_exbibytes\":false,\"zebibytes_to_zettabits\":false,\"zebibytes_to_zebibits\":false,\"zebibytes_to_zettabytes\":false,\"zebibytes_to_yottabits\":false,\"zebibytes_to_yobibits\":false,\"zebibytes_to_yottabytes\":false,\"zebibytes_to_yobibytes\":false,\"yottabits_to_bits\":false,\"yottabits_to_nibbles\":false,\"yottabits_to_bytes\":false,\"yottabits_to_kilobits\":false,\"yottabits_to_kibibits\":false,\"yottabits_to_kibibytes\":false,\"yottabits_to_kilobytes\":false,\"yottabits_to_megabits\":false,\"yottabits_to_mebibits\":false,\"yottabits_to_megabytes\":false,\"yottabits_to_mebibytes\":false,\"yottabits_to_gigabits\":false,\"yottabits_to_gibibits\":false,\"yottabits_to_gigabytes\":false,\"yottabits_to_gibibytes\":false,\"yottabits_to_terabits\":false,\"yottabits_to_tebibits\":false,\"yottabits_to_terabytes\":false,\"yottabits_to_tebibytes\":false,\"yottabits_to_petabits\":false,\"yottabits_to_pebibits\":false,\"yottabits_to_petabytes\":false,\"yottabits_to_pebibytes\":false,\"yottabits_to_exabits\":false,\"yottabits_to_exbibits\":false,\"yottabits_to_exabytes\":false,\"yottabits_to_exbibytes\":false,\"yottabits_to_zettabits\":false,\"yottabits_to_zebibits\":false,\"yottabits_to_zettabytes\":false,\"yottabits_to_zebibytes\":false,\"yottabits_to_yobibits\":false,\"yottabits_to_yottabytes\":false,\"yottabits_to_yobibytes\":false,\"yobibits_to_bits\":false,\"yobibits_to_nibbles\":false,\"yobibits_to_bytes\":false,\"yobibits_to_kilobits\":false,\"yobibits_to_kibibits\":false,\"yobibits_to_kibibytes\":false,\"yobibits_to_kilobytes\":false,\"yobibits_to_megabits\":false,\"yobibits_to_mebibits\":false,\"yobibits_to_megabytes\":false,\"yobibits_to_mebibytes\":false,\"yobibits_to_gigabits\":false,\"yobibits_to_gibibits\":false,\"yobibits_to_gigabytes\":false,\"yobibits_to_gibibytes\":false,\"yobibits_to_terabits\":false,\"yobibits_to_tebibits\":false,\"yobibits_to_terabytes\":false,\"yobibits_to_tebibytes\":false,\"yobibits_to_petabits\":false,\"yobibits_to_pebibits\":false,\"yobibits_to_petabytes\":false,\"yobibits_to_pebibytes\":false,\"yobibits_to_exabits\":false,\"yobibits_to_exbibits\":false,\"yobibits_to_exabytes\":false,\"yobibits_to_exbibytes\":false,\"yobibits_to_zettabits\":false,\"yobibits_to_zebibits\":false,\"yobibits_to_zettabytes\":false,\"yobibits_to_zebibytes\":false,\"yobibits_to_yottabits\":false,\"yobibits_to_yottabytes\":false,\"yobibits_to_yobibytes\":false,\"yottabytes_to_bits\":false,\"yottabytes_to_nibbles\":false,\"yottabytes_to_bytes\":false,\"yottabytes_to_kilobits\":false,\"yottabytes_to_kibibits\":false,\"yottabytes_to_kibibytes\":false,\"yottabytes_to_kilobytes\":false,\"yottabytes_to_megabits\":false,\"yottabytes_to_mebibits\":false,\"yottabytes_to_megabytes\":false,\"yottabytes_to_mebibytes\":false,\"yottabytes_to_gigabits\":false,\"yottabytes_to_gibibits\":false,\"yottabytes_to_gigabytes\":false,\"yottabytes_to_gibibytes\":false,\"yottabytes_to_terabits\":false,\"yottabytes_to_tebibits\":false,\"yottabytes_to_terabytes\":false,\"yottabytes_to_tebibytes\":false,\"yottabytes_to_petabits\":false,\"yottabytes_to_pebibits\":false,\"yottabytes_to_petabytes\":false,\"yottabytes_to_pebibytes\":false,\"yottabytes_to_exabits\":false,\"yottabytes_to_exbibits\":false,\"yottabytes_to_exabytes\":false,\"yottabytes_to_exbibytes\":false,\"yottabytes_to_zettabits\":false,\"yottabytes_to_zebibits\":false,\"yottabytes_to_zettabytes\":false,\"yottabytes_to_zebibytes\":false,\"yottabytes_to_yottabits\":false,\"yottabytes_to_yobibits\":false,\"yottabytes_to_yobibytes\":false,\"yobibytes_to_bits\":false,\"yobibytes_to_nibbles\":false,\"yobibytes_to_bytes\":false,\"yobibytes_to_kilobits\":false,\"yobibytes_to_kibibits\":false,\"yobibytes_to_kibibytes\":false,\"yobibytes_to_kilobytes\":false,\"yobibytes_to_megabits\":false,\"yobibytes_to_mebibits\":false,\"yobibytes_to_megabytes\":false,\"yobibytes_to_mebibytes\":false,\"yobibytes_to_gigabits\":false,\"yobibytes_to_gibibits\":false,\"yobibytes_to_gigabytes\":false,\"yobibytes_to_gibibytes\":false,\"yobibytes_to_terabits\":false,\"yobibytes_to_tebibits\":false,\"yobibytes_to_terabytes\":false,\"yobibytes_to_tebibytes\":false,\"yobibytes_to_petabits\":false,\"yobibytes_to_pebibits\":false,\"yobibytes_to_petabytes\":false,\"yobibytes_to_pebibytes\":false,\"yobibytes_to_exabits\":false,\"yobibytes_to_exbibits\":false,\"yobibytes_to_exabytes\":false,\"yobibytes_to_exbibytes\":false,\"yobibytes_to_zettabits\":false,\"yobibytes_to_zebibits\":false,\"yobibytes_to_zettabytes\":false,\"yobibytes_to_zebibytes\":false,\"yobibytes_to_yottabits\":false,\"yobibytes_to_yobibits\":false,\"yobibytes_to_yottabytes\":false},\"removable_branding\":false,\"exclusive_personal_api_keys\":false,\"documents_model\":null,\"documents_per_month_limit\":0,\"words_per_month_limit\":0,\"images_api\":null,\"images_per_month_limit\":0,\"transcriptions_per_month_limit\":0,\"transcriptions_file_size_limit\":0,\"chats_model\":null,\"chats_per_month_limit\":0,\"chat_messages_per_chat_limit\":0,\"chat_image_size_limit\":0,\"syntheses_api\":null,\"syntheses_per_month_limit\":0,\"synthesized_characters_per_month_limit\":0}', 0, 1, NULL, NULL, NULL, NULL, '25a2484599f2183bbe6347ccebfe67e0', NULL, 0, 'english', NULL, 'UTC', NULL, '2024-06-12 05:37:53', '137.59.155.142', 'AS', 'BD', 'Dhaka', 'desktop', 'en', 'Edge', 'Windows', '2024-06-13 10:08:47', 7, 0, 'direct');

-- --------------------------------------------------------

--
-- Table structure for table `users_logs`
--

CREATE TABLE `users_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `continent_code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser_language` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_logs`
--

INSERT INTO `users_logs` (`id`, `user_id`, `type`, `ip`, `device_type`, `os_name`, `continent_code`, `country_code`, `city_name`, `browser_language`, `browser_name`, `datetime`) VALUES
(1, 1, 'login.default.success', '185.80.221.236', 'desktop', 'Windows', NULL, 'NL', NULL, NULL, NULL, '2024-06-11 23:38:23'),
(2, 1, 'login.wrong_password', '185.80.221.236', 'desktop', 'Windows', NULL, 'NL', NULL, NULL, NULL, '2024-06-11 23:41:10'),
(3, 1, 'login.wrong_password', '185.80.221.236', 'desktop', 'Windows', NULL, 'NL', NULL, NULL, NULL, '2024-06-11 23:41:24'),
(4, 1, 'login.wrong_password', '185.80.221.236', 'desktop', 'Windows', NULL, 'NL', NULL, NULL, NULL, '2024-06-11 23:41:52'),
(5, 1, 'login.wrong_password', '78.159.101.115', 'desktop', 'Windows', NULL, 'DE', NULL, NULL, NULL, '2024-06-11 23:53:13'),
(6, 1, 'lost_password.request_sent', '78.159.101.115', 'desktop', 'Windows', NULL, 'DE', NULL, NULL, NULL, '2024-06-11 23:54:18'),
(7, 1, 'login.default.success', '78.159.101.115', 'desktop', 'Windows', NULL, 'DE', NULL, NULL, NULL, '2024-06-11 23:57:40'),
(8, 1, 'login.wrong_password', '78.159.101.115', 'desktop', 'Windows', NULL, 'DE', NULL, NULL, NULL, '2024-06-12 00:00:50'),
(9, 1, 'login.default.success', '78.159.101.115', 'desktop', 'Windows', NULL, 'DE', NULL, NULL, NULL, '2024-06-12 00:00:58'),
(10, 1, 'login.default.success', '78.159.101.115', 'desktop', 'Windows', NULL, 'DE', NULL, NULL, NULL, '2024-06-12 00:01:45'),
(11, 1, 'login.default.success', '78.159.101.115', 'desktop', 'Windows', NULL, 'DE', NULL, NULL, NULL, '2024-06-12 00:02:13'),
(12, 1, 'login.default.success', '138.199.53.241', 'desktop', 'Windows', NULL, 'RO', NULL, NULL, NULL, '2024-06-12 05:59:17'),
(13, 1, 'login.default.success', '137.59.155.142', 'desktop', 'Windows', NULL, 'BD', NULL, NULL, NULL, '2024-06-13 10:08:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `affiliates_commissions`
--
ALTER TABLE `affiliates_commissions`
  ADD PRIMARY KEY (`affiliate_commission_id`),
  ADD UNIQUE KEY `affiliate_commission_id` (`affiliate_commission_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `referred_user_id` (`referred_user_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `affiliates_withdrawals`
--
ALTER TABLE `affiliates_withdrawals`
  ADD PRIMARY KEY (`affiliate_withdrawal_id`),
  ADD UNIQUE KEY `affiliate_withdrawal_id` (`affiliate_withdrawal_id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`blog_post_id`),
  ADD KEY `blog_post_id_index` (`blog_post_id`),
  ADD KEY `blog_post_url_index` (`url`),
  ADD KEY `blog_posts_category_id` (`blog_posts_category_id`),
  ADD KEY `blog_posts_is_published_index` (`is_published`),
  ADD KEY `blog_posts_language_index` (`language`);

--
-- Indexes for table `blog_posts_categories`
--
ALTER TABLE `blog_posts_categories`
  ADD PRIMARY KEY (`blog_posts_category_id`),
  ADD KEY `url` (`url`),
  ADD KEY `blog_posts_categories_url_language_index` (`url`,`language`);

--
-- Indexes for table `broadcasts`
--
ALTER TABLE `broadcasts`
  ADD PRIMARY KEY (`broadcast_id`);

--
-- Indexes for table `broadcasts_statistics`
--
ALTER TABLE `broadcasts_statistics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `broadcast_id` (`broadcast_id`),
  ADD KEY `broadcasts_statistics_user_id_broadcast_id_type_index` (`broadcast_id`,`user_id`,`type`),
  ADD KEY `broadcasts_statistics_ibfk_1` (`user_id`);

--
-- Indexes for table `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`code_id`),
  ADD KEY `type` (`type`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `internal_notifications`
--
ALTER TABLE `internal_notifications`
  ADD PRIMARY KEY (`internal_notification_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `users_notifications_for_who_idx` (`for_who`) USING BTREE;

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`),
  ADD KEY `pages_pages_category_id_index` (`pages_category_id`),
  ADD KEY `pages_url_index` (`url`),
  ADD KEY `pages_is_published_index` (`is_published`),
  ADD KEY `pages_language_index` (`language`);

--
-- Indexes for table `pages_categories`
--
ALTER TABLE `pages_categories`
  ADD PRIMARY KEY (`pages_category_id`),
  ADD KEY `url` (`url`),
  ADD KEY `pages_categories_url_language_index` (`url`,`language`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id` (`user_id`),
  ADD KEY `plan_id` (`plan_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`plan_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`),
  ADD UNIQUE KEY `project_id` (`project_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `redeemed_codes`
--
ALTER TABLE `redeemed_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code_id` (`code_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`tax_id`);

--
-- Indexes for table `tools_usage`
--
ALTER TABLE `tools_usage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tools_usage_tool_id_idx` (`tool_id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `plan_id` (`plan_id`),
  ADD KEY `api_key` (`api_key`);

--
-- Indexes for table `users_logs`
--
ALTER TABLE `users_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_logs_user_id` (`user_id`),
  ADD KEY `users_logs_ip_type_datetime_index` (`ip`,`type`,`datetime`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `affiliates_commissions`
--
ALTER TABLE `affiliates_commissions`
  MODIFY `affiliate_commission_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliates_withdrawals`
--
ALTER TABLE `affiliates_withdrawals`
  MODIFY `affiliate_withdrawal_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `blog_post_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_posts_categories`
--
ALTER TABLE `blog_posts_categories`
  MODIFY `blog_posts_category_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `broadcasts`
--
ALTER TABLE `broadcasts`
  MODIFY `broadcast_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `broadcasts_statistics`
--
ALTER TABLE `broadcasts_statistics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `codes`
--
ALTER TABLE `codes`
  MODIFY `code_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `internal_notifications`
--
ALTER TABLE `internal_notifications`
  MODIFY `internal_notification_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages_categories`
--
ALTER TABLE `pages_categories`
  MODIFY `pages_category_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `plan_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `redeemed_codes`
--
ALTER TABLE `redeemed_codes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `tax_id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tools_usage`
--
ALTER TABLE `tools_usage`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16268;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_logs`
--
ALTER TABLE `users_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `affiliates_commissions`
--
ALTER TABLE `affiliates_commissions`
  ADD CONSTRAINT `affiliates_commissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `affiliates_commissions_ibfk_2` FOREIGN KEY (`referred_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `affiliates_commissions_ibfk_3` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `blog_posts_ibfk_1` FOREIGN KEY (`blog_posts_category_id`) REFERENCES `blog_posts_categories` (`blog_posts_category_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `broadcasts_statistics`
--
ALTER TABLE `broadcasts_statistics`
  ADD CONSTRAINT `broadcasts_statistics_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `broadcasts_statistics_ibfk_2` FOREIGN KEY (`broadcast_id`) REFERENCES `broadcasts` (`broadcast_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `internal_notifications`
--
ALTER TABLE `internal_notifications`
  ADD CONSTRAINT `internal_notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_ibfk_1` FOREIGN KEY (`pages_category_id`) REFERENCES `pages_categories` (`pages_category_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_plans_plan_id_fk` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`plan_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `redeemed_codes`
--
ALTER TABLE `redeemed_codes`
  ADD CONSTRAINT `redeemed_codes_ibfk_1` FOREIGN KEY (`code_id`) REFERENCES `codes` (`code_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `redeemed_codes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_logs`
--
ALTER TABLE `users_logs`
  ADD CONSTRAINT `users_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
