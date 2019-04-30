DELIMITER $$

CREATE DEFINER=`root`@`%` FUNCTION `FI_STATREGLEMENT`() RETURNS int(11)
BEGIN

	DECLARE rs int;
    
	INSERT INTO STATREGLEMENT(date, reglement_id, montant)
	SELECT date, reglement_id, montant 
	FROM TMP_STATREGLT;
    
    SELECT ROW_COUNT() INTO rs;
    
	RETURN rs;
	
END$$

DELIMITER ;