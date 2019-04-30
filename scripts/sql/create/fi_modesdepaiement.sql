DELIMITER $$

CREATE DEFINER=`root`@`%` FUNCTION `FI_MODESDEPAIEMENT`() RETURNS int(11)
BEGIN

	DECLARE rs int;
    
	INSERT INTO MODESDEPAIEMENT(id, nom)
	SELECT t.reglement_id, t.reglement
	FROM TMP_STATREGLT AS t
	LEFT OUTER JOIN MODESDEPAIEMENT AS p
		ON t.reglement_id = p.id
    WHERE isnull(p.nom)
	GROUP BY t.reglement_id;
    
    SELECT ROW_COUNT() INTO rs;
    
	RETURN rs;
	
END$$

DELIMITER ;