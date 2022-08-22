﻿/*
Navicat MySQL Data Transfer

Source Server         : M26-RP.org_3306
Source Server Version : 50626
Source Host           : M26-RP.org:3306
Source Database       : M26-RP

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2015-09-26 13:17:14
*/

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Online` int(11) NOT NULL DEFAULT '0',
  `UpdateDate` varchar(32) NOT NULL DEFAULT '',
  `RegiDate` varchar(32) NOT NULL DEFAULT '',
  `LastLogin` varchar(32) NOT NULL DEFAULT '',
  `Username` varchar(32) NOT NULL DEFAULT '',
  `Key` varchar(256) NOT NULL DEFAULT '',
  `Email` varchar(256) NOT NULL DEFAULT '',
  `IP` varchar(32) NOT NULL DEFAULT '0.0.0.0',
  `SecureIP` varchar(32) NOT NULL DEFAULT '0.0.0.0',
  `Registered` int(11) NOT NULL DEFAULT '0',
  `ConnectedTime` int(11) NOT NULL DEFAULT '0',
  `Sex` int(11) NOT NULL DEFAULT '1',
  `Age` int(11) NOT NULL DEFAULT '18',
  `BirthDate` varchar(32) NOT NULL DEFAULT '',
  `Band` int(11) NOT NULL DEFAULT '0',
  `PermBand` int(11) NOT NULL DEFAULT '0',
  `Warnings` int(11) NOT NULL DEFAULT '0',
  `Disabled` int(11) NOT NULL DEFAULT '0',
  `Level` int(11) NOT NULL DEFAULT '1',
  `AdminLevel` int(11) NOT NULL DEFAULT '0',
  `SeniorModerator` int(11) NOT NULL DEFAULT '0',
  `DonateRank` int(11) NOT NULL DEFAULT '0',
  `Respect` int(11) NOT NULL DEFAULT '0',
  `XP` int(11) NOT NULL DEFAULT '0',
  `Money` bigint(11) NOT NULL DEFAULT '5000',
  `Bank` bigint(11) NOT NULL DEFAULT '20000',
  `pHealth` float(10,5) NOT NULL DEFAULT '50.00000',
  `pArmor` float(10,5) NOT NULL DEFAULT '0.00000',
  `pSHealth` float(10,5) NOT NULL DEFAULT '0.00000',
  `Int` int(11) NOT NULL DEFAULT '0',
  `VirtualWorld` int(11) NOT NULL DEFAULT '0',
  `Model` int(11) NOT NULL DEFAULT '299',
  `SPos_x` float(20,5) NOT NULL DEFAULT '0.00000',
  `SPos_y` float(20,5) NOT NULL DEFAULT '0.00000',
  `SPos_z` float(20,5) NOT NULL DEFAULT '0.00000',
  `SPos_r` float(20,5) NOT NULL DEFAULT '0.00000',
  `BanAppealer` int(11) NOT NULL DEFAULT '0',
  `PR` int(11) NOT NULL DEFAULT '0',
  `HR` int(11) NOT NULL DEFAULT '0',
  `AP` int(11) NOT NULL DEFAULT '1',
  `Security` int(11) NOT NULL DEFAULT '0',
  `ShopTech` int(11) NOT NULL DEFAULT '0',
  `FactionModerator` int(11) NOT NULL DEFAULT '0',
  `GangModerator` int(11) NOT NULL DEFAULT '0',
  `Undercover` int(11) NOT NULL DEFAULT '0',
  `TogReports` int(11) NOT NULL DEFAULT '0',
  `Radio` int(11) NOT NULL DEFAULT '0',
  `RadioFreq` int(11) NOT NULL DEFAULT '0',
  `UpgradePoints` int(11) NOT NULL DEFAULT '0',
  `Origin` int(11) NOT NULL DEFAULT '0',
  `Muted` int(11) NOT NULL DEFAULT '0',
  `Crimes` int(11) NOT NULL DEFAULT '0',
  `Accent` int(11) NOT NULL DEFAULT '0',
  `CHits` int(11) NOT NULL DEFAULT '0',
  `FHits` int(11) NOT NULL DEFAULT '0',
  `Arrested` int(11) NOT NULL DEFAULT '0',
  `Phonebook` int(11) NOT NULL DEFAULT '0',
  `LottoNr` int(11) NOT NULL DEFAULT '0',
  `Fishes` int(11) NOT NULL DEFAULT '0',
  `BiggestFish` int(11) NOT NULL DEFAULT '0',
  `Job` int(11) NOT NULL DEFAULT '0',
  `Job2` int(11) NOT NULL DEFAULT '0',
  `Paycheck` int(11) NOT NULL DEFAULT '0',
  `HeadValue` int(11) NOT NULL DEFAULT '0',
  `Jailed` int(11) NOT NULL DEFAULT '0',
  `JailTime` int(11) NOT NULL DEFAULT '0',
  `WRestricted` int(11) NOT NULL DEFAULT '0',
  `Materials` int(11) NOT NULL DEFAULT '0',
  `Crates` int(11) NOT NULL DEFAULT '0',
  `Pot` int(11) NOT NULL DEFAULT '0',
  `Crack` int(11) NOT NULL DEFAULT '0',
  `Nation` int(1) NOT NULL DEFAULT '0',
  `Leader` int(11) NOT NULL DEFAULT '-1',
  `Member` int(11) NOT NULL DEFAULT '-1',
  `Division` int(11) NOT NULL DEFAULT '-1',
  `FMember` int(11) NOT NULL DEFAULT '255',
  `Rank` int(11) NOT NULL DEFAULT '-1',
  `DetSkill` int(11) NOT NULL DEFAULT '0',
  `SexSkill` int(11) NOT NULL DEFAULT '0',
  `BoxSkill` int(11) NOT NULL DEFAULT '0',
  `LawSkill` int(11) NOT NULL DEFAULT '0',
  `MechSkill` int(11) NOT NULL DEFAULT '0',
  `TruckSkill` int(11) NOT NULL DEFAULT '0',
  `DrugsSkill` int(11) NOT NULL DEFAULT '0',
  `ArmsSkill` int(11) NOT NULL DEFAULT '0',
  `SmugglerSkill` int(11) NOT NULL DEFAULT '0',
  `FishSkill` int(11) NOT NULL DEFAULT '0',
  `FightingStyle` int(11) NOT NULL DEFAULT '0',
  `PhoneNr` int(11) NOT NULL DEFAULT '0',
  `Apartment` int(11) NOT NULL DEFAULT '-1',
  `Apartment2` int(11) NOT NULL DEFAULT '-1',
  `Renting` int(11) NOT NULL DEFAULT '-1',
  `CarLic` int(11) NOT NULL DEFAULT '1',
  `FlyLic` int(11) NOT NULL DEFAULT '0',
  `BoatLic` int(11) NOT NULL DEFAULT '1',
  `FishLic` int(11) NOT NULL DEFAULT '1',
  `CheckCash` int(11) NOT NULL DEFAULT '0',
  `Checks` int(11) NOT NULL DEFAULT '0',
  `GunLic` int(11) NOT NULL DEFAULT '1',
  `Gun0` int(11) NOT NULL DEFAULT '0',
  `Gun1` int(11) NOT NULL DEFAULT '0',
  `Gun2` int(11) NOT NULL DEFAULT '0',
  `Gun3` int(11) NOT NULL DEFAULT '0',
  `Gun4` int(11) NOT NULL DEFAULT '0',
  `Gun5` int(11) NOT NULL DEFAULT '0',
  `Gun6` int(11) NOT NULL DEFAULT '0',
  `Gun7` int(11) NOT NULL DEFAULT '0',
  `Gun8` int(11) NOT NULL DEFAULT '0',
  `Gun9` int(11) NOT NULL DEFAULT '0',
  `Gun10` int(11) NOT NULL DEFAULT '0',
  `Gun11` int(11) NOT NULL DEFAULT '0',
  `DrugsTime` int(11) NOT NULL DEFAULT '0',
  `LawyerTime` int(11) NOT NULL DEFAULT '0',
  `LawyerFreeTime` int(11) NOT NULL DEFAULT '0',
  `MechTime` int(11) NOT NULL DEFAULT '0',
  `SexTime` int(11) NOT NULL DEFAULT '0',
  `PayDay` int(11) NOT NULL DEFAULT '0',
  `PayDayHad` int(11) NOT NULL DEFAULT '0',
  `CDPlayer` int(11) NOT NULL DEFAULT '0',
  `Dice` int(11) NOT NULL DEFAULT '0',
  `Spraycan` int(11) NOT NULL DEFAULT '0',
  `Rope` int(11) NOT NULL DEFAULT '0',
  `Cigars` int(11) NOT NULL DEFAULT '0',
  `Sprunk` int(11) NOT NULL DEFAULT '0',
  `Bombs` int(11) NOT NULL DEFAULT '0',
  `Wins` int(11) NOT NULL DEFAULT '0',
  `Loses` int(11) NOT NULL DEFAULT '0',
  `Tutorial` int(11) NOT NULL DEFAULT '0',
  `OnDuty` int(11) NOT NULL DEFAULT '0',
  `Hospital` int(11) NOT NULL DEFAULT '0',
  `Married` int(11) NOT NULL DEFAULT '0',
  `MarriedID` int(11) NOT NULL DEFAULT '-1',
  `MarriedTo` varchar(32) NOT NULL DEFAULT 'Nobody',
  `ContractBy` varchar(32) NOT NULL DEFAULT 'Nobody',
  `ContractDetail` varchar(64) NOT NULL DEFAULT 'None',
  `WantedLevel` int(11) NOT NULL DEFAULT '0',
  `Insurance` int(11) NOT NULL DEFAULT '0',
  `NewMuted` int(11) NOT NULL DEFAULT '0',
  `NewMutedTotal` int(11) NOT NULL DEFAULT '0',
  `AdMuted` int(11) NOT NULL DEFAULT '0',
  `AdMutedTotal` int(11) NOT NULL DEFAULT '0',
  `HelpMute` int(11) NOT NULL DEFAULT '0',
  `Helper` int(11) NOT NULL DEFAULT '0',
  `ReportMuted` int(11) NOT NULL DEFAULT '0',
  `ReportMutedTotal` int(11) NOT NULL DEFAULT '0',
  `ReportMutedTime` int(11) NOT NULL DEFAULT '0',
  `VIPMuted` int(11) NOT NULL DEFAULT '0',
  `VIPMutedTime` int(11) NOT NULL DEFAULT '0',
  `GiftTime` int(11) NOT NULL DEFAULT '0',
  `AdvisorDutyHours` int(11) NOT NULL DEFAULT '0',
  `AcceptedHelp` int(11) NOT NULL DEFAULT '0',
  `AcceptReport` int(11) NOT NULL DEFAULT '0',
  `ShopTechOrders` int(11) NOT NULL DEFAULT '0',
  `TrashReport` int(11) NOT NULL DEFAULT '0',
  `GangWarn` int(11) NOT NULL DEFAULT '0',
  `FactionBanned` int(11) NOT NULL DEFAULT '0',
  `CSFBanned` int(11) NOT NULL DEFAULT '0',
  `VIPInviteDay` int(11) NOT NULL DEFAULT '0',
  `TempVIP` int(11) NOT NULL DEFAULT '0',
  `BuddyInvite` int(11) NOT NULL DEFAULT '0',
  `Tokens` int(11) NOT NULL DEFAULT '0',
  `PTokens` int(11) NOT NULL DEFAULT '0',
  `TriageTime` int(11) NOT NULL DEFAULT '0',
  `PrisonedBy` varchar(32) NOT NULL DEFAULT 'Nobody',
  `PrisonReason` varchar(128) NOT NULL DEFAULT 'None',
  `Flag` varchar(128) NOT NULL DEFAULT '',
  `TaxiLicense` int(11) NOT NULL DEFAULT '0',
  `TicketTime` int(11) NOT NULL DEFAULT '0',
  `Screwdriver` int(11) NOT NULL DEFAULT '0',
  `Smslog` int(11) NOT NULL DEFAULT '0',
  `Wristwatch` int(11) NOT NULL DEFAULT '0',
  `Surveillance` int(11) NOT NULL DEFAULT '0',
  `Tire` int(11) NOT NULL DEFAULT '0',
  `Firstaid` int(11) NOT NULL DEFAULT '0',
  `Rccam` int(11) NOT NULL DEFAULT '0',
  `Receiver` int(11) NOT NULL DEFAULT '0',
  `GPS` int(11) NOT NULL DEFAULT '0',
  `Sweep` int(11) NOT NULL DEFAULT '0',
  `SweepLeft` int(11) NOT NULL DEFAULT '0',
  `Bugged` int(11) NOT NULL DEFAULT '0',
  `pWExists` int(11) NOT NULL DEFAULT '0',
  `pWX` float(10,5) NOT NULL DEFAULT '0.00000',
  `pWY` float(10,5) NOT NULL DEFAULT '0.00000',
  `pWZ` float(10,5) NOT NULL DEFAULT '0.00000',
  `pWVW` int(11) NOT NULL DEFAULT '0',
  `pWInt` int(11) NOT NULL DEFAULT '0',
  `pWValue` int(11) NOT NULL DEFAULT '-1',
  `pWSeeds` int(11) NOT NULL DEFAULT '0',
  `Warrants` varchar(128) NOT NULL DEFAULT '',
  `JudgeJailTime` int(11) NOT NULL DEFAULT '0',
  `JudgeJailType` int(11) NOT NULL DEFAULT '0',
  `BeingSentenced` int(11) NOT NULL DEFAULT '0',
  `ProbationTime` int(11) NOT NULL DEFAULT '0',
  `DMKills` int(11) NOT NULL DEFAULT '0',
  `Order` varchar(63) NOT NULL DEFAULT '',
  `OrderConfirmed` int(11) NOT NULL DEFAULT '0',
  `CallsAccepted` int(11) NOT NULL DEFAULT '0',
  `PatientsDelivered` int(11) NOT NULL DEFAULT '0',
  `LiveBanned` int(11) NOT NULL DEFAULT '0',
  `FreezeBank` int(11) NOT NULL DEFAULT '0',
  `FreezeHouse` int(11) NOT NULL DEFAULT '0',
  `FreezeCar` int(11) NOT NULL DEFAULT '0',
  `Hydration` int(11) NOT NULL DEFAULT '0',
  `DoubleEXP` int(11) NOT NULL DEFAULT '0',
  `EXPToken` int(11) NOT NULL DEFAULT '0',
  `RacePlayerLaps` int(11) NOT NULL DEFAULT '0',
  `Ringtone` int(11) NOT NULL DEFAULT '0',
  `VIPM` int(11) NOT NULL DEFAULT '0',
  `VIPMO` int(11) NOT NULL DEFAULT '0',
  `VIPExpire` int(11) NOT NULL DEFAULT '0',
  `VIPSold` int(11) NOT NULL DEFAULT '0',
  `GVip` int(11) NOT NULL DEFAULT '0',
  `Speedo` int(11) NOT NULL DEFAULT '0',
  `Firework` int(11) NOT NULL DEFAULT '0',
  `Boombox` int(11) NOT NULL DEFAULT '0',
  `DrawChance` int(11) NOT NULL DEFAULT '0',
  `GoldBoxTokens` int(11) NOT NULL DEFAULT '0',
  `RewardHours` float(10,5) NOT NULL DEFAULT '0.00000',
  `DMRMuted` int(11) unsigned NOT NULL DEFAULT '0',
  `Watchdog` int(11) unsigned NOT NULL DEFAULT '0',
  `CarsRestricted` tinyint(2) NOT NULL DEFAULT '0',
  `Flagged` tinyint(2) NOT NULL DEFAULT '0',
  `LepPoints` int(11) unsigned NOT NULL DEFAULT '0',
  `LepSafePoints` int(11) NOT NULL DEFAULT '0',
  `LastCarWarning` int(11) NOT NULL DEFAULT '0',
  `CarWarns` int(11) NOT NULL DEFAULT '0',
  `Scripter` int(11) NOT NULL DEFAULT '0',
  `Hours` int(11) NOT NULL DEFAULT '0',
  `Paper` int(11) NOT NULL DEFAULT '0',
  `MailEnabled` int(11) NOT NULL DEFAULT '1',
  `Mailbox` int(11) NOT NULL DEFAULT '0',
  `UnreadMails` int(11) NOT NULL DEFAULT '0',
  `TreasureSkill` int(5) NOT NULL DEFAULT '0',
  `MetalDetector` int(5) NOT NULL DEFAULT '0',
  `HelpedBefore` int(11) NOT NULL DEFAULT '0',
  `Business` int(11) NOT NULL DEFAULT '-1',
  `BusinessRank` int(11) NOT NULL DEFAULT '-1',
  `Trickortreat` int(11) NOT NULL DEFAULT '0',
  `RHMutes` int(1) NOT NULL DEFAULT '0',
  `RHMuteTime` int(11) NOT NULL DEFAULT '0',
  `GiftCode` int(11) NOT NULL DEFAULT '0',
  `Table` int(11) NOT NULL DEFAULT '0',
  `OpiumSeeds` int(11) NOT NULL DEFAULT '0',
  `RawOpium` int(11) NOT NULL DEFAULT '0',
  `Heroin` int(11) NOT NULL DEFAULT '0',
  `Syringe` int(11) NOT NULL DEFAULT '0',
  `Skins` int(2) NOT NULL DEFAULT '0',
  `Hunger` int(11) NOT NULL DEFAULT '50',
  `HungerTimer` int(11) NOT NULL DEFAULT '0',
  `HungerDeathTimer` int(11) NOT NULL DEFAULT '0',
  `Fitness` int(11) NOT NULL DEFAULT '0',
  `Coin` int(11) NOT NULL DEFAULT '0',
  `LastCharmReceived` int(11) NOT NULL DEFAULT '0',
  `HealthCare` int(11) NOT NULL DEFAULT '0',
  `TotalCredits` int(11) NOT NULL DEFAULT '0',
  `911Muted` int(11) NOT NULL DEFAULT '0',
  `ForcePasswordChange` int(11) NOT NULL DEFAULT '0',
  `ReceivedCredits` int(11) NOT NULL DEFAULT '0',
  `Pin` varchar(256) NOT NULL DEFAULT '',
  `RimMod` int(11) NOT NULL DEFAULT '0',
  `Tazer` int(11) NOT NULL DEFAULT '0',
  `Cuff` int(11) NOT NULL DEFAULT '0',
  `CarVoucher` int(11) NOT NULL DEFAULT '0',
  `ReferredBy` varchar(32) NOT NULL DEFAULT 'Nobody',
  `PendingRefReward` int(11) NOT NULL DEFAULT '0',
  `Refers` int(11) NOT NULL DEFAULT '0',
  `Developer` int(11) NOT NULL DEFAULT '0',
  `Famed` int(11) NOT NULL DEFAULT '0',
  `FamedMuted` int(11) NOT NULL DEFAULT '0',
  `DefendTime` int(11) NOT NULL DEFAULT '0',
  `VehicleSlot` int(11) NOT NULL DEFAULT '0',
  `PVIPVoucher` int(11) NOT NULL DEFAULT '0',
  `ToySlot` int(11) NOT NULL DEFAULT '0',
  `RFLTeam` int(11) NOT NULL DEFAULT '-1',
  `RFLTeamL` int(11) NOT NULL DEFAULT '-1',
  `VehVoucher` int(11) NOT NULL DEFAULT '0',
  `SVIPVoucher` int(11) NOT NULL DEFAULT '0',
  `GVIPVoucher` int(11) NOT NULL DEFAULT '0',
  `GiftVoucher` int(11) NOT NULL DEFAULT '0',
  `FallIntoFun` int(11) NOT NULL DEFAULT '0',
  `ContactSlot` int(11) NOT NULL DEFAULT '0',
  `HungerVoucher` int(11) NOT NULL DEFAULT '0',
  `Vials` int(11) NOT NULL DEFAULT '0',
  `BoughtCure` int(11) NOT NULL DEFAULT '0',
  `AdvertVoucher` int(11) NOT NULL DEFAULT '0',
  `ShopCounter` int(11) NOT NULL DEFAULT '0',
  `ShopNotice` int(11) NOT NULL DEFAULT '0',
  `SVIPExVoucher` int(11) NOT NULL DEFAULT '0',
  `GVIPExVoucher` int(11) NOT NULL DEFAULT '0',
  `VIPSellable` int(11) NOT NULL DEFAULT '0',
  `ReceivedPrize` int(11) NOT NULL DEFAULT '0',
  `Ammo1` int(11) NOT NULL DEFAULT '0',
  `Ammo2` int(11) NOT NULL DEFAULT '0',
  `Ammo3` int(11) NOT NULL DEFAULT '0',
  `Ammo4` int(11) NOT NULL DEFAULT '0',
  `Ammo5` int(11) NOT NULL DEFAULT '0',
  `Ammo6` int(11) NOT NULL DEFAULT '0',
  `Ammo7` int(11) NOT NULL DEFAULT '0',
  `Ammo8` int(11) NOT NULL DEFAULT '0',
  `wSaveSlot1` int(11) NOT NULL DEFAULT '0',
  `wSaveSlot2` int(11) NOT NULL DEFAULT '0',
  `wSaveSlot3` int(11) NOT NULL DEFAULT '0',
  `wSaveSlot4` int(11) NOT NULL DEFAULT '0',
  `wSaveSlot5` int(11) NOT NULL DEFAULT '0',
  `wSaveSlot6` int(11) NOT NULL DEFAULT '0',
  `wSaveSlot7` int(11) NOT NULL DEFAULT '0',
  `wSaveSlot8` int(11) NOT NULL DEFAULT '0',
  `aSaveSlot1` int(11) NOT NULL DEFAULT '0',
  `aSaveSlot2` int(11) NOT NULL DEFAULT '0',
  `aSaveSlot3` int(11) NOT NULL DEFAULT '0',
  `aSaveSlot4` int(11) NOT NULL DEFAULT '0',
  `aSaveSlot5` int(11) NOT NULL DEFAULT '0',
  `aSaveSlot6` int(11) NOT NULL DEFAULT '0',
  `aSaveSlot7` int(11) NOT NULL DEFAULT '0',
  `aSaveSlot8` int(11) NOT NULL DEFAULT '0',
  `invMaxSlot` int(11) NOT NULL DEFAULT '3',
  `FacGuns1` int(11) NOT NULL DEFAULT '0',
  `FacGuns2` int(11) NOT NULL DEFAULT '0',
  `FacGuns3` int(11) NOT NULL DEFAULT '0',
  `FacGuns4` int(11) NOT NULL DEFAULT '0',
  `FacGuns5` int(11) NOT NULL DEFAULT '0',
  `FacGuns6` int(11) NOT NULL DEFAULT '0',
  `FacGuns7` int(11) NOT NULL DEFAULT '0',
  `FacGuns8` int(11) NOT NULL DEFAULT '0',
  `Hambuger` int(11) NOT NULL DEFAULT '0',
  `Pizza` int(11) NOT NULL DEFAULT '0',
  `BanhMi` int(11) NOT NULL DEFAULT '0',
  `Hyperion` int(11) NOT NULL DEFAULT '0',
  `ThanhGo` int(11) NOT NULL DEFAULT '0',
  `HopGiay` int(11) NOT NULL DEFAULT '0',
  `TuaVitHP` int(11) NOT NULL DEFAULT '0',
  `ThungXang` int(11) NOT NULL DEFAULT '0',
  `ThungXangHP` float(20,5) NOT NULL DEFAULT '0',
  `JModel` int(11) NOT NULL DEFAULT '0',
  `FacAmmo1` int(11) NOT NULL DEFAULT '0',
  `FacAmmo2` int(11) NOT NULL DEFAULT '0',
  `FacAmmo3` int(11) NOT NULL DEFAULT '0',
  `FacAmmo4` int(11) NOT NULL DEFAULT '0',
  `FacAmmo5` int(11) NOT NULL DEFAULT '0',
  `FacAmmo6` int(11) NOT NULL DEFAULT '0',
  `FacAmmo7` int(11) NOT NULL DEFAULT '0',
  `FacAmmo8` int(11) NOT NULL DEFAULT '0',
  `Neon` int(11) NOT NULL DEFAULT '0',
  `C4Robbank` int(11) NOT NULL DEFAULT '0',
  `SuaBo` int(11) NOT NULL DEFAULT '0',
  `Balo` int(11) NOT NULL DEFAULT '0',
  `KKDaQuy` int(11) NOT NULL DEFAULT '0',
  `DLDate` int(11) NOT NULL DEFAULT '32',
  `DLRewardBox0` int(11) NOT NULL DEFAULT '2',
  `DLRewardBox1` int(11) NOT NULL DEFAULT '2',
  `DLRewardBox2` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`,`Username`),
  KEY `Username` (`Username`(5))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `accounts` VALUES ('1', '0', '', '', '2016-07-19 20:01:09', 'Thai_Nguyen', '4E0658D00F47D86D19A0E792E4BB94B16DB2E902D307DA5637F57CF60E7A174CB4BB6D7095621745B2065DF0C87B77AF69F5D0FBD63359AD3CC6B72F076C3E1E', 'default@email.com', '127.0.0.1', '0.0.0.0', '1', '0', '1', '18', '1999-03-30', '0', '0', '0', '0', '1', '99999', '0', '0', '0', '0', '50000', '20000', '100.00000', '0.00000', '0.00000', '0', '0', '220', '1972.46997', '-2262.62988', '13.54000', '89.99000', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '27', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '-1', '-1', '255', '255', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '-1', '-1', '1', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '27', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '-1', 'Nobody', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Nobody', 'None', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '0', '0.00000', '0.00000', '0.00000', '0', '0', '-1', '0', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.00000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '-1', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '27', '27', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '0', '0', '0', 'Nobody', '0', '0', '0', '0', '0', '0', '0', '0', '0', '-1', '-1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.00000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '32', '2', '2', '2');