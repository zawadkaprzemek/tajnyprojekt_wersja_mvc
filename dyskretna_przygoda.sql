-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 08 Paź 2018, 13:41
-- Wersja serwera: 5.5.58-0ubuntu0.14.04.1
-- Wersja PHP: 5.5.9-1ubuntu4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `dyskretna_przygoda`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `account_coins`
--

CREATE TABLE `account_coins` (
  `login` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coins` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `account_coins`
--

INSERT INTO `account_coins` (`login`, `coins`) VALUES
('aaa', 400),
('antonio123', 400),
('dup', 400),
('Fajny_user', 400),
('kawka2', 400),
('kolo123', 400),
('kunalesna', 380),
('lolol', 400),
('prawiczek', 400),
('ruben', 23840),
('rubenow', 400),
('rubenowy', 400),
('szalonyemil', 1800),
('sztywnymaciek', 340),
('trol12', 400),
('trol123', 400),
('username', 400);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `account_types`
--

CREATE TABLE `account_types` (
  `id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `account_types`
--

INSERT INTO `account_types` (`id`, `name`) VALUES
(1, 'standard'),
(2, 'vip');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `blocked_users`
--

CREATE TABLE `blocked_users` (
  `user_name1` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name2` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `blocked_users`
--

INSERT INTO `blocked_users` (`user_name1`, `user_name2`, `data`) VALUES
('ruben', 'edward', '2017-12-01 15:22:26'),
('ruben', 'mattew', '2017-12-08 12:40:37'),
('kicia', 'ruben', '2018-01-26 17:06:44'),
('ruben', 'marek', '2018-02-01 13:56:29');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `favorite_users`
--

CREATE TABLE `favorite_users` (
  `user_name1` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name2` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `favorite_users`
--

INSERT INTO `favorite_users` (`user_name1`, `user_name2`, `data`) VALUES
('ruben', 'filip', '2017-12-01 14:54:01'),
('konsultant', 'ala', '2017-12-06 15:19:53'),
('kicia', 'ruben', '2018-01-26 16:23:04'),
('ruben', 'kwiatuszek', '2018-02-01 13:50:03'),
('ruben', 'kicia', '2018-02-13 08:44:03'),
('szalonyemil', 'kicia', '2018-02-13 16:46:14'),
('ruben', 'diablica', '2018-02-19 09:12:57'),
('szalonyemil', 'angela', '2018-02-21 15:16:03');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gallery_permissions`
--

CREATE TABLE `gallery_permissions` (
  `id` int(11) NOT NULL,
  `gallery_owner` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `gallery_permissions`
--

INSERT INTO `gallery_permissions` (`id`, `gallery_owner`, `user`, `status`, `date`) VALUES
(7, 'kicia', 'ruben', 1, '2017-10-31 16:54:54'),
(13, 'kicia', 'szalonyemil', 1, '2017-11-03 08:10:05'),
(14, 'adriana', 'ruben', 1, '2017-11-06 15:38:56'),
(16, 'kicia', 'sztywnymaciek', 1, '2017-11-14 16:29:59'),
(22, 'ruben', 'kicia', 1, '2017-12-02 18:32:50'),
(26, 'kwiatuszek', 'szalonyemil', 1, '2017-12-04 15:25:50'),
(27, 'kwiatuszek', 'ruben', 1, '2017-12-06 15:05:14'),
(36, 'chetna', 'ruben', 1, '2018-02-02 09:36:54'),
(37, 'alicja', 'ruben', 1, '2018-02-06 16:21:22'),
(38, 'dup', 'ruben', 0, '2018-02-10 13:54:15'),
(39, 'diablica', 'ruben', 1, '2018-02-19 09:12:53'),
(40, 'anita', 'ruben', 1, '2018-02-19 09:13:28'),
(41, 'karen', 'ruben', 1, '2018-02-20 17:20:19'),
(45, 'wiolka', 'ruben', 1, '2018-03-15 11:12:32');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_from` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `user_to` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `message` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `data_mess` datetime NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Zrzut danych tabeli `messages`
--

INSERT INTO `messages` (`id`, `user_from`, `user_to`, `message`, `data_mess`, `unread`) VALUES
(1, 'ruben', 'kwiatuszek', 'adasd', '2017-08-21 00:00:00', 1),
(2, 'ruben', 'alicja', 'Ładna jesteś ;) spotkamy się? ', '2017-08-21 00:00:00', 1),
(3, 'ruben', 'edward', 'schowaj ten język ciołku', '2017-08-21 18:33:45', 1),
(4, 'ruben', 'kicia', 'Hej, co tam?', '2017-08-21 18:48:41', 1),
(5, 'ruben', 'kwiatuszek', 'hejka', '2017-08-22 10:00:21', 1),
(6, 'ruben', 'kwiatuszek', 'hejka', '2017-08-22 10:00:26', 1),
(7, 'ruben', 'kwiatuszek', 'hejka', '2017-08-22 10:00:54', 1),
(8, 'ruben', 'kwiatuszek', 'hejka', '2017-08-22 10:01:30', 1),
(9, 'ruben', 'kwiatuszek', 'czemu nie odpisujesz?', '2017-08-22 10:48:19', 1),
(10, 'ruben', 'kicia', 'aasdas', '2017-08-22 10:56:28', 1),
(11, 'ruben', 'kicia', 'jlkhgx', '2017-08-22 10:58:11', 1),
(12, 'ruben', 'kicia', 'sadsadssad', '2017-08-22 10:58:29', 1),
(13, 'ruben', 'mattew', 'adasdad', '2017-08-22 11:03:24', 1),
(14, 'ruben', 'angela', 'no hej\r\n', '2017-08-22 13:34:09', 1),
(16, 'szalonyemil', 'kwiatuszek', 'cześć kwiatuszku', '2017-08-23 14:14:12', 1),
(17, 'kicia', 'ruben', 'Zabawimy się?', '2017-08-23 14:43:09', 1),
(19, 'ruben', 'kicia', 'Jasne ;)', '2017-08-23 18:10:33', 1),
(20, 'ruben', 'anna2', 'Hejka', '2017-08-23 18:16:04', 1),
(21, 'ruben', 'kicia', '  Proszę o stworzenie strony na bazie sprzedażówki:  http://centrumpromocyjne.pl/prn/wdt-1285-b/  Strona poza corem, musi komunikować się z bazą mysql. Elementy wyświetlane z bazy: profile, zdjęcia, opisy.  Modyfikacje: wywalamy wszystko oprócz listy profili (łącznie z dymkami, order_page, blokadą i pozostałym contentem). Profile wyświetlamy w 3 kolumnach i z lewej strony dodajemy sidebar.  Potrzebne strony:      główna     strona profilu     strona logowania     strona wiadomości  Więcej informacji i materiały wkrótce.', '2017-08-24 11:00:56', 1),
(22, 'ruben', 'kicia', '  Proszę o stworzenie strony na bazie sprzedażówki:  http://centrumpromocyjne.pl/prn/wdt-1285-b/  Strona poza corem, musi komunikować się z bazą mysql. Elementy wyświetlane z bazy: profile, zdjęcia, opisy.  Modyfikacje: wywalamy wszystko oprócz listy profili (łącznie z dymkami, order_page, blokadą i pozostałym contentem). Profile wyświetlamy w 3 kolumnach i z lewej strony dodajemy sidebar.  Potrzebne strony:      główna     strona profilu     strona logowania     strona wiadomości  Więcej informacji i materiały wkrótce.', '2017-08-24 11:02:49', 1),
(23, 'ruben', 'kicia', 'Tekst', '2017-08-24 11:03:14', 1),
(26, 'ruben', 'kicia', 'Tekst\r\nWięcej tekstu\r\nJeszcze więcej enterów\r\nMocniej \r\nOH OH', '2017-08-24 11:11:20', 1),
(27, 'ruben', 'kicia', 'Tekst\r\nEnter', '2017-08-24 11:14:04', 1),
(28, 'ruben', 'kicia', 'E\r\nN\r\nT\r\n', '2017-08-24 11:14:20', 1),
(29, 'ruben', 'kicia', 'Entery i \r\nentery\r\n\r\n\r\n', '2017-08-24 11:31:23', 1),
(30, 'ruben', 'kicia', '\r\n\r\n\r\n\r\n', '2017-08-24 11:31:51', 1),
(31, 'ruben', 'kicia', 'aadasd ads', '2017-08-24 11:32:08', 1),
(32, 'ruben', 'kicia', 'sdada\r\nasdasd\r\ndupa', '2017-08-24 15:05:21', 1),
(33, 'szalonyemil', 'kwiatuszek', 'halo?', '2017-08-27 15:59:05', 1),
(34, 'szalonyemil', 'angela', 'cześć zndżela', '2017-08-27 15:59:31', 1),
(35, 'szalonyemil', 'angela', 'Andżela znaczy', '2017-08-27 15:59:48', 1),
(36, 'kicia', 'ruben', 'Co tak spamujesz koleś', '2017-08-27 16:01:28', 1),
(37, 'kicia', 'ruben', 'zatkało?', '2017-08-27 16:26:23', 1),
(38, 'ruben', 'kicia', 'a', '2017-08-27 16:40:46', 1),
(39, 'ruben', 'kicia', 'a', '2017-08-27 16:43:04', 1),
(40, 'ruben', 'kicia', 'a', '2017-08-27 16:46:00', 1),
(55, 'ruben', 'kicia', 'podniecasz mnie mała ;)', '2017-08-27 17:15:34', 1),
(56, 'ruben', 'kicia', 'miau ;]', '2017-08-28 10:27:24', 1),
(57, 'szalonyemil', 'angela', 'm', '2017-08-28 14:09:48', 1),
(58, 'szalonyemil', 'angela', 'sdfdsfdsxf', '2017-08-28 14:10:00', 1),
(59, 'szalonyemil', 'angela', 'fgh', '2017-08-28 14:10:06', 1),
(60, 'szalonyemil', 'angela', 'zasdasf', '2017-08-28 14:10:08', 1),
(61, 'szalonyemil', 'angela', 'asfddsfdsfdsfdsf', '2017-08-28 14:10:10', 1),
(62, 'szalonyemil', 'angela', 'dfsxvdfgacdfsdvgdfgb vghfbnfsdfvsafvdfbfgbsdvf', '2017-08-28 14:10:20', 1),
(63, 'szalonyemil', 'angela', 'dupa blada', '2017-08-28 14:10:27', 1),
(64, 'ruben', 'kicia', 'jesteś?', '2017-08-28 16:01:41', 1),
(65, 'ruben', 'kicia', 'halo?', '2017-08-28 17:13:05', 1),
(66, 'ruben', 'kicia', 'alskdjak l', '2017-08-28 18:31:19', 1),
(67, 'ruben', 'kicia', 'asdasd', '2017-08-28 18:32:40', 1),
(68, 'kicia', 'ruben', 'widze że jesteś napalony jak tak piszesz :D', '2017-08-28 18:42:00', 1),
(69, 'ruben', 'kicia', 'i to bardzo :D', '2017-08-29 08:52:37', 1),
(70, 'kicia', 'ruben', 'mam mokro na Twoja mysl ;)', '2017-08-29 08:54:14', 1),
(71, 'ruben', 'kicia', 'stoi mi', '2017-08-29 10:07:28', 1),
(72, 'ruben', 'kwiatuszek', 'to chyba nie ma sensu \r\nbo nie odpisujesz :(\r\na szkoda', '2017-08-29 11:24:57', 1),
(73, 'ruben', 'lolitka', 'Fajny masz tyłeczek, chętnie się nim zaopiekuje ;)', '2017-08-29 11:31:23', 1),
(74, 'szalonyemil', 'angela', 'atyutyj\r\n\r\nasdasfdaf', '2017-08-29 13:08:56', 1),
(75, 'dup', 'szalonyemil', 'halo', '2017-09-01 11:41:09', 1),
(76, 'szalonyemil', 'dup', 'hej', '2017-09-01 11:41:33', 0),
(78, 'kicia', 'ruben', 'to dobrze :D', '2017-09-05 17:52:50', 1),
(79, 'kicia', 'ruben', 'duzego masz?', '2017-09-05 17:54:52', 1),
(80, 'kwiatuszek', 'szalonyemil', 'Cześć Emilku ;)', '2017-09-05 17:55:35', 1),
(81, 'ruben', 'kicia', '18 cm', '2017-09-05 17:56:37', 1),
(86, 'lolitka', 'ruben', 'nie rozpędzaj się tak kolo co :P', '2017-09-05 18:19:47', 1),
(87, 'mattew', 'ruben', 'co spamujesz? wpierdol chcesz?', '2017-09-05 18:23:55', 1),
(88, 'ruben', 'lolitka', 'okej...', '2017-09-06 10:29:14', 1),
(89, 'ruben', 'mattew', 'spadaj cioto', '2017-09-06 10:29:36', 1),
(90, 'szalonyemil', 'kwiatuszek', 'haha :D', '2017-09-06 11:02:20', 1),
(92, 'kwiatuszek', 'szalonyemil', 'dupa', '2017-09-06 11:41:28', 1),
(93, 'angela', 'szalonyemil', 'czesc', '2017-09-06 11:59:03', 1),
(94, 'kwiatuszek', 'ruben', 'hej', '2017-09-06 12:39:38', 1),
(95, 'kwiatuszek', 'ruben', 'sorry ale nie odpisywałam bo nie miałam dostępu do neta przez pogodę :(', '2017-09-06 12:40:09', 1),
(96, 'ruben', 'kwiatuszek', 'aa rozumiem, masz jakieś nagie fotki?', '2017-09-06 13:08:11', 1),
(97, 'alicja', 'ruben', 'a skąd jesteś? Bo ja z Radomia :)', '2017-09-06 13:09:30', 1),
(98, 'ruben', 'kicia', ':)', '2017-09-06 18:43:40', 1),
(101, 'ruben', 'kicia', ':wink:', '2017-09-07 14:15:54', 1),
(102, 'ruben', 'kicia', ':smiley:', '2017-09-07 14:34:54', 1),
(103, 'ruben', 'kicia', ':smile:', '2017-09-07 14:35:02', 1),
(104, 'ruben', 'kicia', ':* ;*', '2017-09-07 15:09:49', 1),
(105, 'ruben', 'kicia', '😜😀😊😃', '2017-09-07 15:31:19', 1),
(106, 'ruben', 'kicia', '😃', '2017-09-07 15:33:00', 1),
(107, 'ruben', 'kwiatuszek', ';(', '2017-09-07 16:07:25', 1),
(108, 'ruben', 'kwiatuszek', ':(', '2017-09-07 17:49:15', 1),
(109, 'ruben', 'kwiatuszek', ':\'( :D :smile:', '2017-09-07 17:49:45', 1),
(110, 'ruben', 'kicia', 'pasuje Ci taki?', '2017-09-07 18:07:34', 1),
(111, 'kicia', 'ruben', 'jasne :D już mi ślinka cieknie ;)', '2017-09-07 18:08:10', 1),
(112, 'kicia', 'ruben', ':wink:', '2017-09-07 18:08:24', 1),
(113, 'ruben', 'kwiatuszek', ':wink: :D :smile: :cat:', '2017-09-07 18:18:21', 1),
(114, 'ruben', 'kwiatuszek', ':D', '2017-09-07 18:19:10', 1),
(115, 'ruben', 'kwiatuszek', 'lol', '2017-09-07 18:19:18', 1),
(116, 'ruben', 'kwiatuszek', ':(\r\njhkj', '2017-09-08 11:33:57', 1),
(117, 'ruben', 'kwiatuszek', ':(', '2017-09-08 11:34:09', 1),
(118, 'ruben', 'kwiatuszek', ':)\r\nsex', '2017-09-08 11:35:20', 1),
(119, 'ruben', 'kwiatuszek', ':) \r\nostry', '2017-09-08 11:37:10', 1),
(120, 'ruben', 'kwiatuszek', ':smile:\r\nw dupke', '2017-09-08 11:40:10', 1),
(121, 'kwiatuszek', 'ruben', 'co tak spamujesz tymi emotkami, dziecko normalnie :kid:', '2017-09-08 11:55:15', 1),
(122, 'kwiatuszek', 'ruben', ':child:', '2017-09-08 11:55:26', 1),
(123, 'kwiatuszek', 'ruben', 'nagie fotki chcesz? nie za szybko?! typowy facet tylko jedno wam w głowie :P', '2017-09-08 11:55:58', 1),
(124, 'angela', 'szalonyemil', 'fajne masz foto :D', '2017-09-08 12:28:31', 1),
(125, 'angela', 'szalonyemil', ';)\r\ngdzie sie tak opaliłeś?', '2017-09-08 12:29:00', 1),
(126, 'kwiatuszek', 'szalonyemil', 'cycki :D', '2017-09-08 12:30:03', 1),
(127, 'kwiatuszek', 'szalonyemil', 'mam fajne i jędrne ;)', '2017-09-08 12:30:19', 1),
(128, 'szalonyemil', 'kwiatuszek', ':*', '2017-09-08 13:13:13', 1),
(129, 'szalonyemil', 'kwiatuszek', '<3', '2017-09-08 13:13:18', 1),
(130, 'szalonyemil', 'kwiatuszek', ':P', '2017-09-08 13:13:30', 1),
(131, 'szalonyemil', 'kwiatuszek', ':smile:', '2017-09-08 13:13:56', 1),
(132, 'szalonyemil', 'kwiatuszek', 'dupa', '2017-09-08 13:14:27', 1),
(133, 'szalonyemil', 'kwiatuszek', ';)', '2017-09-08 13:14:38', 1),
(134, 'szalonyemil', 'angela', 'Troche mnie zjaralo', '2017-09-08 13:15:00', 1),
(135, 'szalonyemil', 'angela', ':O', '2017-09-08 13:15:04', 1),
(136, 'ruben', 'kicia', 'dupa', '2017-09-08 14:13:41', 1),
(137, 'ruben', 'kicia', 'cycki :D', '2017-09-08 14:13:45', 1),
(138, 'ruben', 'kicia', 'chętnie bym Cię złapał za cycki i tyłek ;) <3', '2017-09-08 14:14:32', 1),
(139, 'angela', 'szalonyemil', 'właśnie widać :)', '2017-09-08 14:18:13', 1),
(140, 'angela', 'szalonyemil', 'podniecają mnie tacy opaleni mężczyźni :B :sunglasses: :astonished: :sunglasses:', '2017-09-08 14:19:51', 1),
(141, 'angela', 'szalonyemil', ':heart_eyes:', '2017-09-08 14:20:14', 1),
(142, 'angela', 'szalonyemil', 'B)', '2017-09-08 14:20:29', 1),
(144, 'angela', 'szalonyemil', 'B-) BD', '2017-09-12 17:30:40', 1),
(145, 'angela', 'szalonyemil', '8)', '2017-09-12 17:30:51', 1),
(146, 'szalonyemil', 'angela', 'ale masz oksy!', '2017-09-13 15:59:39', 1),
(147, 'kwiatuszek', 'szalonyemil', 'dupa jesteś', '2017-09-15 15:28:40', 1),
(148, 'szalonyemil', 'aleksandra2', 'yolo', '2017-10-30 11:44:37', 1),
(149, 'kicia', 'ruben', 'strasznie uparty jesteś na ten dostęp do mojej prywatnej galerii, ale niech Ci będzie popatrz sobie ;)', '2017-10-31 18:18:45', 1),
(150, 'szalonyemil', 'aleksandra2', 'gfhgfh', '2017-11-03 08:40:58', 1),
(151, 'szalonyemil', 'angela', 'czy nie masz?', '2017-11-03 15:39:23', 1),
(152, 'ruben', 'kicia', 'dzięki :D', '2017-11-03 16:23:36', 1),
(154, 'ruben', 'kicia', 'tylko jedno zdjęcie? mało coś :(', '2017-11-03 16:25:12', 1),
(155, 'ruben', 'kicia', 'chcesz zobaczyć moją galerie prywatną?', '2017-11-03 16:27:17', 1),
(156, 'ruben', 'kicia', ';)', '2017-11-03 16:27:22', 1),
(157, 'ruben', 'kwiatuszek', 'może i jestem jak dziecko ale jestem napalony na Ciebie ;)', '2017-11-03 17:31:47', 1),
(158, 'ruben', 'kwiatuszek', 'seks', '2017-11-03 17:52:09', 1),
(159, 'ruben', 'kwiatuszek', 'dużo seksu', '2017-11-03 17:53:20', 1),
(160, 'ruben', 'kwiatuszek', 'podoba Ci się moja klata?', '2017-11-06 09:14:25', 1),
(161, 'ruben', 'kwiatuszek', 'wolisz ogoloną czy owłosioną klatę? ;)', '2017-11-06 09:15:02', 1),
(162, 'ruben', 'alicja', 'to nie jest nawet tak daleko bo ja Otwock :D', '2017-11-06 09:16:58', 1),
(163, 'ruben', 'alicja', 'do Radomia to pociagi nawet jezdza :D', '2017-11-06 09:23:12', 1),
(164, 'ruben', 'alicja', 'samochodem też mogę przyjechać ;)', '2017-11-06 09:59:01', 1),
(165, 'szalonyemil', 'kicia', 'test', '2017-11-06 11:20:39', 1),
(166, 'szalonyemil', 'aleksandra', 'dupa', '2017-11-06 11:20:48', 1),
(167, 'szalonyemil', 'kwiatuszek', 'a', '2017-11-06 15:04:23', 1),
(168, 'szalonyemil', 'kwiatuszek', 'ab', '2017-11-06 15:04:24', 1),
(169, 'szalonyemil', 'kwiatuszek', 'abc', '2017-11-06 15:04:25', 1),
(170, 'szalonyemil', 'kwiatuszek', 'abcd', '2017-11-06 15:04:25', 1),
(171, 'szalonyemil', 'kwiatuszek', 'e', '2017-11-06 15:04:28', 1),
(172, 'szalonyemil', 'kwiatuszek', 'f', '2017-11-06 15:04:30', 1),
(173, 'szalonyemil', 'kwiatuszek', 'g', '2017-11-06 15:04:32', 1),
(174, 'szalonyemil', 'kwiatuszek', 'h', '2017-11-06 15:04:33', 1),
(175, 'szalonyemil', 'kwiatuszek', 'i', '2017-11-06 15:04:34', 1),
(176, 'szalonyemil', 'kwiatuszek', 'j', '2017-11-06 15:04:35', 1),
(177, 'szalonyemil', 'kwiatuszek', 'hahaha', '2017-11-06 15:04:39', 1),
(178, 'szalonyemil', 'kwiatuszek', 'asd', '2017-11-06 15:04:40', 1),
(179, 'szalonyemil', 'kwiatuszek', 'asd', '2017-11-06 15:04:41', 1),
(180, 'szalonyemil', 'kwiatuszek', 'asd', '2017-11-06 15:04:43', 1),
(181, 'szalonyemil', 'kwiatuszek', 'asd', '2017-11-06 15:04:44', 1),
(182, 'szalonyemil', 'kwiatuszek', 'asd', '2017-11-06 15:04:45', 1),
(183, 'szalonyemil', 'kwiatuszek', 'asd', '2017-11-06 15:04:46', 1),
(184, 'szalonyemil', 'kwiatuszek', 'asd', '2017-11-06 15:04:47', 1),
(185, 'aleksandra', 'szalonyemil', 'a może cycki :D', '2017-11-06 16:34:10', 1),
(186, 'kwiatuszek', 'ruben', 'wolę owłosione, lubię misiów ;)', '2017-11-06 16:35:27', 1),
(187, 'kwiatuszek', 'szalonyemil', 'co za spam lol :D', '2017-11-06 16:35:50', 1),
(188, 'ruben', 'kwiatuszek', 'to fajnie bo mam fajne futerko ;)', '2017-11-06 17:38:23', 1),
(189, 'kwiatuszek', 'ruben', 'to ja chcę się do Ciebie przytulić ;)', '2017-11-06 17:39:12', 1),
(190, 'kwiatuszek', 'ruben', 'lubie taki meszek u faceta :D', '2017-11-06 18:02:59', 1),
(191, 'alicja', 'ruben', 'to fajnie, moze sprawdzimy Twoje siedzenia ;)', '2017-11-06 18:03:24', 1),
(192, 'kicia', 'ruben', 'a masz tam coś ciekawego ? ;)', '2017-11-06 18:04:03', 1),
(194, 'kicia', 'kazimierz', 'Kaziu Kaziu :poop:', '2017-11-06 18:29:21', 1),
(195, 'kicia', 'szalonyemil', 'hop hop', '2017-11-06 18:31:55', 1),
(196, 'ruben', 'alicja', 'przyznam się szczerze że jeszcze ich nie sprawdzałem :D', '2017-11-06 18:33:21', 1),
(198, 'angela', 'ruben', 'Spadaj', '2017-11-09 10:03:51', 1),
(199, 'aleksandra2', 'szalonyemil', 'chyba komuś tu się umarło :D', '2017-11-10 14:33:46', 1),
(200, 'alicja', 'ruben', 'to trzeba je sprawdzić ;)', '2017-11-10 14:34:18', 1),
(201, 'alicja', 'ruben', 'jestem chętna na to :)', '2017-11-10 14:34:37', 1),
(202, 'aleksandra', 'sztywnymaciek', 'no hej sztywniaku :D', '2017-11-14 16:34:17', 1),
(203, 'aleksandra', 'sztywnymaciek', 'masz punkty żeby do mnie pisać?', '2017-11-14 16:34:35', 1),
(204, 'aleksandra', 'sztywnymaciek', 'czy bida z nędzą?', '2017-11-14 16:34:59', 1),
(205, 'aleksandra', 'sztywnymaciek', ':P', '2017-11-14 16:35:05', 1),
(206, 'sztywnymaciek', 'aleksandra', 'mam :D', '2017-11-14 16:37:08', 1),
(207, 'sztywnymaciek', 'aleksandra', '<3', '2017-11-14 16:37:16', 1),
(208, 'aleksandra', 'sztywnymaciek', 'git', '2017-11-14 16:45:35', 1),
(209, 'aleksandra', 'sztywnymaciek', 'to teraz pisz, wydaj i kup nowe :D', '2017-11-14 16:45:52', 1),
(210, 'sztywnymaciek', 'aleksandra', 'na pewno :D', '2017-11-15 10:17:40', 1),
(211, 'szalonyemil', 'kicia', 'mogę pisać!', '2017-11-22 14:46:00', 1),
(212, 'szalonyemil', 'kicia', 'aaaa', '2017-11-22 14:46:02', 1),
(213, 'szalonyemil', 'kicia', 'super', '2017-11-22 14:46:07', 1),
(214, 'szalonyemil', 'aleksandra2', 'Jestem bogaty', '2017-11-22 14:46:19', 1),
(215, 'szalonyemil', 'aleksandra2', 'mam 900 punktów', '2017-11-22 14:46:23', 1),
(216, 'szalonyemil', 'kwiatuszek', 'lololol', '2017-11-22 14:47:21', 1),
(217, 'szalonyemil', 'mattew', 'cześć przystojniaku', '2017-11-22 14:47:33', 1),
(218, 'szalonyemil', 'oblatywacz', 'ale stary jesteś', '2017-11-22 14:47:43', 1),
(219, 'kicia', 'szalonyemil', 'to bogaty musisz być ;)', '2017-11-24 14:51:16', 1),
(220, 'ruben', 'kicia', 'message', '2017-11-28 15:07:51', 1),
(221, 'szalonyemil', 'angela', 'halo', '2017-11-30 14:36:20', 1),
(222, 'angela', 'szalonyemil', 'halo', '2017-11-30 14:36:43', 1),
(223, 'oblatywacz', 'szalonyemil', 'stary ale jary :D', '2017-11-30 16:59:25', 1),
(224, 'aleksandra2', 'szalonyemil', 'mam więcej punktów nawet', '2017-11-30 17:16:11', 1),
(225, 'aleksandra2', 'szalonyemil', 'może popiszemy teraz?', '2017-11-30 17:16:16', 1),
(226, 'aleksandra2', 'szalonyemil', 'haha', '2017-11-30 17:16:20', 1),
(227, 'ruben', 'mattew', 'żoną byś się zajął a nie innej baby se szukasz...', '2017-12-01 13:55:36', 1),
(228, 'ruben', 'marek', 'zajmij się swoją babą a nie innej szukasz jak masz już jedną, Ty padalcu jeden brodaty', '2017-12-01 15:28:03', 1),
(229, 'szalonyemil', 'aleksandra2', 'hoho', '2017-12-04 15:14:30', 1),
(230, 'kwiatuszek', 'szalonyemil', 'Komunikat techniczny: Cofneliśmy Ci Vipa :D', '2017-12-04 16:34:25', 1),
(231, 'aleksandra2', 'szalonyemil', 'widzę że się powodzi bo posiadasz VIP-a :D', '2017-12-06 15:21:55', 1),
(232, 'lolitka', 'ruben', 'jak jesteś Vipem to dam Ci sie zająć moją pupcią ;)', '2017-12-06 15:25:13', 1),
(233, 'ruben', 'adriana', 'no hej', '2017-12-10 16:50:36', 1),
(234, 'kicia', 'ruben', 'to masz tam coś w tej galerii?', '2017-12-18 16:23:27', 1),
(235, 'kicia', 'ruben', 'to masz tam coś w tej galerii?', '2017-12-18 16:25:16', 1),
(236, 'kicia', 'ruben', 'halo?', '2017-12-18 16:27:03', 1),
(237, 'kicia', 'ruben', 'halo?', '2017-12-18 16:27:16', 1),
(238, 'kicia', 'ruben', 'hop hop', '2017-12-18 16:30:01', 1),
(239, 'kicia', 'ruben', 'hop hop', '2017-12-18 16:30:06', 1),
(240, 'ruben', 'kicia', 'a bedę miał kilka ciekawych fotek ;)', '2017-12-18 16:31:10', 1),
(241, 'kicia', 'ruben', 'na razie to jakiegos ebooka widze :|', '2017-12-18 16:38:42', 1),
(294, 'kicia', 'ruben', 'nie masz jakis swoich fotek?', '2017-12-18 16:43:53', 1),
(295, 'kicia', 'ruben', 'rubciu co? ;)', '2017-12-18 16:44:11', 1),
(296, 'kicia', 'ruben', 'rubciu co? ;)', '2017-12-18 16:44:53', 1),
(297, 'kicia', 'ruben', 'halo?', '2017-12-18 16:45:49', 1),
(298, 'kicia', 'ruben', ';)', '2017-12-18 16:46:29', 1),
(299, 'kicia', 'ruben', ';)', '2017-12-18 16:49:48', 1),
(301, 'ruben', 'kicia', 'bo sprawdzałem czy upload działa, muszę zrobić zdjęcia to wtedy wstawię ;)', '2017-12-18 16:50:29', 1),
(302, 'ruben', 'kicia', 'a jest co fotografować ;)', '2017-12-18 16:52:01', 1),
(303, 'ruben', 'kicia', 'a jest co fotografować ;)', '2017-12-18 16:53:10', 1),
(304, 'kicia', 'ruben', 'na prawdę ?', '2017-12-18 16:59:51', 1),
(305, 'ruben', 'kicia', 'poczekaj a się przekonasz ;)', '2017-12-18 17:08:10', 1),
(306, 'kicia', 'ruben', 'nie mogę się doczekać ;) :)', '2017-12-18 17:08:37', 1),
(307, 'ruben', 'kicia', 'zaufaj mi, warto poczekać ;)', '2017-12-18 17:08:57', 1),
(308, 'kicia', 'ruben', 'trzymam Cię za słowo ;)', '2017-12-18 17:10:05', 1),
(309, 'ruben', 'kicia', 'możesz i za co inne potrzymać :D', '2017-12-18 17:10:17', 1),
(310, 'kicia', 'ruben', 'zboczuch -.-', '2017-12-18 17:10:30', 1),
(311, 'ruben', 'kicia', 'tak jestem :D', '2017-12-18 17:24:49', 1),
(312, 'szalonyemil', 'angela', 'sralo', '2017-12-19 15:17:36', 1),
(313, 'ruben', 'kicia', 'i jestem z tego dumny :D', '2017-12-21 13:54:18', 1),
(314, 'kicia', 'ruben', 'lol ;]', '2017-12-21 13:54:49', 1),
(315, 'kicia', 'ruben', 'chyba Cię zaraz zablokuje :P', '2017-12-21 13:55:00', 1),
(316, 'ruben', 'lolitka', 'czujesz we mnie piniądz?', '2018-01-24 13:16:14', 0),
(317, 'ruben', 'lolitka', 'wystroiłaś się jak bijons?', '2018-01-24 13:16:57', 0),
(318, 'ruben', 'lolitka', 'bo poczułaś we mnie piniądz? :D', '2018-01-24 13:17:16', 0),
(319, 'ruben', 'kicia', 'nie rób tego', '2018-01-24 13:47:10', 1),
(320, 'ruben', 'kicia', 'proszę', '2018-01-24 13:48:06', 1),
(321, 'ruben', 'adriana', 'jestes?', '2018-01-24 13:58:26', 1),
(322, 'ruben', 'kwiatuszek', 'to sie ciesze :D', '2018-01-24 14:02:37', 1),
(323, 'ruben', 'kwiatuszek', ':D', '2018-01-24 14:34:04', 1),
(324, 'ruben', 'kwiatuszek', 'ale tam niżej nie mam owłosienia ;)', '2018-01-24 14:34:37', 1),
(325, 'ruben', 'kwiatuszek', ':D', '2018-01-24 14:36:12', 1),
(326, 'ruben', 'kwiatuszek', ':D', '2018-01-24 14:38:07', 1),
(327, 'ruben', 'kwiatuszek', 'pachy czyste :D', '2018-01-24 14:42:25', 1),
(328, 'ruben', 'kwiatuszek', 'a', '2018-01-24 14:43:57', 1),
(329, 'ruben', 'kwiatuszek', 'a', '2018-01-24 14:45:21', 1),
(330, 'ruben', 'kwiatuszek', 'a', '2018-01-24 14:46:05', 1),
(331, 'ruben', 'kwiatuszek', 'jakie kwiatki lubisz?', '2018-01-24 14:46:29', 1),
(332, 'ruben', 'kwiatuszek', 'bratki, róże czy jakie?', '2018-01-24 14:47:49', 1),
(333, 'ruben', 'kwiatuszek', 'a może trawa>', '2018-01-24 14:49:32', 1),
(334, 'ruben', 'kwiatuszek', 'a może trawa>', '2018-01-24 14:49:47', 1),
(335, 'ruben', 'kwiatuszek', 'czy trawa to nie kwiatek ? :D', '2018-01-24 14:50:20', 1),
(336, 'kicia', 'ruben', 'jak Ty do mnie napisales skoro jestes zablokowany?', '2018-01-25 17:00:54', 1),
(337, 'kicia', 'ruben', 'a', '2018-01-25 17:02:47', 1),
(338, 'kicia', 'ruben', 'co?', '2018-01-25 17:31:50', 1),
(339, 'adriana', 'ruben', 'jestem a co?', '2018-01-25 17:41:31', 1),
(340, 'ruben', 'adriana', 'widzę avatar zmieniłaś ;)', '2018-01-26 09:15:46', 1),
(341, 'kwiatuszek', 'ruben', 'trawę to się pali a kwiatki się wącha :P', '2018-01-26 09:38:06', 1),
(342, 'ruben', 'mattew', 'znam Twoja zone i jej wszystko powiem hahaha :D', '2018-01-26 13:37:58', 0),
(343, 'marek', 'ruben', 'możesz sobie gadać tak cały czas, to moja sprawa co tutaj robię', '2018-01-26 17:28:00', 1),
(344, 'ruben', 'marek', 'zobaczymy co powiesz jak Twoja narzeczona się dowie hahaha :D', '2018-02-01 13:54:17', 1),
(345, 'marek', 'ruben', 'kapuś...', '2018-02-01 13:56:25', 1),
(346, 'ruben', 'marek', 'chcesz mieć więcej kobiet dla siebie to jedź do Afryki i sobie harem tam załóż :P', '2018-02-01 13:57:46', 0),
(347, 'ruben', 'kwiatuszek', 'oj tam oj tam :D', '2018-02-02 11:17:00', 0),
(348, 'ruben', 'kwiatuszek', 'jedno i drugie roślina :D', '2018-02-02 11:17:15', 0),
(349, 'adriana', 'ruben', 'a tak, ten bardziej przyciąga facetów ;)', '2018-02-12 10:17:21', 1),
(350, 'ruben', 'adriana', 'cwana jesteś ;) :D', '2018-02-12 11:57:38', 0),
(351, 'kunalesna', 'aleksandra', 'cześć, zapraszam Cię do mojej norki ;)', '2018-02-14 11:12:51', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_to` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_from` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `notifications`
--

INSERT INTO `notifications` (`id`, `user_to`, `user_from`, `type`, `status`, `date`) VALUES
(35, 'kicia', 'szalonyemil', 4, 1, '2017-11-03 08:10:29'),
(36, 'szalonyemil', 'kicia', 2, 1, '2017-11-03 08:10:29'),
(37, 'adriana', 'ruben', 4, 1, '2017-11-06 15:39:09'),
(38, 'adriana', 'szalonyemil', 5, 1, '2017-11-10 14:48:19'),
(39, 'szalonyemil', 'adriana', 3, 1, '2017-11-10 14:48:19'),
(41, 'sztywnymaciek', 'kicia', 2, 1, '2017-11-14 16:30:31'),
(58, 'kwiatuszek', 'ruben', 5, 1, '2017-12-02 18:58:50'),
(60, 'kwiatuszek', 'ruben', 4, 1, '2017-12-02 18:59:28'),
(61, 'kwiatuszek', 'szalonyemil', 4, 1, '2017-12-04 16:33:34'),
(62, 'szalonyemil', 'kwiatuszek', 2, 1, '2017-12-04 16:33:34'),
(63, 'kwiatuszek', 'ruben', 4, 1, '2017-12-06 15:06:10'),
(83, 'alicja', 'ruben', 4, 1, '2018-02-06 16:21:44'),
(84, 'ruben', 'alicja', 2, 1, '2018-02-06 16:21:44'),
(85, 'dup', 'ruben', 1, 0, '2018-02-10 13:54:15'),
(86, 'karen', 'ruben', 5, 1, '2018-02-10 13:57:01'),
(87, 'ruben', 'karen', 3, 1, '2018-02-10 13:57:01'),
(88, 'diablica', 'ruben', 4, 1, '2018-02-19 09:14:01'),
(89, 'anita', 'ruben', 4, 1, '2018-02-19 09:13:58'),
(90, 'ruben', 'anita', 2, 1, '2018-02-19 09:13:57'),
(91, 'ruben', 'diablica', 2, 1, '2018-02-19 09:14:01'),
(92, 'karen', 'ruben', 4, 1, '2018-02-20 17:20:46'),
(93, 'ruben', 'karen', 2, 1, '2018-02-20 17:20:46'),
(94, 'angela', 'szalonyemil', 5, 1, '2018-03-15 11:00:46'),
(95, 'szalonyemil', 'angela', 3, 0, '2018-03-15 11:00:46'),
(96, 'wiolka', 'ruben', 5, 1, '2018-03-15 11:09:49'),
(97, 'ruben', 'wiolka', 3, 1, '2018-03-15 11:09:49'),
(98, 'wiolka', 'ruben', 5, 1, '2018-03-15 11:11:11'),
(99, 'ruben', 'wiolka', 3, 1, '2018-03-15 11:11:11'),
(100, 'wiolka', 'ruben', 4, 1, '2018-03-15 11:12:38'),
(101, 'ruben', 'wiolka', 2, 1, '2018-03-15 11:12:38');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `notifications_types`
--

CREATE TABLE `notifications_types` (
  `id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `notifications_types`
--

INSERT INTO `notifications_types` (`id`, `name`) VALUES
(1, 'gallery_permission_ask'),
(2, 'gallery_permission_accept'),
(3, 'gallery_permission_decline'),
(4, 'gallery_permission_granted'),
(5, 'gallery_permission_rejected');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pay_status`
--

CREATE TABLE `pay_status` (
  `id` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `pay_status`
--

INSERT INTO `pay_status` (`id`, `name`) VALUES
(1, 'pending'),
(2, 'done');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `profile_visit`
--

CREATE TABLE `profile_visit` (
  `user_name1` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name2` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` datetime NOT NULL,
  `checked` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `profile_visit`
--

INSERT INTO `profile_visit` (`user_name1`, `user_name2`, `data`, `checked`) VALUES
('ruben', 'kicia', '2018-09-27 10:51:15', b'0'),
('szalonyemil', 'kicia', '2018-02-21 18:42:22', b'0'),
('kicia', 'ruben', '2018-01-26 17:06:40', b'1'),
('kicia', 'szalonyemil', '2017-11-30 18:22:40', b'1'),
('kwiatuszek', 'ruben', '2018-01-26 09:38:18', b'1'),
('kwiatuszek', 'szalonyemil', '2017-12-06 10:49:14', b'1'),
('lolitka', 'ruben', '2017-11-30 18:24:22', b'1'),
('lolitka', 'prawiczek', '2017-11-30 18:24:27', b'0'),
('lolitka', 'kicia', '2017-11-30 18:24:30', b'1'),
('ruben', 'kwiatuszek', '2018-09-27 10:51:26', b'0'),
('ruben', 'alicja', '2018-09-27 10:53:28', b'0'),
('ruben', 'lolitka', '2017-11-30 18:26:50', b'0'),
('ruben', 'mattew', '2018-02-12 08:32:38', b'0'),
('ruben', 'edward', '2017-12-01 15:22:23', b'0'),
('mattew', 'ruben', '2017-12-02 19:55:13', b'1'),
('oblatywacz', 'szalonyemil', '2017-12-01 13:24:14', b'1'),
('kicia', 'kicia', '2017-12-01 15:26:31', b'1'),
('mattew', 'szalonyemil', '2017-12-01 13:27:53', b'1'),
('alicja', 'ruben', '2017-12-01 15:26:57', b'1'),
('angela', 'ruben', '2017-12-01 13:36:47', b'1'),
('ruben', 'ziutek', '2017-12-01 13:53:16', b'0'),
('edward', 'ruben', '2017-12-01 14:48:28', b'1'),
('ruben', 'filip', '2018-02-02 11:12:49', b'0'),
('mattew', 'mattew', '2017-12-01 15:03:32', b'0'),
('ruben', 'marek', '2018-02-01 13:59:40', b'0'),
('marek', 'ruben', '2017-12-02 19:54:46', b'1'),
('matthew', 'ruben', '2017-12-02 19:53:30', b'1'),
('mathew', 'ruben', '2017-12-02 19:53:47', b'1'),
('szalonyemil', 'aleksandra2', '2017-12-04 15:15:11', b'0'),
('szalonyemil', 'angela', '2018-02-21 18:43:23', b'0'),
('szalonyemil', 'aneta', '2017-12-04 15:25:33', b'0'),
('szalonyemil', 'kwiatuszek', '2018-02-21 18:43:15', b'0'),
('ruben', 'daniel', '2017-12-04 16:22:04', b'0'),
('ruben', 'lukasz', '2017-12-04 16:22:19', b'0'),
('szalonyemil', 'alicja', '2017-12-05 13:28:03', b'0'),
('szalonyemil', 'diablica', '2017-12-05 13:28:14', b'0'),
('kicia', 'sztywnymaciek', '2018-01-24 11:38:16', b'0'),
('adriana', 'ruben', '2018-01-25 11:59:06', b'1'),
('konsultant', 'ala', '2017-12-14 15:43:35', b'0'),
('konsultant', 'ula', '2017-12-06 15:20:37', b'0'),
('konsultant', 'rafal', '2017-12-06 15:20:50', b'0'),
('ruben', 'aleksandra', '2018-03-15 11:03:01', b'0'),
('ruben', 'diablica', '2018-09-27 10:53:24', b'0'),
('konsultant', 'kwiatuszek', '2017-12-21 12:28:51', b'0'),
('konsultant', 'kicia', '2017-12-21 12:28:54', b'1'),
('ruben', 'adriana', '2018-03-15 11:03:23', b'0'),
('szalonyemil', 'marek', '2017-12-15 15:53:37', b'0'),
('ruben', 'kamil', '2017-12-20 08:18:03', b'0'),
('konsultant', 'arnold', '2017-12-20 09:48:30', b'0'),
('ruben', 'ala', '2017-12-21 11:57:54', b'0'),
('konsultant', 'chetna', '2017-12-21 12:29:00', b'0'),
('ruben', 'chetna', '2018-02-02 09:37:27', b'0'),
('chetna', 'ruben', '2017-12-20 14:18:40', b'1'),
('ruben', 'ula', '2017-12-20 16:17:42', b'0'),
('ruben', 'angela', '2018-02-20 17:35:01', b'0'),
('konsultant', 'angela', '2017-12-21 12:07:49', b'0'),
('konsultant', 'aleksandra', '2017-12-21 12:36:22', b'0'),
('konsultant', 'anna2', '2017-12-21 15:40:49', b'0'),
('ruben', 'anna2', '2018-02-19 09:12:18', b'0'),
('ruben', 'kazimierz', '2018-01-26 13:47:50', b'0'),
('ruben', 'Fajny_user', '2018-01-26 14:11:06', b'0'),
('ruben', 'konsultant', '2018-01-26 14:11:33', b'1'),
('ruben', 'dup', '2018-02-10 14:23:44', b'0'),
('ruben', 'karen', '2018-09-27 10:53:20', b'0'),
('kunalesna', 'kicia', '2018-02-14 11:07:42', b'0'),
('kunalesna', 'aleksandra', '2018-02-14 11:48:23', b'0'),
('ruben', 'alex', '2018-02-19 09:11:59', b'0'),
('ruben', 'anna', '2018-02-19 09:13:05', b'0'),
('ruben', 'anita', '2018-09-27 10:53:25', b'0'),
('szalonyemil', 'mattew', '2018-02-21 15:15:12', b'0'),
('szalonyemil', 'aleksandra', '2018-02-21 18:43:27', b'0'),
('ruben', 'wiolka', '2018-09-27 10:53:11', b'0'),
('ruben', 'aneta', '2018-09-27 10:51:07', b'0'),
('ruben', 'ruchalka', '2018-09-27 10:52:19', b'0');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(8) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `account_type` int(11) NOT NULL DEFAULT '1',
  `activate` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `account_type`, `activate`) VALUES
(1, 'ruben', 'ruben@gmail.com', 'e384fc93e4323257ad0b592c04212b4e', 'user', 2, 1),
(2, 'konsultant', 'konsultant@bpo.com', 'e0e7a52512ba1f24cb148321e5c41b54', 'super_admin', 2, 1),
(4, 'prawiczek', 'prawiczek2@gmail.com', 'a4826dcd193b4161365d7457e67da538', 'user', 1, 1),
(5, 'kicia', 'kicia@fmail.com', '8a8c648d4ba7bff880c7b91f93ffc1cf', 'fake', 2, 1),
(6, 'kwiatuszek', 'kwiatuszek@fmail.com', '0dcf53d0bc0b186d3e124c61a1124a71', 'fake', 2, 1),
(7, 'mattew', 'mattew@fmail.com', '0a723dff3be736ac7b3b6f7b4593e201', 'fake', 2, 1),
(8, 'angela', 'angela@fmail.com', '42ee4a3e100a3f06915906a944cec297', 'fake', 2, 1),
(9, 'aleksandra', 'aleksandra@fmail.com', 'e7b773dd62b7674247edee14f97eb1ce', 'fake', 2, 1),
(10, 'marek', 'marek@fmail.com', 'c02402d89d0429d2a87786c63fc78d19', 'fake', 2, 1),
(11, 'anna2', 'anna2@fmail.com', '2d20f95e0630d037f14b251cffde39f4', 'fake', 2, 1),
(12, 'alex', 'alex@fmail.com', '7581d3c40265eccc19266eaf66a50df1', 'fake', 2, 1),
(13, 'kazimierz', 'kazimierz@fmail.com', 'e17c10fe3eeea92d875e5731e95629fc', 'fake', 2, 1),
(14, 'alicja', 'alicja@fmail.com', 'e153f3a207afef72a74ae2c18d152d61', 'fake', 2, 1),
(15, 'karen', 'karen@fmail.com', 'ea17fe361df7fa5f453ee1f956fd80dd', 'fake', 2, 1),
(16, 'edward', 'edward@fmail.com', '6574ef8a72e360c9050d4970ce405ed7', 'fake', 2, 1),
(17, 'baska', 'baska@fmail.com', '8d02a4e6b343a9619dafed16a2759f9c', 'fake', 2, 1),
(18, 'daniel', 'daniel@fmail.com', '187cc54115a0246240f146668c1ab3a7', 'fake', 2, 1),
(19, 'artur', 'artur@fmail.com', '5b2eb9ab905e154a37669d273554d442', 'fake', 2, 1),
(20, 'diablica', 'diablica@fmail.com', '71d38461856eda163489353d3ea6e386', 'fake', 2, 1),
(21, 'gabriela', 'gabriela@fmail.com', '986ce9b6026d11a44b1f4f589bb9f486', 'fake', 2, 1),
(22, 'eryk', 'eryk@fmail.com', 'a0c48dbff66c95ce5ad4b6ecad3f95b7', 'fake', 2, 1),
(23, 'anna', 'anna@fmail.com', '7d51b27ce6057e12cd5ccb15b27e126b', 'fake', 2, 1),
(24, 'julia', 'julia@fmail.com', 'a94bf507c98b8f7aa5b1e68d09435fc3', 'fake', 2, 1),
(25, 'lukasz', 'lukasz@fmail.com', '06243ca958ab4e7a8947bcab2c79d50a', 'fake', 2, 1),
(26, 'wladyslaw', 'wladyslaw@fmail.com', '9213c9ba301ffd2cb087a99958239d5e', 'fake', 2, 1),
(27, 'adriana', 'adriana@fmail.com', 'bdbbc1c38a6a203244f27328c615c229', 'fake', 2, 1),
(28, 'anita', 'anita@fmail.com', '544db37cb245c68c345073bfd37800fb', 'fake', 2, 1),
(29, 'ken', 'ken@fmail.com', '809b27f63cc665ce7cbd89b4a4ffa575', 'fake', 2, 1),
(30, 'filip', 'filip@fmail.com', '2d9031ec69b1bebb75e3866f17ac390e', 'fake', 2, 1),
(31, 'karolina', 'karolina@fmail.com', 'b11960ed27b227795c31ae6bb2e32543', 'fake', 2, 1),
(32, 'karol', 'karol@fmail.com', '578059e97f9c636475c364ee23aff7a6', 'fake', 2, 1),
(33, 'eliza', 'eliza@fmail.com', 'e2e92a211cb349ce46750fb5ae5b2f2e', 'fake', 2, 1),
(34, 'wiolka', 'wiolka@fmail.com', '95101aababf0ec768c7a5c3af90115dd', 'fake', 2, 1),
(35, 'ula', 'ula@fmail.com', 'aa3cc3d400d27e8af0de8e8b7406100b', 'fake', 2, 1),
(36, 'joanna', 'joanna@fmail.com', '4f304962961bb8cc0d7b89ee4c3e0ee3', 'fake', 2, 1),
(37, 'edyta', 'edyta@fmail.com', '66d497808469004003ef04ac1e306dee', 'fake', 2, 1),
(38, 'ewelina', 'ewelina@fmail.com', '0b66dc759e2a0cccb4860511f2e9cf86', 'fake', 2, 1),
(39, 'kuba', 'kuba@fmail.com', 'f2fac1c784733f39d8100a0928306ca6', 'fake', 2, 1),
(40, 'karol2', 'karol2@fmail.com', 'f4a06322f505ad48e268c97416f43273', 'fake', 2, 1),
(41, 'rafal', 'rafal@fmail.com', '6f1536aab0751fc8aff4df91405ed271', 'fake', 2, 1),
(42, 'aneta', 'aneta@fmail.com', 'a6478c96ef6943b2d0387592d1dfe103', 'fake', 2, 1),
(43, 'ala', 'ala@fmail.com', '2aeba7a4618bac90d53815f43d723c6a', 'fake', 2, 1),
(44, 'kornelia', 'kornelia@fmail.com', '0e5834fcae799fc39beeb328087e0631', 'fake', 2, 1),
(45, 'olek', 'olek@fmail.com', '8ab82cada048aad5f06e8e2525505b73', 'fake', 2, 1),
(46, 'marek2', 'marek2@fmail.com', 'a91e86409e3b387e0a45a04bf0cc1724', 'fake', 2, 1),
(47, 'lolitka', 'lolitka@fmail.com', '3cc35b4810f640871828464b282ba8f7', 'fake', 2, 1),
(48, 'aleksandra2', 'aleksandra2@fmail.com', '3b7fe2d01f828a62f6d9918b328436ba', 'fake', 2, 1),
(49, 'kamil', 'kamil@fmail.com', '17ca91de6405f3cac318445d466a3083', 'fake', 2, 1),
(50, 'kevin', 'kevin@fmail.com', '33122df651fdc49a4d3f430a7b660038', 'fake', 2, 1),
(51, 'aaa', 'aa@pp.pl', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', 'user', 1, 1),
(52, 'szalonyemil', 'denkmic@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'user', 2, 1),
(53, 'Fajny_user', 'new_user@gmail.com', '2c73bdccfcb396e58ede6691fb9ca773', 'user', 1, 1),
(54, 'kolo123', 'kolo@kolo.com', '513436c1d6ff998ed67ae5930a2fbe10', 'user', 1, 1),
(55, 'dup', 'dupa@cycki.pl', '25d55ad283aa400af464c76d713c07ad', 'user', 1, 1),
(60, 'kawka', 'kawka@fmail.com', '36db3344d8b53d145aea46fdc4156252', 'fake', 2, 1),
(61, 'oblatywacz', 'oblatywacz@fmail.com', '9512b216c61039d589cd81d9b4a98f52', 'fake', 2, 1),
(62, 'lama', 'lama@fmail.com', 'bddff407a82fe940be3ac86ad947ba02', 'fake', 2, 1),
(66, 'kawka2', 'kawka@mail.com', '2e801e65dfc0ed17ff104628b6cddbb8', 'user', 1, 0),
(67, 'ziutek', 'ziutek@fmail.com', '97d5964dc2339836dc775fcd998635e8', 'fake', 2, 1),
(68, 'sztywnymaciek', 'sztywnymaciek@gmail.com', '753f187b608fb47c313afbde9795042c', 'user', 1, 1),
(69, 'twardymaciek', 'twardymaciek@gmail.com', '594d859bb0b2c74b9d2ceb5880b28a8f', 'super_admin', 2, 1),
(70, 'lolol', 'lolol@mail.com', 'edcd9a24e21ce92fbf5ae0ed11c310a8', 'user', 1, 1),
(71, 'antonio123', 'antonio@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 1, 1),
(72, 'arnold', 'arnold@fmail.com', 'bc1419e93444f784d633e741320fd05a', 'fake', 2, 1),
(73, 'chetna', 'chetna@fmail.com', 'a7bcd00d54a2d2bca8c74b698a987633', 'fake', 2, 1),
(74, 'ruchalka', 'ruchalka@fmail.com', '8092f9a8aeb526d3b669281eb8c19476.jpg', 'fake', 2, 1),
(75, 'nimfa', 'nimfa@fmail.com', '0a3515568df66d4e8d695d53f3819fe7.jpg', 'fake', 2, 1),
(76, 'saszka', 'saszka@fmail.com', '0ad60ac60792e2e29a0e53be45d19465.jpg', 'fake', 2, 1),
(77, 'tovelo', 'tovelo@fmail.com', '5d3c1ae416e00f249926f04d4a686702.jpg', 'fake', 2, 1),
(78, 'trol12', 'troll@gmail.com', 'd8ca4394fd1493e77305fefd41ee399a', 'user', 2, 1),
(79, 'trol123', 'troll2@gmail.com', 'd8ca4394fd1493e77305fefd41ee399a', 'user', 1, 1),
(80, 'rubenowy', 'rubena@gmail.com', 'ba2e57cbd8546cffd7db6bfd4077758b', 'user', 1, 0),
(81, 'rubenow', 'rubenaa@gmail.com', 'ba2e57cbd8546cffd7db6bfd4077758b', 'user', 1, 0),
(82, 'username', 'example@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user', 1, 0),
(83, 'kunalesna', 'kuna2@gmail.com', '43afdfa3d58f2b7b9029a4dde08d8919', 'user', 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users_info`
--

CREATE TABLE `users_info` (
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `age` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `avatar` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `state` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `users_info`
--

INSERT INTO `users_info` (`user_name`, `age`, `avatar`, `state`, `info`, `sex`, `date_birth`) VALUES
('adriana', '21 lat', 'adriana.png', 'w związku', 'Zależy mi na dyskrecji. Ze mną spełnisz wszystkie swoje fantazje jeśli Tego chcesz. Ze mną można wszystko. Czekam na wiadomość ;)', 'w', NULL),
('ala', '25 lat', 'ala.png', 'wolna', 'Witam miłych panów. Zapraszam do swojego prywatnego mieszkanka. Preferuję sex klasyczny w różnych pozycjach, sex oralny bez zabezpieczenia z finałem w ustach', 'w', NULL),
('aleksandra', '36 lat', 'aleksandra.jpg', 'otwarty związek', 'Z moją dziewczyną szukamy otwartego faceta do trójkąta. Interesuje nas Tylko seks z facetem powyżej...', 'w', NULL),
('aleksandra2', '37 lat', 'aleksandra2.jpg', 'mężatka', 'Sexy mamuśka pozna MŁODSZEGO kochanka, który swoim dużym penisem przypomni jej co znaczy młodość. Zapraszam ;*', 'w', NULL),
('alex', '23 lata', 'alex.jpg', 'otwarty związek', 'Chętnie poznam starszą Panią, która poczuje w środku jak ją penetruje swoim 24 cm penisem. Czekam na...', 'm', NULL),
('alicja', '29 lat', 'alicja.jpg', 'mężatka', 'Szukam dyskretnego, przystojnego, młodego, dzikiego w łóżku Pana, który sprawi, że poczuje się jak nastolatka. Jestem modelką, interesują mnie tylko um...', 'w', NULL),
('aneta', '28 lat', 'aneta.jpg', 'w związku', 'Młodziutka, subtelna, zadbana, zgrabna brunetka,o aksamitnym ciele i ładnej buzi, zaprasza do swojego dyskretnego mieszkanka', 'w', NULL),
('angela', '29 lat', 'angela.jpg', 'w związku', 'Szukam fajnego chłopaczka lub dziewczynki, bo mój facet mnie nudzi. Potrzebuję Cię...', 'w', NULL),
('anita', '23 lata', 'anita.jpg', 'zaręczona', 'Jestem niegrzeczna.;* Szukam faceta, który zrozumie moje potrzeby I mnie wyrucha konkretnie. Moje wymagania to penis od 20 cm w...', 'w', NULL),
('anna', '26 lat', 'anna.jpg', 'w związku', 'Raz anielica, raz diablica. Chcesz wiedzieć na co mnie stać to napisz do mnie i się Przekonaj. Tylko odważni!', 'w', NULL),
('anna2', '39 lat', 'anna2.jpg', 'mężatka', 'Poznam starszego Pana, który sprawi mi prezenty w zamian za seks. Najlepiej U niego nie u mnie bo...', 'w', NULL),
('arnold', '37 lat', 'arnold.png', 'wolny', 'boczek, grubas', 'm', NULL),
('artur', '41 lat', 'artur.jpg', 'żonaty', 'Spotkajmy się na dyskretny układ a nie pożałujesz. Seks, wyjazdy, pieniądze, dam ci wszystko co tylko...', 'm', NULL),
('baska', '27 lat', 'baska.jpg', 'rozwódka', 'Jestem ostrą lalunią, jeśli lubisz trochę więcej ciałka to zapraszam do mnie w poniedziałki i środy. Czekam na wiad....', 'w', NULL),
('chetna', '21 lat', 'chetna.png', 'wolna', 'Jestem chętna na wszystko ;)', 'w', NULL),
('daniel', '37 lat', 'daniel.jpg', 'rozwiedziony', 'Szukam „laleczki”, która zrobi dla mnie wszystko. Masz pewność, że tak cię urządzę, że nie będziesz mogła siadać przez....', 'm', NULL),
('diablica', '25 lat', 'diablica.jpg', 'zaręczona', 'Hmm, jeśli mi się spodobasz to spełnie wszystkie Twoje zachcianki. Napisz wiadomość, czekam na ciebie', 'w', NULL),
('dup', ' lat', 'dup.png', 'W otwartym związku', 'Jestem napalona, chcę dzisiaj poczuć Ciebie w sobie i Twój ładunek ;)', 'w', '1997-01-01'),
('edward', '20 lat', 'edward.jpg', 'wolny', 'Szukam laseczki z dużym tyłeczkiem i biustem minimum c. Lubię namiętny seks ale się dostosuje. Może być też szyb...', 'm', NULL),
('edyta', '28 lat', 'edyta.jpg', 'w związku', 'Chcesz mnie poznać? Odezwij się, nie krępuj się a nie pożałujesz! ;)', 'w', NULL),
('eliza', '32 lata', 'eliza.jpg', 'mężatka', 'Miłości szukam? Nie! Szukam kochanka. Ustawcie się w kolejce a sama wybiorę mojego słodkiego sexy boya ;**', 'w', NULL),
('eryk', '19 lat', 'eryk.jpg', 'wolny', 'Młodsze dziewczynki mnie nie interesują. Poluję na starsze kobiety, Najlepiej sexy mamuśki. Czekam na Twoją wiad...', 'm', NULL),
('ewelina', '28 lat', 'ewelina.jpg', 'w związku', 'Chcesz mnie poznać? Odezwij się, nie krępuj się a nie pożałujesz! ;)', 'w', NULL),
('Fajny_user', ' lat', 'Fajny_user.png', 'wolny', 'Jestem fajny i mam tukana w profilu ;)', 'm', '1999-08-17'),
('filip', '28 lat', 'filip.jpg', 'wolny', 'Spokojny facet szuka seksownej kotki aby spędzić razem czas. Ty decydujesz jak. Zapraszam', 'm', NULL),
('gabriela', '27 lat', 'gabriela.jpg', 'w związku', 'Nie jestem idealna ale mam duże cycki i ciasną cipkę. Jeśli takie lubisz To napisz do mnie a się dogadamy. Seks...', 'w', NULL),
('joanna', '30 lat', 'joanna.jpg', 'mężatka', 'Mam wolne mieszkanie dzisiaj o godzinie 19, jeśli zdążysz napisać to Zapraszam Cię na szybki numerek. :)', 'w', NULL),
('julia', '23 lata', 'julia.jpg', 'zaręczona', 'Szukam przyjaciela z korzyściami, żeby się spotykać na ruchanko tak 2-3 razy w tygodniu. Zainteresowany i przystojny? Napisz', 'w', NULL),
('kamil', '36 lat', 'kamil.jpg', 'żonaty', 'Szukam laseczki około 18-20 lat. Moje wymagania to ładna buzia, ogolona wszędzie i uległa...', 'm', NULL),
('karen', '35 lat', 'karen.jpg', 'mężatka', 'Potrzbuje mężczyzn, który będzie moim Panem. Lubię klapsy i...', 'w', NULL),
('karol', '29 lat', 'karol.jpg', 'wolny', 'Uległe kobietki piszcie ;*', 'm', NULL),
('karol2', '36 lat', 'karol2.jpg', 'w związku', 'Lubię ciemne dziewczynki. ;* Uroda egzotyczna mile widziana. Duża pupa również. Zapraszam!', 'm', NULL),
('karolina', '36 lat', 'karolina.jpg', 'samotna matka', 'Jestem samotną matką, chcę znów poczuć zapach faceta i ciepło jego Ramion. Może być przelotny seks, wystarczy żebyś był czuły. Zainteresowani...', 'w', NULL),
('kawka', '25 lat', 'kawka.png', 'wolna', 'Jestem kawka dziwaczka', 'w', NULL),
('kazimierz', '21 lat', 'kazimierz.jpg', 'w związku', 'Z dziewczyną szukamy pary do wymiany seksualnej lub jednej dziewczyny do trójkąta. Zainteresowani pisać', 'm', NULL),
('ken', '33 lata', 'ken.jpg', 'wolny', 'Szukam przygode. Chcesz seks, pisz. Ja bogaty i dobry kochanek', 'm', NULL),
('kevin', '21 lat', 'kevin.jpg', 'w związku', 'I am here for an exchange. I\'m form USA. Only sex with girls 18-30 years old.', 'm', NULL),
('kicia', '25 lat', 'kicia.png', 'mężatka', 'Szukam władczego, dyskretnego Pana, który przypomni mi co to dobry se...', 'w', NULL),
('konsultant', NULL, 'konsultant.png', 'wolny', 'nic ciekawego', 'm', '1990-09-24'),
('kornelia', '42 lata', 'kornelia.jpg', 'wdowa', ' Ja 42-letnia kobieta, zadbana pachnąca z poczuciem humoru, inteligentna. Zapraszam na kawę, herbatę, rozmowę oraz erotyczne spotkania. Uwielbiam sprawiać przyjemność po francusku i mam z tego ogromna satysfakcje. ', 'w', NULL),
('kuba', '47 lat', 'kuba.jpg', 'żonaty', 'Szukam 2 lub 3 panienek na jutrzejszy wieczór. Któraś chętna? Pisać!', 'm', NULL),
('kunalesna', NULL, 'kunalesna.png', 'wolny', 'jestem kuna i nie pracuje LUL', 'm', '1989-01-30'),
('kwiatuszek', '28 lat', 'kwiatuszek.jpg', 'w związku', 'Jestem przed ślubem, szukam dyskretnego mężczyznę z, którym zrobię ostatni skok w bok, w', 'w', NULL),
('lama', '20 lat', 'lama.png', 'wolna', 'Jestem lama', 'w', NULL),
('lolitka', '26 lat', 'lolitka.jpg', 'zaręczona', 'Szukam faceta doświadczonego w analu z, którym zrobię to pierwszy raz. Napisz do mnie aby się umówić', 'w', NULL),
('lukasz', '22 lata', 'lukasz.jpg', 'wolny', 'Suczki zapraszam do mnie na namietną noc. Pobawimy się. Bedzie winko, Pizza i seks. Napisz a...', 'm', NULL),
('marek', '38 lat', 'marek.jpg', 'zaręczony', 'Szukam kobiety w wieku 18-26 lat, która będzie do mnie przychodzić wieczorami na kolację i namiętny seks. Tylko ukł...', 'm', NULL),
('marek2', '32 lata', 'marek2.jpg', 'wolny', 'Chcesz zostać moją księżniczką? Najpierw spełnij moje wymagania. Mam Kajdanki, będzie ostro. Napisz ;*', 'm', NULL),
('mattew', '33 lata', 'mattew.jpg', 'żonaty', 'Szukam zadbanej słodkiej panienki w wieku od 20 lat do 35. Na kolację a później na małe co nie co w sypialni', 'm', NULL),
('nimfa', '26 lat', 'nimfa.png', 'wolna', 'Jestem nimfa, chętna i gorąca ;)', 'w', NULL),
('oblatywacz', '56 lat', 'oblatywacz.png', 'wolny', 'Pilot oblatywacz', 'm', NULL),
('olek', '38 lat', 'olek.jpg', 'w związku', ' Związku nie będzie. Tylko seks. Lubisz przygodę? Napisz', 'm', NULL),
('prawiczek', NULL, 'prawiczek.png', 'wolny', 'Chcę zaliczyć wkońcu', 'm', '1999-08-23'),
('rafal', '24 lata', 'rafal.jpg', 'zaręczony', 'Dziewczynki kocham was wszystkie! Blondynki, brunetki, Rude, bylyby z ogoloną cipką. Może być też anal ;* Pisać...', 'm', NULL),
('ruben', NULL, 'ruben.png', 'żonaty', 'Jestem sexy boyy, sexy boy, not boy toy Kappa', 'm', '1989-06-14'),
('ruchalka', '23 lata', 'ruchalka.png', 'wolna', 'Jestem tutaj aby ruchać', 'w', NULL),
('saszka', '25 lat', 'saszka.png', 'W otwartym związku', 'Jestem z ukrainy, szukam kogoś z kim bym mogła spędzać samotne wieczory ;)', 'w', NULL),
('szalonyemil', NULL, 'szalonyemil.png', 'Dupa', 'Cycki', 'm', '1993-08-11'),
('sztywnymaciek', NULL, 'sztywnymaciek.png', 'Wolny', 'jestem sztywny', 'm', '1989-11-20'),
('tovelo', '28 lat', 'tovelo.png', 'wolna', 'Jestem sexy laska', 'w', NULL),
('ula', '27 lat', 'ula.jpg', 'otwarty związek', 'Interesuje się fotografią. Zrobimy sobie ostre zdjęcia a później przeżyjemy Super chwile. Jesteś na to gotowy? Napisz ;*', 'w', NULL),
('wiolka', '19 lat', 'wiolka.jpg', 'wolna', 'Moja ulubiona pozycja to 69 a Twoja? Napisz do mnie a się co do tego dogadamy. Tylko u Ciebie...', 'w', NULL),
('wladyslaw', '49 lat', 'wladyslaw.jpg', 'rozwiedziony', 'Szukam kobiety na seks za kasę. Zapłacę ile chcesz ale musisz być ładna. Odezwij się.Pozdrawiam', 'm', NULL),
('ziutek', '26 lat', 'ziutek.png', 'wolny', 'Cześć', 'm', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vip_pay`
--

CREATE TABLE `vip_pay` (
  `id` int(11) NOT NULL,
  `user` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `vip_pay`
--

INSERT INTO `vip_pay` (`id`, `user`, `cookie`, `pay_link`, `status`) VALUES
(4, 'szalonyemil', '5e38e7c2af5b6cef225b811548b987c5', 'https://180next.com/payments/templates/next180/payments.xhtml?i=s_5e38e7c2af5b6cef225b811548b987c5&l=pl&loc=pl_PL&m=WnU5M4nOTlEFrqGsu2VhER6yaQFLxjSWKFXkuF7xEgzdBnKJHMnk_770i1Qz8NsqLHQLIel4k-X-4XBe3JboUlG0Qt-9sGMYS4pSUzQr2WNIXlWn9c7--sfg3t0Y6yPh5fGTsZ9x1mPR8A5PMrFuU18UGlSSiofQgbmS_cfb3TkZzxE-tbEu_32G4FlOF_l9wb-Xk9vUt9v6L5RsVBtfoV3lULrqw62pQORfLnnfVyCCPOO94FI1PLNxvP9fX_0ANvbvEhFBQa4YZmvZPsNmofeT0JT-HL-ofmkkRlsTZrAq-mvrDg-v4866i-M9ODSC6gXKpAfJGRIkk88kpFb4-3h02CUoX_2k-Sj88YlW_ZwmiscfRM8sZWX4FMo1hEtHNLJctuNU8AzV_3QKhJL9iDqLONq0nC7oz57EEm38RntnCUhxLnYxko7WLmZHcJHMA3d5p1vwQm3PMj5IAgiL8Y7jPTU0MxeOs3gmpAiIh7a5ts_FAHTtzqq9dhrBg8gi7VTUtdFNl2PHhwcTpAAaLe5lfSNBtpjGOi4nJcK8y-MbOwrRm0E-QBqabYx2WDCKT1wT6g2xDRQ1gMV0xDOViA', 2),
(10, 'ruben', '02702a6bb9d5e8863c5e30ae78c4d718', 'https://180next.com/payments/payNow?i=s_02702a6bb9d5e8863c5e30ae78c4d718&l=pl&loc=pl_PL&m=WnU5M4nOTlEFrqGsu2VhER6yaQFLxjSWKFXkuF7xEgzdBnKJHMnk_770i1Qz8NsqLHQLIel4k-X-4XBe3JboUlG0Qt-9sGMYS4pSUzQr2WNIXlWn9c7--sfg3t0Y6yPhAEnbLF_5tskz7O9hzz0X9DNz0Et06RZ6ug9sKyUR4P3f2_wHDHEEDfnY_7s5ptqUUDNd5dsMTm22eHS3PqYazMjXfxNbk7o5sBrFG_bob0CF-nlHOHPeTWrvMEfjuc2m4P-lXKWP5BoLLgeHEXR7C-_xb0tb2cmHDlicnnI1KJnzTTcSTSC1mox_sgCH4aW7lv6MJBuYlb5NcyhqXNgLY5yxd_ZlK2JdQhAgG9LhJ-g5zRehVb8NEf7RkJEUp7gFET6fnZ6ZLb2S_0_bycKlxh4oF04AZQoI3AgtHXU68gUAft_mwRCSSnGkB7ENoZPnczRbo74VtXrR5c3H-kZM1czFhQwMNEsqJsFWiyxQyxYkvMDRj-VM_RjHQB3WRGA9wtQ_DV3NqXezd209ZvHFIZXoDF3J_3ioEVuHDHpCCmY', 2),
(11, 'trol12', 'c7f99e2f558d35983fbcedf4d86c578c', 'https://180next.com/payments/payNow?i=s_c7f99e2f558d35983fbcedf4d86c578c&l=pl&loc=pl_PL&m=WnU5M4nOTlEFrqGsu2VhER6yaQFLxjSWKFXkuF7xEgzdBnKJHMnk_770i1Qz8NsqLHQLIel4k-X-4XBe3JboUlG0Qt-9sGMYS4pSUzQr2WNIXlWn9c7--sfg3t0Y6yPhF0aNTcUKWZjyk_f_-WYNdUcJV9NOTi0_D0DglcAzJc1jQqZ5toJS2-vG5Hmz2F4wKtKnS9AzpOzZwOvzjguIoh1yusKASZ6JJXHjkLBLofR7Mnd2q9Oz60hUYzvOVDpqhTMOriabIjenQoPJOSB9fbK6xkkKFqaiaUu1UGE5nBi_SWWp0hVzQDATrqtIt99f5ptO5uyddgUaU3fJHg2sFuR6k4RPSRRaX6eemzqFxw8bNLGJPVXxn3G40nEn3NbY-StdjHgyuAb62sAjqjgcpqXnk2GkMnlLNOw5vkWMYSXcLF0bIC-iEIzh5BOq6GqfhK62QpFNC4Cs1F_qSJmrhhLEvHjVS1HNGyB2PYGnIkFtOoJsJ4jmun-Hsx13KQL72ywr1Dv0yrvmeG-uE121YFHZHhSSWlg3j7gb277SKqs', 2),
(13, 'kunalesna', 'ba0c768753ca11d8141d95753313744e', 'https://180next.com/payments/payNow?i=s_ba0c768753ca11d8141d95753313744e&l=pl&loc=pl_PL&m=WnU5M4nOTlEFrqGsu2VhER6yaQFLxjSWKFXkuF7xEgzdBnKJHMnk_770i1Qz8NsqLHQLIel4k-X-4XBe3JboUlG0Qt-9sGMYS4pSUzQr2WNIXlWn9c7--sfg3t0Y6yPhFmsz9JrzBrxCeDBpnEIS5lkiK-WEW4_8r09gVI1I6ZgX1K230YsGbtZugTgCoJeR5ZkSEoDXO7IjeKR9H1ztyfpRoclIogo2ZqMDpfzNzhq2KNKlMdRTIajJHQ6WqxILWWgyxSp3CBqxufuh5ZvKYflR3C_FL9Z3qTZPvyWwgEZ4voVmZt2acBK69HF6E1-kzFqB-3NApjcvK0WX2kG_a0t3s3c2mb4WFH7nkOIiU3g8s_zJHjMbePre1kLHmatWUaqmv2Pixx6aKrPIj0aaNziybAbZSa13wgHi1mUbbvDqajTAVhvf07PXPpaj7FPqKflqgyXNnG9mZD5j0zUl51mCN8RAeb0B3jZp9kemntEM_KIMN-It1Q6-tBLfaxeIvUuSOfFPElZWiaOqp_rzF4cZLEpcTUiuED3fGAqzFLrTUdSGH29kX3ro9jnH3b0nVmAxAMMcNvmVv8QfPBDvnA', 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `account_coins`
--
ALTER TABLE `account_coins`
  ADD PRIMARY KEY (`login`),
  ADD KEY `login` (`login`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery_permissions`
--
ALTER TABLE `gallery_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications_types`
--
ALTER TABLE `notifications_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pay_status`
--
ALTER TABLE `pay_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users_info`
--
ALTER TABLE `users_info`
  ADD PRIMARY KEY (`user_name`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `user_name_2` (`user_name`);

--
-- Indexes for table `vip_pay`
--
ALTER TABLE `vip_pay`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `gallery_permissions`
--
ALTER TABLE `gallery_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT dla tabeli `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=352;
--
-- AUTO_INCREMENT dla tabeli `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT dla tabeli `notifications_types`
--
ALTER TABLE `notifications_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `pay_status`
--
ALTER TABLE `pay_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT dla tabeli `vip_pay`
--
ALTER TABLE `vip_pay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
