create extension if not exists pg_net;
create extension if not exists pg_cron;

create table if not exists public.capitals (
  ord int primary key, iso2 text not null, city text not null, country text not null, region text not null,
  lat double precision not null, lon double precision not null
);
truncate public.capitals;
insert into public.capitals (ord, iso2, city, country, region, lat, lon) values
(1, 'AW', 'Oranjestad', 'Aruba', 'Latin America & Caribbean ', 12.5167, -70.0167),
(2, 'AF', 'Kabul', 'Afghanistan', 'Middle East, North Africa, Afghanistan & Pakistan', 34.5228, 69.1761),
(3, 'AO', 'Luanda', 'Angola', 'Sub-Saharan Africa ', -8.81155, 13.242),
(4, 'AL', 'Tirane', 'Albania', 'Europe & Central Asia', 41.3317, 19.8172),
(5, 'AD', 'Andorra la Vella', 'Andorra', 'Europe & Central Asia', 42.5075, 1.5218),
(6, 'AE', 'Abu Dhabi', 'United Arab Emirates', 'Middle East, North Africa, Afghanistan & Pakistan', 24.4764, 54.3705),
(7, 'AR', 'Buenos Aires', 'Argentina', 'Latin America & Caribbean ', -34.6118, -58.4173),
(8, 'AM', 'Yerevan', 'Armenia', 'Europe & Central Asia', 40.1596, 44.509),
(9, 'AS', 'Pago Pago', 'American Samoa', 'East Asia & Pacific', -14.2846, -170.691),
(10, 'AG', 'Saint John''s', 'Antigua and Barbuda', 'Latin America & Caribbean ', 17.1175, -61.8456),
(11, 'AU', 'Canberra', 'Australia', 'East Asia & Pacific', -35.282, 149.129),
(12, 'AT', 'Vienna', 'Austria', 'Europe & Central Asia', 48.2201, 16.3798),
(13, 'AZ', 'Baku', 'Azerbaijan', 'Europe & Central Asia', 40.3834, 49.8932),
(14, 'BI', 'Bujumbura', 'Burundi', 'Sub-Saharan Africa ', -3.3784, 29.3639),
(15, 'BE', 'Brussels', 'Belgium', 'Europe & Central Asia', 50.8371, 4.36761),
(16, 'BJ', 'Porto-Novo', 'Benin', 'Sub-Saharan Africa ', 6.4779, 2.6323),
(17, 'BF', 'Ouagadougou', 'Burkina Faso', 'Sub-Saharan Africa ', 12.3605, -1.53395),
(18, 'BD', 'Dhaka', 'Bangladesh', 'South Asia', 23.7055, 90.4113),
(19, 'BG', 'Sofia', 'Bulgaria', 'Europe & Central Asia', 42.7105, 23.3238),
(20, 'BH', 'Manama', 'Bahrain', 'Middle East, North Africa, Afghanistan & Pakistan', 26.1921, 50.5354),
(21, 'BS', 'Nassau', 'Bahamas, The', 'Latin America & Caribbean ', 25.0661, -77.339),
(22, 'BA', 'Sarajevo', 'Bosnia and Herzegovina', 'Europe & Central Asia', 43.8607, 18.4214),
(23, 'BY', 'Minsk', 'Belarus', 'Europe & Central Asia', 53.9678, 27.5766),
(24, 'BZ', 'Belmopan', 'Belize', 'Latin America & Caribbean ', 17.2534, -88.7713),
(25, 'BM', 'Hamilton', 'Bermuda', 'North America', 32.3293, -64.706),
(26, 'BO', 'La Paz', 'Bolivia', 'Latin America & Caribbean ', -16.5, -68.15),
(27, 'BR', 'Brasilia', 'Brazil', 'Latin America & Caribbean ', -15.7801, -47.9292),
(28, 'BB', 'Bridgetown', 'Barbados', 'Latin America & Caribbean ', 13.0935, -59.6105),
(29, 'BN', 'Bandar Seri Begawan', 'Brunei Darussalam', 'East Asia & Pacific', 4.94199, 114.946),
(30, 'BT', 'Thimphu', 'Bhutan', 'South Asia', 27.5768, 89.6177),
(31, 'BW', 'Gaborone', 'Botswana', 'Sub-Saharan Africa ', -24.6544, 25.9201),
(32, 'CF', 'Bangui', 'Central African Republic', 'Sub-Saharan Africa ', 4.3612, 18.555),
(33, 'CA', 'Ottawa', 'Canada', 'North America', 45.4215, -75.6919),
(34, 'CH', 'Bern', 'Switzerland', 'Europe & Central Asia', 46.948, 7.44821),
(35, 'CL', 'Santiago', 'Chile', 'Latin America & Caribbean ', -33.475, -70.6475),
(36, 'CN', 'Beijing', 'China', 'East Asia & Pacific', 40.0495, 116.286),
(37, 'CI', 'Yamoussoukro', 'Cote d''Ivoire', 'Sub-Saharan Africa ', 6.8206, -5.2767),
(38, 'CM', 'Yaounde', 'Cameroon', 'Sub-Saharan Africa ', 3.8721, 11.5174),
(39, 'CD', 'Kinshasa', 'Congo, Dem. Rep.', 'Sub-Saharan Africa ', -4.325, 15.3222),
(40, 'CG', 'Brazzaville', 'Congo, Rep.', 'Sub-Saharan Africa ', -4.2767, 15.2662),
(41, 'CO', 'Bogota', 'Colombia', 'Latin America & Caribbean ', 4.60987, -74.082),
(42, 'KM', 'Moroni', 'Comoros', 'Sub-Saharan Africa ', -11.6986, 43.2418),
(43, 'CV', 'Praia', 'Cabo Verde', 'Sub-Saharan Africa ', 14.9218, -23.5087),
(44, 'CR', 'San Jose', 'Costa Rica', 'Latin America & Caribbean ', 9.63701, -84.0089),
(45, 'CU', 'Havana', 'Cuba', 'Latin America & Caribbean ', 23.1333, -82.3667),
(46, 'KY', 'George Town', 'Cayman Islands', 'Latin America & Caribbean ', 19.3022, -81.3857),
(47, 'CY', 'Nicosia', 'Cyprus', 'Europe & Central Asia', 35.1676, 33.3736),
(48, 'CZ', 'Prague', 'Czechia', 'Europe & Central Asia', 50.0878, 14.4205),
(49, 'DE', 'Berlin', 'Germany', 'Europe & Central Asia', 52.5235, 13.4115),
(50, 'DJ', 'Djibouti', 'Djibouti', 'Middle East, North Africa, Afghanistan & Pakistan', 11.5806, 43.1425),
(51, 'DM', 'Roseau', 'Dominica', 'Latin America & Caribbean ', 15.2976, -61.39),
(52, 'DK', 'Copenhagen', 'Denmark', 'Europe & Central Asia', 55.6763, 12.5681),
(53, 'DO', 'Santo Domingo', 'Dominican Republic', 'Latin America & Caribbean ', 18.479, -69.8908),
(54, 'DZ', 'Algiers', 'Algeria', 'Middle East, North Africa, Afghanistan & Pakistan', 36.7397, 3.05097),
(55, 'EC', 'Quito', 'Ecuador', 'Latin America & Caribbean ', -0.229498, -78.5243),
(56, 'EG', 'Cairo', 'Egypt, Arab Rep.', 'Middle East, North Africa, Afghanistan & Pakistan', 30.0982, 31.2461),
(57, 'ER', 'Asmara', 'Eritrea', 'Sub-Saharan Africa ', 15.3315, 38.9183),
(58, 'ES', 'Madrid', 'Spain', 'Europe & Central Asia', 40.4167, -3.70327),
(59, 'EE', 'Tallinn', 'Estonia', 'Europe & Central Asia', 59.4392, 24.7586),
(60, 'ET', 'Addis Ababa', 'Ethiopia', 'Sub-Saharan Africa ', 9.02274, 38.7468),
(61, 'FI', 'Helsinki', 'Finland', 'Europe & Central Asia', 60.1608, 24.9525),
(62, 'FJ', 'Suva', 'Fiji', 'East Asia & Pacific', -18.1149, 178.399),
(63, 'FR', 'Paris', 'France', 'Europe & Central Asia', 48.8566, 2.35097),
(64, 'FO', 'Torshavn', 'Faroe Islands', 'Europe & Central Asia', 61.8926, -6.91181),
(65, 'FM', 'Palikir', 'Micronesia, Fed. Sts.', 'East Asia & Pacific', 6.91771, 158.185),
(66, 'GA', 'Libreville', 'Gabon', 'Sub-Saharan Africa ', 0.38832, 9.45162),
(67, 'GB', 'London', 'United Kingdom', 'Europe & Central Asia', 51.5002, -0.126236),
(68, 'GE', 'Tbilisi', 'Georgia', 'Europe & Central Asia', 41.71, 44.793),
(69, 'GH', 'Accra', 'Ghana', 'Sub-Saharan Africa ', 5.57045, -0.20795),
(70, 'GN', 'Conakry', 'Guinea', 'Sub-Saharan Africa ', 9.51667, -13.7),
(71, 'GM', 'Banjul', 'Gambia, The', 'Sub-Saharan Africa ', 13.4495, -16.5885),
(72, 'GW', 'Bissau', 'Guinea-Bissau', 'Sub-Saharan Africa ', 11.8037, -15.1804),
(73, 'GQ', 'Malabo', 'Equatorial Guinea', 'Sub-Saharan Africa ', 3.7523, 8.7741),
(74, 'GR', 'Athens', 'Greece', 'Europe & Central Asia', 37.9792, 23.7166),
(75, 'GD', 'Saint George''s', 'Grenada', 'Latin America & Caribbean ', 12.0653, -61.7449),
(76, 'GL', 'Nuuk', 'Greenland', 'Europe & Central Asia', 64.1836, -51.7214),
(77, 'GT', 'Guatemala City', 'Guatemala', 'Latin America & Caribbean ', 14.6248, -90.5328),
(78, 'GU', 'Agana', 'Guam', 'East Asia & Pacific', 13.4443, 144.794),
(79, 'GY', 'Georgetown', 'Guyana', 'Latin America & Caribbean ', 6.80461, -58.1548),
(80, 'HN', 'Tegucigalpa', 'Honduras', 'Latin America & Caribbean ', 14.0818, -87.2068),
(81, 'HR', 'Zagreb', 'Croatia', 'Europe & Central Asia', 45.8069, 15.9614),
(82, 'HT', 'Port-au-Prince', 'Haiti', 'Latin America & Caribbean ', 18.5392, -72.3288),
(83, 'HU', 'Budapest', 'Hungary', 'Europe & Central Asia', 47.4984, 19.0408),
(84, 'ID', 'Jakarta', 'Indonesia', 'East Asia & Pacific', -6.19752, 106.83),
(85, 'IM', 'Douglas', 'Isle of Man', 'Europe & Central Asia', 54.1509, -4.47928),
(86, 'IN', 'New Delhi', 'India', 'South Asia', 28.6353, 77.225),
(87, 'IE', 'Dublin', 'Ireland', 'Europe & Central Asia', 53.3441, -6.26749),
(88, 'IR', 'Tehran', 'Iran, Islamic Rep.', 'Middle East, North Africa, Afghanistan & Pakistan', 35.6878, 51.4447),
(89, 'IQ', 'Baghdad', 'Iraq', 'Middle East, North Africa, Afghanistan & Pakistan', 33.3302, 44.394),
(90, 'IS', 'Reykjavik', 'Iceland', 'Europe & Central Asia', 64.1353, -21.8952),
(91, 'IT', 'Rome', 'Italy', 'Europe & Central Asia', 41.8955, 12.4823),
(92, 'JM', 'Kingston', 'Jamaica', 'Latin America & Caribbean ', 17.9927, -76.792),
(93, 'JO', 'Amman', 'Jordan', 'Middle East, North Africa, Afghanistan & Pakistan', 31.9497, 35.9263),
(94, 'JP', 'Tokyo', 'Japan', 'East Asia & Pacific', 35.67, 139.77),
(95, 'KZ', 'Astana', 'Kazakhstan', 'Europe & Central Asia', 51.1879, 71.4382),
(96, 'KE', 'Nairobi', 'Kenya', 'Sub-Saharan Africa ', -1.27975, 36.8126),
(97, 'KG', 'Bishkek', 'Kyrgyz Republic', 'Europe & Central Asia', 42.8851, 74.6057),
(98, 'KH', 'Phnom Penh', 'Cambodia', 'East Asia & Pacific', 11.5556, 104.874),
(99, 'KI', 'Tarawa', 'Kiribati', 'East Asia & Pacific', 1.32905, 172.979),
(100, 'KN', 'Basseterre', 'St. Kitts and Nevis', 'Latin America & Caribbean ', 17.3, -62.7309),
(101, 'KR', 'Seoul', 'Korea, Rep.', 'East Asia & Pacific', 37.5323, 126.957),
(102, 'KW', 'Kuwait City', 'Kuwait', 'Middle East, North Africa, Afghanistan & Pakistan', 29.3721, 47.9824),
(103, 'LA', 'Vientiane', 'Lao PDR', 'East Asia & Pacific', 17.9667, 102.6),
(104, 'LB', 'Beirut', 'Lebanon', 'Middle East, North Africa, Afghanistan & Pakistan', 33.8872, 35.5134),
(105, 'LR', 'Monrovia', 'Liberia', 'Sub-Saharan Africa ', 6.30039, -10.7957),
(106, 'LY', 'Tripoli', 'Libya', 'Middle East, North Africa, Afghanistan & Pakistan', 32.8578, 13.1072),
(107, 'LC', 'Castries', 'St. Lucia', 'Latin America & Caribbean ', 14.0, -60.9832),
(108, 'LI', 'Vaduz', 'Liechtenstein', 'Europe & Central Asia', 47.1411, 9.52148),
(109, 'LK', 'Colombo', 'Sri Lanka', 'South Asia', 6.92148, 79.8528),
(110, 'LS', 'Maseru', 'Lesotho', 'Sub-Saharan Africa ', -29.5208, 27.7167),
(111, 'LT', 'Vilnius', 'Lithuania', 'Europe & Central Asia', 54.6896, 25.2799),
(112, 'LU', 'Luxembourg', 'Luxembourg', 'Europe & Central Asia', 49.61, 6.1296),
(113, 'LV', 'Riga', 'Latvia', 'Europe & Central Asia', 56.9465, 24.1048),
(114, 'MA', 'Rabat', 'Morocco', 'Middle East, North Africa, Afghanistan & Pakistan', 33.9905, -6.8704),
(115, 'MC', 'Monaco', 'Monaco', 'Europe & Central Asia', 43.7325, 7.41891),
(116, 'MD', 'Chisinau', 'Moldova', 'Europe & Central Asia', 47.0167, 28.8497),
(117, 'MG', 'Antananarivo', 'Madagascar', 'Sub-Saharan Africa ', -18.9137, 47.5361),
(118, 'MV', 'Male', 'Maldives', 'South Asia', 4.1742, 73.5109),
(119, 'MX', 'Mexico City', 'Mexico', 'Latin America & Caribbean ', 19.427, -99.1276),
(120, 'MH', 'Majuro', 'Marshall Islands', 'East Asia & Pacific', 7.11046, 171.135),
(121, 'MK', 'Skopje', 'North Macedonia', 'Europe & Central Asia', 42.0024, 21.4361),
(122, 'ML', 'Bamako', 'Mali', 'Sub-Saharan Africa ', 12.6092, -7.9752),
(123, 'MT', 'Valletta', 'Malta', 'Middle East, North Africa, Afghanistan & Pakistan', 35.9042, 14.5189),
(124, 'MM', 'Naypyidaw', 'Myanmar', 'East Asia & Pacific', 19.7366, 96.2072),
(125, 'ME', 'Podgorica', 'Montenegro', 'Europe & Central Asia', 42.4602, 19.2595),
(126, 'MN', 'Ulaanbaatar', 'Mongolia', 'East Asia & Pacific', 47.9129, 106.937),
(127, 'MP', 'Saipan', 'Northern Mariana Islands', 'East Asia & Pacific', 15.1935, 145.765),
(128, 'MZ', 'Maputo', 'Mozambique', 'Sub-Saharan Africa ', -25.9664, 32.5713),
(129, 'MR', 'Nouakchott', 'Mauritania', 'Sub-Saharan Africa ', 18.2367, -15.9824),
(130, 'MU', 'Port Louis', 'Mauritius', 'Sub-Saharan Africa ', -20.1605, 57.4977),
(131, 'MW', 'Lilongwe', 'Malawi', 'Sub-Saharan Africa ', -13.9899, 33.7703),
(132, 'MY', 'Kuala Lumpur', 'Malaysia', 'East Asia & Pacific', 3.12433, 101.684),
(133, 'NA', 'Windhoek', 'Namibia', 'Sub-Saharan Africa ', -22.5648, 17.0931),
(134, 'NC', 'Noum''ea', 'New Caledonia', 'East Asia & Pacific', -22.2677, 166.464),
(135, 'NE', 'Niamey', 'Niger', 'Sub-Saharan Africa ', 13.514, 2.1073),
(136, 'NG', 'Abuja', 'Nigeria', 'Sub-Saharan Africa ', 9.05804, 7.48906),
(137, 'NI', 'Managua', 'Nicaragua', 'Latin America & Caribbean ', 12.1475, -86.2734),
(138, 'NL', 'Amsterdam', 'Netherlands', 'Europe & Central Asia', 52.3738, 4.89095),
(139, 'NO', 'Oslo', 'Norway', 'Europe & Central Asia', 59.9138, 10.7387),
(140, 'NP', 'Kathmandu', 'Nepal', 'South Asia', 27.6939, 85.3157),
(141, 'NR', 'Yaren District', 'Naoero', 'East Asia & Pacific', -0.5477, 166.920867),
(142, 'NZ', 'Wellington', 'New Zealand', 'East Asia & Pacific', -41.2865, 174.776),
(143, 'OM', 'Muscat', 'Oman', 'Middle East, North Africa, Afghanistan & Pakistan', 23.6105, 58.5874),
(144, 'PK', 'Islamabad', 'Pakistan', 'Middle East, North Africa, Afghanistan & Pakistan', 33.7215, 73.0433),
(145, 'PA', 'Panama City', 'Panama', 'Latin America & Caribbean ', 8.99427, -79.5188),
(146, 'PE', 'Lima', 'Peru', 'Latin America & Caribbean ', -12.0931, -77.0465),
(147, 'PH', 'Manila', 'Philippines', 'East Asia & Pacific', 14.5515, 121.035),
(148, 'PW', 'Koror', 'Palau', 'East Asia & Pacific', 7.34194, 134.479),
(149, 'PG', 'Port Moresby', 'Papua New Guinea', 'East Asia & Pacific', -9.47357, 147.194),
(150, 'PL', 'Warsaw', 'Poland', 'Europe & Central Asia', 52.26, 21.02),
(151, 'PR', 'San Juan', 'Puerto Rico (US)', 'Latin America & Caribbean ', 18.23, -66.0),
(152, 'KP', 'Pyongyang', 'Korea, Dem. People''s Rep.', 'East Asia & Pacific', 39.0319, 125.754),
(153, 'PT', 'Lisbon', 'Portugal', 'Europe & Central Asia', 38.7072, -9.13552),
(154, 'PY', 'Asuncion', 'Paraguay', 'Latin America & Caribbean ', -25.3005, -57.6362),
(155, 'PF', 'Papeete', 'French Polynesia', 'East Asia & Pacific', -17.535, -149.57),
(156, 'QA', 'Doha', 'Qatar', 'Middle East, North Africa, Afghanistan & Pakistan', 25.2948, 51.5082),
(157, 'RO', 'Bucharest', 'Romania', 'Europe & Central Asia', 44.4479, 26.0979),
(158, 'RU', 'Moscow', 'Russian Federation', 'Europe & Central Asia', 55.7558, 37.6176),
(159, 'RW', 'Kigali', 'Rwanda', 'Sub-Saharan Africa ', -1.95325, 30.0587),
(160, 'SA', 'Riyadh', 'Saudi Arabia', 'Middle East, North Africa, Afghanistan & Pakistan', 24.6748, 46.6977),
(161, 'SD', 'Khartoum', 'Sudan', 'Sub-Saharan Africa ', 15.5932, 32.5363),
(162, 'SN', 'Dakar', 'Senegal', 'Sub-Saharan Africa ', 14.7247, -17.4734),
(163, 'SG', 'Singapore', 'Singapore', 'East Asia & Pacific', 1.28941, 103.85),
(164, 'SB', 'Honiara', 'Solomon Islands', 'East Asia & Pacific', -9.42676, 159.949),
(165, 'SL', 'Freetown', 'Sierra Leone', 'Sub-Saharan Africa ', 8.4821, -13.2134),
(166, 'SV', 'San Salvador', 'El Salvador', 'Latin America & Caribbean ', 13.7034, -89.2073),
(167, 'SM', 'San Marino', 'San Marino', 'Europe & Central Asia', 43.9322, 12.4486),
(168, 'SO', 'Mogadishu', 'Somalia, Fed. Rep.', 'Sub-Saharan Africa ', 2.07515, 45.3254),
(169, 'RS', 'Belgrade', 'Serbia', 'Europe & Central Asia', 44.8024, 20.4656),
(170, 'SS', 'Juba', 'South Sudan', 'Sub-Saharan Africa ', 4.85, 31.6),
(171, 'ST', 'Sao Tome', 'Sao Tome and Principe', 'Sub-Saharan Africa ', 0.20618, 6.6071),
(172, 'SR', 'Paramaribo', 'Suriname', 'Latin America & Caribbean ', 5.8232, -55.1679),
(173, 'SK', 'Bratislava', 'Slovak Republic', 'Europe & Central Asia', 48.1484, 17.1073),
(174, 'SI', 'Ljubljana', 'Slovenia', 'Europe & Central Asia', 46.0546, 14.5044),
(175, 'SE', 'Stockholm', 'Sweden', 'Europe & Central Asia', 59.3327, 18.0645),
(176, 'SZ', 'Mbabane', 'Eswatini', 'Sub-Saharan Africa ', -26.5225, 31.4659),
(177, 'SC', 'Victoria', 'Seychelles', 'Sub-Saharan Africa ', -4.6309, 55.4466),
(178, 'SY', 'Damascus', 'Syrian Arab Republic', 'Middle East, North Africa, Afghanistan & Pakistan', 33.5146, 36.3119),
(179, 'TC', 'Grand Turk', 'Turks and Caicos Islands', 'Latin America & Caribbean ', 21.4602778, -71.141389),
(180, 'TD', 'N''Djamena', 'Chad', 'Sub-Saharan Africa ', 12.1048, 15.0445),
(181, 'TG', 'Lome', 'Togo', 'Sub-Saharan Africa ', 6.1228, 1.2255),
(182, 'TH', 'Bangkok', 'Thailand', 'East Asia & Pacific', 13.7308, 100.521),
(183, 'TJ', 'Dushanbe', 'Tajikistan', 'Europe & Central Asia', 38.5878, 68.7864),
(184, 'TM', 'Ashgabat', 'Turkmenistan', 'Europe & Central Asia', 37.9509, 58.3794),
(185, 'TL', 'Dili', 'Timor-Leste', 'East Asia & Pacific', -8.56667, 125.567),
(186, 'TO', 'Nuku''alofa', 'Tonga', 'East Asia & Pacific', -21.136, -175.216),
(187, 'TT', 'Port-of-Spain', 'Trinidad and Tobago', 'Latin America & Caribbean ', 10.6596, -61.4789),
(188, 'TN', 'Tunis', 'Tunisia', 'Middle East, North Africa, Afghanistan & Pakistan', 36.7899, 10.21),
(189, 'TR', 'Ankara', 'Turkiye', 'Europe & Central Asia', 39.7153, 32.3606),
(190, 'TV', 'Funafuti', 'Tuvalu', 'East Asia & Pacific', -8.6314877, 179.089567),
(191, 'TZ', 'Dodoma', 'Tanzania', 'Sub-Saharan Africa ', -6.17486, 35.7382),
(192, 'UG', 'Kampala', 'Uganda', 'Sub-Saharan Africa ', 0.314269, 32.5729),
(193, 'UA', 'Kiev', 'Ukraine', 'Europe & Central Asia', 50.4536, 30.5038),
(194, 'UY', 'Montevideo', 'Uruguay', 'Latin America & Caribbean ', -34.8941, -56.0675),
(195, 'US', 'Washington D.C.', 'United States', 'North America', 38.8895, -77.032),
(196, 'UZ', 'Tashkent', 'Uzbekistan', 'Europe & Central Asia', 41.3052, 69.269),
(197, 'VC', 'Kingstown', 'St. Vincent and the Grenadines', 'Latin America & Caribbean ', 13.2035, -61.2653),
(198, 'VE', 'Caracas', 'Venezuela, RB', 'Latin America & Caribbean ', 10.488, -66.8792),
(199, 'VG', 'Road Town', 'British Virgin Islands', 'Latin America & Caribbean ', 18.431389, -64.623056),
(200, 'VI', 'Charlotte Amalie', 'Virgin Islands (U.S.)', 'Latin America & Caribbean ', 18.3358, -64.8963),
(201, 'VN', 'Hanoi', 'Viet Nam', 'East Asia & Pacific', 21.0069, 105.825),
(202, 'VU', 'Port-Vila', 'Vanuatu', 'East Asia & Pacific', -17.7404, 168.321),
(203, 'WS', 'Apia', 'Samoa', 'East Asia & Pacific', -13.8314, -171.752),
(204, 'XK', 'Pristina', 'Kosovo', 'Europe & Central Asia', 42.565, 20.926),
(205, 'YE', 'Sana''a', 'Yemen, Rep.', 'Middle East, North Africa, Afghanistan & Pakistan', 15.352, 44.2075),
(206, 'ZA', 'Pretoria', 'South Africa', 'Sub-Saharan Africa ', -25.746, 28.1871),
(207, 'ZM', 'Lusaka', 'Zambia', 'Sub-Saharan Africa ', -15.3982, 28.2937),
(208, 'ZW', 'Harare', 'Zimbabwe', 'Sub-Saharan Africa ', -17.8312, 31.0672);

create table if not exists public.cache (
  key text primary key,
  data jsonb not null,
  updated_at timestamptz not null default now()
);
alter table public.cache enable row level security;
drop policy if exists "cache public read" on public.cache;
create policy "cache public read" on public.cache for select to anon, authenticated using (true);

create table if not exists public.cache_jobs (
  id bigserial primary key, key text not null, part int not null, request_id bigint not null, created_at timestamptz not null default now()
);
-- helper tables are locked: only the jobs below (which run with the database's own rights) touch them
alter table public.capitals enable row level security;
alter table public.cache_jobs enable row level security;

-- 1. every hour: send two requests (104 capitals each) and remember their ids
create or replace function public.capitals_request() returns void language plpgsql security definer set search_path = public as $$
declare r record;
begin
  delete from public.cache_jobs where key = 'capitals';
  for r in
    select part, string_agg(lat::text, ',' order by ord) as lats, string_agg(lon::text, ',' order by ord) as lons
    from (select *, (ord - 1) / 104 as part from public.capitals) c group by part
  loop
    insert into public.cache_jobs (key, part, request_id)
    values ('capitals', r.part, net.http_get(
      'https://api.open-meteo.com/v1/forecast?latitude=' || r.lats || '&longitude=' || r.lons ||
      '&current=temperature_2m,apparent_temperature,weather_code,is_day,wind_speed_10m,relative_humidity_2m&timezone=auto',
      '{}'::jsonb, '{}'::jsonb, 20000));
  end loop;
end $$;

-- 2. every minute: when both answers are in, build the sheet and store it
create or replace function public.capitals_collect() returns void language plpgsql security definer set search_path = public as $$
declare j record; st int; body text; sheet jsonb := '[]'::jsonb; want int; got int := 0;
begin
  select count(*) into want from public.cache_jobs where key = 'capitals';
  if want = 0 then return; end if;
  for j in select * from public.cache_jobs where key = 'capitals' order by part loop
    select status_code, content into st, body from net._http_response where id = j.request_id;
    if st is distinct from 200 or body is null then exit; end if;
    got := got + 1;
    sheet := sheet || coalesce((
      select jsonb_agg(jsonb_build_object(
        'city', c.city, 'country', c.country, 'iso2', c.iso2, 'region', c.region, 'lat', c.lat, 'lon', c.lon,
        't', (e.v->'current'->>'temperature_2m')::float, 'feel', (e.v->'current'->>'apparent_temperature')::float,
        'code', (e.v->'current'->>'weather_code')::int, 'day', (e.v->'current'->>'is_day')::int = 1,
        'wind', (e.v->'current'->>'wind_speed_10m')::float, 'hum', (e.v->'current'->>'relative_humidity_2m')::float,
        'tz', e.v->>'timezone', 'offset', coalesce((e.v->>'utc_offset_seconds')::int, 0)) order by c.ord)
      from jsonb_array_elements(case when jsonb_typeof(body::jsonb) = 'array' then body::jsonb else jsonb_build_array(body::jsonb) end) with ordinality as e(v, i)
      join public.capitals c on c.ord = j.part * 104 + e.i
      where e.v->'current'->>'temperature_2m' is not null), '[]'::jsonb);
  end loop;
  if got = want and jsonb_array_length(sheet) > 100 then
    insert into public.cache (key, data, updated_at) values ('capitals', sheet, now())
    on conflict (key) do update set data = excluded.data, updated_at = now();
    delete from public.cache_jobs where key = 'capitals';
  elsif exists (select 1 from public.cache_jobs where key = 'capitals' and created_at < now() - interval '10 minutes') then
    delete from public.cache_jobs where key = 'capitals'; -- this round failed; the next hourly round tries again
  end if;
end $$;

select cron.unschedule(jobid) from cron.job where jobname in ('earthvault-capitals-request', 'earthvault-capitals-collect');
select cron.schedule('earthvault-capitals-request', '0 * * * *', $$select public.capitals_request()$$);
select cron.schedule('earthvault-capitals-collect', '* * * * *', $$select public.capitals_collect()$$);

-- first round right away (the sheet appears within about two minutes)
select public.capitals_request();
