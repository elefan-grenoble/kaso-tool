Phase 1 - Cr�ation du model :

Cr�ation de la table STATREGLEMENT qui contient les statistiques (statreglement.sql).
Cr�ation de la table MODESDEPAIEMENT, dico des diff�rents modes de paiement (modesdepaiement.sql).

Cr�ation de la fonction d'alimentation de STATREGLEMENT (fi_statreglement.sql).
Cr�ation de la fonction d'alimentation de MODESDEPAIEMENT (fi_modesdepaiement.sql).


Cette phase n'est ex�cut�e qu'une seule fois.


Phase 2 - Alimentaion du modem :

Cr�ation d'une table temporaire de travail (tmp_statreglt.sql).
Le scirpt sh load_statreglt.sh importe les donn�es dans la table temporaire (TMP_STATREGLT).


Cette phase est ex�cut�e quotidiennement.