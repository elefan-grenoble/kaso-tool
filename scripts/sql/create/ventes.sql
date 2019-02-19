
CREATE TABLE IF NOT EXISTS VENTE (
  code_article        BIGINT          NOT NULL,
  date                DATE            NOT NULL,
  designation_article VARCHAR(56)     NOT NULL,
  quantite            DECIMAL(40, 30) NOT NULL,
  ca_ht               DECIMAL(10, 3)  NOT NULL,
  ca_ttc              DECIMAL(10, 3)  NOT NULL,
  PRIMARY KEY (code_article, date),
  CONSTRAINT VENTE_ARTICLE_FK FOREIGN KEY (code_article) REFERENCES kaso.ARTICLE(code)
)
  DEFAULT CHARACTER SET UTF8
  COLLATE UTF8_unicode_ci
  ENGINE = InnoDB;
