-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2025-03-31 12:14:04
-- サーバのバージョン： 8.4.0
-- PHP のバージョン: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `c_learning_systemdb`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `another_reserved_word`
--

CREATE TABLE `another_reserved_word` (
  `word` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `error_string` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `grammar_number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `another_reserved_word`
--

INSERT INTO `another_reserved_word` (`word`, `error_string`, `grammar_number`) VALUES
('and', '', 0),
('def', '', 0),
('elif', 'elif文はPythonの文で、C言語にはありません', 101),
('from', '', 0),
('global', '', 0),
('import', '', 0),
('in', 'inはpythonの演算子で、C言語にはありません', 0),
('is', '', 0),
('not', 'notはPythonの演算子で、C言語にはありません', 0),
('or', '', 0),
('pass', '', 0),
('raise', '', 0),
('range', 'range関数はPythonの関数で、C言語にはありません', 0),
('String', 'C言語にString型はありません', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `c_grammar`
--

CREATE TABLE `c_grammar` (
  `program_number` int NOT NULL,
  `string_data` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `c_grammar`
--

INSERT INTO `c_grammar` (`program_number`, `string_data`) VALUES
(1, '1-&-id-;'),
(1, '1-*-id-;'),
(1, '1-80-(-T-)'),
(1, '1-80-(-T-)-{-G-}'),
(1, '1-id-(-)-{-G-}'),
(1, '1-id-(-T-)-{-G-}'),
(1, '1-id-;'),
(1, '1-id-ag-Q-;'),
(1050, '1050-(-T-)-;'),
(11, '11-(-T-)-D-;'),
(11, '11-(-T-)-{-G-}'),
(13, '13-11-(-T-)-D-;'),
(13, '13-11-(-T-)-{-G-}'),
(13, '13-{-G-}'),
(14, '14-(-T-)-{-G-}'),
(15, '15-(-T-)-D-;'),
(15, '15-(-T-)-{-G-}'),
(16, '16-(-T-)-D-;'),
(16, '16-(-T-)-{-G-}'),
(17, '17-;'),
(17, '17-N;'),
(18, '18-{-G-}-16-(-T-)-;'),
(2, '2-&-id-;'),
(2, '2-*-id-;'),
(2, '2-id-;'),
(2, '2-id-ag1-Q-;'),
(20, '20-(-T-)-;'),
(21, '21-(-T-)-;'),
(23, '23-(-T-)-;'),
(25, '25-A;'),
(3, '3-&-id-;'),
(3, '3-*-id-;'),
(3, '3-id-;'),
(3, '3-id-ag-Q-;'),
(33, '33-{-G-}-;'),
(4, '4-&-id-;'),
(4, '4-*-id-;'),
(4, '4-id-;'),
(4, '4-id-ag-Q-;');

-- --------------------------------------------------------

--
-- テーブルの構造 `c_grammar_error`
--

CREATE TABLE `c_grammar_error` (
  `number` int NOT NULL,
  `grammar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `c_grammar_error`
--

INSERT INTO `c_grammar_error` (`number`, `grammar`) VALUES
(15, 'for(初期化;条件;更新処理){\\n\\t内容\\n}'),
(11, 'if(条件){\\n\\t内容\\n}'),
(101, 'if(条件){\\n\\t内容\\n}\\nelse if(条件){\\n\\t内容\\n}'),
(11, 'if(条件)内容;');

-- --------------------------------------------------------

--
-- テーブルの構造 `c_operator`
--

CREATE TABLE `c_operator` (
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `c_operator`
--

INSERT INTO `c_operator` (`name`, `type`) VALUES
('!', 'lg3'),
('!=', 'cp6'),
('#', '#'),
('%', 'cl5'),
('%=', 'ag6'),
('&', 'bt1'),
('&&', 'lg1'),
('&=', 'ag7'),
('(', '('),
(')', ')'),
('*', 'cl3'),
('*/', 'co3'),
('*=', 'ag4'),
('+', 'cl1'),
('++', 'ct1'),
('+=', 'ag2'),
(',', ','),
('-', 'cl2'),
('--', 'ct2'),
('-=', 'ag3'),
('/', 'cl4'),
('/*', 'co2'),
('//', 'co1'),
('/=', 'ag5'),
(':', ':'),
(';', ';'),
('<', 'cp1'),
('<<', 'bt4'),
('<<=', 'ag10'),
('<=', 'cp2'),
('=', 'ag1'),
('==', 'cp5'),
('>', 'cp3'),
('>=', 'cp4'),
('>>', 'bt5'),
('>>=', 'ag11'),
('?', '?'),
('[', '['),
(']', ']'),
('^', 'bt3'),
('^=', 'ag9'),
('{', '{'),
('|', 'bt2'),
('|=', 'ag8'),
('||', 'lg2'),
('}', '}'),
('~', 'bt6');

-- --------------------------------------------------------

--
-- テーブルの構造 `c_reserved_words`
--

CREATE TABLE `c_reserved_words` (
  `word_number` int NOT NULL,
  `word` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `c_reserved_words`
--

INSERT INTO `c_reserved_words` (`word_number`, `word`, `description`) VALUES
(1, 'int', '変数宣言'),
(2, 'char', '変数宣言'),
(3, 'float', '変数宣言'),
(4, 'double', '変数宣言'),
(10, 'void', '関数'),
(11, 'if', '条件文'),
(13, 'else', '条件文'),
(14, 'switch', '条件文'),
(15, 'for', '繰り返し文'),
(16, 'while', '繰り返し文'),
(17, 'break', ''),
(18, 'do', ''),
(25, 'return', '返り値'),
(33, 'struct', ''),
(34, 'union', ''),
(35, 'enum', ''),
(37, 'short', ''),
(38, 'long', ''),
(39, 'signed', ''),
(40, 'unsigned', ''),
(41, 'const', ''),
(42, 'restrict', ''),
(43, 'volatile', ''),
(46, 'exterm', ''),
(47, 'static', ''),
(48, 'auto', ''),
(49, 'register', ''),
(50, 'typedef', ''),
(55, '#include', ''),
(56, 'stdio.h', ''),
(58, 'math.h', ''),
(80, 'main', ''),
(101, 'else if', ''),
(1001, 'FILE', ''),
(1002, 'fpos_t', ''),
(1003, 'stdin', ''),
(1004, 'stdout', ''),
(1005, 'stderr', ''),
(1006, 'fopen', ''),
(1007, 'fopen_s', ''),
(1008, 'freopen', ''),
(1009, 'freopen_s', ''),
(1010, 'fclose', ''),
(1011, 'fflush', ''),
(1012, 'setbuf', ''),
(1013, 'setvbuf', ''),
(1014, 'fwide', ''),
(1015, 'fread', ''),
(1016, 'fwrite', ''),
(1017, 'fgetc', ''),
(1018, 'getc', ''),
(1019, 'fgets', ''),
(1020, 'fputc', ''),
(1021, 'putc', ''),
(1022, 'fputs', ''),
(1023, 'getchar', ''),
(1024, 'gets', ''),
(1025, 'gets_s', ''),
(1026, 'putchar', ''),
(1027, 'puts', ''),
(1028, 'ungetc', ''),
(1029, 'fgetwc', ''),
(1030, 'getwc', ''),
(1031, 'fgetws', ''),
(1032, 'fputwc', ''),
(1033, 'putwc', ''),
(1034, 'fputws', ''),
(1035, 'getwchar', ''),
(1036, 'putwchar', ''),
(1037, 'ungetwc', ''),
(1038, 'scanf', ''),
(1039, 'fscanf', ''),
(1040, 'sscanf', ''),
(1041, 'scanf_s', ''),
(1042, 'fscanf_s', ''),
(1043, 'sscanf_s', ''),
(1044, 'vscanf', ''),
(1045, 'vfscanf', ''),
(1046, 'vsscanf', ''),
(1047, 'vscanf_s', ''),
(1048, 'vfscanf_s', ''),
(1049, 'vsscanf_s', ''),
(1050, 'printf', ''),
(1051, 'fprintf', ''),
(1052, 'sprintf', ''),
(1053, 'snprintf', ''),
(1054, 'printf_s', ''),
(1055, 'fprintf_s', ''),
(1056, 'sprintf_s', ''),
(1057, 'snprintf_s', ''),
(1058, 'vprintf', ''),
(1059, 'vfprintf', ''),
(1060, 'vsprintf', ''),
(1061, 'vsnprintf', ''),
(1062, 'vprintf_s', ''),
(1063, 'vfprintf_s', ''),
(1064, 'vsprintf_s', ''),
(1065, 'vsnprintf_s', ''),
(1066, 'wscanf', ''),
(1067, 'fwscanf', ''),
(1068, 'swscanf', ''),
(1069, 'wscanf_s', ''),
(1070, 'fwscanf_s', ''),
(1071, 'swscanf_s', ''),
(1072, 'vwscanf', ''),
(1073, 'vfwscanf', ''),
(1074, 'vswscanf', ''),
(1075, 'vwscanf_s', ''),
(1076, 'vfwscanf_s', ''),
(1077, 'vswscanf_s', ''),
(1078, 'wprintf', ''),
(1079, 'fwprintf', ''),
(1080, 'swprintf', ''),
(1081, 'wprintf_s', ''),
(1082, 'fwprintf_s', ''),
(1083, 'swprintf_s', ''),
(1084, 'snwprintf_s', ''),
(1085, 'vwprintf', ''),
(1086, 'vfwprintf', ''),
(1087, 'vswprintf', ''),
(1088, 'vwprintf_s', ''),
(1089, 'vfwprintf_s', ''),
(1090, 'vswprintf_s', ''),
(1091, 'vsnwprintf_s', ''),
(1092, 'ftell', ''),
(1093, 'fgetpos', ''),
(1094, 'fseek', ''),
(1095, 'fsetpos', ''),
(1096, 'rewind', ''),
(1097, 'clearerr', ''),
(1098, 'feof', ''),
(1099, 'ferror', ''),
(1100, 'perror', ''),
(1101, 'remove', ''),
(1102, 'rename', ''),
(1103, 'tmpfile', ''),
(1104, 'tmpfile_s', ''),
(1105, 'tmpnam', ''),
(1106, 'tmpnam_s', ''),
(2001, 'abs', ''),
(2002, 'labs', ''),
(2003, 'llabs', ''),
(2004, 'div', ''),
(2005, 'ldiv', ''),
(2006, 'lldiv', ''),
(2007, 'imaxabs', ''),
(2008, 'imaxdiv', ''),
(2009, 'fabs', ''),
(2010, 'fabsf', ''),
(2011, 'fabsl', ''),
(2012, 'fmod', ''),
(2013, 'fmodf', ''),
(2014, 'fmodl', ''),
(2015, 'remainder', ''),
(2016, 'remainderf', ''),
(2017, 'remainderl', ''),
(2018, 'remquo', ''),
(2019, 'remquof', ''),
(2020, 'remquol', ''),
(2021, 'fma', ''),
(2022, 'fmaf', ''),
(2023, 'fmal', ''),
(2024, 'fmax', ''),
(2025, 'fmaxf', ''),
(2026, 'fmaxl', ''),
(2027, 'fmin', ''),
(2028, 'fminf', ''),
(2029, 'fminl', ''),
(2030, 'fdim', ''),
(2031, 'fdimf', ''),
(2032, 'fdiml', ''),
(2033, 'nan', ''),
(2034, 'nanf', ''),
(2035, 'nanl', ''),
(2036, 'exp', ''),
(2037, 'expf', ''),
(2038, 'expl', ''),
(2039, 'exp2', ''),
(2040, 'exp2f', ''),
(2041, 'exp2l', ''),
(2042, 'expm1', ''),
(2043, 'expm1f', ''),
(2044, 'expm1l', ''),
(2045, 'log', ''),
(2046, 'logf', ''),
(2047, 'logl', ''),
(2048, 'log10', ''),
(2049, 'log10f', ''),
(2050, 'log10l', ''),
(2051, 'log2', ''),
(2052, 'log2f', ''),
(2053, 'log2l', ''),
(2054, 'log1p', ''),
(2055, 'log1pf', ''),
(2056, 'log1pl', ''),
(2057, 'pow', ''),
(2058, 'powf', ''),
(2059, 'powl', ''),
(2060, 'sqrt', ''),
(2061, 'sqrtf', ''),
(2062, 'sqrtl', ''),
(2063, 'cbrt', ''),
(2064, 'cbrtf', ''),
(2065, 'cbrtl', ''),
(2066, 'hypot', ''),
(2067, 'hypotf', ''),
(2068, 'hypotl', ''),
(2069, 'sin', ''),
(2070, 'sinf', ''),
(2071, 'sinl', ''),
(2072, 'cos', ''),
(2073, 'cosf', ''),
(2074, 'cosl', ''),
(2075, 'tan', ''),
(2076, 'tanf', ''),
(2077, 'tanl', ''),
(2078, 'asin', ''),
(2079, 'asinf', ''),
(2080, 'asinl', ''),
(2081, 'acos', ''),
(2082, 'acosf', ''),
(2083, 'acosl', ''),
(2084, 'atan', ''),
(2085, 'atanf', ''),
(2086, 'atanl', ''),
(2087, 'atan2', ''),
(2088, 'atan2f', ''),
(2089, 'atan2l', ''),
(2090, 'sinh', ''),
(2091, 'sinhf', ''),
(2092, 'sinhl', ''),
(2093, 'cosh', ''),
(2094, 'coshf', ''),
(2095, 'coshl', ''),
(2096, 'tanh', ''),
(2097, 'tanhf', ''),
(2098, 'tanhl', ''),
(2099, 'asinh', ''),
(2100, 'asinhf', ''),
(2101, 'asinhl', ''),
(2102, 'acosh', ''),
(2103, 'acoshf', ''),
(2104, 'acoshl', ''),
(2105, 'atanh', ''),
(2106, 'atanhf', ''),
(2107, 'atanhl', ''),
(2108, 'erf', ''),
(2109, 'erff', ''),
(2110, 'erfl', ''),
(2111, 'erfc', ''),
(2112, 'erfcf', ''),
(2113, 'erfcl', ''),
(2114, 'tgamma', ''),
(2115, 'tgammaf', ''),
(2116, 'tgammal', ''),
(2117, 'lgamma', ''),
(2118, 'lgammaf', ''),
(2119, 'lgammal', ''),
(2120, 'ceil', ''),
(2121, 'ceilf', ''),
(2122, 'ceill', ''),
(2123, 'floor', ''),
(2124, 'floorf', ''),
(2125, 'floorl', ''),
(2126, 'trunc', ''),
(2127, 'truncf', ''),
(2128, 'truncl', ''),
(2129, 'round', ''),
(2130, 'roundf', ''),
(2131, 'roundl', ''),
(2132, 'lround', ''),
(2133, 'lroundf', ''),
(2134, 'lroundl', ''),
(2135, 'llround', ''),
(2136, 'llroundf', ''),
(2137, 'llroundl', ''),
(2138, 'nearbyint', ''),
(2139, 'nearbyintf', ''),
(2140, 'nearbyintl', ''),
(2141, 'rint', ''),
(2142, 'rintf', ''),
(2143, 'rintl', ''),
(2144, 'lrint', ''),
(2145, 'lrintf', ''),
(2146, 'lrintl', ''),
(2147, 'llrint', ''),
(2148, 'llrintf', ''),
(2149, 'llrintl', ''),
(2150, 'frexp', ''),
(2151, 'frexpf', ''),
(2152, 'frexpl', ''),
(2153, 'ldexp', ''),
(2154, 'ldexpf', ''),
(2155, 'ldexpl', ''),
(2156, 'modf', ''),
(2157, 'modff', ''),
(2158, 'modfl', ''),
(2159, 'scalbn', ''),
(2160, 'scalbnf', ''),
(2161, 'scalbnl', ''),
(2162, 'scalbln', ''),
(2163, 'scalblnf', ''),
(2164, 'scalblnl', ''),
(2165, 'ilogb', ''),
(2166, 'ilogbf', ''),
(2167, 'ilogbl', ''),
(2168, 'logb', ''),
(2169, 'logbf', ''),
(2170, 'logbl', ''),
(2171, 'nextafter', ''),
(2172, 'nextafterf', ''),
(2173, 'nextafterl', ''),
(2174, 'nexttoward', ''),
(2175, 'nexttowardf', ''),
(2176, 'nexttowardl', ''),
(2177, 'copysign', ''),
(2178, 'copysignf', ''),
(2179, 'copysignl', ''),
(2180, 'fpclassify', ''),
(2181, 'isfinite', ''),
(2182, 'isinf', ''),
(2183, 'isnan', ''),
(2184, 'isnormal', ''),
(2185, 'signbit', ''),
(2186, 'isgreater', ''),
(2187, 'isgreaterequal', ''),
(2188, 'isless', ''),
(2189, 'islessequal', ''),
(2190, 'islessgreater', ''),
(2191, 'isunordered', ''),
(2192, 'div_t', ''),
(2193, 'ldiv_t', ''),
(2194, 'lldiv_t', ''),
(2195, 'imaxdiv_t', ''),
(2196, 'float_t', ''),
(2197, 'double_t', ''),
(2198, 'HUGE_VALF', ''),
(2199, 'HUGE_VAL', ''),
(2200, 'HUGE_VALL', ''),
(2201, 'INFINITY', ''),
(2202, 'NAN', ''),
(2203, 'FP_FAST_FMAF', ''),
(2204, 'FP_FAST_FMA', ''),
(2205, 'FP_FAST_FMAL', ''),
(2206, 'FP_ILOGB0', ''),
(2207, 'FP_ILOGBNAN', ''),
(2208, 'math_errhandling', ''),
(2209, 'MATH_ERRNO', ''),
(2210, 'MATH_ERREXCEPT', ''),
(2211, 'FP_NORMAL', ''),
(2212, 'FP_SUBNORMAL', ''),
(2213, 'FP_ZERO', ''),
(2214, 'FP_INFINITE', ''),
(2215, 'FP_NAN', '');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `another_reserved_word`
--
ALTER TABLE `another_reserved_word`
  ADD PRIMARY KEY (`word`);

--
-- テーブルのインデックス `c_grammar`
--
ALTER TABLE `c_grammar`
  ADD UNIQUE KEY `string_data` (`string_data`);

--
-- テーブルのインデックス `c_grammar_error`
--
ALTER TABLE `c_grammar_error`
  ADD UNIQUE KEY `grammar` (`grammar`);

--
-- テーブルのインデックス `c_operator`
--
ALTER TABLE `c_operator`
  ADD PRIMARY KEY (`name`);

--
-- テーブルのインデックス `c_reserved_words`
--
ALTER TABLE `c_reserved_words`
  ADD UNIQUE KEY `word_number` (`word_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
