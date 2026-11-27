= *Plus: jeux infinis, Langages oméga-réguliers et topologie*

== Cours

- Automates de Buchis, Langages omega-régulier (voir "spé/reg/Automates de Büchi")
- Topologie sur les mots infinis
- Définition des boréliens
- Jeu de Gale-Steward. Les preuves de déterminisation ou non sont des exos!
- Un jeu déterminé. Une stratégie gagnante. Théorème de Zermelo. Calcul des attracteurs.

== Propriétée de la topologie sur $NN^NN$

On se place dans $NN^NN$ avec la topologie usuelle des préfixes.

- Montrer que les clopens (ensembles ouverts et fermés) sont exactements les unions finies de boules ouvertes.

== Complétion des automates de buchi

Soit $A = (Q, Sigma, Delta, Q_0, F)$ un automate de Buchi. On va montrer que $Sigma^omega\\L(A)$ est aussi reconnu par un automate de Buchi.

Soit $w in Sigma^+$, on défini
$ f(w) = ({(q,p) in Q^2 | exists q -->^w p},{(q,p) in Q^2 | exists q -->^w p "qui passe par" F }) $

On dit que $w tilde w'$ si $f(w) = f(w')$. On remarque que c'est une relation d'équivalence (car la partition est définie par image inverse). Pour $w in Sigma^+$, on note $[w]$ sa classe d'équivalence par $tilde$.

1. Montrer que $tilde$ à un nombre fini de classe d'équivalence et que pour tout $w in Sigma^+, [w]$ est un langage régulier.

On admet le *théorème de Ramsey:* Pour tout $k in NN$, si $G = (V,E)$ est un graphe infini labelisé en aretes par $eta : E --> {1,...,k}$, alors il existe $S subset.eq V$ infini tel que $G[S]$ soit un graphe monochromatique.

2. Montrer que pour tout $u in Sigma^omega$ il existe $w, w' in Sigma^+$ tel que $u in [w].[w']^omega$
3. Montrer que pour tout $w,w' in Sigma^omega$, soit $[w].[w']^omega subset.eq L(A)$, soit $[w].[w']^omega inter L(A) = emptyset$.
4. En déduire que les automates de buchis sont clos par complémentaires.

== Jeu de Gale-Steward non déterminé, XOR infini

On se situe dans le cadre d'un $omega$-jeux sur $Sigma = {0, 1}$. On va montrer que tout les jeux de Gale-Steward ne sont pas déterminé.

TODO

== Jeu de Gale-Steward non déterminé, construction inductive

TODO

== Déterminisation des ouverts 

Soit $O in cal(O)$ un ouvert de $NN^NN$ avec la topologie usuelle des préfixes. On veux montrer que le jeu de Gale-Steward sur $O$ est déterminé.

TODO

== Théorème de Déterminisation de Martin (pt 1)


TODO