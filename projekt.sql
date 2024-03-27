create database Hotel;
use Hotel;

CREATE TABLE IF NOT EXISTS `Pokoj` (
  `Nr_pokoju` INT NOT NULL,
  `Liczba_Miejsc` TINYINT(1) NOT NULL,
  `Liczba_Lozek_1-s` ENUM('0', '1', '2', '3', '4', '5', '6') NOT NULL,
  `Liczba_Lozek_2-os` ENUM('0', '1', '2', '3') NOT NULL,
  PRIMARY KEY (`Nr_pokoju`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Klient` (
  `Id` INT NOT NULL,
  `Imie` VARCHAR(20) NOT NULL,
  `Nazwisko` VARCHAR(30) NOT NULL,
  `Nr_telefonu` CHAR(9) NOT NULL,
  `Adres_mailowy` VARCHAR(50) NOT NULL,
  `Ulica` VARCHAR(60) NOT NULL,
  `Nr_domu/lokalu` VARCHAR(10) NOT NULL,
  `Kod_pocztowy` VARCHAR(6) NOT NULL,
  `Miejscowosc` VARCHAR(60) NOT NULL,
  `Pesel` CHAR(11) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Rezerwacja` (
  `Id` INT NOT NULL,
  `Id_klienta` INT NOT NULL,
  `Poczatek_rezerwacji` DATE NOT NULL,
  `Koniec_rezerwacji` DATE NOT NULL,
  `Cena` SMALLINT(5) NOT NULL,
  `Koszt_anulowania_rezerwacji` SMALLINT(5) NOT NULL,
  `Rodzaj_platnosci` ENUM('Karta', 'Gotowka', 'Blik', 'Przelew') NOT NULL,
  PRIMARY KEY (`Id`, `Id_klienta`),
  INDEX `Id_klienta_idx` (`Id_klienta` ASC) VISIBLE,
  CONSTRAINT `Id_klienta`
    FOREIGN KEY (`Id_klienta`)
    REFERENCES `mydb`.`Klient` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Pokoje_do_rezerwacji` (
  `Nr_pokoju` INT NOT NULL,
  `Id` INT NOT NULL,
  PRIMARY KEY (`Nr_pokoju`, `Id`),
  INDEX `Id_idx` (`Id` ASC) VISIBLE,
  CONSTRAINT `Nr_pokoju`
    FOREIGN KEY (`Nr_pokoju`)
    REFERENCES `mydb`.`Rezerwacja` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Id`
    FOREIGN KEY (`Id`)
    REFERENCES `mydb`.`Pokoj` (`Nr_pokoju`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Osoba_wspoltowarzyszaca` (
  `Id` INT NOT NULL,
  `Id_klienta` INT NOT NULL,
  `Imie` VARCHAR(20) NOT NULL,
  `Nazwisko` VARCHAR(30) NOT NULL,
  `Nr_telefonu` CHAR(9) NOT NULL,
  `Adres_mailowy` VARCHAR(50) NOT NULL,
  `Pesel` CHAR(11) NOT NULL,
  PRIMARY KEY (`Id`, `Id_klienta`),
  INDEX `Id_klienta_idx` (`Id_klienta` ASC) VISIBLE,
  CONSTRAINT `Id_klienta1`
    FOREIGN KEY (`Id_klienta`)
    REFERENCES `mydb`.`Klient` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

desc pokoj;

select * from pokoj; 

insert into pokoj values
('101', '6', '3', '0'),
('102', '4', '2', '0'),
('103', '4', '2', '0'),
('104', '1', '0', '1'),
('105', '1', '0', '1'),
('106', '4', '2', '0'),
('107', '4', '2', '0'),
('108', '2', '1', '0'),
('109', '2', '1', '0'),
('110', '5', '2', '1'),
('111', '5', '2', '1'),
('112', '2', '1', '0'),
('113', '2', '1', '0'),
('114', '5', '2', '1'),
('115', '5', '2', '1'),
('116', '3', '1', '1'),
('117', '3', '1', '1'),
('118', '6', '3', '0'),
('119', '6', '3', '0'),
('120', '3', '1', '1'),
('121', '3', '1', '1'),
('122', '6', '3', '0'),
('123', '6', '3', '0'),
('124', '4', '2', '0'),
('125', '4', '2', '0'),
('126', '1', '0', '1'),
('127', '1', '0', '1'),
('128', '4', '2', '0'),
('129', '4', '2', '0'),
('201', '1', '0', '1'),
('202', '5', '2', '1'),
('203', '5', '2', '1'),
('204', '2', '1', '0'),
('205', '5', '2', '1'),
('206', '5', '2', '1'),
('207', '3', '1', '1'),
('208', '3', '1', '1'),
('209', '6', '3', '0'),
('210', '6', '3', '0'),
('211', '3', '1', '1'),
('212', '3', '1', '1'),
('213', '6', '3', '0'),
('214', '6', '3', '0'),
('215', '4', '2', '0'),
('216', '4', '2', '0'),
('217', '1', '0', '1'),
('218', '1', '0', '1'),
('219', '4', '2', '0'),
('220', '4', '2', '0'),
('221', '1', '0', '1'),
('222', '1', '0', '1'),
('223', '5', '2', '1'),
('224', '5', '2', '1'),
('225', '2', '1', '0'),
('226', '2', '1', '0'),
('227', '5', '2', '1'),
('228', '5', '2', '1'),
('229', '2', '1', '0'),
('301', '6', '3', '0'),
('302', '6', '3', '0'),
('303', '3', '1', '1'),
('304', '3', '1', '1'),
('305', '6', '3', '0'),
('306', '6', '3', '0'),
('307', '4', '2', '0'),
('308', '4', '2', '0'),
('309', '1', '0', '1'),
('310', '1', '0', '1'),
('311', '4', '2', '0'),
('312', '1', '0', '1'),
('313', '1', '0', '1'),
('314', '5', '2', '1'),
('315', '5', '2', '1'),
('316', '2', '1', '0'),
('317', '2', '1', '0'),
('318', '5', '2', '1'),
('319', '5', '2', '1'),
('320', '2', '1', '0'),
('321', '2', '1', '0'),
('322', '6', '3', '0'),
('323', '6', '3', '0'),
('324', '3', '1', '1'),
('325', '3', '1', '1'),
('326', '6', '3', '0'),
('327', '6', '3', '0'),
('328', '3', '1', '1'),
('329', '3', '1', '1'),
('401', '1', '0', '1'),
('402', '4', '2', '0'),
('403', '4', '2', '0'),
('404', '1', '0', '1'),
('405', '1', '0', '1'),
('406', '4', '2', '0'),
('407', '4', '2', '0'),
('408', '2', '1', '0'),
('409', '2', '1', '0'),
('410', '5', '2', '1'),
('411', '5', '2', '1'),
('412', '2', '1', '0'),
('413', '2', '1', '0'),
('414', '6', '3', '0'),
('415', '6', '3', '0'),
('416', '3', '1', '1'),
('417', '6', '3', '0'),
('418', '6', '3', '0'),
('419', '3', '1', '1'),
('420', '3', '1', '1'),
('421', '1', '0', '1'),
('422', '1', '0', '1'),
('423', '4', '2', '0'),
('424', '4', '2', '0'),
('425', '1', '0', '1'),
('426', '1', '0', '1'),
('427', '4', '2', '0'),
('428', '4', '2', '0'),
('429', '2', '1', '0');

select * from klient;

delete from klient;

insert into klient values
('1', 'Anna', 'Kowalska', '703124133', 'a.kowalska@gmail.com', 'Krakowska', '23', '41-134', 'Warszawa', '89928006757'), 
('2', 'Jan', 'Nowak', '879804186', 'j.nowak@gmail.com', 'Warszawska', '72', '75-298', 'Kraków', '18457719605'),
('3', 'Maria', 'Wiśniewska', '473980901', 'm.wisniewski@gmail.com', 'Poznańska', '92', '61-089', 'Poznań', '85435145627'),
('4', 'Andrzej', 'Wójcik', '106578323', 'a.wojcik@gmail.com', 'Łódzka', '5', '51-196', 'Łódz', '72521170944'),
('5', 'Ewa', 'Kowalczyk', '738150706', 'e.kowalczyk@gmail.com', 'Wrocławska', '89', '33-374', 'Wrocław', '87454028817'),
('6', 'Tomasz', 'Kozłowski', '653361706', 't.kozlowski@gmail.com', 'Gdańska', '44', '98-914', 'Gdańsk', '79258903175'), 
('7', 'Marta', 'Jankowska', '282080545', 'm.jankowska@gmail.com', 'Katowicka', '24', '63-641', 'Katowice', '15339013088'),
('8', 'Krzysztof', 'Majewski', '810345260', 'k.majewski@gmail.com', 'Słowackiego', '81', '58-061', 'Szczecin', '61463998680'),
('9', 'Agnieszka', 'Król', '440293478', 'a.krol@gmail.com', 'Kopernika', '25', '23-560', 'Bydgoszcz', '51049319757'),
('10', 'Piotr', 'Młynarczyk', '667636267', 'p.mlynarczyk@gmail.com', 'Mickiewicza', '48', '48-666', 'Lublin', '59017642569'),
('11', 'Kasia', 'Wieczorek', '853053272', 'k.wieczorek@gmail.com', 'Sienkiewicza', '22', '35-677', 'Białystok', '40591083681'),
('12', 'Marek', 'Adamczyk', '946637935', 'm.adamczyk@gmail.com', 'Piłsudskiego', '40', '80-249', 'Częstochowa', '39557348249'),
('13', 'Dorota', 'Dąbrowski', '374129270', 'd.dabrowski@gmail.com', 'Konopnickiej', '42', '80-176', 'Toruń', '92032228989'),
('14', 'Jerzy', 'Pawlak', '179565007', 'j.pawlak@gmail.com', 'Chopina', '63', '27-028', 'Gdynia', '91241368264'),
('15', 'Joanna', 'Kaczmarek', '716764766', 'j.kaczmarek@gmail.com', 'Koszykowa', '17', '50-967', 'Sopot', '96612047818'),
('16', 'Robert', 'Zając', '454173799', 'r.zajac@gmail.com', 'Jagiellońska', '6', '75-582', 'Kielce', '76440599092'),
('17', 'Alicja', 'Piotrowski', '462975596', 'a.piotrowski@gmail.com', 'Szewska', '28', '99-614', 'Rzeszów', '75800819983'),
('18', 'Stanisław', 'Grabowski', '726790147', 's.grabowski@gmail.com', 'Nowowiejska', '57', '15-763', 'Gliwice', '36479274857'),
('19', 'Monika', 'Michalski', '355802599', 'm.michalski@gmail.com', 'Kolejowa', '47', '41-049', 'Zabrze', '96499470742'),
('20', 'Marcin', 'Krawczyk', '133256111', 'm.krawczyk@gmail.com', 'Tadeusza Kościuszki', '54', '92-847', 'Olsztyn', '77427151310'),
('21', 'Beata', 'Kaczorowski', '284685630', 'b.kaczorowski@gmail.com', 'Kazimierza Wielkiego', '94', '46-771', 'Bielsko-Biała', '10892138060'),
('22', 'Ryszard', 'Zalewski', '121209014', 'r.zalewski@gmail.com', 'Mieszka I', '68', '37-246', 'Bytom', '97029521024'),
('23', 'Iwona', 'Jabłoński', '801865244', 'i.jablonski@gmail.com', 'Stefana Batorego', '73', '89-907', 'Zielona Góra', '29225975130'),
('24', 'Grzegorz', 'Kraska', '936844264', 'g.kraska@gmail.com', 'Obrońców Tobruku', '46', '36-982', 'Rybnik', '81590819799'),
('25', 'Paulina', 'Makowski', '613017332', 'p.makowski@gmail.com', 'Bolesława Krzywoustego', '32', '65-009', 'Ruda Śląska', '53710785564'),
('26', 'Wojciech', 'Dudek', '460825441', 'w.dudek@gmail.com', 'Jana Pawła II', '93', '90-084', 'Tychy', '93905252387'), 
('27', 'Natalia', 'Wójcik', '170935266', 'n.wojcik@gmail.com', 'Piotra Skargi', '15', '25-029', 'Gorzów Wielkopolski', '48447663768'),
('28', 'Bartłomiej', 'Kubiak', '467784454', 'b.kubiak@gmail.com', 'Słowackiego', '14', '74-660', 'Dąbrowa Górnicza', '36177027325'),
('29', 'Martyna', 'Mazur', '114905686', 'm.mazur@gmail.com', 'Konstytucji', '64', '66-663', 'Elbląg', '97373000220'),
('30', 'Zofia', 'Krasowski', '545409059', 'z.krasowski@gmail.com', 'Konstytucji 3 maja', '27', '87-106', 'Legnica', '92557131170'),
('31', 'Adam', 'Urbaniak', '403782658', 'a.urbaniak@gmail.com', 'Jana III Sobieskiego', '2', '27-169', 'Opole', '16016237874'),
('32', 'Elżbieta', 'Krajewski', '799521632', 'e.krajewski@gmail.com', 'Krakowska', '85', '69-484', 'Jaworzno', '26616690721'),
('33', 'Maciej', 'Lis', '712709433', 'm.lis@gmail.com', 'Warszawska', '19', '28-604', 'Jastrzębie-Zdrój', '13316167522'),
('34', 'Julia', 'Maciejewski', '108405404', 'j.maciejewski@gmail.com', 'Poznańska', '20', '97-979', 'Koszalin', '16547156396'),
('35', 'Cezary', 'Kozak', '701633213', 'c.kozak@gmail.com', 'Łódzka', '36', '46-778', 'Wałbrzych', '32644145751'),
('36', 'Magdalena', 'Czarnecki', '408112889', 'm.czarnecki@gmail.com', 'Wrocławska', '79', '70-518', 'Słupsk', '70326431714'),
('37', 'Bartosz', 'Szewczyk', '883365723', 'b.szewczyk@gmail.com', 'Gdańska', '61', '74-884', 'Jelenia Góra', '17886187930'),
('38', 'Gabriela', 'Tomaszewski', '101152614', 'g.tomaszewski@gmail.com', 'Katowicka', '60', '18-342', 'Kalisz', '14141231066'),
('39', 'Paweł', 'Piotrkowski', '854196744', 'p.piotrkowski@gmail.com', 'Słowackiego', '7', '77-327', 'Grudziądz', '73662989058'),
('40', 'Patrycja', 'Górski', '381483198', 'p.gorski@gmail.com', 'Kopernika', '91', '14-328', 'Siedlce', '98422767444'), 
('41', 'Łukasz', 'Cieślak', '586357326', 'l.cieslak@gmail.com', 'Mickiewicza', '4', '83-450', 'Legionowo', '37307548658'),
('42', 'Katarzyna', 'Dudziński', '462796802', 'k.dudzinski@gmail.com', 'Sienkiewicza', '77', '47-366', 'Piła', '85377083283'),
('43', 'Dawid', 'Baran', '340204839', 'd.baran@gmail.com', 'Piłsudskiego', '16', '31-133', 'Stargard', '69088822721'),
('44', 'Izabela', 'Bielecki', '613341152', 'i.bielecki@gmail.com', 'Konopnickiej', '65', '19-339', 'Ostroda', '89755721329'),
('45', 'Radosław', 'Majchrzak', '870355654', 'r.majchrzak@gmail.com', 'Chopina', '67', '16-514', 'Mysłowice', '85968952372'),
('46', 'Sylwia', 'Maj', '924366873', 's.maj@gmail.com', 'Koszykowa', '70', '23-958', 'Inowrocław', '38998471118'),
('47', 'Małgorzata', 'Madej', '461161463', 'm.madej@gmail.com', 'Jagiellońska', '55', '68-883', 'Wejherowo', '96254718866'),
('48', 'Joanna', 'Krolak', '854787520', 'j.krolak@gmail.com', 'Szewska', '88', '17-091', 'Tomaszów Mazowiecki', '46986683898'),
('49', 'Bartosz', 'Jezierski', '820940572', 'b.jezierski@gmail.com', 'Nowowiejska', '3', '98-915', 'Pabianice', '99483582350'),
('50', 'Agata', 'Jakubowski', '279218161', 'a.jakubowski@gmail.com', 'Kolejowa', '18', '55-385', 'Tarnów', '72165002088'),
('51', 'Adam', 'Gajewski', '750176098', 'a.gajewski@gmail.com', 'Tadeusza Kościuszki', '49', '47-805', 'Chorzów', '41955560120'),
('52', 'Barbara', 'Faltynowski', '634576515', 'b.faltynowski@gmail.com', 'Kazimierza Wielkiego', '10', '46-144', 'Ruda Śląska', '96011127322'),
('53', 'Jerzy', 'Dziedzic', '171571453', 'j.dziedzic@gmail.com', 'Mieszka I', '97', '92-463', 'Tychy', '19588379101'),
('54', 'Zofia', 'Błaszczyk', '794548076', 'z.blaszczyk@gmail.com', 'Stefana Batorego', '56', '79-487', 'Gorzów Wielkopolski', '76697593801'),
('55', 'Józef', 'Włodarczyk', '924893153', 'j.wlodarczyk@gmail.com', 'Obrońców Tobruku', '33', '22-888', 'Dąbrowa Górnicza', '73332041099'),
('56', 'Halina', 'Urbanowski', '813761649', 'h.urbanowski@gmail.com', 'Bolesława Krzywoustego', '86', '11-665', 'Elbląg', '15872483115'),
('57', 'Janina', 'Szydłowski', '987841535', 'j.szydlowski@gmail.com', 'Jana Pawła II', '13', '24-343', 'Legnica', '94179148277'),
('58', 'Stanisław', 'Szulc', '255535769', 's.szulc@gmail.com', 'Piotra Skargi', '87', '98-775', 'Opole', '76653840937'),
('59', 'Leszek', 'Szostak', '672330881', 'l.szostak@gmail.com', 'Słowackiego', '76', '19-865', 'Jaworzno', '15034756969'),
('60', 'Danuta', 'Szubert', '102560263', 'd.szubert@gmail.com', 'Konstytucji', '74', '37-698', 'Jastrzębie-Zdrój', '89115384711'),
('61', 'Bogdan', 'Sroka', '428683647', 'b.sroka@gmail.com', 'Konstytucji 3 maja', '9', '33-033', 'Koszalin', '51167097595'),
('62', 'Ewelina', 'Skrzypczak', '630293011', 'e.skrzypczak@gmail.com', 'Jana III Sobieskiego', '98', '57-228', 'Wałbrzych', '46038696202'),
('63', 'Tadeusz', 'Skowron', '452457450', 't.skowron@gmail.com', 'Szewska', '80', '78-450', 'Słupsk', '46442867618'),
('64', 'Teresa', 'Skorupa', '204158950', 't.skorupa@gmail.com', 'Nowowiejska', '11', '75-749', 'Jelenia Góra', '19551218645'),
('65', 'Andrzej', 'Skalski', '544299589', 'a.skalski@gmail.com', 'Kolejowa', '75', '47-362', 'Kalisz', '69636340729'),
('66', 'Marta', 'Sitarski', '843411254', 'm.sitarski@gmail.com', 'Tadeusza Kościuszki', '58', '82-687', 'Grudziądz', '10324522581'),
('67', 'Barbara', 'Sikora', '703531879', 'b.sikora@gmail.com', 'Kazimierza Wielkiego', '31', '95-583', 'Siedlce', '27991964134'),
('68', 'Piotr', 'Sidor', '771154073', 'p.sidor@gmail.com', 'Mieszka I', '26', '48-261', 'Legionowo', '61396635405'),
('69', 'Jan', 'Siczek', '847695706', 'j.siczek@gmail.com', 'Stefana Batorego', '71', '72-755', 'Piła', '61121210698'),
('70', 'Grażyna', 'Siejka', '910649409', 'g.siejka@gmail.com', 'Obrońców Tobruku', '78', '44-369', 'Stargard', '38453413180');









