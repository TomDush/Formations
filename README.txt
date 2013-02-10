***************************************************
** Initiation aux Frameworks JAVA				 **
***************************************************

Ce projet réuni les slides et les sources (latex) des présentations sur les
frameworks JAVA :
- Hibernate : persistance des données
- Spring : implementation de Invertion de Controle
- Junit, Mockito, FestAssert, DBunit : outils de tests unitaires


Aide Mémoire :
****************************************************

I - Introduction aux frameworks :
-----------------------------------------
Insister sur : 
- la séparation technique / fonctionnelle
- mutualisation des façons de faire / code technique entre applications

II - Hibernate
-----------------------------------------
...


III - BILAN PART 1
-----------------------------------------
Faire résumer aux particpants les grands axes et concepts des slides :
* frameworks - Hibenate - ORM - Précautions avec Hibernate *
Les points important à remonter :
- découpage technique / fonctionnel (métier). Technique mutualisée sur les frameworks
- ORM =  donne une vision "objets" de la BDD
- JPA pour définir la structure de la BDD à Hibernate (générateurs BDD <--> java)
- Objets volatiles -> persistants/supprimé en les liant à la session -> détachés lorsque la session est fermée
- Commit de la transactiuon pour flusher la session (exécuter les requêtes SQL)
