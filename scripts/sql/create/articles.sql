
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS ARTICLE;

CREATE TABLE ARTICLE (
  code                   BIGINT PRIMARY KEY,
  designation            VARCHAR(512) NOT NULL,
  code_fournisseur       INT NOT NULL,
  ref_fournisseur        VARCHAR(56),
  famille_id             INT DEFAULT NULL,
  code_famille           INT NOT NULL,
  code_s_famille         INT NOT NULL,
  code_ss_famille        INT NOT NULL,
  code_tva               INT,
  qte_appro              INT,
  code_rayon             VARCHAR(56),
  code_emplacement       INT,
  code_marque            INT,
  code_provenance        INT,
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

LOAD DATA LOCAL INFILE '/home/kaso/exports/KASO_ARTICLE.CSV'
INTO TABLE ARTICLE
CHARACTER SET 'latin2'
FIELDS TERMINATED BY ';'
IGNORE 1 LINES
(code, designation, code_fournisseur, ref_fournisseur, code_famille, code_s_famille, code_ss_famille, code_tva, qte_appro, code_rayon, code_emplacement, code_marque, code_provenance, prix_vente, anc_prix_vente, prix_promo, prix_achat_brut, anc_prix_achat_brut, remise_achat, status, qte_kg_litre, unite_vente, @date_creation, @date_modification, taux_tva, prix_vente_ht, anc_prix_vente_ht, @dummy)
SET date_creation = STR_TO_DATE(@date_creation,'%e/%c/%Y'), date_modification = STR_TO_DATE(@date_modification,'%e/%c/%Y');

-- Create missing FAMILLE
INSERT INTO FAMILLE(code, code_s_famille, code_ss_famille, nom)
  SELECT DISTINCT a.code_famille, a.code_s_famille, a.code_ss_famille, 'Inconnu'
  FROM ARTICLE a
  WHERE NOT EXISTS (
      SELECT * FROM FAMILLE f
      WHERE a.code_famille = f.code
            AND a.code_s_famille = f.code_s_famille
            AND a.code_ss_famille = f.code_ss_famille);

-- Populate the famille_id column
UPDATE ARTICLE a SET famille_id = (SELECT id FROM FAMILLE f WHERE f.code = a.code_famille AND a.code_s_famille = f.code_s_famille AND a.code_ss_famille = f.code_ss_famille) WHERE famille_id IS NULL;
-- Drop uneeded columns now that we have a proper link to FAMILLE
ALTER TABLE ARTICLE DROP COLUMN code_famille, DROP COLUMN code_s_famille, DROP COLUMN code_ss_famille;


-- Create missing FOURNISSEUR
INSERT INTO FOURNISSEUR(code, nom)
  SELECT DISTINCT a.code_fournisseur, 'Inconnu'
  FROM ARTICLE a
  WHERE NOT EXISTS (
      SELECT * FROM FOURNISSEUR f
      WHERE a.code_fournisseur = f.code);
      
-- Create missing RAYON
INSERT INTO RAYON(code, libelle)
  SELECT DISTINCT a.code_fournisseur, 'Inconnu'
  FROM ARTICLE a
  WHERE NOT EXISTS (
      SELECT * FROM RAYON f
      WHERE a.code_fournisseur = f.code);
      
-- Create missing EMPLACEMENT
INSERT INTO EMPLACEMENT(code, libelle)
  SELECT DISTINCT a.code_emplacement, 'Inconnu'
  FROM ARTICLE a
  WHERE NOT EXISTS (
      SELECT * FROM EMPLACEMENT f
      WHERE a.code_emplacement = f.code);
      
-- Create missing MARQUE
INSERT INTO MARQUE(code, libelle)
  SELECT DISTINCT a.code_emplacement, 'Inconnu'
  FROM ARTICLE a
  WHERE NOT EXISTS (
      SELECT * FROM MARQUE f
      WHERE a.code_emplacement = f.code);
      
-- Create missing PROVENANCE
INSERT INTO PROVENANCE(code, libelle)
  SELECT DISTINCT a.code_emplacement, 'Inconnu'
  FROM ARTICLE a
  WHERE NOT EXISTS (
      SELECT * FROM PROVENANCE f
      WHERE a.code_emplacement = f.code);
      
-- Delete unknown articles from the vente table
DELETE FROM VENTE WHERE code_article NOT IN (SELECT code FROM ARTICLE);
      
SET FOREIGN_KEY_CHECKS=1;

-- Create the FK constraint to FAMILLE based on famille_id
ALTER TABLE ARTICLE CHANGE famille_id famille_id INT NOT NULL;
ALTER TABLE ARTICLE ADD CONSTRAINT ARTICLE_FAMILLE_FK FOREIGN KEY (famille_id) REFERENCES FAMILLE(id);

ALTER TABLE ARTICLE ADD CONSTRAINT ARTICLE_FOURNISSEUR_FK FOREIGN KEY (code_fournisseur) REFERENCES FOURNISSEUR(code);
ALTER TABLE ARTICLE ADD CONSTRAINT ARTICLE_RAYON_FK FOREIGN KEY (code_rayon) REFERENCES RAYON(code);      
ALTER TABLE ARTICLE ADD CONSTRAINT ARTICLE_EMPLACEMENT_FK FOREIGN KEY (code_emplacement) REFERENCES EMPLACEMENT(code);
ALTER TABLE ARTICLE ADD CONSTRAINT ARTICLE_MARQUE_FK FOREIGN KEY (code_marque) REFERENCES MARQUE(code);
ALTER TABLE ARTICLE ADD CONSTRAINT ARTICLE_PROVENANCE_FK FOREIGN KEY (code_provenance) REFERENCES PROVENANCE(code);

