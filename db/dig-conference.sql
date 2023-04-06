-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.4.26-MariaDB-1:10.4.26+maria~ubu2004-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `administrativeArea` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dependentLocality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postalCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortingCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addressLine1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addressLine2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organizationTaxId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fgxjaumckyepurnoeirqzfooxdtlgvvdbdln` (`ownerId`),
  CONSTRAINT `fk_fgxjaumckyepurnoeirqzfooxdtlgvvdbdln` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qiaivxlnebadurokqceteymtudiejixtszgb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_awjcgrahiszoghtvmnvrjndedczphugyfwoo` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_kmgwflkdzejsnjvjutssmnndnygpukbuebtj` (`dateRead`),
  KEY `fk_khlbgqqfwshglpplgonbtoitbnwmnubximls` (`pluginId`),
  CONSTRAINT `fk_ihehxhkmermccluijapjemotahwyssksctov` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_khlbgqqfwshglpplgonbtoitbnwmnubximls` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT 0,
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT 0,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_itsonuevxumdkuwmhdhwerhovcfrtefpkaoh` (`volumeId`),
  KEY `idx_byutviuexvfqcbfajqyaqnddokpaecovcpgw` (`volumeId`),
  KEY `fk_wlphbvbdlrkomfmianvtxuhfjjfejphfzzmc` (`sessionId`),
  CONSTRAINT `fk_atkfihayrryvfkfcteqieyfbgqahyumuabwl` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wlphbvbdlrkomfmianvtxuhfjjfejphfzzmc` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT 0,
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT 0,
  `isCli` tinyint(1) DEFAULT 0,
  `actionRequired` tinyint(1) DEFAULT 0,
  `processIfRootEmpty` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `alt` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cuqzpputotuazxqiklqyguadhlexgmgkdkzw` (`filename`,`folderId`),
  KEY `idx_jhmjvcfonqaokjqzosvspvwglwmquodimkjp` (`folderId`),
  KEY `idx_plkuvxhkhcvoxjhavkwhxrthcfwlbpdsjide` (`volumeId`),
  KEY `fk_xjyvatocmupeslhplqqutmwfyyeqvongklhb` (`uploaderId`),
  CONSTRAINT `fk_hlixvumasokuwtktzakisjmtkxcvwpmprftr` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lssqclpmdjnwnhabrvhdquswsokmsnldlsdy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_numtuyswujoeixxmoxgeghawemcbejzmjrqc` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xjyvatocmupeslhplqqutmwfyyeqvongklhb` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_wbrpdcesnjnzyhdhyquahowagjbmdcrlrayk` (`groupId`),
  KEY `fk_fzamgtprazhuhwzitffwrxaalaoomnhqtomp` (`parentId`),
  CONSTRAINT `fk_enahvsdmvkyimheyyodvmpteqlyvrsdzinit` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fzamgtprazhuhwzitffwrxaalaoomnhqtomp` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ughtlhdfebdsmfoxnuwjpwzkmegxjocvsbyb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_akgtmmgntrhlcanmpyojffxstljhvqzfspcv` (`name`),
  KEY `idx_pjdcqmsegmuckapcfmuszxlhfntlosblfmwc` (`handle`),
  KEY `idx_zhyemojtegjubhitboxjrqrflkmztpqkpyxn` (`structureId`),
  KEY `idx_bpjqluijyvppnxtqodwmhkifgekzsmrwvkrw` (`fieldLayoutId`),
  KEY `idx_pgezcqqfwhzrwrxewlfhtufywfshzfnsvsnv` (`dateDeleted`),
  CONSTRAINT `fk_gdnolxwwbnxlsobfdfjuqwkmiqnbaytpqocy` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hfjxwcmwuxqfkvggeuywejonvzerdpszcfng` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gmagypweubnutgflbjjadwvjoeijtdxeanaf` (`groupId`,`siteId`),
  KEY `idx_lxdtmuaokcnqsltmvbqhwecoezfahsvcmdnw` (`siteId`),
  CONSTRAINT `fk_edftssltxlaqhcbnvkjvvptdnwqyqimhxvqz` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_indjumwetopgyeadrnuwcisdurlkunjoxsrs` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_spkpjrzvempuaecrphtmazteovdsxhdtzfdl` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_sfeqiaasdqiunulfkrkzqnnsoufjktappxth` (`siteId`),
  KEY `fk_kvmabjupzyfutltnttanjovumnmdissxdgbb` (`userId`),
  CONSTRAINT `fk_awmcseyaalpicepufuytdfuywqakzyrimgvu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kvmabjupzyfutltnttanjovumnmdissxdgbb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_sfeqiaasdqiunulfkrkzqnnsoufjktappxth` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_wegotxouattqirzgbvfhzcpqajdcnpiqhvgs` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_yspoacsyozhqptbhnnzxjdaqrhzraevomyzj` (`siteId`),
  KEY `fk_vilyvmvcjjwojjqhwcvvcrfzhtxyskuijjcs` (`fieldId`),
  KEY `fk_znkraoorvjjjddqgmyvlugqmxdxfqdtsedhm` (`userId`),
  CONSTRAINT `fk_srursylesshftzkvdkxtkaqougeozpdubhyr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vilyvmvcjjwojjqhwcvvcrfzhtxyskuijjcs` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yspoacsyozhqptbhnnzxjdaqrhzraevomyzj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_znkraoorvjjjddqgmyvlugqmxdxfqdtsedhm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_date_bhgwtomc` datetime DEFAULT NULL,
  `field_startTime_rortsxhy` time DEFAULT NULL,
  `field_endTime_qozjxvrp` time DEFAULT NULL,
  `field_orgName_iqviaavg` varchar(800) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_altTag_bczzioby` varchar(800) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_heroHeadlineH1_buypcalv` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_heroSubhead_ymvviltp` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fqvqfgqmhwixqvmzgaepquhcmzhdbnsmmifx` (`elementId`,`siteId`),
  KEY `idx_gbxoueobnnprwfxbqpkkeoylklgzstvjscrn` (`siteId`),
  KEY `idx_jtibmybfghbtvymwsdrbzgnijznlwrheytgh` (`title`),
  CONSTRAINT `fk_piyriimnlclvvizdhyohkhkjctlmpibbytbm` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yaondapwllotiwowdkcjmzcsxowflnirfskz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_xcojylxzsmrhqxexbuxkiiurnrwopzspfgah` (`userId`),
  CONSTRAINT `fk_xcojylxzsmrhqxexbuxkiiurnrwopzspfgah` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hqdnarpcikyconbuxqrbahpvnmvritehnbdb` (`key`,`fingerprint`)
) ENGINE=InnoDB AUTO_INCREMENT=445 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_zrtbomgmnbvthwwjozafllohmmklfpdjrcnp` (`creatorId`,`provisional`),
  KEY `idx_bqpxkaynoufcntczrerijkosbldepucwaltx` (`saved`),
  KEY `fk_smxzlonbfziokweyjjinnbsoqivqihqffnqt` (`canonicalId`),
  CONSTRAINT `fk_smxzlonbfziokweyjjinnbsoqivqihqffnqt` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yshgstitshqtpkdsctomyjbnlhhczurbmwpi` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wdozexxjbhmkigsbykzafzwrmtooejqlaxme` (`dateDeleted`),
  KEY `idx_kakalnvojskdvtzqpkvrxbhxzbmloiyjucis` (`fieldLayoutId`),
  KEY `idx_toiojlcsthaxebuwxbquutgxjjaqugnwsacq` (`type`),
  KEY `idx_bupqziknvinwcyiilpkdiwaplirctqgbwuuo` (`enabled`),
  KEY `idx_lgahehutiiabogzyaavofdwglugmbfviduae` (`archived`,`dateCreated`),
  KEY `idx_eiurycpqyvdwyqtqzfhxpxrkifmokpgsrtll` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `fk_uapjaxozkdaklmlwphucpjfrabqlnczhunnw` (`canonicalId`),
  KEY `fk_dgnqmvcarizgewqyfhgebmxcxqrylydrhhef` (`draftId`),
  KEY `fk_zjowtinrpopcegbjjkcjvjhmhcbdgxawvlbf` (`revisionId`),
  KEY `idx_biewhdupdrxbjrwameybxvrvdexaboknpvdu` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  CONSTRAINT `fk_bjlkxukykdhschlsiocgccbmjenicgbpwprb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_dgnqmvcarizgewqyfhgebmxcxqrylydrhhef` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uapjaxozkdaklmlwphucpjfrabqlnczhunnw` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zjowtinrpopcegbjjkcjvjhmhcbdgxawvlbf` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zlmewlmzjmpekmiqjntjqntflafsfkrrvuvz` (`elementId`,`siteId`),
  KEY `idx_wnaflxsuqbqueqljmpknnvigxdpdgwmdwzkw` (`siteId`),
  KEY `idx_mxrhwioepgzhjbmsvmopfaxtxkbtbviuvxre` (`slug`,`siteId`),
  KEY `idx_baosbxczuqzsgvdxmatsykditgkaxbnvdmuc` (`enabled`),
  KEY `idx_qxjizyojojdrcfgitkocoisxllbzcjzaogne` (`uri`,`siteId`),
  CONSTRAINT `fk_kujdaujcstxzwpgwrgnklahklbdnpaowwbfe` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_voplzgaendbqxqkstvxyeqrqykyvpzxawzrq` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fidgkivgzneeaqnxvzkbjktkoiordtqdxroi` (`postDate`),
  KEY `idx_rdwaldkxxrduavyahrbkktcwxejvrnfcecaz` (`expiryDate`),
  KEY `idx_lvadviidiyvlfzhaouiwfltmfpjkiburqrcj` (`authorId`),
  KEY `idx_ryphjjicdfwpufxmbdjhcmuptzdpfnyyjotg` (`sectionId`),
  KEY `idx_yypagejbaeovrpyflwoejxbzjckbadgipogy` (`typeId`),
  KEY `fk_gqhoxgkcgjymwcctpoepiiasskgcybwoppvz` (`parentId`),
  CONSTRAINT `fk_gqhoxgkcgjymwcctpoepiiasskgcybwoppvz` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hdahafhrnzzvtgpeifyytffdtmzrpkftzppq` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kragbfbtlqvsuughhiiydehupzxrxcoxakxf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_luoruiagsqyjltuihoqqnpzuvtclwmxrjljl` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rrozqldpbdhnzfcaulxyxohichiddtuysprx` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pdgfnhzorytgcuhltocayidzvqiuvccdcfbu` (`name`,`sectionId`),
  KEY `idx_vidxncahlhgktptnsocfeubntnwilsyymkuz` (`handle`,`sectionId`),
  KEY `idx_izxmbbhttjbdkwpvfhitjbulzpzyowoyyepx` (`sectionId`),
  KEY `idx_rpezbqavhzusygomyydwmmsaddcofsedssoz` (`fieldLayoutId`),
  KEY `idx_rawbjtncfmbsszrxiignbiftmeoxxddwkgzv` (`dateDeleted`),
  CONSTRAINT `fk_nzpsogybsqwnouzpnjskfpcldocmwokyqcaa` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_prbcrqpqvxwfodevhsojodxwcznaucckxoeh` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_egbintzyuebpxslpjvkoosnalonxofmrpfbp` (`name`),
  KEY `idx_erqsxvsoyejhisnaxjvubnjekkpegyxlrvqt` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_loeaegmieykxswuekzcilfdjnvmhlcznnpnj` (`layoutId`,`fieldId`),
  KEY `idx_gpxhfbejkzqllyauitsmpinmxegsrvvtpmrx` (`sortOrder`),
  KEY `idx_qdahzfwcfuuvloevqxqdkksboohpmsebcexx` (`tabId`),
  KEY `idx_pgmzbkmnjbcdwgtnixmsdcoplbynmvcmdean` (`fieldId`),
  CONSTRAINT `fk_llvpvwmebuovsghvuauclclsrnppoeqpkjwi` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lzgyuhmtcqtzugzcpvkbeutrewmgdshbrjwp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ydmgelrsorbfruayvcsgkpordattenqjcvhl` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ebukpgwlptytennhnqungfbgduuoaybsgvip` (`dateDeleted`),
  KEY `idx_lkopbekuumkobhkrbbgnqlmhcwmvnaxemkfl` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `elements` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_odwyhnbcrfqlnbpcowchbugixenurfepvyxd` (`sortOrder`),
  KEY `idx_xhmumgeaqdrhbvmzysrtbwfwawpaedpomrhq` (`layoutId`),
  CONSTRAINT `fk_axzzrmqiqygcvujyqaicltyzdymtboubnonl` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wlgbeymshwnhynhzaxhcxosnxtvercxmvpai` (`handle`,`context`),
  KEY `idx_xdtuyoxwqogcqzjyjyivurtwfhlkpavimbwc` (`groupId`),
  KEY `idx_xfifetzyylrwwvymvtabjfbsqfeovvxsilfy` (`context`),
  CONSTRAINT `fk_qsbeoatoxpyiaoxufzjtsezzrwjjtontemjr` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rxjqnekpycocqorovrdwvlfsgymilgqisyfa` (`name`),
  KEY `idx_xjglbaxanbvqbpdkylzociuxyghowfeazbfa` (`handle`),
  KEY `idx_tvqqhikxdfskruvrpbhlipxvobomjvjbzpis` (`fieldLayoutId`),
  KEY `idx_rlbubsqswheyjnulntzbpwqqdonjpcjsbbhf` (`sortOrder`),
  CONSTRAINT `fk_lkchrpgezyralwtickofeiqionohornbecjx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xrxdzgqyqoweyzxmboqfwdiaoykrjcdvlatk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uvfcbwyfvumqszvlimffpufrymwutyzkrxmd` (`accessToken`),
  UNIQUE KEY `idx_lmxziufpszxkiuakjdkslzlcvlgehbtivams` (`name`),
  KEY `fk_pxahgzewzoipyyznkrdgscyftzvuheiwhjgl` (`schemaId`),
  CONSTRAINT `fk_pxahgzewzoipyyznkrdgscyftzvuheiwhjgl` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transformString` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_puspgpjrcssxoqytcbekiublgfqgwnscblvk` (`assetId`,`format`,`transformString`),
  KEY `idx_wslsjhhdpnzpxcztldmhfhhpmkfuccblipgx` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `fill` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT 1,
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ohdkttabmnwsgbcormlyxxdimzsoyjznczyd` (`name`),
  KEY `idx_sryigailzbumhrapwnkgbachzswfcmcidqtf` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pydkkhnvyzqakidxbpslfabhdhohddzgedrw` (`primaryOwnerId`),
  KEY `idx_tkzbtyjntmksmnrericdcsfvhdlemsddlbtv` (`fieldId`),
  KEY `idx_pkfckoxirbalcpboqjxebynkjjomkjsmkatp` (`typeId`),
  CONSTRAINT `fk_fwckfoimhamyhgauuziesmarwbgpicpdgqtf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lawqdybjoeoxpnnfroqqtcyhjunebcseszlz` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ledvylemzstcrughmmtplpjueztlorvopvpa` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lgxdmlntkpumvvmspbiwfbfyslodjeixkxmt` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_eltxwtytpzxmcxsyikiyzyqzczbbfkqiefas` (`ownerId`),
  CONSTRAINT `fk_eltxwtytpzxmcxsyikiyzyqzczbbfkqiefas` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sdcxiabentolfgtwlkyjhnefvxwvskrgcddu` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lrcxysplrsolnbnztnffnkfjammqyrudfmeo` (`name`,`fieldId`),
  KEY `idx_phipxmubwvdlkkixfzbvezcycbvizywqtttj` (`handle`,`fieldId`),
  KEY `idx_ljocrxdsfbxuywfpwzkiedyqaezakcvdflsu` (`fieldId`),
  KEY `idx_pyvwffnluklsxjvnnnrapzihkliuorbmtmdf` (`fieldLayoutId`),
  CONSTRAINT `fk_exdvrbbdsmgwrojiohjtaysuznbrbufwzkyj` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_grfbpciqcluqkokrxkjndgdznqzsvgpgvwvl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ydzxbzsoytfbpthfvbwisziyobsvvtetzzrl` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cwnlpstszhsngjblrciopnzopyawlvuclnvz` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_khztxnhunmvkksyilnwbnskoaajrufbytupz` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_ptyqvywnwyaayfcrgxxvgjwfeoucxwvqchix` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pksotshjldudncececxuiuarwinahskzyfnk` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_yudwdvzmmavoiujfudthjdthsdxygvqgdhqz` (`sourceId`),
  KEY `idx_jtudyfvhenhxjpazvbawfxvrjkpgglbucloj` (`targetId`),
  KEY `idx_xkpjkyvlscazmgljcqpcnrnwwbpcetwsqxux` (`sourceSiteId`),
  CONSTRAINT `fk_tnjyapbuqxeogodccepgycmvnacyarhjhcwb` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xglbgacpnopvsqgdroyxkypydcrrlloaydrr` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xhigngqtndbbiremjpjcgsqxrjrkgnosempw` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_oaeekguztlwgvlxeymrflrjzvlhfuamdhrbt` (`canonicalId`,`num`),
  KEY `fk_jiadsvsndaxjgpodcjhxptwqermsjwpcguvt` (`creatorId`),
  CONSTRAINT `fk_jiadsvsndaxjgpodcjhxptwqermsjwpcguvt` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_slfpyijyosmkwoqbhwfcptxiqalrlybunwvc` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_eqgwekordlhwcqeajqvifoymcmxyqihzbcuv` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_liujfdacyisgpybjzfugorfhsrjoibvxtphp` (`handle`),
  KEY `idx_hiextkaooivyjmxrtmtwgzdrfcmhxaztqvck` (`name`),
  KEY `idx_ervrhpmwgwoedazzjtrvvekxveqbcstkchfd` (`structureId`),
  KEY `idx_iljvwccrpagngisbhmhcoiyeuxxztopmaktm` (`dateDeleted`),
  CONSTRAINT `fk_omtinrvlftmacgfzulcyuwyaaojkiztddisk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uomgpdrprbqmiieiezqmlhajfrakcproeheb` (`sectionId`,`siteId`),
  KEY `idx_fwmzhybpcwnyatqomxophbqdqzeeskzvcvyg` (`siteId`),
  CONSTRAINT `fk_aikgpxplkcixxdzadwuaaqllnevjlpmbdhbr` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ebqkjypqidvbdbzvsfutkhouuczcauqgfvur` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cxdphhcrkcqprexozmeyurbjgeqfibzcuvlx` (`uid`),
  KEY `idx_nqaifawgodtclukifpzzdljthvfcjgkghvwa` (`token`),
  KEY `idx_huidnafwzjjqhfmyakwsahcwauqqmbshqaup` (`dateUpdated`),
  KEY `idx_saxxwwtxzzckbfrftjejicusvgifhrbnvxdh` (`userId`),
  CONSTRAINT `fk_ihwcppgldrhkiugltfxffomzlsftmpmtglvh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_glnihamtaeifndrmbkjjjmiergotlooqwwap` (`userId`,`message`),
  CONSTRAINT `fk_jzpsdfxjtvrpzuddxtbetuyatkkizbyhpgao` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qvnxcvppvvzuyoiwwliktudereodenybzjzp` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'true',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jmmelgoolzpvekjbdnhvetdsbutnqlmtphtn` (`dateDeleted`),
  KEY `idx_xcwhlyfktkdzppjntosdgdtixyofwjpkindo` (`handle`),
  KEY `idx_pdvkvknnmgoksmtrjhadminsxapcisqfzcph` (`sortOrder`),
  KEY `fk_jnlgktefczbpzerambhzjnwfoubdtgtidcps` (`groupId`),
  CONSTRAINT `fk_jnlgktefczbpzerambhzjnwfoubdtgtidcps` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sprig_playgrounds`
--

DROP TABLE IF EXISTS `sprig_playgrounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sprig_playgrounds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `component` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `variables` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dfvowoqfddzztrlnpnnrdlrzxtfhhzjyibyj` (`structureId`,`elementId`),
  KEY `idx_iowsrzpvefdkorbidxphbbftdeqnfwombcac` (`root`),
  KEY `idx_gvkejpmckxguitudgcfrxzavfjxlmkiaudyl` (`lft`),
  KEY `idx_cabjjegtafazkxyzmetdjinkcbevpdkvoagj` (`rgt`),
  KEY `idx_ijmzvjnucvehhwykvajnvarzkdrxuwiiaube` (`level`),
  KEY `idx_pzvvhqcespvrwsmrneebhfjsukmqupyejtgz` (`elementId`),
  CONSTRAINT `fk_zlffjqcetxcmexiekruetiopybxwlegjarii` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yldujfuwlkervfuseicnqhsvmdivqxucxbtg` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uwnekclpryalgjebvcajeloamftrorqvbyxq` (`key`,`language`),
  KEY `idx_rmkcfwwtfrbmnshnmxvuypcpazufcoqbceta` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rnzhbosbxyjvvetzjulzwwcmhamfmovcvlrq` (`name`),
  KEY `idx_djupmdmnsibrpmakpcagnrcfrysmteomsryo` (`handle`),
  KEY `idx_qunscsqinusxmwwalounhnmnvijrdrzblerx` (`dateDeleted`),
  KEY `fk_bwmorguglmhggnpbkpvxbfnqxzaabbffvvij` (`fieldLayoutId`),
  CONSTRAINT `fk_bwmorguglmhggnpbkpvxbfnqxzaabbffvvij` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rjynzlvzgybkfimyyxgatnjdumpzdvmbwsld` (`groupId`),
  CONSTRAINT `fk_hxkpvgelpshapjfmzsaqscdpzexqlcnfyvqj` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wocqakvxrzsefouolnxqvwjfppprhuksdezf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bcllyjcwdcrboyvqvgjrnulhdhcunbakdkqu` (`token`),
  KEY `idx_pqdhkzyaslldpszswdpwhcwkrzvnviscqcxq` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bohqmnulfdxayzjveulunwfjpdnytqwfqflg` (`handle`),
  KEY `idx_fvggdkdvdrnkdqljmagcbceodnxynhrzxsid` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nvnlzmrdgvretzzqiayvxsnpepwmqenmflcc` (`groupId`,`userId`),
  KEY `idx_hxatepehohfaumivvcfccoybrxcgjrddwsvp` (`userId`),
  CONSTRAINT `fk_mpeenyugkmqxbapqopwdtsiiygcrauhurqrr` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uuzsrqwpemuczjzpxzbpznpuhccmcmuujwqn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_krkrlqhzsuowpoorebbycyefvfwccbuhdldp` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xaougeztdzxjtlrjuvzznascglesvvaczwnl` (`permissionId`,`groupId`),
  KEY `idx_rwxluzmgfjookotfbdvttkbcobdrxxbwngho` (`groupId`),
  CONSTRAINT `fk_dmtvenotmtbrnbzypzzbnnmeqaenxrsmnllk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fmcxzffwsdxotzgjhdenqkjcxxeainhxlbch` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xdnfzfpwzkhsqjtmzywchklhzyebgejzfcad` (`permissionId`,`userId`),
  KEY `idx_tqbwfusylmkdoglvgrwuufxgjpzlwbeufybw` (`userId`),
  CONSTRAINT `fk_voiwmbdufmcfdtddzgzvlkfkbdbipzyeydjn` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ydecdrtfxeuedeeowsuzopjnljgpjlzpanbq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_smckfzdtxqkafghgboaclbefhwkkfryviknu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_nmjpniohzpxkgjeekhstwmdtztwygziwbljg` (`verificationCode`),
  KEY `idx_ywlshtlftfbupxcynhkdffrupsfxivaspldx` (`email`),
  KEY `idx_evowvfvnzgyelbnzbcgrikqakvbhxeszdabv` (`username`),
  KEY `fk_ecapfzmlthpoqybaycoofwlecligqmdkpphg` (`photoId`),
  KEY `idx_bxrngrjobbtonabveekookwdkhggdsxoxkcq` (`active`),
  KEY `idx_gzwldwrtqpbaubookyylddscqfmtwulvbbly` (`locked`),
  KEY `idx_dkwthhebdttwohocgylxgvsrhzkghqowbjdt` (`pending`),
  KEY `idx_sqfgelyarmkrixzpjavvwwwejrjfrytuetbk` (`suspended`),
  CONSTRAINT `fk_coaonbvnssvhiccgiyralypkkewtrjbqgnef` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ecapfzmlthpoqybaycoofwlecligqmdkpphg` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_medkddxudmjbsaowpwlnzbutvqkbokxvsncy` (`name`,`parentId`,`volumeId`),
  KEY `idx_xtzafacdajmyszzjtuvghprnkghagqthqeit` (`parentId`),
  KEY `idx_ulhvegosrswdjffcdxwyghwcapnotyqekzel` (`volumeId`),
  CONSTRAINT `fk_cwzwsxsdzenwcctyamqmkkrouegjipwcqmbe` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_danyjeeejfxvucxqlfveeftdjtpatzoklnbf` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fs` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `transformFs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transformSubpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nfognuuwjjllblyuviqufzibjdnhsefntldu` (`name`),
  KEY `idx_ccwkzfofeyknnwwosoududntmakqkoyvzfuw` (`handle`),
  KEY `idx_mdfnnuciloucwxbieviuadnfwridhqcbkpfm` (`fieldLayoutId`),
  KEY `idx_xgnwmyjffkgzgqgnfvfxuyuldogzyyexcgvs` (`dateDeleted`),
  CONSTRAINT `fk_hsdojmpysvaiolkhyrgmzwgyeshprlzbxjxy` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_owsjnjzupeccoektghbklxrptlfceapluvpc` (`userId`),
  CONSTRAINT `fk_jepjozvytnbusopcmrznjexritwuememrixk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-29 16:44:11
-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.4.26-MariaDB-1:10.4.26+maria~ubu2004-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (44,1,1,1,'DIG-Logo.svg','image',NULL,187,74,4687,NULL,NULL,NULL,'2021-11-10 14:04:22','2021-11-05 22:13:05','2021-11-10 14:04:32'),(45,1,1,1,'Footer-logo.svg','image',NULL,75,74,3530,NULL,NULL,NULL,'2021-11-10 14:03:34','2021-11-05 22:15:20','2021-11-10 14:03:34'),(64,1,1,1,'DIG-Logo.png','image',NULL,188,76,2493,NULL,0,0,'2023-03-29 15:41:23','2023-03-29 15:41:23','2023-03-29 15:41:23');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categories` VALUES (6,1,NULL,NULL,'2021-11-04 21:58:20','2021-11-04 21:58:20'),(7,1,NULL,NULL,'2021-11-04 21:58:44','2021-11-04 21:58:44'),(8,1,NULL,NULL,'2021-11-04 21:59:21','2021-11-04 21:59:21');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categorygroups` VALUES (1,2,5,'Workshop Options','workshopOptions','end','2021-11-04 21:57:56','2021-11-04 21:57:56',NULL,'94a2c9bc-5cc0-46ee-abe2-1c327c2c818d');
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categorygroups_sites` VALUES (1,1,1,1,'workshop-options/{slug}',NULL,'2021-11-04 21:57:56','2021-11-04 21:57:56','d1659316-778b-4e25-ac65-278f08aabc88');
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (1,1,'firstName','2021-11-05 23:02:34',0,1),(1,1,'lastName','2021-11-05 23:02:34',0,1),(9,1,'slug','2021-11-04 22:04:19',0,1),(9,1,'title','2021-11-04 22:04:19',0,1),(9,1,'uri','2021-11-04 22:04:19',0,1),(13,1,'slug','2021-11-04 22:09:17',0,1),(13,1,'title','2021-11-04 22:09:17',0,1),(17,1,'slug','2021-11-04 22:09:35',0,1),(17,1,'title','2021-11-04 22:09:35',0,1),(17,1,'uri','2021-11-04 22:09:35',0,1),(19,1,'slug','2021-11-04 22:10:14',0,1),(19,1,'title','2021-11-04 22:10:14',0,1),(19,1,'uri','2021-11-04 22:10:14',0,1),(21,1,'slug','2021-11-04 22:11:02',0,1),(21,1,'title','2021-11-04 22:10:56',0,1),(21,1,'uri','2021-11-04 22:11:02',0,1),(23,1,'slug','2021-11-04 22:11:54',0,1),(23,1,'title','2021-11-04 22:11:54',0,1),(23,1,'uri','2021-11-04 22:11:54',0,1),(25,1,'slug','2021-11-04 22:12:29',0,1),(25,1,'title','2021-11-04 22:12:29',0,1),(25,1,'uri','2021-11-04 22:12:29',0,1),(27,1,'slug','2021-11-04 22:13:14',0,1),(27,1,'title','2021-11-04 22:13:14',0,1),(27,1,'uri','2021-11-04 22:13:14',0,1),(29,1,'slug','2021-11-04 22:15:43',0,1),(29,1,'title','2021-11-04 22:15:43',0,1),(29,1,'uri','2021-11-04 22:15:43',0,1),(31,1,'slug','2021-11-04 22:16:29',0,1),(31,1,'title','2021-11-04 22:16:29',0,1),(31,1,'uri','2021-11-04 22:16:29',0,1),(35,1,'slug','2021-11-04 22:18:18',0,1),(35,1,'title','2021-11-04 22:18:18',0,1),(35,1,'uri','2021-11-04 22:18:18',0,1),(37,1,'postDate','2021-11-04 22:19:39',0,1),(37,1,'slug','2021-11-04 22:19:34',0,1),(37,1,'title','2021-11-06 17:35:55',0,1),(37,1,'uri','2021-11-04 22:19:34',0,1),(39,1,'postDate','2021-11-04 22:20:22',0,1),(39,1,'slug','2021-11-04 22:20:16',0,1),(39,1,'title','2021-11-06 17:36:22',0,1),(39,1,'uri','2021-11-04 22:20:16',0,1),(41,1,'postDate','2021-11-06 17:34:57',0,1),(41,1,'slug','2021-11-04 22:20:49',0,1),(41,1,'title','2021-11-06 17:36:54',0,1),(41,1,'uri','2021-11-04 22:20:49',0,1),(61,1,'email','2023-03-29 16:38:21',0,1),(61,1,'firstName','2023-03-29 16:38:21',0,1),(61,1,'fullName','2023-03-29 16:38:21',0,1),(61,1,'lastName','2023-03-29 16:38:21',0,1),(61,1,'lastPasswordChangeDate','2023-03-28 20:35:05',0,61),(61,1,'password','2023-03-28 20:35:05',0,61),(61,1,'username','2023-03-29 16:38:21',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (2,1,9,'2021-11-05 23:01:01',0,1),(2,1,10,'2023-03-27 16:47:22',0,1),(9,1,1,'2021-11-04 22:07:37',0,1),(13,1,1,'2021-11-04 22:09:17',0,1),(17,1,1,'2021-11-04 22:09:57',0,1),(19,1,1,'2021-11-04 22:10:32',0,1),(21,1,1,'2021-11-04 22:11:26',0,1),(23,1,1,'2021-11-04 22:12:12',0,1),(25,1,1,'2021-11-04 22:12:50',0,1),(27,1,1,'2021-11-04 22:13:43',0,1),(29,1,2,'2021-11-04 22:15:48',0,1),(29,1,3,'2021-11-04 22:17:48',0,1),(29,1,4,'2021-11-04 22:17:48',0,1),(31,1,2,'2021-11-04 22:16:37',0,1),(31,1,3,'2021-11-04 22:16:47',0,1),(31,1,4,'2021-11-04 22:16:55',0,1),(35,1,2,'2021-11-04 22:18:24',0,1),(35,1,3,'2021-11-04 22:18:35',0,1),(35,1,4,'2021-11-04 22:18:43',0,1),(50,1,1,'2021-11-06 15:26:55',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2021-11-04 21:20:27','2021-11-05 23:02:34','8c24e729-5dde-4142-bc3a-16d37ac587b1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,2,1,'Home','2021-11-04 21:33:27','2023-03-27 16:47:22','9186142a-d310-4fb5-b062-e03f3f807f78',NULL,NULL,NULL,NULL,NULL,'DIG Conference','10.5.23  |  BATON ROUGE, LA'),(3,3,1,'Home','2021-11-04 21:33:28','2021-11-04 21:33:28','fd54c4f7-4407-4f6a-9587-9587c7a29e33',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,4,1,'Home','2021-11-04 21:33:28','2021-11-04 21:33:28','d4febc0e-2890-48eb-9524-0fa22bc32530',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,5,1,'Home','2021-11-04 21:33:54','2021-11-04 21:33:54','c7601ff2-2262-4198-9ee8-419ad37f12de',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,6,1,'Development','2021-11-04 21:58:20','2021-11-04 21:58:20','3f282658-f0ed-44db-bc47-3d3f311c8bd4',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,7,1,'Strategy and Content','2021-11-04 21:58:44','2021-11-04 21:58:44','c3390cec-8237-4d09-8afa-aac1a34767e8',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,8,1,'Design','2021-11-04 21:59:21','2021-11-04 21:59:21','425b9e7a-759a-4a15-bb7c-70683ee9aae0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,9,1,'Workshop 1','2021-11-04 22:04:05','2021-11-06 15:26:29','90289853-1abe-4bef-9fad-35cd52afca71',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,10,1,'Workshop 1','2021-11-04 22:04:25','2021-11-04 22:04:25','44555e1b-5091-4c63-8eee-c2faf17d55cc',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,12,1,'Workshop 1','2021-11-04 22:07:37','2021-11-04 22:07:37','f3717385-3ba2-468c-8c82-c2a990057cd1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,13,1,'Workshop 2','2021-11-04 22:08:26','2021-11-04 22:09:17','77d10846-db39-44a1-a47e-36496c0235db',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,14,1,'Workshop 1 copy','2021-11-04 22:08:27','2021-11-04 22:08:27','9b50cdc0-dc3f-492a-b8fd-74a66ff1abd8',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,16,1,'Workshop 2','2021-11-04 22:09:17','2021-11-04 22:09:17','b8588642-1148-4543-9e96-347fd1b1d365',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,17,1,'Workshop 3','2021-11-04 22:09:21','2021-11-04 22:09:58','8e2cfee4-85ad-43d4-aae3-50e66c629bc3',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,18,1,'Workshop 3','2021-11-04 22:09:58','2021-11-04 22:09:58','c06212dd-000c-4ea3-8427-8e6b55eced95',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,19,1,'Workshop 4','2021-11-04 22:10:02','2021-11-04 22:10:37','9378e7a6-7c7c-4621-b934-cd3ff8545df6',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,20,1,'Workshop 4','2021-11-04 22:10:37','2021-11-04 22:10:37','a884cf14-a092-4248-9996-7f83bd9d9200',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,21,1,'Workshop 5','2021-11-04 22:10:42','2021-11-04 22:11:32','b8bef737-3751-4c8a-bdcb-0edde4b3675b',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,22,1,'Workshop 5','2021-11-04 22:11:32','2021-11-04 22:11:32','a61afaeb-fdc0-48d1-b1d2-2bb6632d121e',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,23,1,'Workshop 6','2021-11-04 22:11:36','2021-11-04 22:12:12','4db0c94e-2aaf-4f7d-80eb-1779d02ce0dd',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,24,1,'Workshop 6','2021-11-04 22:12:12','2021-11-04 22:12:12','e30c1aef-a959-4666-b25e-8fe5ca6c7c97',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,25,1,'Workshop 7','2021-11-04 22:12:16','2021-11-04 22:12:50','9a3fdabf-2f18-4a01-afe4-45c63160bdfb',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,26,1,'Workshop 7','2021-11-04 22:12:50','2021-11-04 22:12:50','969d438f-5655-43e6-8947-0525211a80cb',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,27,1,'Workshop 8','2021-11-04 22:12:54','2021-11-04 22:13:44','9d0894b8-ba57-430a-b54a-a05acd4e3d50',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,28,1,'Workshop 8','2021-11-04 22:13:44','2021-11-04 22:13:44','9e59fcf9-ae8c-4916-b15e-9c12277674b4',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,29,1,'Registration and Sign-In','2021-11-04 22:15:20','2021-11-04 22:17:48','fe314c39-f8af-4bc2-99e6-41a2ee58710d','2021-10-04 07:00:00','15:30:00','16:30:00',NULL,NULL,NULL,NULL),(30,30,1,'Registration and Sign-In','2021-11-04 22:16:01','2021-11-04 22:16:01','1e29e27c-8a8a-4fdf-9243-4a527313f118','2021-10-04 07:00:00','03:30:00','04:30:00',NULL,NULL,NULL,NULL),(31,31,1,'Happy Hour','2021-11-04 22:16:16','2021-11-04 22:16:56','a39202e7-6a5d-4b59-8eb6-9066df9b53b1','2021-10-04 07:00:00','17:00:00','19:30:00',NULL,NULL,NULL,NULL),(32,32,1,'Happy Hour','2021-11-04 22:16:56','2021-11-04 22:16:56','cd3515e8-6631-4508-ae42-fa44f28b3f78','2021-10-04 07:00:00','17:00:00','19:30:00',NULL,NULL,NULL,NULL),(34,34,1,'Registration and Sign-In','2021-11-04 22:17:48','2021-11-04 22:17:48','5eb210e1-6b9d-4a1c-a1b3-9599bc4cd703','2021-10-04 07:00:00','15:30:00','16:30:00',NULL,NULL,NULL,NULL),(35,35,1,'Morning Coffee and Social','2021-11-04 22:18:02','2021-11-04 22:18:44','96467612-cc6c-4b8a-adb8-31552ed97765','2021-10-05 07:00:00','08:00:00','09:00:00',NULL,NULL,NULL,NULL),(36,36,1,'Morning Coffee and Social','2021-11-04 22:18:44','2021-11-04 22:18:44','9e60cccb-9aa8-4cf4-8176-527c11b5fc9f','2021-10-05 07:00:00','08:00:00','09:00:00',NULL,NULL,NULL,NULL),(37,37,1,'Influential speakers at DIG this year','2021-11-04 22:19:08','2021-11-06 17:35:55','630c62e0-e520-4a9d-bdcd-6a062ef1847b',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,38,1,'Influential Speakers at DIG This Year','2021-11-04 22:19:43','2021-11-04 22:19:43','0991b6d0-7879-4cc0-965a-1e1e82f84597',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,39,1,'Tech meet-ups in Baton Rouge','2021-11-04 22:19:54','2021-11-06 17:36:22','cb21d4ad-0fba-4159-8a0c-cf378d5db474',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,40,1,'Tech Meet-Ups in Baton Rouge','2021-11-04 22:20:27','2021-11-04 22:20:27','8b11ddb4-bd78-4f9b-b7a1-f7b8e435febe',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,41,1,'How to get the most out of tech conferences','2021-11-04 22:20:31','2021-11-06 17:36:54','8d24224d-80eb-4185-956f-8936109b5842',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,42,1,'How to Get the Most Out of Tech Conferences','2021-11-04 22:20:58','2021-11-04 22:20:58','2157a16a-8bb8-4197-a7ba-07111471b63e',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,43,1,NULL,'2021-11-05 22:04:56','2021-11-05 22:15:43','348de32f-04a0-4ac2-8f5f-04ebf1cb0d58',NULL,NULL,NULL,'DIG',NULL,NULL,NULL),(44,44,1,'DIG Logo','2021-11-05 22:13:04','2023-03-29 16:07:53','36fc16cc-13e7-42fe-929a-fde061c036cd',NULL,NULL,NULL,NULL,'DIG Logo',NULL,NULL),(45,45,1,'Footer logo','2021-11-05 22:15:19','2023-03-29 16:07:46','cfc35838-2e82-4970-861f-2e830698c1d6',NULL,NULL,NULL,NULL,'DIG conference logo',NULL,NULL),(46,46,1,'Home','2021-11-05 22:59:59','2021-11-05 22:59:59','4e836fef-1bc6-48f6-80b6-93dddbf44bba',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,48,1,'Home','2021-11-05 23:01:02','2021-11-05 23:01:02','e295caff-5df9-4a39-8e7f-cfad4c6a822f',NULL,NULL,NULL,NULL,NULL,'DIG Conference','10.5.21 | Baton Rouge, LA'),(49,49,1,'Workshop 1','2021-11-06 15:26:30','2021-11-06 15:26:30','d1103885-9da9-4c92-8a0d-f76f2c75ae0e',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,50,1,'Workshop 2','2021-11-06 15:26:53','2021-11-06 15:26:55','d6ce2d83-00fd-4ecf-a374-99eeaef3d62a',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,52,1,'How to Get the Most Out of Tech Conferences','2021-11-06 17:34:58','2021-11-06 17:34:58','90b0af7b-f15f-4e22-abce-16d0e8ca80ec',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,54,1,'Influential speakers at DIG this year','2021-11-06 17:35:56','2021-11-06 17:35:56','4586bfda-ec91-401a-aca8-a08fb84b6988',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,56,1,'Tech meet-ups in Baton Rouge','2021-11-06 17:36:22','2021-11-06 17:36:22','3316ded3-b426-498d-9e92-262a611a7b9b',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,58,1,'How to get the most out of tech conferences','2021-11-06 17:36:54','2021-11-06 17:36:54','5bac62c0-a866-463d-952e-66894e791b45',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,60,1,'Home','2021-11-07 21:28:52','2021-11-07 21:28:52','0b6923ed-e352-48bc-bd8c-3c08808e99d7',NULL,NULL,NULL,NULL,NULL,'DIG Conference','10.5.21  |  BATON ROUGE, LA'),(61,61,1,NULL,'2023-03-27 16:35:39','2023-03-29 16:38:21','1cd83afc-adb3-4833-8c7b-297105a9e5a2',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,63,1,'Home','2023-03-27 16:47:22','2023-03-27 16:47:22','1ffa42d4-ecf3-4f1e-aa5b-c78696cfd6c2',NULL,NULL,NULL,NULL,NULL,'DIG Conference','10.5.23  |  BATON ROUGE, LA'),(64,64,1,'DIG Logo','2023-03-29 15:41:23','2023-03-29 15:41:23','c5e4f3e0-7fbd-4149-ba17-72b2f80a048e',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `drafts` VALUES (18,13,1,1,'Draft 1','',1,NULL,1);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2021-11-04 21:20:27','2021-11-05 23:02:34',NULL,NULL,'59826722-0b35-4c48-a1c7-e16b2b804c61'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2021-11-04 21:33:27','2023-03-27 16:47:22',NULL,NULL,'4d99bc1d-eed7-4f50-91e8-5f878e7a1268'),(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2021-11-04 21:33:27','2021-11-04 21:33:28',NULL,NULL,'0f70130c-bb67-4d00-8682-296b6568ed6d'),(4,2,NULL,2,1,'craft\\elements\\Entry',1,0,'2021-11-04 21:33:28','2021-11-04 21:33:28',NULL,NULL,'195c3c78-27f8-4257-8b1d-aa0eb4f823a7'),(5,2,NULL,3,1,'craft\\elements\\Entry',1,0,'2021-11-04 21:33:53','2021-11-04 21:33:54',NULL,NULL,'b1af3e6e-e1b9-4af6-ac88-ae3e68cdecbb'),(6,NULL,NULL,NULL,5,'craft\\elements\\Category',1,0,'2021-11-04 21:58:20','2021-11-04 21:58:20',NULL,NULL,'56aab333-6c81-4e3b-9242-e9f873613389'),(7,NULL,NULL,NULL,5,'craft\\elements\\Category',1,0,'2021-11-04 21:58:44','2021-11-04 21:58:44',NULL,NULL,'5fc913d8-6f7a-4868-ab8e-ea2bd0ca60d7'),(8,NULL,NULL,NULL,5,'craft\\elements\\Category',1,0,'2021-11-04 21:59:21','2021-11-04 21:59:21',NULL,NULL,'a0a5872d-e6e9-46b2-a2f4-c5d0f7b5330e'),(9,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2021-11-04 22:04:05','2021-11-06 15:26:29',NULL,NULL,'f8ddb427-2527-4501-9ed6-b22e84ffe1d1'),(10,9,NULL,4,2,'craft\\elements\\Entry',1,0,'2021-11-04 22:04:25','2021-11-04 22:04:25',NULL,NULL,'76cb129f-b56b-4dba-9720-22c27c896632'),(12,9,NULL,5,2,'craft\\elements\\Entry',1,0,'2021-11-04 22:07:36','2021-11-04 22:07:37',NULL,NULL,'a74e6235-31d3-499c-a242-a434cd6f0c36'),(13,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2021-11-04 22:08:26','2021-11-04 22:09:17',NULL,NULL,'4973bd91-faac-46b1-ae4a-1b6178df13d1'),(14,13,NULL,6,2,'craft\\elements\\Entry',1,0,'2021-11-04 22:08:26','2021-11-04 22:08:27',NULL,NULL,'759d1757-f9d3-47c8-a246-0479a42ef003'),(16,13,NULL,7,2,'craft\\elements\\Entry',1,0,'2021-11-04 22:09:17','2021-11-04 22:09:17',NULL,NULL,'bd5b86f4-bd13-4535-a937-975497f9a2aa'),(17,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2021-11-04 22:09:21','2021-11-04 22:09:58',NULL,NULL,'d8d55018-f299-4209-b33a-861b5aa4960c'),(18,17,NULL,8,2,'craft\\elements\\Entry',1,0,'2021-11-04 22:09:58','2021-11-04 22:09:58',NULL,NULL,'76c00d69-8e07-45ad-9512-c31bf6190641'),(19,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2021-11-04 22:10:02','2021-11-04 22:10:37',NULL,NULL,'b64340c7-d609-4e59-ab13-facb9d5e838f'),(20,19,NULL,9,2,'craft\\elements\\Entry',1,0,'2021-11-04 22:10:37','2021-11-04 22:10:37',NULL,NULL,'2ca9524d-c4dd-488e-8395-4d5812f9fa20'),(21,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2021-11-04 22:10:42','2021-11-04 22:11:32',NULL,NULL,'3b343ed5-79d9-4d92-8a4f-003a5c049394'),(22,21,NULL,10,2,'craft\\elements\\Entry',1,0,'2021-11-04 22:11:32','2021-11-04 22:11:32',NULL,NULL,'469e607b-b837-47df-9a11-c1e4c21241b9'),(23,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2021-11-04 22:11:36','2021-11-04 22:12:12',NULL,NULL,'716b8cce-1408-4745-9d02-f2a20e0d4e67'),(24,23,NULL,11,2,'craft\\elements\\Entry',1,0,'2021-11-04 22:12:12','2021-11-04 22:12:12',NULL,NULL,'1096549e-d6b0-4c7a-9dc1-0708f863da0f'),(25,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2021-11-04 22:12:16','2021-11-04 22:12:50',NULL,NULL,'6bd0a361-9484-466c-b072-fdf628283ec5'),(26,25,NULL,12,2,'craft\\elements\\Entry',1,0,'2021-11-04 22:12:50','2021-11-04 22:12:50',NULL,NULL,'ce0ab047-e97e-4343-aca5-95a8a18a09bc'),(27,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2021-11-04 22:12:54','2021-11-04 22:13:44',NULL,NULL,'b4abd574-c146-4b60-8834-f9b08d24102a'),(28,27,NULL,13,2,'craft\\elements\\Entry',1,0,'2021-11-04 22:13:44','2021-11-04 22:13:44',NULL,NULL,'633400e2-4e20-4ccd-8b12-e4fefb23c304'),(29,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2021-11-04 22:15:20','2021-11-04 22:17:48',NULL,NULL,'afbadb62-1e97-4642-961f-0c6d30208603'),(30,29,NULL,14,3,'craft\\elements\\Entry',1,0,'2021-11-04 22:16:01','2021-11-04 22:16:01',NULL,NULL,'981aeb84-0ebc-48e1-8cc7-774b9ae3a104'),(31,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2021-11-04 22:16:16','2021-11-04 22:16:56',NULL,NULL,'7ef0ca59-1451-4df7-92e4-bf012e2b243f'),(32,31,NULL,15,3,'craft\\elements\\Entry',1,0,'2021-11-04 22:16:56','2021-11-04 22:16:56',NULL,NULL,'312dda7e-b259-4aa0-a37b-4793ea6b46aa'),(34,29,NULL,16,3,'craft\\elements\\Entry',1,0,'2021-11-04 22:17:48','2021-11-04 22:17:48',NULL,NULL,'6dc8e71b-b8b1-4e72-8703-7cdc8eea077e'),(35,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2021-11-04 22:18:02','2021-11-04 22:18:44',NULL,NULL,'ca8fe518-ce59-495e-bac1-46d81d4039cb'),(36,35,NULL,17,3,'craft\\elements\\Entry',1,0,'2021-11-04 22:18:44','2021-11-04 22:18:44',NULL,NULL,'b4c0df40-e0e9-4a69-b5ac-31013c00bab2'),(37,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-11-04 22:19:08','2021-11-06 17:35:55',NULL,NULL,'dd237d0e-bb40-42c0-bb7b-b8a0d69731e9'),(38,37,NULL,18,4,'craft\\elements\\Entry',1,0,'2021-11-04 22:19:43','2021-11-04 22:19:43',NULL,NULL,'b2d6196b-414a-4c8b-bd83-ed9a02521c18'),(39,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-11-04 22:19:54','2021-11-06 17:36:22',NULL,NULL,'17f9a64a-4fbd-4206-9d05-4ed4713c1fe1'),(40,39,NULL,19,4,'craft\\elements\\Entry',1,0,'2021-11-04 22:20:27','2021-11-04 22:20:27',NULL,NULL,'8cd75d68-bd6f-4a34-9b86-efde02f02b77'),(41,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-11-04 22:20:31','2021-11-06 17:36:54',NULL,NULL,'bdc9c832-68a4-45e7-804d-6fb923db8b4e'),(42,41,NULL,20,4,'craft\\elements\\Entry',1,0,'2021-11-04 22:20:58','2021-11-04 22:20:58',NULL,NULL,'b2fbaa54-5cef-411a-ad4a-ead9f05e7600'),(43,NULL,NULL,NULL,6,'craft\\elements\\GlobalSet',1,0,'2021-11-05 22:04:56','2021-11-05 22:15:42',NULL,NULL,'7c06fcf9-1581-471a-882f-9048a934814a'),(44,NULL,NULL,NULL,7,'craft\\elements\\Asset',1,0,'2021-11-05 22:13:04','2023-03-29 16:07:53',NULL,NULL,'46d1a9cf-befe-4a99-a973-96f9f9fec170'),(45,NULL,NULL,NULL,7,'craft\\elements\\Asset',1,0,'2021-11-05 22:15:19','2023-03-29 16:07:46',NULL,NULL,'1cf116f6-2dc5-4aab-80cf-18c520ed7a6d'),(46,2,NULL,21,1,'craft\\elements\\Entry',1,0,'2021-11-05 22:59:58','2021-11-05 22:59:59',NULL,NULL,'2fb2e43d-4326-4a22-90c1-5b291cc17a63'),(48,2,NULL,22,1,'craft\\elements\\Entry',1,0,'2021-11-05 23:01:01','2021-11-05 23:01:02',NULL,NULL,'6e687a73-b121-4931-88d6-ab2866040c31'),(49,9,NULL,23,2,'craft\\elements\\Entry',1,0,'2021-11-06 15:26:29','2021-11-06 15:26:30',NULL,NULL,'341514d8-8de4-4c06-be46-ccb92b8175eb'),(50,13,18,NULL,2,'craft\\elements\\Entry',1,0,'2021-11-06 15:26:53','2021-11-06 15:26:55',NULL,NULL,'95c15a80-811d-418d-a314-566562c59d31'),(52,41,NULL,24,4,'craft\\elements\\Entry',1,0,'2021-11-06 17:34:57','2021-11-06 17:34:58',NULL,NULL,'15a08061-5b7f-4331-8f8a-e15107f719e5'),(54,37,NULL,25,4,'craft\\elements\\Entry',1,0,'2021-11-06 17:35:55','2021-11-06 17:35:56',NULL,NULL,'dd72e6a1-16d6-465d-8211-228be1bfa4fe'),(56,39,NULL,26,4,'craft\\elements\\Entry',1,0,'2021-11-06 17:36:22','2021-11-06 17:36:22',NULL,NULL,'19b12793-df88-4a92-a17a-734f3d2b8a47'),(58,41,NULL,27,4,'craft\\elements\\Entry',1,0,'2021-11-06 17:36:54','2021-11-06 17:36:54',NULL,NULL,'5695b1ed-c09e-4f7a-b168-25b7a22aca9c'),(60,2,NULL,28,1,'craft\\elements\\Entry',1,0,'2021-11-07 21:28:51','2021-11-07 21:28:52',NULL,NULL,'72dfb4c0-fb3e-4ba4-910d-10b2c3b0e2d3'),(61,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-03-27 16:35:39','2023-03-29 16:38:21',NULL,NULL,'d2917a01-cdd4-421b-b6a3-874f847c3804'),(63,2,NULL,29,1,'craft\\elements\\Entry',1,0,'2023-03-27 16:47:22','2023-03-27 16:47:22',NULL,NULL,'82f03b49-676d-4e8f-834c-7846ac61cf17'),(64,NULL,NULL,NULL,7,'craft\\elements\\Asset',1,0,'2023-03-29 15:41:23','2023-03-29 15:41:23',NULL,'2023-03-29 15:41:53','4e8566b4-d9aa-4820-a4f7-ed4946740df4');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2021-11-04 21:20:27','2021-11-04 21:20:27','6cf25b30-5a96-479e-b89c-547dca46000b'),(2,2,1,'home','__home__',1,'2021-11-04 21:33:27','2021-11-04 21:33:27','ac19e5f9-67c1-4425-8f62-15436a9a8733'),(3,3,1,'home','__home__',1,'2021-11-04 21:33:28','2021-11-04 21:33:28','62e6b282-bd58-408b-8e5a-f5c3efabace9'),(4,4,1,'home','__home__',1,'2021-11-04 21:33:28','2021-11-04 21:33:28','191892a3-c018-41e6-8305-2cbe71631803'),(5,5,1,'home','__home__',1,'2021-11-04 21:33:54','2021-11-04 21:33:54','2ff1ace7-cc9d-4e22-a7e4-825cb78a555f'),(6,6,1,'development','workshop-options/development',1,'2021-11-04 21:58:20','2021-11-04 21:58:26','9d25d5b9-2180-4ead-b3d0-e09ad5c159b0'),(7,7,1,'strategy-and-content','workshop-options/strategy-and-content',1,'2021-11-04 21:58:44','2021-11-04 21:58:51','ce5914b8-9f5f-4d85-b992-ffd7c0d8652f'),(8,8,1,'design','workshop-options/design',1,'2021-11-04 21:59:21','2021-11-04 21:59:27','8fa494fd-46e2-4709-ade1-91de54f0328a'),(9,9,1,'workshop-1','workshops/workshop-1',1,'2021-11-04 22:04:05','2021-11-04 22:04:19','a35b594e-7006-4184-9f0c-2757a0ab4cb2'),(10,10,1,'workshop-1','workshops/workshop-1',1,'2021-11-04 22:04:25','2021-11-04 22:04:25','c592f4f0-f337-470b-8f06-0d7de7cd03e3'),(12,12,1,'workshop-1','workshops/workshop-1',1,'2021-11-04 22:07:37','2021-11-04 22:07:37','6266215e-6e6c-4f1b-9aeb-d3c97acef987'),(13,13,1,'workshop-2','workshops/workshop-2',1,'2021-11-04 22:08:26','2021-11-04 22:09:17','6eb69cf1-c670-418b-9faa-8cb29b22c881'),(14,14,1,'workshop-1-2','workshops/workshop-1-2',1,'2021-11-04 22:08:27','2021-11-04 22:08:27','93c6a327-1d8f-4577-89d7-cbfd0abf4146'),(16,16,1,'workshop-2','workshops/workshop-2',1,'2021-11-04 22:09:17','2021-11-04 22:09:17','c229f42c-1d6d-4910-b309-1768638afe80'),(17,17,1,'workshop-3','workshops/workshop-3',1,'2021-11-04 22:09:21','2021-11-04 22:09:35','c2dfaf12-4feb-46a0-975f-831ede7fc645'),(18,18,1,'workshop-3','workshops/workshop-3',1,'2021-11-04 22:09:58','2021-11-04 22:09:58','783fe5db-44ca-41ab-b192-034d18c4a2cf'),(19,19,1,'workshop-4','workshops/workshop-4',1,'2021-11-04 22:10:02','2021-11-04 22:10:14','b3a69cfe-36ad-466c-acba-9c823d80dc64'),(20,20,1,'workshop-4','workshops/workshop-4',1,'2021-11-04 22:10:37','2021-11-04 22:10:37','bf6490f8-52b4-4f33-a521-f0a560a576a9'),(21,21,1,'workshop-5','workshops/workshop-5',1,'2021-11-04 22:10:42','2021-11-04 22:11:02','3aff4907-5461-4f87-b9ac-3de868cb8c26'),(22,22,1,'workshop-5','workshops/workshop-5',1,'2021-11-04 22:11:32','2021-11-04 22:11:32','ea172802-7a0a-487e-a0b5-5bdd2f795127'),(23,23,1,'workshop-6','workshops/workshop-6',1,'2021-11-04 22:11:36','2021-11-04 22:11:53','9c518e35-c604-40d9-a625-189753e3c68d'),(24,24,1,'workshop-6','workshops/workshop-6',1,'2021-11-04 22:12:12','2021-11-04 22:12:12','2f3bd114-7e30-4dad-99eb-72b065adf47f'),(25,25,1,'workshop-7','workshops/workshop-7',1,'2021-11-04 22:12:16','2021-11-04 22:12:28','33de20e5-2d0f-48c6-a252-f4b3bb70759a'),(26,26,1,'workshop-7','workshops/workshop-7',1,'2021-11-04 22:12:50','2021-11-04 22:12:50','0e9eba1c-d223-4c7f-81f1-efb127bb513e'),(27,27,1,'workshop-8','workshops/workshop-8',1,'2021-11-04 22:12:54','2021-11-04 22:13:14','b3daed42-9ce8-42c7-94db-137b153d7dca'),(28,28,1,'workshop-8','workshops/workshop-8',1,'2021-11-04 22:13:44','2021-11-04 22:13:44','51a38c39-462d-46d1-832b-ce645906291f'),(29,29,1,'registration-and-sign-in','events/registration-and-sign-in',1,'2021-11-04 22:15:20','2021-11-04 22:15:43','740bc940-26fa-4b38-a917-2db8dd943d13'),(30,30,1,'registration-and-sign-in','events/registration-and-sign-in',1,'2021-11-04 22:16:01','2021-11-04 22:16:01','53d4f200-3780-49c1-b421-0c7a030d5ce0'),(31,31,1,'happy-hour','events/happy-hour',1,'2021-11-04 22:16:16','2021-11-04 22:16:29','37b960cb-fc62-4f9d-8501-8400afb88467'),(32,32,1,'happy-hour','events/happy-hour',1,'2021-11-04 22:16:56','2021-11-04 22:16:56','08169dea-03d5-43c5-b6e0-31384ff401c4'),(34,34,1,'registration-and-sign-in','events/registration-and-sign-in',1,'2021-11-04 22:17:48','2021-11-04 22:17:48','6f91d2b9-4b69-48b5-a985-c6eccae57776'),(35,35,1,'morning-coffee-and-social','events/morning-coffee-and-social',1,'2021-11-04 22:18:02','2021-11-04 22:18:17','1baf4478-fdd4-44ac-b488-5628be1c65fb'),(36,36,1,'morning-coffee-and-social','events/morning-coffee-and-social',1,'2021-11-04 22:18:44','2021-11-04 22:18:44','4c514aa9-9843-455d-a878-0e65a58b8485'),(37,37,1,'influential-speakers-at-dig-this-year','news/influential-speakers-at-dig-this-year',1,'2021-11-04 22:19:08','2021-11-04 22:19:34','88a8867a-d971-4d20-bccd-97e6e1bb3fe8'),(38,38,1,'influential-speakers-at-dig-this-year','news/influential-speakers-at-dig-this-year',1,'2021-11-04 22:19:43','2021-11-04 22:19:43','d4f6cf4f-273a-40e4-ad0e-72dd62638a30'),(39,39,1,'tech-meet-ups-in-baton-rouge','news/tech-meet-ups-in-baton-rouge',1,'2021-11-04 22:19:54','2021-11-04 22:20:16','322bfbc0-1059-488f-9b43-f10e20b5099b'),(40,40,1,'tech-meet-ups-in-baton-rouge','news/tech-meet-ups-in-baton-rouge',1,'2021-11-04 22:20:27','2021-11-04 22:20:27','0bd3a1f5-4e78-4d3b-a1c9-9b81d18f767d'),(41,41,1,'how-to-get-the-most-out-of-tech-conferences','news/how-to-get-the-most-out-of-tech-conferences',1,'2021-11-04 22:20:31','2021-11-04 22:20:49','d2eb09ad-5804-4919-b3c4-780319bb0428'),(42,42,1,'how-to-get-the-most-out-of-tech-conferences','news/how-to-get-the-most-out-of-tech-conferences',1,'2021-11-04 22:20:58','2021-11-04 22:20:58','1bf1cb12-2e90-4997-acb0-d6f00a6efb8a'),(43,43,1,NULL,NULL,1,'2021-11-05 22:04:56','2021-11-05 22:04:56','7d52f65c-c15d-462f-90be-4d1eede752e2'),(44,44,1,NULL,NULL,1,'2021-11-05 22:13:04','2021-11-05 22:13:04','1f205421-476e-40e6-8a89-66d2962f134b'),(45,45,1,NULL,NULL,1,'2021-11-05 22:15:19','2021-11-05 22:15:19','50722e84-91ca-4210-bcb2-30f60fb201c7'),(46,46,1,'home','__home__',1,'2021-11-05 22:59:59','2021-11-05 22:59:59','103c258d-3881-4b2e-96cb-01023246d7bd'),(48,48,1,'home','__home__',1,'2021-11-05 23:01:02','2021-11-05 23:01:02','01e1be3f-3f57-48a9-a7f9-78860fa5cbf0'),(49,49,1,'workshop-1','workshops/workshop-1',1,'2021-11-06 15:26:30','2021-11-06 15:26:30','f427539e-c365-491e-b234-7eade11d2e70'),(50,50,1,'workshop-2','workshops/workshop-2',1,'2021-11-06 15:26:53','2021-11-06 15:26:53','892d55d1-8f38-44d1-9ebb-71a187b4407b'),(52,52,1,'how-to-get-the-most-out-of-tech-conferences','news/how-to-get-the-most-out-of-tech-conferences',1,'2021-11-06 17:34:58','2021-11-06 17:34:58','711404ad-b7d3-4ae5-a98d-2456ff4de34e'),(54,54,1,'influential-speakers-at-dig-this-year','news/influential-speakers-at-dig-this-year',1,'2021-11-06 17:35:56','2021-11-06 17:35:56','b6d94652-bca8-4f19-8138-0508727fe8cb'),(56,56,1,'tech-meet-ups-in-baton-rouge','news/tech-meet-ups-in-baton-rouge',1,'2021-11-06 17:36:22','2021-11-06 17:36:22','058e98a3-d881-48d6-b2ea-f1fbc2a4313a'),(58,58,1,'how-to-get-the-most-out-of-tech-conferences','news/how-to-get-the-most-out-of-tech-conferences',1,'2021-11-06 17:36:54','2021-11-06 17:36:54','4a26f060-6d87-4d23-b26d-5e9e8d29067c'),(60,60,1,'home','__home__',1,'2021-11-07 21:28:52','2021-11-07 21:28:52','6c50940f-1f35-4f5e-a7d7-8cb51360dfd2'),(61,61,1,NULL,NULL,1,'2023-03-27 16:35:39','2023-03-27 16:35:39','f16382cd-217e-4d52-99e8-9d518942c23e'),(63,63,1,'home','__home__',1,'2023-03-27 16:47:22','2023-03-27 16:47:22','bbd3b4a0-ac44-49e4-81ae-b184c48171e8'),(64,64,1,NULL,NULL,1,'2023-03-29 15:41:23','2023-03-29 15:41:23','5f77d722-054a-41c4-a500-d9642ccefba6');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,1,NULL,'2021-11-04 21:33:00',NULL,NULL,'2021-11-04 21:33:27','2021-11-04 21:33:27'),(3,1,NULL,1,NULL,'2021-11-04 21:33:00',NULL,NULL,'2021-11-04 21:33:28','2021-11-04 21:33:28'),(4,1,NULL,1,NULL,'2021-11-04 21:33:00',NULL,NULL,'2021-11-04 21:33:28','2021-11-04 21:33:28'),(5,1,NULL,1,NULL,'2021-11-04 21:33:00',NULL,NULL,'2021-11-04 21:33:54','2021-11-04 21:33:54'),(9,2,NULL,2,1,'2021-11-04 22:04:00',NULL,NULL,'2021-11-04 22:04:05','2021-11-04 22:04:05'),(10,2,NULL,2,1,'2021-11-04 22:04:00',NULL,NULL,'2021-11-04 22:04:25','2021-11-04 22:04:25'),(12,2,NULL,2,1,'2021-11-04 22:04:00',NULL,NULL,'2021-11-04 22:07:37','2021-11-04 22:07:37'),(13,2,NULL,2,1,'2021-11-04 22:04:00',NULL,NULL,'2021-11-04 22:08:27','2021-11-04 22:08:27'),(14,2,NULL,2,1,'2021-11-04 22:04:00',NULL,NULL,'2021-11-04 22:08:27','2021-11-04 22:08:27'),(16,2,NULL,2,1,'2021-11-04 22:04:00',NULL,NULL,'2021-11-04 22:09:17','2021-11-04 22:09:17'),(17,2,NULL,2,1,'2021-11-04 22:09:00',NULL,NULL,'2021-11-04 22:09:22','2021-11-04 22:09:22'),(18,2,NULL,2,1,'2021-11-04 22:09:00',NULL,NULL,'2021-11-04 22:09:58','2021-11-04 22:09:58'),(19,2,NULL,2,1,'2021-11-04 22:10:00',NULL,NULL,'2021-11-04 22:10:03','2021-11-04 22:10:03'),(20,2,NULL,2,1,'2021-11-04 22:10:00',NULL,NULL,'2021-11-04 22:10:37','2021-11-04 22:10:37'),(21,2,NULL,2,1,'2021-11-04 22:10:00',NULL,NULL,'2021-11-04 22:10:42','2021-11-04 22:10:42'),(22,2,NULL,2,1,'2021-11-04 22:10:00',NULL,NULL,'2021-11-04 22:11:32','2021-11-04 22:11:32'),(23,2,NULL,2,1,'2021-11-04 22:11:00',NULL,NULL,'2021-11-04 22:11:36','2021-11-04 22:11:36'),(24,2,NULL,2,1,'2021-11-04 22:11:00',NULL,NULL,'2021-11-04 22:12:12','2021-11-04 22:12:12'),(25,2,NULL,2,1,'2021-11-04 22:12:00',NULL,NULL,'2021-11-04 22:12:16','2021-11-04 22:12:16'),(26,2,NULL,2,1,'2021-11-04 22:12:00',NULL,NULL,'2021-11-04 22:12:50','2021-11-04 22:12:50'),(27,2,NULL,2,1,'2021-11-04 22:12:00',NULL,NULL,'2021-11-04 22:12:54','2021-11-04 22:12:54'),(28,2,NULL,2,1,'2021-11-04 22:12:00',NULL,NULL,'2021-11-04 22:13:44','2021-11-04 22:13:44'),(29,3,NULL,3,1,'2021-11-04 22:15:00',NULL,NULL,'2021-11-04 22:15:20','2021-11-04 22:15:20'),(30,3,NULL,3,1,'2021-11-04 22:15:00',NULL,NULL,'2021-11-04 22:16:01','2021-11-04 22:16:01'),(31,3,NULL,3,1,'2021-11-04 22:16:00',NULL,NULL,'2021-11-04 22:16:16','2021-11-04 22:16:16'),(32,3,NULL,3,1,'2021-11-04 22:16:00',NULL,NULL,'2021-11-04 22:16:56','2021-11-04 22:16:56'),(34,3,NULL,3,1,'2021-11-04 22:15:00',NULL,NULL,'2021-11-04 22:17:48','2021-11-04 22:17:48'),(35,3,NULL,3,1,'2021-11-04 22:18:00',NULL,NULL,'2021-11-04 22:18:02','2021-11-04 22:18:02'),(36,3,NULL,3,1,'2021-11-04 22:18:00',NULL,NULL,'2021-11-04 22:18:44','2021-11-04 22:18:44'),(37,4,NULL,4,1,'2021-09-30 22:19:00',NULL,NULL,'2021-11-04 22:19:08','2021-11-04 22:19:39'),(38,4,NULL,4,1,'2021-09-30 22:19:00',NULL,NULL,'2021-11-04 22:19:43','2021-11-04 22:19:43'),(39,4,NULL,4,1,'2021-08-02 22:19:00',NULL,NULL,'2021-11-04 22:19:54','2021-11-04 22:20:22'),(40,4,NULL,4,1,'2021-08-02 22:19:00',NULL,NULL,'2021-11-04 22:20:27','2021-11-04 22:20:27'),(41,4,NULL,4,1,'2021-07-03 22:20:00',NULL,NULL,'2021-11-04 22:20:32','2021-11-06 17:34:57'),(42,4,NULL,4,1,'2021-11-04 22:20:00',NULL,NULL,'2021-11-04 22:20:58','2021-11-04 22:20:58'),(46,1,NULL,1,NULL,'2021-11-04 21:33:00',NULL,NULL,'2021-11-05 22:59:59','2021-11-05 22:59:59'),(48,1,NULL,1,NULL,'2021-11-04 21:33:00',NULL,NULL,'2021-11-05 23:01:02','2021-11-05 23:01:02'),(49,2,NULL,2,1,'2021-11-04 22:04:00',NULL,NULL,'2021-11-06 15:26:30','2021-11-06 15:26:30'),(50,2,NULL,2,1,'2021-11-04 22:04:00',NULL,NULL,'2021-11-06 15:26:54','2021-11-06 15:26:54'),(52,4,NULL,4,1,'2021-07-03 22:20:00',NULL,NULL,'2021-11-06 17:34:58','2021-11-06 17:34:58'),(54,4,NULL,4,1,'2021-09-30 22:19:00',NULL,NULL,'2021-11-06 17:35:56','2021-11-06 17:35:56'),(56,4,NULL,4,1,'2021-08-02 22:19:00',NULL,NULL,'2021-11-06 17:36:22','2021-11-06 17:36:22'),(58,4,NULL,4,1,'2021-07-03 22:20:00',NULL,NULL,'2021-11-06 17:36:54','2021-11-06 17:36:54'),(60,1,NULL,1,NULL,'2021-11-04 21:33:00',NULL,NULL,'2021-11-07 21:28:52','2021-11-07 21:28:52'),(63,1,NULL,1,NULL,'2021-11-04 21:33:00',NULL,NULL,'2023-03-27 16:47:22','2023-03-27 16:47:22');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,1,'Home','home',0,'site',NULL,'{section.name|raw}',1,'2021-11-04 21:33:27','2021-11-05 22:59:58',NULL,'3a566891-a13e-4afd-b861-dbb70617c06f'),(2,2,2,'Workshops','workshops',1,'site',NULL,NULL,1,'2021-11-04 21:35:55','2021-11-04 21:36:26',NULL,'cd901ed7-4538-46c2-bb9f-87a94182e14f'),(3,3,3,'Default','default',1,'site',NULL,NULL,1,'2021-11-04 21:36:57','2021-11-04 21:36:57',NULL,'9e958346-5830-4e4e-83a9-8782cb80dd70'),(4,4,4,'Default','default',1,'site',NULL,NULL,1,'2021-11-04 21:37:21','2021-11-04 21:37:21',NULL,'1b4a32f2-2de8-4a8d-8208-58b3c45d9da1');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2021-11-04 21:20:27','2021-11-04 21:20:27',NULL,'b71ae0f5-0f4a-4477-9f0c-3c338ad02d8d'),(2,'Workshops','2021-11-04 22:00:04','2021-11-04 22:00:04',NULL,'d8e2337d-f0d9-427b-891c-2c80172d9473'),(3,'Events','2021-11-04 22:01:06','2021-11-04 22:01:06',NULL,'d9fe5eee-fd03-438e-8e5b-4a3825748f8d'),(4,'News','2021-11-04 22:01:16','2021-11-04 22:01:16',NULL,'6557ba0c-1632-484f-ae2e-ab7f22b55066'),(5,'Globals','2021-11-05 22:00:04','2021-11-05 22:00:04',NULL,'8f2a8a85-dbf7-4bb1-8090-3de22a20ace4'),(6,'Assets','2021-11-05 22:08:55','2021-11-05 22:08:55',NULL,'35ee41a8-521e-4670-8ff9-0a988d4bf1d1'),(7,'Home','2021-11-05 22:56:24','2021-11-05 22:56:24',NULL,'0e0adc44-6b95-4f80-b769-844d1c551b50');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (8,6,13,5,0,0,'2021-11-05 22:14:10','2021-11-05 22:14:10','25c80026-62bf-40e2-99e1-055627049b9e'),(9,6,13,6,0,1,'2021-11-05 22:14:10','2021-11-05 22:14:10','c91bf93e-c407-4555-a983-545f299becc1'),(10,6,13,7,0,2,'2021-11-05 22:14:10','2021-11-05 22:14:10','1ff1b2dd-45e6-408c-95b8-85b9ac192dba'),(18,7,25,8,0,1,'2023-03-29 15:35:00','2023-03-29 15:35:00','9bf6fe3a-c3eb-4eb4-9f74-17e51abf8d44');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2021-11-04 21:33:27','2021-11-04 21:33:27',NULL,'6ad2ef42-7da6-4bd1-97d4-1a22967a53a1'),(2,'craft\\elements\\Entry','2021-11-04 21:35:54','2021-11-04 21:35:54',NULL,'8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4'),(3,'craft\\elements\\Entry','2021-11-04 21:36:57','2021-11-04 21:36:57',NULL,'2a2a65f8-7f80-43ae-bd88-da1d7200f7c2'),(4,'craft\\elements\\Entry','2021-11-04 21:37:21','2021-11-04 21:37:21',NULL,'aa33e363-4ce1-4994-bc6d-b4263e0d59c6'),(5,'craft\\elements\\Category','2021-11-04 21:57:56','2021-11-04 21:57:56',NULL,'97b33eb0-f3a7-4277-b54f-416f5d9e266a'),(6,'craft\\elements\\GlobalSet','2021-11-05 22:04:56','2021-11-05 22:04:56',NULL,'747c7215-b02d-44ed-a82c-2177b0913dc4'),(7,'craft\\elements\\Asset','2021-11-05 22:08:30','2021-11-05 22:08:30',NULL,'1b18a847-22c9-4524-9129-2069aee9a286');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (7,5,'Content',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"b1c32990-27e3-4438-ac71-4149fa616eb6\"}]',1,'2021-11-04 21:57:56','2023-03-24 20:15:50','9f0c6595-6950-47b6-8a4f-7382796bce88'),(13,6,'Organization Info',NULL,'[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c819cbe2-c3b3-440f-920f-40cda13e406b\",\"uid\":\"b1193012-77cb-4f0d-a174-f4232c56e2ad\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0b2c19fa-2230-4389-bba3-bb254a308b66\",\"uid\":\"672df8bb-de8f-4560-a3c9-fc7d5f943ece\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"dc7de2e2-0271-457c-96d8-17fc50854f46\",\"uid\":\"94850bd8-b8a9-4913-aa76-7394e49e255b\"}]',1,'2021-11-05 22:14:10','2023-03-24 20:15:50','ce811dea-80f4-4642-a5e1-a9746f5ef318'),(21,4,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"autocapitalize\":true,\"autocomplete\":false,\"autocorrect\":true,\"class\":null,\"disabled\":false,\"id\":null,\"instructions\":null,\"label\":null,\"max\":null,\"min\":null,\"name\":null,\"orientation\":null,\"placeholder\":null,\"readonly\":false,\"requirable\":false,\"size\":null,\"step\":null,\"tip\":null,\"title\":null,\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"warning\":null,\"width\":100,\"uid\":\"2c81f447-7350-4bd6-b046-d2d9697632f5\"}]',1,'2023-03-24 20:15:50','2023-03-24 20:15:50','057afdea-2a37-40aa-901d-4d7917232827'),(22,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"autocapitalize\":true,\"autocomplete\":false,\"autocorrect\":true,\"class\":null,\"disabled\":false,\"id\":null,\"instructions\":null,\"label\":null,\"max\":null,\"min\":null,\"name\":null,\"orientation\":null,\"placeholder\":null,\"readonly\":false,\"requirable\":false,\"size\":null,\"step\":null,\"tip\":null,\"title\":null,\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"warning\":null,\"width\":100,\"uid\":\"a76118b0-67fa-4dc0-9cd0-2b4aa67b5c13\"},{\"fieldUid\":\"09b66cbd-79da-423b-a032-8e557c20a47f\",\"instructions\":null,\"label\":null,\"required\":false,\"tip\":null,\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"warning\":null,\"width\":100,\"uid\":\"67f8b88c-a270-40a2-87b5-fac7e7ae91bc\"},{\"fieldUid\":\"9dba5aaf-a7b7-4b18-94de-6480f73ffe8f\",\"instructions\":null,\"label\":null,\"required\":false,\"tip\":null,\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"warning\":null,\"width\":100,\"uid\":\"bfd5d52a-cbc2-415f-962c-3e3f169feac1\"}]',1,'2023-03-24 20:15:50','2023-03-24 20:15:50','fd3caf80-072e-48aa-b233-7078df834eed'),(23,3,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"autocapitalize\":true,\"autocomplete\":false,\"autocorrect\":true,\"class\":null,\"disabled\":false,\"id\":null,\"instructions\":null,\"label\":null,\"max\":null,\"min\":null,\"name\":null,\"orientation\":null,\"placeholder\":null,\"readonly\":false,\"requirable\":false,\"size\":null,\"step\":null,\"tip\":null,\"title\":null,\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"warning\":null,\"width\":100,\"uid\":\"263e4e83-7f7e-46f6-bc98-925390668748\"},{\"fieldUid\":\"45f36e39-a33d-480a-b301-8490c3826065\",\"instructions\":null,\"label\":null,\"required\":false,\"tip\":null,\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"warning\":null,\"width\":100,\"uid\":\"a4dd0f03-3b28-4a08-93dc-01a04597a12e\"},{\"fieldUid\":\"3c073182-f385-4f69-9d7e-09d570f452b2\",\"instructions\":null,\"label\":null,\"required\":false,\"tip\":null,\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"warning\":null,\"width\":100,\"uid\":\"2e9c8327-3e3c-4f96-9dee-d3d27b1589f4\"},{\"fieldUid\":\"8a3661ac-e890-4b8d-ae18-c80a5e821dc8\",\"instructions\":null,\"label\":null,\"required\":false,\"tip\":null,\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"warning\":null,\"width\":100,\"uid\":\"327ed9e9-e889-4bbe-ab25-a84da10a8f31\"}]',1,'2023-03-24 20:15:50','2023-03-24 20:15:50','f79c334d-e5d2-4be1-be55-7a35f1d116d8'),(24,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"autocapitalize\":true,\"autocomplete\":false,\"autocorrect\":true,\"class\":null,\"disabled\":false,\"id\":null,\"instructions\":null,\"label\":null,\"max\":null,\"min\":null,\"name\":null,\"orientation\":null,\"placeholder\":null,\"readonly\":false,\"requirable\":false,\"size\":null,\"step\":null,\"tip\":null,\"title\":null,\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"warning\":null,\"width\":100,\"uid\":\"0e90611f-61fe-44b3-a02b-af79df559a41\"},{\"fieldUid\":\"de6da1a6-867d-4e20-b532-29a8b37faff0\",\"instructions\":null,\"label\":null,\"required\":false,\"tip\":null,\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"warning\":null,\"width\":100,\"uid\":\"e3430382-2989-404e-b048-930f8e922fae\"}]',1,'2023-03-24 20:15:50','2023-03-24 20:15:50','369c0d51-2296-41fd-846b-8c4428974efb'),(25,7,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"1b75e1eb-f0d0-4edf-88ce-30822ecd7415\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"121971c6-1424-443e-914d-edc338c201b6\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"ab72d918-6eef-4db5-8cbd-f685cfedbb9f\"}]',1,'2023-03-29 15:35:00','2023-03-29 15:35:00','6cf4446d-f174-4ae1-9a7e-cb434f794c83');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,2,'Workshop Category','workshopCat','global',NULL,'',1,'site',NULL,'craft\\fields\\Categories','{\"allowLimit\":false,\"allowMultipleSources\":false,\"allowSelfRelations\":false,\"branchLimit\":\"\",\"limit\":null,\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":\"group:94a2c9bc-5cc0-46ee-abe2-1c327c2c818d\",\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2021-11-04 22:00:42','2021-11-06 15:22:12','de6da1a6-867d-4e20-b532-29a8b37faff0'),(2,3,'Date','date','global','bhgwtomc','',0,'none',NULL,'craft\\fields\\Date','{\"max\":null,\"min\":null,\"minuteIncrement\":\"30\",\"showDate\":true,\"showTime\":false,\"showTimeZone\":false}','2021-11-04 22:01:53','2021-11-04 22:01:53','45f36e39-a33d-480a-b301-8490c3826065'),(3,3,'Start Time','startTime','global','rortsxhy','',1,'none',NULL,'craft\\fields\\Time','{\"max\":null,\"min\":null,\"minuteIncrement\":30}','2021-11-04 22:02:26','2021-11-04 22:02:26','3c073182-f385-4f69-9d7e-09d570f452b2'),(4,3,'End Time','endTime','global','qozjxvrp','',1,'none',NULL,'craft\\fields\\Time','{\"max\":null,\"min\":null,\"minuteIncrement\":30}','2021-11-04 22:03:09','2021-11-04 22:03:09','8a3661ac-e890-4b8d-ae18-c80a5e821dc8'),(5,5,'Organization Name','orgName','global','iqviaavg','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":200,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-11-05 22:01:13','2021-11-05 22:01:13','c819cbe2-c3b3-440f-920f-40cda13e406b'),(6,5,'Organization Logo','orgLogo','global',NULL,'Adding an .svg file is preferable. ',1,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"Add your logo.\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":true,\"viewMode\":\"large\"}','2021-11-05 22:03:09','2021-11-05 22:11:20','0b2c19fa-2230-4389-bba3-bb254a308b66'),(7,5,'Footer Logo','footerLogo','global',NULL,'',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"Add a footer logo\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":true,\"viewMode\":\"large\"}','2021-11-05 22:06:54','2021-11-05 22:11:53','dc7de2e2-0271-457c-96d8-17fc50854f46'),(8,6,'Alt Tag','altTag','global','bczzioby','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":200,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-11-05 22:09:22','2021-11-05 22:09:22','ab72d918-6eef-4db5-8cbd-f685cfedbb9f'),(9,7,'Hero Headline (h1)','heroHeadlineH1','global','buypcalv','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-11-05 22:56:55','2021-11-05 22:56:55','09b66cbd-79da-423b-a032-8e557c20a47f'),(10,7,'Hero Subhead','heroSubhead','global','ymvviltp','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-11-05 22:57:26','2021-11-05 22:57:26','9dba5aaf-a7b7-4b18-94de-6480f73ffe8f');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `globalsets` VALUES (43,'Branding','branding',6,1,'2021-11-05 22:04:57','2021-11-05 22:04:57','7c06fcf9-1581-471a-882f-9048a934814a');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[]',1,'2023-03-24 20:11:00','2023-03-24 20:11:00','8dbe7fb4-102a-46a4-9a5f-399b2dc3a38f');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqltokens` VALUES (1,'Public Token','__PUBLIC__',1,NULL,NULL,1,'2023-03-24 20:11:00','2023-03-24 20:11:00','88505953-d34d-4b5b-8c9f-3b602977c74b');
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.4.5','4.4.0.4',0,'mjpfupxgmgfa','3@kqpyclqcja','2021-11-04 21:20:26','2023-03-29 15:36:03','acd445d7-ea32-4ce9-ae87-2e918735e726');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','770a6ca8-8950-4cb4-9b23-7f110e067a6b'),(2,'craft','m150403_183908_migrations_table_changes','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','44ed1dc6-238b-4d23-beb4-84f9d0088d8e'),(3,'craft','m150403_184247_plugins_table_changes','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','d9dd34b4-106f-4917-a191-bbf1a761d16d'),(4,'craft','m150403_184533_field_version','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','565dd6f4-22d4-4047-b912-42545a6e3579'),(5,'craft','m150403_184729_type_columns','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','3271ec33-5992-4a61-bbac-016d7c3ae218'),(6,'craft','m150403_185142_volumes','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','a3041343-12f3-4d77-a85c-cc5fbde70f7f'),(7,'craft','m150428_231346_userpreferences','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','2739f068-f356-42e9-8e8c-6059c6ada301'),(8,'craft','m150519_150900_fieldversion_conversion','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','1109e042-be32-4416-9abf-61a926232af8'),(9,'craft','m150617_213829_update_email_settings','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','1f13fa87-3ce2-4ff7-bb80-a4f1144a05d6'),(10,'craft','m150721_124739_templatecachequeries','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','7d118c2b-0bc4-4351-9c2b-d69c663fd084'),(11,'craft','m150724_140822_adjust_quality_settings','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','275d30a6-0dd1-4bd6-9f56-ff46d0dd0158'),(12,'craft','m150815_133521_last_login_attempt_ip','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','8e587e50-f300-433a-99fe-ccc88a94f0c6'),(13,'craft','m151002_095935_volume_cache_settings','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','8b44bfa5-7939-49b1-94d7-f2ff8dc30810'),(14,'craft','m151005_142750_volume_s3_storage_settings','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','10bc7d63-2d72-4ee1-b250-4e1830f5abfa'),(15,'craft','m151016_133600_delete_asset_thumbnails','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','1f28fbad-5005-4ce6-a692-b023f1af31b0'),(16,'craft','m151209_000000_move_logo','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','0e5d4cda-fdcb-4f9a-a197-73ac0b345752'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','48f2d773-2a9f-4935-8ec5-d84080135c82'),(18,'craft','m151215_000000_rename_asset_permissions','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','e07cf003-8566-434a-9239-433e05cfbab7'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','e9a89e9d-db53-4338-aee8-ac836ab0ed1f'),(20,'craft','m160708_185142_volume_hasUrls_setting','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','a351c247-8474-4a74-aca1-595fdc8d0b7d'),(21,'craft','m160714_000000_increase_max_asset_filesize','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','ff5aeefa-2a1a-4a34-85ce-4248b66c46eb'),(22,'craft','m160727_194637_column_cleanup','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','3f66b9ab-55a1-44e1-b12f-246c8c603dff'),(23,'craft','m160804_110002_userphotos_to_assets','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','5ab9440c-15db-4c59-a795-e8c319f2d2e1'),(24,'craft','m160807_144858_sites','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','fc5fa0b3-d268-4769-bba6-a96157b6ff59'),(25,'craft','m160829_000000_pending_user_content_cleanup','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','a055b25c-acd7-4b83-85a5-dea4c62ad36c'),(26,'craft','m160830_000000_asset_index_uri_increase','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','0da210f7-cf4a-42e9-82ec-6fe930e85d98'),(27,'craft','m160912_230520_require_entry_type_id','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','7bfd866e-1df2-4fd1-8aaf-2362f655491e'),(28,'craft','m160913_134730_require_matrix_block_type_id','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','6e103b5a-b47c-424d-afde-c88a9bd2aad1'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','23f17789-9b8f-4e65-8b14-c417d9ca8d01'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','04bb9b1f-6ca8-4a2d-9177-dcbc6842e081'),(31,'craft','m160925_113941_route_uri_parts','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','b15438dd-509a-426e-a8aa-7f03852c6653'),(32,'craft','m161006_205918_schemaVersion_not_null','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','dcf545eb-3c29-4601-b950-dba7f5c68fa8'),(33,'craft','m161007_130653_update_email_settings','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','db7b3645-531e-4a9d-afe7-cd3ee5751d46'),(34,'craft','m161013_175052_newParentId','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','8902fadf-cb18-46f5-924c-d53e475cf7ae'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','ba92de4c-0c7c-49e8-92c5-d444a3ebc3a1'),(36,'craft','m161021_182140_rename_get_help_widget','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','4f493de8-274b-4247-9569-fd102a6a8d94'),(37,'craft','m161025_000000_fix_char_columns','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','79575c78-f4e3-4baf-ab77-aad90d1fbfc2'),(38,'craft','m161029_124145_email_message_languages','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','1375423f-bcb1-4803-82ac-9cfbbaf1b0ef'),(39,'craft','m161108_000000_new_version_format','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','3e809de0-3059-4d1c-943e-9d407324524e'),(40,'craft','m161109_000000_index_shuffle','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','2c8c1e14-8d65-4dbf-9624-b1266a95924e'),(41,'craft','m161122_185500_no_craft_app','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','750316af-a3ae-4915-8ef7-89cbe9ba6b6e'),(42,'craft','m161125_150752_clear_urlmanager_cache','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','7739e0ff-6a61-46f9-bd5f-64a51bf7ef44'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','97ea3213-bc37-48d5-a6d6-83eb7902e51e'),(44,'craft','m170114_161144_udates_permission','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','628ef45a-f5a0-48c9-920f-3b25769763a4'),(45,'craft','m170120_000000_schema_cleanup','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','b783e0bf-907c-4008-828c-1357a047305d'),(46,'craft','m170126_000000_assets_focal_point','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','70ed53c0-5acf-4e6f-a855-4fdbec127371'),(47,'craft','m170206_142126_system_name','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','ec53308e-33d6-4ae1-9a99-b7e0b9e23e9a'),(48,'craft','m170217_044740_category_branch_limits','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','37f361ba-6452-4428-abde-2fc1c079627e'),(49,'craft','m170217_120224_asset_indexing_columns','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','b1e4f527-2007-4ee9-a0a7-5975b19d4aa6'),(50,'craft','m170223_224012_plain_text_settings','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','565e86b4-4b85-4beb-b41c-f0757f87d053'),(51,'craft','m170227_120814_focal_point_percentage','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','50b89bfe-db65-4149-bed4-dcd5dc122adc'),(52,'craft','m170228_171113_system_messages','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','6030b682-bb52-4f3e-a0fe-7c5117db79c4'),(53,'craft','m170303_140500_asset_field_source_settings','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','9932fb2b-ebc1-4362-8de7-cad3fd0cd878'),(54,'craft','m170306_150500_asset_temporary_uploads','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','1a13de2a-f3ff-4e2b-b79c-3c4abd46d076'),(55,'craft','m170523_190652_element_field_layout_ids','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','d0d2eeb0-6d95-4e33-bd7f-fe11e5e98cae'),(56,'craft','m170621_195237_format_plugin_handles','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','47956da1-475b-4579-ad74-5cc4d663db42'),(57,'craft','m170630_161027_deprecation_line_nullable','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','40f36a89-2e59-4f34-954b-64f9ec3ec381'),(58,'craft','m170630_161028_deprecation_changes','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','5f918aae-9adb-4423-866d-f73386b8e7fd'),(59,'craft','m170703_181539_plugins_table_tweaks','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','981875f3-9f40-495f-82b8-0f80733a12cc'),(60,'craft','m170704_134916_sites_tables','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','e7500eca-7a66-4466-82ab-7062f28573dd'),(61,'craft','m170706_183216_rename_sequences','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','51553df0-5d15-4609-ac78-d530a7368d61'),(62,'craft','m170707_094758_delete_compiled_traits','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','1fbe46a1-966b-4f53-9fa4-7fa147aaa38b'),(63,'craft','m170731_190138_drop_asset_packagist','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','cd805ab3-eaf9-4cad-b930-d4d64129858e'),(64,'craft','m170810_201318_create_queue_table','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','0739477b-4aa5-46ba-a72e-89fbf2e9aa9c'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','4e1bfa6e-925f-4f22-8d46-462927ac58c6'),(66,'craft','m170914_204621_asset_cache_shuffle','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','28d6d748-7078-4ab7-8fdd-ba5275155cb7'),(67,'craft','m171011_214115_site_groups','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','ca1b20ea-bbfc-433e-9c2a-bf56e59f4565'),(68,'craft','m171012_151440_primary_site','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','e862c08f-9ada-421c-96d7-c71c96fdbaf1'),(69,'craft','m171013_142500_transform_interlace','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','df77028f-3a05-4841-96e2-8439e7b78602'),(70,'craft','m171016_092553_drop_position_select','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','171c4f39-594c-4cfa-be28-a5b3793a9f2d'),(71,'craft','m171016_221244_less_strict_translation_method','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','c3c21e3b-c318-4c90-9ab1-874f413cb372'),(72,'craft','m171107_000000_assign_group_permissions','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','3667b12c-77a9-4bef-8381-a55037376b1c'),(73,'craft','m171117_000001_templatecache_index_tune','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','6e46b65f-0e47-4d31-93b8-9ffa0538989f'),(74,'craft','m171126_105927_disabled_plugins','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','846f1c3b-ff91-435b-989d-a534400f6800'),(75,'craft','m171130_214407_craftidtokens_table','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','17199608-ee4d-4214-a349-7ce979294a97'),(76,'craft','m171202_004225_update_email_settings','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','943c9873-604f-4f64-9448-a525bd030ac6'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','07fdfc09-442c-42d6-8ab9-3d764b886808'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','392fc9cc-2d78-4655-88e8-b823ccb2e033'),(79,'craft','m171218_143135_longtext_query_column','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','953e8c82-a0a9-4c52-b20d-8ca3627d691e'),(80,'craft','m171231_055546_environment_variables_to_aliases','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','3f0255bd-dab7-448e-8459-027b95eb5970'),(81,'craft','m180113_153740_drop_users_archived_column','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','23edabbb-4ba0-4ab4-a5c6-26088d638889'),(82,'craft','m180122_213433_propagate_entries_setting','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','35d0c060-99d8-40ac-ba08-d48b696b75a8'),(83,'craft','m180124_230459_fix_propagate_entries_values','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','2ea83ba6-b16c-4f82-9d4b-88dfd16c3966'),(84,'craft','m180128_235202_set_tag_slugs','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','cac52261-015f-470c-a658-1ddf6e45c454'),(85,'craft','m180202_185551_fix_focal_points','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','695e6a87-01e3-455d-a310-73a66331ab92'),(86,'craft','m180217_172123_tiny_ints','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','ad4b57a0-53ad-42db-ac30-f8530792f51e'),(87,'craft','m180321_233505_small_ints','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','2b19852f-1ec2-4f01-b4c0-801fd164a3ff'),(88,'craft','m180404_182320_edition_changes','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','8ed65710-b296-4a31-a16a-5aeb875afbeb'),(89,'craft','m180411_102218_fix_db_routes','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','be8b9ea7-a260-44a9-b93b-918437487f03'),(90,'craft','m180416_205628_resourcepaths_table','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','827f90d1-70fc-4bc1-badf-71e1d9fa1bc0'),(91,'craft','m180418_205713_widget_cleanup','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','c6ef4872-c086-469b-b8e4-95a85dafb59f'),(92,'craft','m180425_203349_searchable_fields','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','b1876848-010f-444a-8c8a-11ce499b54e5'),(93,'craft','m180516_153000_uids_in_field_settings','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','bdee1e75-bb25-45c6-a86a-d3c39463fb9f'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','d62627fb-9aab-4481-86fb-03bd6aaec804'),(95,'craft','m180518_173000_permissions_to_uid','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','61dd2229-07b8-4098-871f-42113fb87b8b'),(96,'craft','m180520_173000_matrix_context_to_uids','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','b735b22c-7d8e-4e30-8f43-b7068eaf44d6'),(97,'craft','m180521_172900_project_config_table','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','32d355fd-ae73-40e9-9a9a-d34a9a931b7b'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','d69dc860-3bb2-4a76-84e7-bee3c54e7cd4'),(99,'craft','m180731_162030_soft_delete_sites','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','eaf7ce74-79fd-4d9e-9342-36b86e59bef2'),(100,'craft','m180810_214427_soft_delete_field_layouts','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','b451be21-b929-4940-a97e-1e650854b1af'),(101,'craft','m180810_214439_soft_delete_elements','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','f1ac4458-6c8d-46d6-88b6-4cb61549ca88'),(102,'craft','m180824_193422_case_sensitivity_fixes','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','03c847b6-e187-4e67-98ad-abbb02963ac4'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','22f2227a-3273-4622-b304-57ab195e45e2'),(104,'craft','m180904_112109_permission_changes','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','aa10ed88-34e8-4c73-bd3a-0132dc44c1b8'),(105,'craft','m180910_142030_soft_delete_sitegroups','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','70905fdd-cd59-4a8e-b0fc-a3fd1266bf88'),(106,'craft','m181011_160000_soft_delete_asset_support','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','389adeba-c260-4777-ae40-329e8c34434a'),(107,'craft','m181016_183648_set_default_user_settings','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','fa86b765-3055-4193-abf1-399903fb5f70'),(108,'craft','m181017_225222_system_config_settings','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','c2b166e3-bd28-4071-bdf3-5bf776f764aa'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','e9401fa3-6ad8-4435-8c0d-ecdc46aa2297'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','982faf0f-ad99-4ce0-b798-c3170717637a'),(111,'craft','m181112_203955_sequences_table','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','1be00119-f7a3-4166-92be-42d83dab7804'),(112,'craft','m181121_001712_cleanup_field_configs','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','3c82f9d6-c394-4b0f-89e7-a88a4c57e5bb'),(113,'craft','m181128_193942_fix_project_config','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','c1bd1b4d-9876-4b02-855e-ba2ff931b3b3'),(114,'craft','m181130_143040_fix_schema_version','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','fa28da2e-7f29-427f-8508-1a87083caf8d'),(115,'craft','m181211_143040_fix_entry_type_uids','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','f6701008-348b-430e-b14b-94c3c2cf3003'),(116,'craft','m181217_153000_fix_structure_uids','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','c2916f25-8c7c-4c12-9d15-eb59d06f912e'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','cf1835a1-7dde-4348-bf19-3375b2de66e9'),(118,'craft','m190108_110000_cleanup_project_config','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','e91ed2ad-88b0-4aa1-85da-7753d1568dd7'),(119,'craft','m190108_113000_asset_field_setting_change','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','08de90da-3c8c-4d0d-9475-eb301197b7dd'),(120,'craft','m190109_172845_fix_colspan','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','c944f92a-8689-40e2-982d-1b76cba2c134'),(121,'craft','m190110_150000_prune_nonexisting_sites','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','df89449a-42cd-4d6c-9f16-263b4cdd426d'),(122,'craft','m190110_214819_soft_delete_volumes','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','42437375-fa0b-44df-9216-29a270f82e0d'),(123,'craft','m190112_124737_fix_user_settings','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','af4909a5-9d5b-465c-9fac-0e44db2399c9'),(124,'craft','m190112_131225_fix_field_layouts','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','93b5041e-d2f9-41dc-958e-53ceefb11296'),(125,'craft','m190112_201010_more_soft_deletes','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','ca186d90-0a32-488e-9186-5c9f0184fce9'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','2f983ff2-a28e-4ed1-9f18-9e6703cfd6e3'),(127,'craft','m190121_120000_rich_text_config_setting','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','f223d199-aaa6-4a15-b295-f1f92427b6f3'),(128,'craft','m190125_191628_fix_email_transport_password','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','5ee4e859-b1f5-4675-b297-a53dd95be656'),(129,'craft','m190128_181422_cleanup_volume_folders','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','be2311fe-1df1-4a90-bd8b-e4c125890ee6'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','3c4385c6-c93b-4bfd-aceb-218a4add7325'),(131,'craft','m190218_143000_element_index_settings_uid','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','97ff1a50-154d-4448-8e6e-3f9b283961a9'),(132,'craft','m190312_152740_element_revisions','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','83a8520d-5db9-456d-b82f-8d332083a0ec'),(133,'craft','m190327_235137_propagation_method','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','90f230d2-513e-47a1-b4e0-662b415b0e3c'),(134,'craft','m190401_223843_drop_old_indexes','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','0cca8120-5adf-43c7-bc00-2b88a5e872fc'),(135,'craft','m190416_014525_drop_unique_global_indexes','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','02b3412c-d759-4294-8b70-af0f71dfda24'),(136,'craft','m190417_085010_add_image_editor_permissions','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','395cfe21-957e-4b34-b076-426c3972d48c'),(137,'craft','m190502_122019_store_default_user_group_uid','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','8627a64e-aaef-440d-95c7-b917a7b45a65'),(138,'craft','m190504_150349_preview_targets','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','b57e5d49-6403-499b-aa34-fda0e98bda6c'),(139,'craft','m190516_184711_job_progress_label','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','e08bd2b5-a2f8-4739-99ef-c2c26d885d6e'),(140,'craft','m190523_190303_optional_revision_creators','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','f2343f9a-0c90-41ec-bd64-1ff671ac3aaa'),(141,'craft','m190529_204501_fix_duplicate_uids','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','55f8d48b-46c8-4113-b82d-822196195d3a'),(142,'craft','m190605_223807_unsaved_drafts','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','5fc9369f-9d83-4f78-9613-5b986ee65778'),(143,'craft','m190607_230042_entry_revision_error_tables','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','b4237612-f8c0-435f-812a-db0e8cbe3ecf'),(144,'craft','m190608_033429_drop_elements_uid_idx','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','e288ed08-736b-4dd9-bb2c-4a4604ea0fe3'),(145,'craft','m190617_164400_add_gqlschemas_table','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','eb3a8522-ea8a-4731-8514-a607156d5969'),(146,'craft','m190624_234204_matrix_propagation_method','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','e088d8e4-9e61-42a2-972d-81baab081414'),(147,'craft','m190711_153020_drop_snapshots','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','aacf1858-295d-4ace-b961-acbe683b3dc9'),(148,'craft','m190712_195914_no_draft_revisions','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','a57ef663-6633-4b68-beec-d0e52d3abd9a'),(149,'craft','m190723_140314_fix_preview_targets_column','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','8e03acdd-cdc8-4853-aad5-8b4c15acc031'),(150,'craft','m190820_003519_flush_compiled_templates','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','be88c2b2-f182-45c0-ae35-0750795eecd9'),(151,'craft','m190823_020339_optional_draft_creators','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','02faea97-b962-4502-91df-16731b97e962'),(152,'craft','m190913_152146_update_preview_targets','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','8abee706-8587-4679-9eba-6530ab07f237'),(153,'craft','m191107_122000_add_gql_project_config_support','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','e0da43b5-9461-472b-b086-d252f6776290'),(154,'craft','m191204_085100_pack_savable_component_settings','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','55426d04-753b-475f-bf61-20caceaa7aec'),(155,'craft','m191206_001148_change_tracking','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','5363feb7-429e-4d68-80a7-587b24936eac'),(156,'craft','m191216_191635_asset_upload_tracking','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','b2e0c9f8-6b78-433e-a4d8-7e4c48172af8'),(157,'craft','m191222_002848_peer_asset_permissions','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','42948408-864f-442b-b1b9-e18d93409b75'),(158,'craft','m200127_172522_queue_channels','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','24e2bde7-aeb6-4084-a5c3-4827d4556459'),(159,'craft','m200211_175048_truncate_element_query_cache','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','f997ab00-f452-453e-83f5-3634b68e43e4'),(160,'craft','m200213_172522_new_elements_index','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','49f0fd4f-728e-43c0-8b9e-8e53b0154bb5'),(161,'craft','m200228_195211_long_deprecation_messages','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','cc4282f5-157d-486f-ae3b-9e433f76239c'),(162,'craft','m200306_054652_disabled_sites','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','fe96d2cd-0a74-4867-88ef-5f9d680d16ea'),(163,'craft','m200522_191453_clear_template_caches','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','d54bcd12-3ea6-44c4-83fa-00824402d0ac'),(164,'craft','m200606_231117_migration_tracks','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','e5890e74-88c6-4f18-8ad5-4adb44c4bb5b'),(165,'craft','m200619_215137_title_translation_method','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','5d39a838-ee1f-4654-a596-ba4bdd5cc16c'),(166,'craft','m200620_005028_user_group_descriptions','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','e24e3370-2de5-4f9f-b611-e5d8dc40acf2'),(167,'craft','m200620_230205_field_layout_changes','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','78c90e53-757e-4de9-888b-17553812dd45'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','18ce0aad-a647-495b-8afb-29a7e4c7d116'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','fb8c3b85-3b26-40b4-8105-f9ee88f8c2b5'),(170,'craft','m200630_183000_drop_configmap','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','60479362-7081-41aa-bbc3-119da08d4290'),(171,'craft','m200715_113400_transform_index_error_flag','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','a483162c-19a2-48e8-9eda-ecd38ad6e125'),(172,'craft','m200716_110900_replace_file_asset_permissions','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','e3c35e53-2c77-4cff-8a26-5505b46fe07d'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','5306c7e2-9696-4b30-9648-0c1fdc45a504'),(174,'craft','m200720_175543_drop_unique_constraints','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','db75e6db-8e2a-40b9-8a06-75625eb724eb'),(175,'craft','m200825_051217_project_config_version','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','d41d7497-94a1-42fe-b4fc-f5ccc6d97d49'),(176,'craft','m201116_190500_asset_title_translation_method','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','48531463-e7ee-4a71-9955-bf91cf494239'),(177,'craft','m201124_003555_plugin_trials','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','515edda2-70d8-4242-ba9a-d7046a7bd5ce'),(178,'craft','m210209_135503_soft_delete_field_groups','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','21d401bc-c0a7-4ab0-9eed-7ba3a2123b89'),(179,'craft','m210212_223539_delete_invalid_drafts','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','7835fd4a-1197-4020-affc-e7d2fef0a6f0'),(180,'craft','m210214_202731_track_saved_drafts','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','f3c3654f-962b-474c-a500-b35e05dccbc4'),(181,'craft','m210223_150900_add_new_element_gql_schema_components','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','2245fbe4-4dc9-43b8-97dc-1fbdf440b5fc'),(182,'craft','m210302_212318_canonical_elements','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','7f314d5d-c513-4097-b4b1-2732dd274638'),(183,'craft','m210326_132000_invalidate_projectconfig_cache','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','0e8a48b8-d6bc-4aa4-bf32-cc2164177c7a'),(184,'craft','m210329_214847_field_column_suffixes','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','64b21240-2ad6-426c-86e1-c71af2a8469b'),(185,'craft','m210331_220322_null_author','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','9f0c005d-5185-48e9-9c47-541f789dc00f'),(186,'craft','m210405_231315_provisional_drafts','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','70053118-ed85-48ea-b4e5-2425523dc5b4'),(187,'craft','m210602_111300_project_config_names_in_config','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','f47b4e63-6514-4816-805f-0190f21276af'),(188,'craft','m210611_233510_default_placement_settings','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','40c5cf9e-9bce-4b08-b200-5e880e6a7b53'),(189,'craft','m210613_145522_sortable_global_sets','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','6c19ea51-de1c-41e2-971d-54433f5c70eb'),(190,'craft','m210613_184103_announcements','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','be209704-1d52-4ef8-a6bb-5523cb6a184a'),(191,'craft','m210829_000000_element_index_tweak','2021-11-04 21:20:29','2021-11-04 21:20:29','2021-11-04 21:20:29','f7a4372a-d70c-49e6-a5c0-49912ceedf2f'),(192,'plugin:sprig','Install','2021-11-05 21:23:16','2021-11-05 21:23:16','2021-11-05 21:23:16','4f0492e5-eeff-4edb-9f82-b9cf45e8bc14'),(193,'plugin:sprig','m201020_120000_add_playgrounds_table','2021-11-05 21:23:17','2021-11-05 21:23:17','2021-11-05 21:23:17','57bcc91b-8195-4eb4-88ee-e0b87210ac63'),(194,'craft','m220209_095604_add_indexes','2023-03-24 20:02:29','2023-03-24 20:02:29','2023-03-24 20:02:29','7b2cfd0f-147d-400d-963a-343d0d6cb0bf'),(195,'craft','m220214_000000_truncate_sessions','2023-03-24 20:02:30','2023-03-24 20:02:30','2023-03-24 20:02:30','8bdcdfaf-bf3e-4540-9448-3926dfc992dc'),(196,'craft','m230221_185926_drop_element_fks','2023-03-24 20:02:30','2023-03-24 20:02:30','2023-03-24 20:02:30','44d4f794-52a7-4701-8e4b-a531edee9c8d'),(197,'craft','m230226_013114_drop_plugin_license_columns','2023-03-24 20:02:30','2023-03-24 20:02:30','2023-03-24 20:02:30','1ebb2979-89de-4cba-9f85-2bac64260d01'),(198,'craft','m210121_145800_asset_indexing_changes','2023-03-24 20:15:48','2023-03-24 20:15:48','2023-03-24 20:15:48','14c6424e-7695-4f51-b2b0-9d73cdc5f931'),(199,'craft','m210624_222934_drop_deprecated_tables','2023-03-24 20:15:48','2023-03-24 20:15:48','2023-03-24 20:15:48','ff74b8df-c035-40a2-9421-de74481629c9'),(200,'craft','m210724_180756_rename_source_cols','2023-03-24 20:15:48','2023-03-24 20:15:48','2023-03-24 20:15:48','0ef9777d-a682-4ad3-a07a-86678a3f0de0'),(201,'craft','m210809_124211_remove_superfluous_uids','2023-03-24 20:15:49','2023-03-24 20:15:49','2023-03-24 20:15:49','7dcb711e-dae3-435b-bd17-308686fbc47a'),(202,'craft','m210817_014201_universal_users','2023-03-24 20:15:49','2023-03-24 20:15:49','2023-03-24 20:15:49','7764c9fa-7734-4ec6-96e9-00feb925b95f'),(203,'craft','m210904_132612_store_element_source_settings_in_project_config','2023-03-24 20:15:49','2023-03-24 20:15:49','2023-03-24 20:15:49','89be86c9-d5ce-432e-be06-76207bb86800'),(204,'craft','m211115_135500_image_transformers','2023-03-24 20:15:49','2023-03-24 20:15:49','2023-03-24 20:15:49','a0755aa0-2187-4a02-9e77-e5e1bb39bde8'),(205,'craft','m211201_131000_filesystems','2023-03-24 20:15:50','2023-03-24 20:15:50','2023-03-24 20:15:50','20e73e86-8f15-4721-9620-c5ec427f8f4e'),(206,'craft','m220103_043103_tab_conditions','2023-03-24 20:15:50','2023-03-24 20:15:50','2023-03-24 20:15:50','bf5491c2-b309-4a83-b1e3-4fcb5bf795aa'),(207,'craft','m220104_003433_asset_alt_text','2023-03-24 20:15:50','2023-03-24 20:15:50','2023-03-24 20:15:50','106266aa-ed8a-458f-ab6f-c04a7eb96c81'),(208,'craft','m220123_213619_update_permissions','2023-03-24 20:15:50','2023-03-24 20:15:50','2023-03-24 20:15:50','8a4e199d-6700-4053-8d38-68b9d88651f0'),(209,'craft','m220126_003432_addresses','2023-03-24 20:15:50','2023-03-24 20:15:50','2023-03-24 20:15:50','2f4a6ca9-7dbc-4f59-b339-d2ac88be5fa9'),(210,'craft','m220213_015220_matrixblocks_owners_table','2023-03-24 20:15:50','2023-03-24 20:15:50','2023-03-24 20:15:50','d4c8cd6e-110a-4c50-8676-2fbeb1b21b2d'),(211,'craft','m220222_122159_full_names','2023-03-24 20:15:50','2023-03-24 20:15:50','2023-03-24 20:15:50','13b8dd24-91ff-494c-bc2a-904be2b236d4'),(212,'craft','m220223_180559_nullable_address_owner','2023-03-24 20:15:50','2023-03-24 20:15:50','2023-03-24 20:15:50','7d550110-d7d6-42d0-90c6-fb7582c68924'),(213,'craft','m220225_165000_transform_filesystems','2023-03-24 20:15:50','2023-03-24 20:15:50','2023-03-24 20:15:50','35fa839a-139f-4043-803e-54daef9537a5'),(214,'craft','m220309_152006_rename_field_layout_elements','2023-03-24 20:15:50','2023-03-24 20:15:50','2023-03-24 20:15:50','5bd9f76d-7997-463d-8449-ed5288660fa5'),(215,'craft','m220314_211928_field_layout_element_uids','2023-03-24 20:15:50','2023-03-24 20:15:50','2023-03-24 20:15:50','d89a4985-7739-4584-978c-d6eeb33e7bf0'),(216,'craft','m220316_123800_transform_fs_subpath','2023-03-24 20:15:50','2023-03-24 20:15:50','2023-03-24 20:15:50','ac946504-be80-45f4-8b1f-c134c3924e45'),(217,'craft','m220317_174250_release_all_jobs','2023-03-24 20:15:50','2023-03-24 20:15:50','2023-03-24 20:15:50','8ba510ad-2c07-4609-8d27-439fc3329af6'),(218,'craft','m220330_150000_add_site_gql_schema_components','2023-03-24 20:15:50','2023-03-24 20:15:50','2023-03-24 20:15:50','6e584a3b-b24c-48a9-af8c-4b7e7db0efbf'),(219,'craft','m220413_024536_site_enabled_string','2023-03-24 20:15:50','2023-03-24 20:15:50','2023-03-24 20:15:50','5d52b5f1-eb3c-4c0c-b110-742ba49be27e'),(220,'craft','m221027_160703_add_image_transform_fill','2023-03-24 20:15:51','2023-03-24 20:15:51','2023-03-24 20:15:51','450171ef-b03e-4bc7-9324-b4d06d4df9e3'),(221,'craft','m221028_130548_add_canonical_id_index','2023-03-24 20:15:51','2023-03-24 20:15:51','2023-03-24 20:15:51','fad2de4c-3c99-444f-8c4b-aa9832f3f1bc'),(222,'craft','m221118_003031_drop_element_fks','2023-03-24 20:15:51','2023-03-24 20:15:51','2023-03-24 20:15:51','5135a851-66e3-4815-ac2d-ba203e16f099'),(223,'craft','m230131_120713_asset_indexing_session_new_options','2023-03-24 20:15:51','2023-03-24 20:15:51','2023-03-24 20:15:51','aae32e74-115b-40a8-b531-2be5ea66efb4');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'sprig','2.5.1','1.0.1','2021-11-05 21:23:16','2021-11-05 21:23:16','2023-03-24 20:15:40','20483a34-48b9-499d-83e6-48681134461c'),(3,'vite','4.0.5','1.0.0','2023-03-27 16:36:29','2023-03-27 16:36:29','2023-03-27 16:36:29','ce4bc973-297e-4383-9580-521ce73275ed');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.defaultPlacement','\"end\"'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.autocapitalize','true'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.autocomplete','false'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.autocorrect','true'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.class','null'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.disabled','false'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.id','null'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.instructions','null'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.label','null'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.max','null'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.min','null'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.name','null'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.orientation','null'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.placeholder','null'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.readonly','false'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.requirable','false'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.size','null'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.step','null'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.tip','null'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.title','null'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\TitleField\"'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.warning','null'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.elements.0.width','100'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.name','\"Content\"'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.fieldLayouts.97b33eb0-f3a7-4277-b54f-416f5d9e266a.tabs.0.sortOrder','1'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.handle','\"workshopOptions\"'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.name','\"Workshop Options\"'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.siteSettings.f399f771-94d2-4947-b646-5167ef3e7739.hasUrls','true'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.siteSettings.f399f771-94d2-4947-b646-5167ef3e7739.template','null'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.siteSettings.f399f771-94d2-4947-b646-5167ef3e7739.uriFormat','\"workshop-options/{slug}\"'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.structure.maxLevels','null'),('categoryGroups.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d.structure.uid','\"e1355d12-97c5-48c5-b71d-35e2a4736141\"'),('dateModified','1680104163'),('email.fromEmail','\"wolfhoelscher@gmail.com\"'),('email.fromName','\"DIG Conference\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.autocapitalize','true'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.autocomplete','false'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.autocorrect','true'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.class','null'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.disabled','false'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.id','null'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.instructions','null'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.label','null'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.max','null'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.min','null'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.name','null'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.orientation','null'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.placeholder','null'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.readonly','false'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.requirable','false'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.size','null'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.step','null'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.tip','null'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.title','null'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.warning','null'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.elements.0.width','100'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.name','\"Content\"'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.fieldLayouts.aa33e363-4ce1-4994-bc6d-b4263e0d59c6.tabs.0.sortOrder','1'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.handle','\"default\"'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.hasTitleField','true'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.name','\"Default\"'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.section','\"9edfd08f-a121-4075-888e-1184c893ecc3\"'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.sortOrder','1'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.titleFormat','null'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.titleTranslationKeyFormat','null'),('entryTypes.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1.titleTranslationMethod','\"site\"'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.autocapitalize','true'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.autocomplete','false'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.autocorrect','true'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.class','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.disabled','false'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.id','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.instructions','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.label','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.max','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.min','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.name','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.orientation','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.placeholder','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.readonly','false'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.requirable','false'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.size','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.step','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.tip','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.title','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.warning','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.0.width','100'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.1.fieldUid','\"09b66cbd-79da-423b-a032-8e557c20a47f\"'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.1.instructions','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.1.label','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.1.required','false'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.1.tip','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.1.warning','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.1.width','100'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.2.fieldUid','\"9dba5aaf-a7b7-4b18-94de-6480f73ffe8f\"'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.2.instructions','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.2.label','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.2.required','false'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.2.tip','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.2.warning','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.elements.2.width','100'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.name','\"Content\"'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.fieldLayouts.6ad2ef42-7da6-4bd1-97d4-1a22967a53a1.tabs.0.sortOrder','1'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.handle','\"home\"'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.hasTitleField','false'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.name','\"Home\"'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.section','\"5e1a2be2-d470-49ee-8b38-bd0922219a84\"'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.sortOrder','1'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.titleFormat','\"{section.name|raw}\"'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.titleTranslationKeyFormat','null'),('entryTypes.3a566891-a13e-4afd-b861-dbb70617c06f.titleTranslationMethod','\"site\"'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.autocapitalize','true'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.autocomplete','false'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.autocorrect','true'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.class','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.disabled','false'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.id','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.instructions','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.label','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.max','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.min','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.name','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.orientation','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.placeholder','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.readonly','false'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.requirable','false'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.size','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.step','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.tip','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.title','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.warning','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.0.width','100'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.1.fieldUid','\"45f36e39-a33d-480a-b301-8490c3826065\"'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.1.instructions','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.1.label','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.1.required','false'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.1.tip','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.1.warning','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.1.width','100'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.2.fieldUid','\"3c073182-f385-4f69-9d7e-09d570f452b2\"'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.2.instructions','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.2.label','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.2.required','false'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.2.tip','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.2.warning','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.2.width','100'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.3.fieldUid','\"8a3661ac-e890-4b8d-ae18-c80a5e821dc8\"'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.3.instructions','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.3.label','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.3.required','false'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.3.tip','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.3.warning','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.elements.3.width','100'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.name','\"Content\"'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.fieldLayouts.2a2a65f8-7f80-43ae-bd88-da1d7200f7c2.tabs.0.sortOrder','1'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.handle','\"default\"'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.hasTitleField','true'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.name','\"Default\"'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.section','\"a5744892-cefc-4ba8-9b73-1f6a864889c5\"'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.sortOrder','1'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.titleFormat','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.titleTranslationKeyFormat','null'),('entryTypes.9e958346-5830-4e4e-83a9-8782cb80dd70.titleTranslationMethod','\"site\"'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.autocapitalize','true'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.autocomplete','false'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.autocorrect','true'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.class','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.disabled','false'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.id','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.instructions','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.label','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.max','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.min','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.name','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.orientation','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.placeholder','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.readonly','false'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.requirable','false'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.size','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.step','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.tip','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.title','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.warning','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.0.width','100'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.1.fieldUid','\"de6da1a6-867d-4e20-b532-29a8b37faff0\"'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.1.instructions','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.1.label','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.1.required','false'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.1.tip','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.1.warning','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.elements.1.width','100'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.name','\"Content\"'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.fieldLayouts.8e1da8f7-fbf4-4207-9dfe-bcdbbe226ae4.tabs.0.sortOrder','1'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.handle','\"workshops\"'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.hasTitleField','true'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.name','\"Workshops\"'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.section','\"b4cc5457-0dc9-4b17-b46a-5d150cc4cd67\"'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.sortOrder','1'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.titleFormat','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.titleTranslationKeyFormat','null'),('entryTypes.cd901ed7-4538-46c2-bb9f-87a94182e14f.titleTranslationMethod','\"site\"'),('fieldGroups.0e0adc44-6b95-4f80-b769-844d1c551b50.name','\"Home\"'),('fieldGroups.35ee41a8-521e-4670-8ff9-0a988d4bf1d1.name','\"Assets\"'),('fieldGroups.6557ba0c-1632-484f-ae2e-ab7f22b55066.name','\"News\"'),('fieldGroups.8f2a8a85-dbf7-4bb1-8090-3de22a20ace4.name','\"Globals\"'),('fieldGroups.b71ae0f5-0f4a-4477-9f0c-3c338ad02d8d.name','\"Common\"'),('fieldGroups.d8e2337d-f0d9-427b-891c-2c80172d9473.name','\"Workshops\"'),('fieldGroups.d9fe5eee-fd03-438e-8e5b-4a3825748f8d.name','\"Events\"'),('fields.09b66cbd-79da-423b-a032-8e557c20a47f.columnSuffix','\"buypcalv\"'),('fields.09b66cbd-79da-423b-a032-8e557c20a47f.contentColumnType','\"text\"'),('fields.09b66cbd-79da-423b-a032-8e557c20a47f.fieldGroup','\"0e0adc44-6b95-4f80-b769-844d1c551b50\"'),('fields.09b66cbd-79da-423b-a032-8e557c20a47f.handle','\"heroHeadlineH1\"'),('fields.09b66cbd-79da-423b-a032-8e557c20a47f.instructions','\"\"'),('fields.09b66cbd-79da-423b-a032-8e557c20a47f.name','\"Hero Headline (h1)\"'),('fields.09b66cbd-79da-423b-a032-8e557c20a47f.searchable','false'),('fields.09b66cbd-79da-423b-a032-8e557c20a47f.settings.byteLimit','null'),('fields.09b66cbd-79da-423b-a032-8e557c20a47f.settings.charLimit','null'),('fields.09b66cbd-79da-423b-a032-8e557c20a47f.settings.code','\"\"'),('fields.09b66cbd-79da-423b-a032-8e557c20a47f.settings.columnType','null'),('fields.09b66cbd-79da-423b-a032-8e557c20a47f.settings.initialRows','\"4\"'),('fields.09b66cbd-79da-423b-a032-8e557c20a47f.settings.multiline','\"\"'),('fields.09b66cbd-79da-423b-a032-8e557c20a47f.settings.placeholder','null'),('fields.09b66cbd-79da-423b-a032-8e557c20a47f.settings.uiMode','\"normal\"'),('fields.09b66cbd-79da-423b-a032-8e557c20a47f.translationKeyFormat','null'),('fields.09b66cbd-79da-423b-a032-8e557c20a47f.translationMethod','\"none\"'),('fields.09b66cbd-79da-423b-a032-8e557c20a47f.type','\"craft\\\\fields\\\\PlainText\"'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.columnSuffix','null'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.contentColumnType','\"string\"'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.fieldGroup','\"8f2a8a85-dbf7-4bb1-8090-3de22a20ace4\"'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.handle','\"orgLogo\"'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.instructions','\"Adding an .svg file is preferable. \"'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.name','\"Organization Logo\"'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.searchable','true'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.allowedKinds.0','\"image\"'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.allowSelfRelations','false'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.allowUploads','true'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.defaultUploadLocationSource','\"volume:b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9\"'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.defaultUploadLocationSubpath','\"\"'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.limit','\"1\"'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.localizeRelations','false'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.previewMode','\"full\"'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.restrictFiles','\"1\"'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.selectionLabel','\"Add your logo.\"'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.showSiteMenu','true'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.showUnpermittedFiles','false'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.showUnpermittedVolumes','false'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.singleUploadLocationSource','\"volume:b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9\"'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.singleUploadLocationSubpath','\"\"'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.source','null'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.sources.0','\"volume:b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9\"'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.targetSiteId','null'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.useSingleFolder','false'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.validateRelatedElements','true'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.settings.viewMode','\"large\"'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.translationKeyFormat','null'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.translationMethod','\"site\"'),('fields.0b2c19fa-2230-4389-bba3-bb254a308b66.type','\"craft\\\\fields\\\\Assets\"'),('fields.3c073182-f385-4f69-9d7e-09d570f452b2.columnSuffix','\"rortsxhy\"'),('fields.3c073182-f385-4f69-9d7e-09d570f452b2.contentColumnType','\"time\"'),('fields.3c073182-f385-4f69-9d7e-09d570f452b2.fieldGroup','\"d9fe5eee-fd03-438e-8e5b-4a3825748f8d\"'),('fields.3c073182-f385-4f69-9d7e-09d570f452b2.handle','\"startTime\"'),('fields.3c073182-f385-4f69-9d7e-09d570f452b2.instructions','\"\"'),('fields.3c073182-f385-4f69-9d7e-09d570f452b2.name','\"Start Time\"'),('fields.3c073182-f385-4f69-9d7e-09d570f452b2.searchable','true'),('fields.3c073182-f385-4f69-9d7e-09d570f452b2.settings.max','null'),('fields.3c073182-f385-4f69-9d7e-09d570f452b2.settings.min','null'),('fields.3c073182-f385-4f69-9d7e-09d570f452b2.settings.minuteIncrement','30'),('fields.3c073182-f385-4f69-9d7e-09d570f452b2.translationKeyFormat','null'),('fields.3c073182-f385-4f69-9d7e-09d570f452b2.translationMethod','\"none\"'),('fields.3c073182-f385-4f69-9d7e-09d570f452b2.type','\"craft\\\\fields\\\\Time\"'),('fields.45f36e39-a33d-480a-b301-8490c3826065.columnSuffix','\"bhgwtomc\"'),('fields.45f36e39-a33d-480a-b301-8490c3826065.contentColumnType','\"datetime\"'),('fields.45f36e39-a33d-480a-b301-8490c3826065.fieldGroup','\"d9fe5eee-fd03-438e-8e5b-4a3825748f8d\"'),('fields.45f36e39-a33d-480a-b301-8490c3826065.handle','\"date\"'),('fields.45f36e39-a33d-480a-b301-8490c3826065.instructions','\"\"'),('fields.45f36e39-a33d-480a-b301-8490c3826065.name','\"Date\"'),('fields.45f36e39-a33d-480a-b301-8490c3826065.searchable','false'),('fields.45f36e39-a33d-480a-b301-8490c3826065.settings.max','null'),('fields.45f36e39-a33d-480a-b301-8490c3826065.settings.min','null'),('fields.45f36e39-a33d-480a-b301-8490c3826065.settings.minuteIncrement','\"30\"'),('fields.45f36e39-a33d-480a-b301-8490c3826065.settings.showDate','true'),('fields.45f36e39-a33d-480a-b301-8490c3826065.settings.showTime','false'),('fields.45f36e39-a33d-480a-b301-8490c3826065.settings.showTimeZone','false'),('fields.45f36e39-a33d-480a-b301-8490c3826065.translationKeyFormat','null'),('fields.45f36e39-a33d-480a-b301-8490c3826065.translationMethod','\"none\"'),('fields.45f36e39-a33d-480a-b301-8490c3826065.type','\"craft\\\\fields\\\\Date\"'),('fields.8a3661ac-e890-4b8d-ae18-c80a5e821dc8.columnSuffix','\"qozjxvrp\"'),('fields.8a3661ac-e890-4b8d-ae18-c80a5e821dc8.contentColumnType','\"time\"'),('fields.8a3661ac-e890-4b8d-ae18-c80a5e821dc8.fieldGroup','\"d9fe5eee-fd03-438e-8e5b-4a3825748f8d\"'),('fields.8a3661ac-e890-4b8d-ae18-c80a5e821dc8.handle','\"endTime\"'),('fields.8a3661ac-e890-4b8d-ae18-c80a5e821dc8.instructions','\"\"'),('fields.8a3661ac-e890-4b8d-ae18-c80a5e821dc8.name','\"End Time\"'),('fields.8a3661ac-e890-4b8d-ae18-c80a5e821dc8.searchable','true'),('fields.8a3661ac-e890-4b8d-ae18-c80a5e821dc8.settings.max','null'),('fields.8a3661ac-e890-4b8d-ae18-c80a5e821dc8.settings.min','null'),('fields.8a3661ac-e890-4b8d-ae18-c80a5e821dc8.settings.minuteIncrement','30'),('fields.8a3661ac-e890-4b8d-ae18-c80a5e821dc8.translationKeyFormat','null'),('fields.8a3661ac-e890-4b8d-ae18-c80a5e821dc8.translationMethod','\"none\"'),('fields.8a3661ac-e890-4b8d-ae18-c80a5e821dc8.type','\"craft\\\\fields\\\\Time\"'),('fields.9dba5aaf-a7b7-4b18-94de-6480f73ffe8f.columnSuffix','\"ymvviltp\"'),('fields.9dba5aaf-a7b7-4b18-94de-6480f73ffe8f.contentColumnType','\"text\"'),('fields.9dba5aaf-a7b7-4b18-94de-6480f73ffe8f.fieldGroup','\"0e0adc44-6b95-4f80-b769-844d1c551b50\"'),('fields.9dba5aaf-a7b7-4b18-94de-6480f73ffe8f.handle','\"heroSubhead\"'),('fields.9dba5aaf-a7b7-4b18-94de-6480f73ffe8f.instructions','\"\"'),('fields.9dba5aaf-a7b7-4b18-94de-6480f73ffe8f.name','\"Hero Subhead\"'),('fields.9dba5aaf-a7b7-4b18-94de-6480f73ffe8f.searchable','false'),('fields.9dba5aaf-a7b7-4b18-94de-6480f73ffe8f.settings.byteLimit','null'),('fields.9dba5aaf-a7b7-4b18-94de-6480f73ffe8f.settings.charLimit','null'),('fields.9dba5aaf-a7b7-4b18-94de-6480f73ffe8f.settings.code','\"\"'),('fields.9dba5aaf-a7b7-4b18-94de-6480f73ffe8f.settings.columnType','null'),('fields.9dba5aaf-a7b7-4b18-94de-6480f73ffe8f.settings.initialRows','\"4\"'),('fields.9dba5aaf-a7b7-4b18-94de-6480f73ffe8f.settings.multiline','\"\"'),('fields.9dba5aaf-a7b7-4b18-94de-6480f73ffe8f.settings.placeholder','null'),('fields.9dba5aaf-a7b7-4b18-94de-6480f73ffe8f.settings.uiMode','\"normal\"'),('fields.9dba5aaf-a7b7-4b18-94de-6480f73ffe8f.translationKeyFormat','null'),('fields.9dba5aaf-a7b7-4b18-94de-6480f73ffe8f.translationMethod','\"none\"'),('fields.9dba5aaf-a7b7-4b18-94de-6480f73ffe8f.type','\"craft\\\\fields\\\\PlainText\"'),('fields.ab72d918-6eef-4db5-8cbd-f685cfedbb9f.columnSuffix','\"bczzioby\"'),('fields.ab72d918-6eef-4db5-8cbd-f685cfedbb9f.contentColumnType','\"string(800)\"'),('fields.ab72d918-6eef-4db5-8cbd-f685cfedbb9f.fieldGroup','\"35ee41a8-521e-4670-8ff9-0a988d4bf1d1\"'),('fields.ab72d918-6eef-4db5-8cbd-f685cfedbb9f.handle','\"altTag\"'),('fields.ab72d918-6eef-4db5-8cbd-f685cfedbb9f.instructions','\"\"'),('fields.ab72d918-6eef-4db5-8cbd-f685cfedbb9f.name','\"Alt Tag\"'),('fields.ab72d918-6eef-4db5-8cbd-f685cfedbb9f.searchable','true'),('fields.ab72d918-6eef-4db5-8cbd-f685cfedbb9f.settings.byteLimit','null'),('fields.ab72d918-6eef-4db5-8cbd-f685cfedbb9f.settings.charLimit','200'),('fields.ab72d918-6eef-4db5-8cbd-f685cfedbb9f.settings.code','\"\"'),('fields.ab72d918-6eef-4db5-8cbd-f685cfedbb9f.settings.columnType','null'),('fields.ab72d918-6eef-4db5-8cbd-f685cfedbb9f.settings.initialRows','\"4\"'),('fields.ab72d918-6eef-4db5-8cbd-f685cfedbb9f.settings.multiline','\"\"'),('fields.ab72d918-6eef-4db5-8cbd-f685cfedbb9f.settings.placeholder','null'),('fields.ab72d918-6eef-4db5-8cbd-f685cfedbb9f.settings.uiMode','\"normal\"'),('fields.ab72d918-6eef-4db5-8cbd-f685cfedbb9f.translationKeyFormat','null'),('fields.ab72d918-6eef-4db5-8cbd-f685cfedbb9f.translationMethod','\"none\"'),('fields.ab72d918-6eef-4db5-8cbd-f685cfedbb9f.type','\"craft\\\\fields\\\\PlainText\"'),('fields.c819cbe2-c3b3-440f-920f-40cda13e406b.columnSuffix','\"iqviaavg\"'),('fields.c819cbe2-c3b3-440f-920f-40cda13e406b.contentColumnType','\"string(800)\"'),('fields.c819cbe2-c3b3-440f-920f-40cda13e406b.fieldGroup','\"8f2a8a85-dbf7-4bb1-8090-3de22a20ace4\"'),('fields.c819cbe2-c3b3-440f-920f-40cda13e406b.handle','\"orgName\"'),('fields.c819cbe2-c3b3-440f-920f-40cda13e406b.instructions','\"\"'),('fields.c819cbe2-c3b3-440f-920f-40cda13e406b.name','\"Organization Name\"'),('fields.c819cbe2-c3b3-440f-920f-40cda13e406b.searchable','true'),('fields.c819cbe2-c3b3-440f-920f-40cda13e406b.settings.byteLimit','null'),('fields.c819cbe2-c3b3-440f-920f-40cda13e406b.settings.charLimit','200'),('fields.c819cbe2-c3b3-440f-920f-40cda13e406b.settings.code','\"\"'),('fields.c819cbe2-c3b3-440f-920f-40cda13e406b.settings.columnType','null'),('fields.c819cbe2-c3b3-440f-920f-40cda13e406b.settings.initialRows','\"4\"'),('fields.c819cbe2-c3b3-440f-920f-40cda13e406b.settings.multiline','\"\"'),('fields.c819cbe2-c3b3-440f-920f-40cda13e406b.settings.placeholder','null'),('fields.c819cbe2-c3b3-440f-920f-40cda13e406b.settings.uiMode','\"normal\"'),('fields.c819cbe2-c3b3-440f-920f-40cda13e406b.translationKeyFormat','null'),('fields.c819cbe2-c3b3-440f-920f-40cda13e406b.translationMethod','\"none\"'),('fields.c819cbe2-c3b3-440f-920f-40cda13e406b.type','\"craft\\\\fields\\\\PlainText\"'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.columnSuffix','null'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.contentColumnType','\"string\"'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.fieldGroup','\"8f2a8a85-dbf7-4bb1-8090-3de22a20ace4\"'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.handle','\"footerLogo\"'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.instructions','\"\"'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.name','\"Footer Logo\"'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.searchable','false'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.allowedKinds.0','\"image\"'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.allowSelfRelations','false'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.allowUploads','true'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.defaultUploadLocationSource','\"volume:b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9\"'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.defaultUploadLocationSubpath','\"\"'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.limit','\"1\"'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.localizeRelations','false'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.previewMode','\"full\"'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.restrictFiles','\"1\"'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.selectionLabel','\"Add a footer logo\"'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.showSiteMenu','true'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.showUnpermittedFiles','false'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.showUnpermittedVolumes','false'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.singleUploadLocationSource','\"volume:b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9\"'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.singleUploadLocationSubpath','\"\"'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.source','null'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.sources.0','\"volume:b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9\"'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.targetSiteId','null'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.useSingleFolder','false'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.validateRelatedElements','true'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.settings.viewMode','\"large\"'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.translationKeyFormat','null'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.translationMethod','\"site\"'),('fields.dc7de2e2-0271-457c-96d8-17fc50854f46.type','\"craft\\\\fields\\\\Assets\"'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.columnSuffix','null'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.contentColumnType','\"string\"'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.fieldGroup','\"d8e2337d-f0d9-427b-891c-2c80172d9473\"'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.handle','\"workshopCat\"'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.instructions','\"\"'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.name','\"Workshop Category\"'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.searchable','true'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.settings.allowLimit','false'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.settings.allowMultipleSources','false'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.settings.allowSelfRelations','false'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.settings.branchLimit','\"\"'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.settings.limit','null'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.settings.localizeRelations','false'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.settings.selectionLabel','\"\"'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.settings.showSiteMenu','true'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.settings.source','\"group:94a2c9bc-5cc0-46ee-abe2-1c327c2c818d\"'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.settings.sources','\"*\"'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.settings.targetSiteId','null'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.settings.validateRelatedElements','false'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.settings.viewMode','null'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.translationKeyFormat','null'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.translationMethod','\"site\"'),('fields.de6da1a6-867d-4e20-b532-29a8b37faff0.type','\"craft\\\\fields\\\\Categories\"'),('fs.logos.hasUrls','true'),('fs.logos.name','\"logos\"'),('fs.logos.settings.path','\"@assetsPath\"'),('fs.logos.type','\"craft\\\\fs\\\\Local\"'),('fs.logos.url','\"@web/assets/logos\"'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.0.fieldUid','\"c819cbe2-c3b3-440f-920f-40cda13e406b\"'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.0.instructions','null'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.0.label','null'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.0.required','false'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.0.tip','null'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.0.warning','null'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.0.width','100'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.1.fieldUid','\"0b2c19fa-2230-4389-bba3-bb254a308b66\"'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.1.instructions','null'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.1.label','null'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.1.required','false'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.1.tip','null'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.1.warning','null'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.1.width','100'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.2.fieldUid','\"dc7de2e2-0271-457c-96d8-17fc50854f46\"'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.2.instructions','null'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.2.label','null'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.2.required','false'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.2.tip','null'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.2.warning','null'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.elements.2.width','100'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.name','\"Organization Info\"'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.fieldLayouts.747c7215-b02d-44ed-a82c-2177b0913dc4.tabs.0.sortOrder','1'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.handle','\"branding\"'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.name','\"Branding\"'),('globalSets.7c06fcf9-1581-471a-882f-9048a934814a.sortOrder','1'),('graphql.publicToken.enabled','true'),('graphql.publicToken.expiryDate','null'),('graphql.schemas.8dbe7fb4-102a-46a4-9a5f-399b2dc3a38f.isPublic','true'),('graphql.schemas.8dbe7fb4-102a-46a4-9a5f-399b2dc3a38f.name','\"Public Schema\"'),('meta.__names__.09b66cbd-79da-423b-a032-8e557c20a47f','\"Hero Headline (h1)\"'),('meta.__names__.0b2c19fa-2230-4389-bba3-bb254a308b66','\"Organization Logo\"'),('meta.__names__.0e0adc44-6b95-4f80-b769-844d1c551b50','\"Home\"'),('meta.__names__.1b4a32f2-2de8-4a8d-8208-58b3c45d9da1','\"Default\"'),('meta.__names__.35ee41a8-521e-4670-8ff9-0a988d4bf1d1','\"Assets\"'),('meta.__names__.3a566891-a13e-4afd-b861-dbb70617c06f','\"Home\"'),('meta.__names__.3c073182-f385-4f69-9d7e-09d570f452b2','\"Start Time\"'),('meta.__names__.45f36e39-a33d-480a-b301-8490c3826065','\"Date\"'),('meta.__names__.5e1a2be2-d470-49ee-8b38-bd0922219a84','\"Home\"'),('meta.__names__.6557ba0c-1632-484f-ae2e-ab7f22b55066','\"News\"'),('meta.__names__.7452cb63-b1b9-414b-8e96-4289cc1ada79','\"DIG Conference\"'),('meta.__names__.7c06fcf9-1581-471a-882f-9048a934814a','\"Branding\"'),('meta.__names__.8a3661ac-e890-4b8d-ae18-c80a5e821dc8','\"End Time\"'),('meta.__names__.8dbe7fb4-102a-46a4-9a5f-399b2dc3a38f','\"Public Schema\"'),('meta.__names__.8f2a8a85-dbf7-4bb1-8090-3de22a20ace4','\"Globals\"'),('meta.__names__.94a2c9bc-5cc0-46ee-abe2-1c327c2c818d','\"Workshop Options\"'),('meta.__names__.9dba5aaf-a7b7-4b18-94de-6480f73ffe8f','\"Hero Subhead\"'),('meta.__names__.9e958346-5830-4e4e-83a9-8782cb80dd70','\"Default\"'),('meta.__names__.9edfd08f-a121-4075-888e-1184c893ecc3','\"News\"'),('meta.__names__.a5744892-cefc-4ba8-9b73-1f6a864889c5','\"Events\"'),('meta.__names__.ab72d918-6eef-4db5-8cbd-f685cfedbb9f','\"Alt Tag\"'),('meta.__names__.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9','\"Logos\"'),('meta.__names__.b4cc5457-0dc9-4b17-b46a-5d150cc4cd67','\"Workshops\"'),('meta.__names__.b71ae0f5-0f4a-4477-9f0c-3c338ad02d8d','\"Common\"'),('meta.__names__.c819cbe2-c3b3-440f-920f-40cda13e406b','\"Organization Name\"'),('meta.__names__.cd901ed7-4538-46c2-bb9f-87a94182e14f','\"Workshops\"'),('meta.__names__.d8e2337d-f0d9-427b-891c-2c80172d9473','\"Workshops\"'),('meta.__names__.d9fe5eee-fd03-438e-8e5b-4a3825748f8d','\"Events\"'),('meta.__names__.dc7de2e2-0271-457c-96d8-17fc50854f46','\"Footer Logo\"'),('meta.__names__.de6da1a6-867d-4e20-b532-29a8b37faff0','\"Workshop Category\"'),('meta.__names__.f399f771-94d2-4947-b646-5167ef3e7739','\"DIG Conference\"'),('plugins.sprig.edition','\"standard\"'),('plugins.sprig.enabled','true'),('plugins.sprig.schemaVersion','\"1.0.1\"'),('plugins.vite.edition','\"standard\"'),('plugins.vite.enabled','true'),('plugins.vite.schemaVersion','\"1.0.0\"'),('sections.5e1a2be2-d470-49ee-8b38-bd0922219a84.defaultPlacement','\"end\"'),('sections.5e1a2be2-d470-49ee-8b38-bd0922219a84.enableVersioning','true'),('sections.5e1a2be2-d470-49ee-8b38-bd0922219a84.handle','\"home\"'),('sections.5e1a2be2-d470-49ee-8b38-bd0922219a84.name','\"Home\"'),('sections.5e1a2be2-d470-49ee-8b38-bd0922219a84.propagationMethod','\"all\"'),('sections.5e1a2be2-d470-49ee-8b38-bd0922219a84.siteSettings.f399f771-94d2-4947-b646-5167ef3e7739.enabledByDefault','true'),('sections.5e1a2be2-d470-49ee-8b38-bd0922219a84.siteSettings.f399f771-94d2-4947-b646-5167ef3e7739.hasUrls','true'),('sections.5e1a2be2-d470-49ee-8b38-bd0922219a84.siteSettings.f399f771-94d2-4947-b646-5167ef3e7739.template','\"index.twig\"'),('sections.5e1a2be2-d470-49ee-8b38-bd0922219a84.siteSettings.f399f771-94d2-4947-b646-5167ef3e7739.uriFormat','\"__home__\"'),('sections.5e1a2be2-d470-49ee-8b38-bd0922219a84.type','\"single\"'),('sections.9edfd08f-a121-4075-888e-1184c893ecc3.defaultPlacement','\"end\"'),('sections.9edfd08f-a121-4075-888e-1184c893ecc3.enableVersioning','true'),('sections.9edfd08f-a121-4075-888e-1184c893ecc3.handle','\"news\"'),('sections.9edfd08f-a121-4075-888e-1184c893ecc3.name','\"News\"'),('sections.9edfd08f-a121-4075-888e-1184c893ecc3.propagationMethod','\"all\"'),('sections.9edfd08f-a121-4075-888e-1184c893ecc3.siteSettings.f399f771-94d2-4947-b646-5167ef3e7739.enabledByDefault','true'),('sections.9edfd08f-a121-4075-888e-1184c893ecc3.siteSettings.f399f771-94d2-4947-b646-5167ef3e7739.hasUrls','true'),('sections.9edfd08f-a121-4075-888e-1184c893ecc3.siteSettings.f399f771-94d2-4947-b646-5167ef3e7739.template','\"news/_entry\"'),('sections.9edfd08f-a121-4075-888e-1184c893ecc3.siteSettings.f399f771-94d2-4947-b646-5167ef3e7739.uriFormat','\"news/{slug}\"'),('sections.9edfd08f-a121-4075-888e-1184c893ecc3.type','\"channel\"'),('sections.a5744892-cefc-4ba8-9b73-1f6a864889c5.defaultPlacement','\"end\"'),('sections.a5744892-cefc-4ba8-9b73-1f6a864889c5.enableVersioning','true'),('sections.a5744892-cefc-4ba8-9b73-1f6a864889c5.handle','\"events\"'),('sections.a5744892-cefc-4ba8-9b73-1f6a864889c5.name','\"Events\"'),('sections.a5744892-cefc-4ba8-9b73-1f6a864889c5.propagationMethod','\"all\"'),('sections.a5744892-cefc-4ba8-9b73-1f6a864889c5.siteSettings.f399f771-94d2-4947-b646-5167ef3e7739.enabledByDefault','true'),('sections.a5744892-cefc-4ba8-9b73-1f6a864889c5.siteSettings.f399f771-94d2-4947-b646-5167ef3e7739.hasUrls','true'),('sections.a5744892-cefc-4ba8-9b73-1f6a864889c5.siteSettings.f399f771-94d2-4947-b646-5167ef3e7739.template','\"events/_entry\"'),('sections.a5744892-cefc-4ba8-9b73-1f6a864889c5.siteSettings.f399f771-94d2-4947-b646-5167ef3e7739.uriFormat','\"events/{slug}\"'),('sections.a5744892-cefc-4ba8-9b73-1f6a864889c5.type','\"channel\"'),('sections.b4cc5457-0dc9-4b17-b46a-5d150cc4cd67.defaultPlacement','\"end\"'),('sections.b4cc5457-0dc9-4b17-b46a-5d150cc4cd67.enableVersioning','true'),('sections.b4cc5457-0dc9-4b17-b46a-5d150cc4cd67.handle','\"workshops\"'),('sections.b4cc5457-0dc9-4b17-b46a-5d150cc4cd67.name','\"Workshops\"'),('sections.b4cc5457-0dc9-4b17-b46a-5d150cc4cd67.propagationMethod','\"all\"'),('sections.b4cc5457-0dc9-4b17-b46a-5d150cc4cd67.siteSettings.f399f771-94d2-4947-b646-5167ef3e7739.enabledByDefault','true'),('sections.b4cc5457-0dc9-4b17-b46a-5d150cc4cd67.siteSettings.f399f771-94d2-4947-b646-5167ef3e7739.hasUrls','true'),('sections.b4cc5457-0dc9-4b17-b46a-5d150cc4cd67.siteSettings.f399f771-94d2-4947-b646-5167ef3e7739.template','\"workshops/_entry\"'),('sections.b4cc5457-0dc9-4b17-b46a-5d150cc4cd67.siteSettings.f399f771-94d2-4947-b646-5167ef3e7739.uriFormat','\"workshops/{slug}\"'),('sections.b4cc5457-0dc9-4b17-b46a-5d150cc4cd67.structure.maxLevels','1'),('sections.b4cc5457-0dc9-4b17-b46a-5d150cc4cd67.structure.uid','\"abf1c4f4-8fc6-49bd-addf-fafd082f001b\"'),('sections.b4cc5457-0dc9-4b17-b46a-5d150cc4cd67.type','\"structure\"'),('siteGroups.7452cb63-b1b9-414b-8e96-4289cc1ada79.name','\"DIG Conference\"'),('sites.f399f771-94d2-4947-b646-5167ef3e7739.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.f399f771-94d2-4947-b646-5167ef3e7739.enabled','true'),('sites.f399f771-94d2-4947-b646-5167ef3e7739.handle','\"default\"'),('sites.f399f771-94d2-4947-b646-5167ef3e7739.hasUrls','true'),('sites.f399f771-94d2-4947-b646-5167ef3e7739.language','\"en\"'),('sites.f399f771-94d2-4947-b646-5167ef3e7739.name','\"DIG Conference\"'),('sites.f399f771-94d2-4947-b646-5167ef3e7739.primary','true'),('sites.f399f771-94d2-4947-b646-5167ef3e7739.siteGroup','\"7452cb63-b1b9-414b-8e96-4289cc1ada79\"'),('sites.f399f771-94d2-4947-b646-5167ef3e7739.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"DIG Conference\"'),('system.retryDuration','null'),('system.schemaVersion','\"4.4.0.4\"'),('system.timeZone','\"America/Chicago\"'),('users.allowPublicRegistration','false'),('users.deactivateByDefault','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elementCondition','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.autocapitalize','true'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.autocomplete','false'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.autocorrect','true'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.class','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.disabled','false'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.elementCondition','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.id','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.instructions','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.label','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.max','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.min','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.name','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.orientation','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.placeholder','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.readonly','false'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.requirable','false'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.size','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.step','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.tip','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.title','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.uid','\"1b75e1eb-f0d0-4edf-88ce-30822ecd7415\"'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.userCondition','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.warning','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.0.width','100'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.1.elementCondition','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.1.fieldUid','\"ab72d918-6eef-4db5-8cbd-f685cfedbb9f\"'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.1.instructions','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.1.label','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.1.required','false'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.1.tip','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.1.uid','\"121971c6-1424-443e-914d-edc338c201b6\"'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.1.userCondition','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.1.warning','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.elements.1.width','100'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.name','\"Content\"'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.uid','\"6cf4446d-f174-4ae1-9a7e-cb434f794c83\"'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fieldLayouts.1b18a847-22c9-4524-9129-2069aee9a286.tabs.0.userCondition','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.fs','\"logos\"'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.handle','\"logos\"'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.name','\"Logos\"'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.sortOrder','1'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.titleTranslationKeyFormat','null'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.titleTranslationMethod','\"site\"'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.transformFs','\"\"'),('volumes.b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (2,1,9,NULL,6,1,'2021-11-04 22:07:37','2021-11-04 22:07:37','48181153-7919-4b13-b098-e1e7d033967e'),(3,1,12,NULL,6,1,'2021-11-04 22:07:37','2021-11-04 22:07:37','1ff667ce-eea1-42d5-9c7b-3c43bddd3f5f'),(4,1,13,NULL,6,1,'2021-11-04 22:08:27','2021-11-04 22:08:27','54a22720-af4c-4d84-b71c-43971532ca90'),(5,1,14,NULL,6,1,'2021-11-04 22:08:27','2021-11-04 22:08:27','0e5de4f4-e7ba-4f57-bf2a-7da4320bc9e3'),(9,1,13,NULL,8,2,'2021-11-04 22:09:17','2021-11-04 22:09:17','cd47e941-27fb-4071-91c4-afae841c6ca1'),(10,1,16,NULL,6,1,'2021-11-04 22:09:17','2021-11-04 22:09:17','8c690bf4-532f-4c0f-9bf7-c4c4699dbf9b'),(11,1,16,NULL,8,2,'2021-11-04 22:09:17','2021-11-04 22:09:17','45ace861-e2e1-441e-a6df-feea514fbdba'),(12,1,17,NULL,6,1,'2021-11-04 22:09:53','2021-11-04 22:09:53','417874e3-fdb2-4b08-b572-ec2262ee2246'),(13,1,17,NULL,7,2,'2021-11-04 22:09:53','2021-11-04 22:09:53','129a1c88-8be7-4825-b37e-5e74d3a9093d'),(14,1,17,NULL,8,3,'2021-11-04 22:09:53','2021-11-04 22:09:53','5418fcb0-3bc6-4797-a695-76b1b0f0d34e'),(15,1,18,NULL,6,1,'2021-11-04 22:09:58','2021-11-04 22:09:58','775f3dfb-b3f6-41c0-a9cb-bdfe56079959'),(16,1,18,NULL,7,2,'2021-11-04 22:09:58','2021-11-04 22:09:58','b153750d-fdf5-42ba-995a-39522bbc121e'),(17,1,18,NULL,8,3,'2021-11-04 22:09:58','2021-11-04 22:09:58','91d23892-caa5-42d9-93da-2eb4c8050422'),(18,1,19,NULL,8,1,'2021-11-04 22:10:32','2021-11-04 22:10:32','155c1e7b-613c-48e1-bba7-2759df6742e8'),(19,1,20,NULL,8,1,'2021-11-04 22:10:37','2021-11-04 22:10:37','ddf7e1dd-4381-46c7-aef0-4b69a867ae41'),(20,1,21,NULL,7,1,'2021-11-04 22:11:26','2021-11-04 22:11:26','94a67a82-ecae-4d10-97f2-6d93577c69f3'),(21,1,22,NULL,7,1,'2021-11-04 22:11:32','2021-11-04 22:11:32','6335d717-9488-4d32-b549-1e01b3d4e1eb'),(22,1,23,NULL,6,1,'2021-11-04 22:12:09','2021-11-04 22:12:09','348b7c35-3eae-45c8-aa5e-24ae89142722'),(23,1,23,NULL,7,2,'2021-11-04 22:12:09','2021-11-04 22:12:09','38dc80ae-35c7-450f-a5a6-cbb9ad951c57'),(24,1,23,NULL,8,3,'2021-11-04 22:12:09','2021-11-04 22:12:09','c024f574-73f9-49c1-ad14-ef385251ed81'),(25,1,24,NULL,6,1,'2021-11-04 22:12:12','2021-11-04 22:12:12','3204d680-2a70-4133-b9d9-3777e5222e46'),(26,1,24,NULL,7,2,'2021-11-04 22:12:12','2021-11-04 22:12:12','9cae0776-9f40-45ef-9bcd-36ba8aac099b'),(27,1,24,NULL,8,3,'2021-11-04 22:12:12','2021-11-04 22:12:12','d2b03ca2-42e4-4e6d-8a6e-e2d72b6024f9'),(28,1,25,NULL,6,1,'2021-11-04 22:12:47','2021-11-04 22:12:47','5aab2568-d095-4789-aadf-10814556726f'),(29,1,25,NULL,8,2,'2021-11-04 22:12:47','2021-11-04 22:12:47','ec9ef16a-f2df-428f-aacb-6b1d1f7385dc'),(30,1,26,NULL,6,1,'2021-11-04 22:12:50','2021-11-04 22:12:50','f9ef3184-d557-4c34-8885-c521c302bf43'),(31,1,26,NULL,8,2,'2021-11-04 22:12:50','2021-11-04 22:12:50','4c78ec78-779a-4b6e-b32a-cdbb787acce2'),(32,1,27,NULL,6,1,'2021-11-04 22:13:30','2021-11-04 22:13:30','b629a3e0-dc21-4c89-ac41-695319ab2ad3'),(33,1,27,NULL,7,2,'2021-11-04 22:13:40','2021-11-04 22:13:40','664f615b-e2fb-44b0-9c18-a986b1abf8f9'),(34,1,28,NULL,6,1,'2021-11-04 22:13:44','2021-11-04 22:13:44','92fff7c1-975e-43d0-b7a6-996fd907c6ed'),(35,1,28,NULL,7,2,'2021-11-04 22:13:44','2021-11-04 22:13:44','cc44bdb7-496f-4956-8213-27860bf89438'),(36,6,43,NULL,44,1,'2021-11-05 22:13:18','2021-11-05 22:13:18','62d21618-bb27-4bdc-8785-aff7fcb99035'),(37,7,43,NULL,45,1,'2021-11-05 22:15:43','2021-11-05 22:15:43','ea0e89c3-5f92-493d-a0d8-44c46ba9c65e'),(38,1,49,NULL,6,1,'2021-11-06 15:26:30','2021-11-06 15:26:30','11ec16eb-89c5-4a06-97f3-449116b72227'),(39,1,50,NULL,6,1,'2021-11-06 15:26:54','2021-11-06 15:26:54','933470bf-8c47-4afa-b214-a17a320933a1'),(40,1,50,NULL,8,2,'2021-11-06 15:26:54','2021-11-06 15:26:54','932570ef-c14e-458d-8ba5-fbd0f24387d3');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,NULL),(3,2,1,3,NULL),(4,9,1,1,''),(5,9,1,2,''),(6,13,1,1,NULL),(7,13,1,2,'Applied “Draft 1”'),(8,17,1,1,''),(9,19,1,1,''),(10,21,1,1,''),(11,23,1,1,''),(12,25,1,1,''),(13,27,1,1,''),(14,29,1,1,''),(15,31,1,1,''),(16,29,1,2,'Applied “Draft 1”'),(17,35,1,1,''),(18,37,1,1,''),(19,39,1,1,''),(20,41,1,1,''),(21,2,1,4,NULL),(22,2,1,5,'Applied “Draft 1”'),(23,9,1,3,''),(24,41,1,2,'Applied “Draft 1”'),(25,37,1,2,'Applied “Draft 1”'),(26,39,1,2,'Applied “Draft 1”'),(27,41,1,3,'Applied “Draft 1”'),(28,2,1,6,''),(29,2,1,7,'Applied “Draft 1”');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'username',0,1,' hoels wolf '),(1,'lastname',0,1,''),(1,'firstname',0,1,''),(2,'slug',0,1,' home '),(6,'slug',0,1,' development '),(6,'title',0,1,' development '),(7,'slug',0,1,' strategy and content '),(7,'title',0,1,' strategy and content '),(8,'slug',0,1,' design '),(8,'title',0,1,' design '),(9,'title',0,1,' workshop 1 '),(9,'slug',0,1,' workshop 1 '),(9,'field',1,1,' development '),(13,'field',1,1,' development design '),(13,'slug',0,1,' workshop 2 '),(13,'title',0,1,' workshop 2 '),(17,'title',0,1,' workshop 3 '),(17,'slug',0,1,' workshop 3 '),(17,'field',1,1,' development strategy and content design '),(19,'title',0,1,' workshop 4 '),(19,'field',1,1,' design '),(19,'slug',0,1,' workshop 4 '),(21,'title',0,1,' workshop 5 '),(21,'slug',0,1,' workshop 5 '),(21,'field',1,1,' strategy and content '),(23,'title',0,1,' workshop 6 '),(23,'slug',0,1,' workshop 6 '),(23,'field',1,1,' development strategy and content design '),(25,'field',1,1,' development design '),(25,'title',0,1,' workshop 7 '),(25,'slug',0,1,' workshop 7 '),(27,'field',1,1,' development strategy and content '),(27,'title',0,1,' workshop 8 '),(27,'slug',0,1,' workshop 8 '),(29,'field',3,1,''),(29,'slug',0,1,' registration and sign in '),(29,'title',0,1,' registration and sign in '),(31,'field',3,1,''),(31,'title',0,1,' happy hour '),(31,'slug',0,1,' happy hour '),(31,'field',4,1,''),(29,'field',4,1,''),(35,'field',4,1,''),(35,'title',0,1,' morning coffee and social '),(35,'slug',0,1,' morning coffee and social '),(35,'field',3,1,''),(37,'slug',0,1,' influential speakers at dig this year '),(37,'title',0,1,' influential speakers at dig this year '),(39,'title',0,1,' tech meet ups in baton rouge '),(39,'slug',0,1,' tech meet ups in baton rouge '),(41,'title',0,1,' how to get the most out of tech conferences '),(41,'slug',0,1,' how to get the most out of tech conferences '),(43,'slug',0,1,''),(44,'extension',0,1,' svg '),(43,'field',6,1,' dig logo '),(43,'field',5,1,' dig '),(45,'kind',0,1,' image '),(45,'extension',0,1,' svg '),(1,'fullname',0,1,''),(1,'email',0,1,' wolfhoelscher gmail com '),(1,'slug',0,1,''),(50,'title',0,1,' workshop 2 '),(50,'slug',0,1,' workshop 2 '),(50,'field',1,1,' development design '),(45,'filename',0,1,' footer logo svg '),(44,'filename',0,1,' dig logo svg '),(44,'field',8,1,' dig logo '),(61,'username',0,1,' admin '),(61,'fullname',0,1,' jr dev candidate '),(61,'firstname',0,1,' jr '),(61,'lastname',0,1,' candidate '),(61,'email',0,1,' dev emergentmethod com '),(2,'title',0,1,' home '),(61,'slug',0,1,''),(64,'filename',0,1,' dig logo png '),(64,'extension',0,1,' png '),(64,'kind',0,1,' image '),(64,'alt',0,1,''),(64,'slug',0,1,''),(64,'title',0,1,' dig logo '),(45,'alt',0,1,''),(45,'slug',0,1,''),(45,'title',0,1,' footer logo '),(45,'field',8,1,' dig conference logo '),(44,'kind',0,1,' image '),(44,'alt',0,1,''),(44,'slug',0,1,''),(44,'title',0,1,' dig logo ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Home','home','single',1,'all','end',NULL,'2021-11-04 21:33:26','2021-11-04 21:33:26',NULL,'5e1a2be2-d470-49ee-8b38-bd0922219a84'),(2,1,'Workshops','workshops','structure',1,'all','end',NULL,'2021-11-04 21:35:54','2021-11-04 21:35:54',NULL,'b4cc5457-0dc9-4b17-b46a-5d150cc4cd67'),(3,NULL,'Events','events','channel',1,'all','end',NULL,'2021-11-04 21:36:56','2021-11-04 21:36:56',NULL,'a5744892-cefc-4ba8-9b73-1f6a864889c5'),(4,NULL,'News','news','channel',1,'all','end',NULL,'2021-11-04 21:37:20','2021-11-04 21:37:20',NULL,'9edfd08f-a121-4075-888e-1184c893ecc3');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','index.twig',1,'2021-11-04 21:33:27','2021-11-04 21:33:27','a26c31b0-2fa8-4ebe-8834-2678fdc01d6b'),(2,2,1,1,'workshops/{slug}','workshops/_entry',1,'2021-11-04 21:35:54','2021-11-04 21:35:54','7a3d20a8-9d5b-4e36-a4d2-b17bb8011b9d'),(3,3,1,1,'events/{slug}','events/_entry',1,'2021-11-04 21:36:56','2021-11-04 21:36:56','08470c8a-f09f-4ab8-96d0-fc7dff2feb71'),(4,4,1,1,'news/{slug}','news/_entry',1,'2021-11-04 21:37:21','2021-11-04 21:37:21','23e71708-ac70-4f66-b4c0-5f31e980be36');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'DIG Conference','2021-11-04 21:20:27','2021-11-04 21:20:27',NULL,'7452cb63-b1b9-414b-8e96-4289cc1ada79');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'1','DIG Conference','default','en',1,'$PRIMARY_SITE_URL',1,'2021-11-04 21:20:27','2023-03-24 20:07:03',NULL,'f399f771-94d2-4947-b646-5167ef3e7739');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sprig_playgrounds`
--

LOCK TABLES `sprig_playgrounds` WRITE;
/*!40000 ALTER TABLE `sprig_playgrounds` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sprig_playgrounds` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structureelements` VALUES (1,2,NULL,1,1,8,0,'2021-11-04 21:58:20','2021-11-04 21:59:21','30102b8e-5e2a-4107-a60d-792d0e51d8f1'),(2,2,6,1,2,3,1,'2021-11-04 21:58:20','2021-11-04 21:58:20','a41f9030-8032-4cb6-9f5c-f5b2377fac7f'),(3,2,7,1,4,5,1,'2021-11-04 21:58:45','2021-11-04 21:58:45','1b03930b-291c-427a-982a-f54b14b173af'),(4,2,8,1,6,7,1,'2021-11-04 21:59:21','2021-11-04 21:59:21','c21bb066-11f7-4eee-bbeb-8ce9c30baa55'),(5,1,NULL,5,1,18,0,'2021-11-04 22:04:05','2021-11-04 22:12:54','6242b36e-6176-4d3a-acc6-e9f5d328bfe7'),(6,1,9,5,2,3,1,'2021-11-04 22:04:05','2021-11-04 22:04:05','ed6aeaf3-adfe-4c21-8eb1-8dc6049b6e06'),(7,1,13,5,4,5,1,'2021-11-04 22:08:27','2021-11-04 22:08:27','9c61d344-89e0-4d3d-845c-9a27e34803a8'),(8,1,17,5,6,7,1,'2021-11-04 22:09:22','2021-11-04 22:09:22','615a3c2b-b8da-45f8-a1e8-196312cddad9'),(9,1,19,5,8,9,1,'2021-11-04 22:10:03','2021-11-04 22:10:03','eda09cac-0420-420a-87c9-a06fa7d7b74c'),(10,1,21,5,10,11,1,'2021-11-04 22:10:42','2021-11-04 22:10:42','ff4c855b-bc34-4a32-8ca9-c731a2542bc3'),(11,1,23,5,12,13,1,'2021-11-04 22:11:37','2021-11-04 22:11:37','fdb1c9c2-5e58-4a18-8e67-c00a6b30d6d0'),(12,1,25,5,14,15,1,'2021-11-04 22:12:16','2021-11-04 22:12:16','c081f524-4e83-4742-9b77-7ef7b394323a'),(13,1,27,5,16,17,1,'2021-11-04 22:12:54','2021-11-04 22:12:54','9d835ddf-a0b8-4e79-a1fb-4d35ba5061c8');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES (1,1,'2021-11-04 21:35:54','2021-11-04 21:35:54',NULL,'abf1c4f4-8fc6-49bd-addf-fafd082f001b'),(2,NULL,'2021-11-04 21:57:55','2021-11-04 21:57:55',NULL,'e1355d12-97c5-48c5-b71d-35e2a4736141');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"showFieldHandles\":true,\"enableDebugToolbarForSite\":true,\"enableDebugToolbarForCp\":true,\"showExceptionView\":false,\"profileTemplates\":false}'),(61,'{\"language\":\"en-US\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"notificationDuration\":\"5000\",\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,'hoels.wolf',NULL,NULL,'','','wolfhoelscher@gmail.com','$2y$13$ey1fSK5uAuPXQ.W3Xl4dHOFvVD42pV/HdvJsh4sZD3CdsV/yb8yDG',1,1,0,0,0,'2023-03-29 15:31:57',NULL,'2023-03-29 16:38:14',1,'2023-03-29 16:38:14',NULL,1,NULL,NULL,NULL,0,'2021-11-04 21:20:28','2021-11-04 21:20:28','2023-03-29 16:38:14'),(61,'admin','Jr. Dev Candidate',NULL,'Jr.','Candidate','dev@emergentmethod.com','$2y$13$972v1voJT1j3ms2wGjo7b.8/UU8nKDf/bTOw4W/PgKk8zCNozyW1C',1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2023-03-28 20:35:05','2023-03-27 16:35:39','2023-03-29 16:38:21');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Logos',NULL,'2021-11-05 22:08:31','2023-03-29 15:35:00','6d2ea5af-2f91-454a-93ac-bb785195086b'),(2,NULL,NULL,'Temporary source',NULL,'2021-11-05 22:12:17','2021-11-05 22:12:17','5c990689-e0b0-45ac-b168-8b20e3ae6a1a'),(3,2,NULL,'user_1','user_1/','2021-11-05 22:12:17','2021-11-05 22:12:17','ea7185dd-dd57-4368-bb90-cc33adff6000');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,7,'Logos','logos','logos','','','site',NULL,1,'2021-11-05 22:08:31','2023-03-29 15:35:00',NULL,'b22bf838-bae2-4ce7-a9c7-c9be49ce3cb9');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2021-11-04 21:32:10','2021-11-04 21:32:10','d11513d0-bfaa-4e57-a9f8-4d801b312485'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2021-11-04 21:32:10','2021-11-04 21:32:10','143d81dd-95aa-4187-bc12-4aed5dfe91e4'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2021-11-04 21:32:10','2021-11-04 21:32:10','e37aaedb-5e0d-4c3e-a230-d55e643b3a69'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2021-11-04 21:32:10','2021-11-04 21:32:10','1b73e8c9-8ee9-4b5c-8f1d-5e76a0df32e1'),(5,61,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-03-28 20:34:29','2023-03-28 20:34:29','84341875-5466-48f9-a6d0-5ca3374fadca'),(6,61,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2023-03-28 20:34:29','2023-03-28 20:34:29','ec67c941-d997-42f1-8dfd-62e1f0ac39f5'),(7,61,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-03-28 20:34:29','2023-03-28 20:34:29','08b4261a-ae07-4991-b0dc-edd9cd6a3081'),(8,61,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-03-28 20:34:29','2023-03-28 20:34:29','922e587f-23d5-403c-a6b2-fa8bc94c3289');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-29 16:44:11
