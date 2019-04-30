DROP TABLE IF EXISTS STATREGLEMENT;

CREATE TABLE IF NOT EXISTS STATREGLEMENT (
  date date NOT NULL,
  reglement_id tinyint(3) unsigned NOT NULL,
  montant float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `STATREGLEMENT`
 ADD PRIMARY KEY (`date`,`reglement_id`);