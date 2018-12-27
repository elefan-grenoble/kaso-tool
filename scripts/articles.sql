DROP TABLE IF EXISTS ARTICLE;

CREATE TABLE ARTICLE (
  code                   BIGINT PRIMARY KEY,
  designation            VARCHAR(512) NOT NULL,
  code_fournisseur       VARCHAR(56) NOT NULL,
  ref_fournisseur        VARCHAR(56),
  code_famille           INT NOT NULL,
  code_s_famille         INT,
  code_ss_famille        INT,
  code_tva               INT,
  qte_appro              INT,
  prix_vente             DECIMAL(10, 2),
  anc_prix_vente         DECIMAL(10, 2),
  prix_promo             DECIMAL(10, 2),
  prix_achat_brut        DECIMAL(10, 2),
  anc_prix_achat_brut    DECIMAL(10, 2),
  remise_achat           DECIMAL(10, 2),
  status                 VARCHAR(56) NOT NULL,
  qte_kg_litre           INT,
  unite_vente            VARCHAR(56) NOT NULL,
  date_creation          DATE,
  date_modification      DATE,
  taux_tva               DECIMAL(10, 2),
  prix_vente_ht          DECIMAL(10, 6),
  anc_prix_vente_ht      DECIMAL(10, 6)
)
  DEFAULT CHARACTER SET UTF8
  COLLATE UTF8_unicode_ci
  ENGINE = InnoDB;

LOAD DATA LOCAL INFILE '/home/bastien/lelefan/kaso/exports/KASO_ARTICLE.CSV'
INTO TABLE ARTICLE
CHARACTER SET 'latin2'
FIELDS TERMINATED BY ';'
IGNORE 1 LINES
(code, designation, code_fournisseur, ref_fournisseur, code_famille, code_s_famille, code_ss_famille, code_tva, qte_appro, prix_vente, anc_prix_vente, prix_promo, prix_achat_brut, anc_prix_achat_brut, remise_achat, status, qte_kg_litre, unite_vente, @date_creation, @date_modification, taux_tva, prix_vente_ht, anc_prix_vente_ht, @dummy)
SET date_creation = STR_TO_DATE(@date_creation,'%e/%c/%Y'), date_modification = STR_TO_DATE(@date_modification,'%e/%c/%Y');