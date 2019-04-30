Phase 1 - Création du model :

Création de la table STATREGLEMENT qui contient les statistiques (statreglement.sql).
Création de la table MODESDEPAIEMENT, dico des différents modes de paiement (modesdepaiement.sql).

Création de la fonction d'alimentation de STATREGLEMENT (fi_statreglement.sql).
Création de la fonction d'alimentation de MODESDEPAIEMENT (fi_modesdepaiement.sql).


Cette phase n'est exécutée qu'une seule fois.


Phase 2 - Alimentaion du modem :

Création d'une table temporaire de travail (tmp_statreglt.sql).
Le scirpt sh load_statreglt.sh importe les données dans la table temporaire (TMP_STATREGLT).


Cette phase est exécutée quotidiennement.