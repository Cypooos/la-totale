
= *MPI: Théorie des jeux*

== Cours
- Définition d'un jeu. Jeu d'accesibilité. Stratégie, stratégie gagnante.
- Calcul des attracteurs. Définition des $A_i^j$ dans l'algorithme du calcul des attracteurs.
- Algorithme min-max, élagage $alpha\/beta$, verison avec heuristique.
- Algorithme $A\*$
- Zermelo (HP)

*Petites questions*
- Soit un jeu $G=(V,E)$ avec $V = NN$ et telle que les arètes orienté sont toutes de la forme $(x,y)$ avec $y<x$. On suppose de plus que $forall x in V, deg_+ v = 0 => v in F_1 union F_2$. Montrer que pour chaque état du jeu, un des deux joueurs possède toujours une stratégie gagnante.

*Exercices à ajouter:*
- Devine le nombre de points fixes, Putnam 2023

== Jeu de Chomp

On considère une tablette de chocolat rectangulaire de taille $n times m$. Les cases sont indexées par $(i,j)$ avec $0 <= i < n$ et $0 <= j < m$. La case $(0,0)$ est empoisonnée.

Deux joueurs (Alice et Bob) jouent à tour de rôle, en commençant par Alice. À chaque coup, un joueur choisit une case $(i,j)$ encore présente, puis mange toutes les cases $(i',j')$ telles que $i' >= i$ et $j' >= j.$ Le joueur qui mange la case empoisonnée perd.

1. Quel joueur possède une stratégie gagnante si $n = 1$ ?
2. Montrer que le jeu se termine toujours.
3. Montrer que pour toute tablette rectangulaire $n times m$ avec $n,m >= 2$, le premier joueur possède une stratégie gagnante.

== Jeu et graphes biparti #footnote[CCINP Sujet A 2025]
Soit $G = (S, A)$ un graphe non orienté, connexe. On s’intéresse à un jeu à deux joueurs : R (rouge) et B (bleu). R commence en choisissant un sommet et en le coloriant en rouge. Puis chacun à son tour, le joueur choisit un sommet non colorié voisin de sommet de la couleur de l’adversaire mais non voisin d’un sommet de sa propre couleur, puis colorie ce sommet de sa couleur. Si aucun sommet n’est jouable, le joueur passe son tour.

Quand aucun joueur ne peut jouer, la partie est terminée.
— Si le graphe est entièrement colorié, R gagne.
— Sinon, B gagne.

1. Donner la définition d’une stratégie.
2. Donner la définition d’une stratégie gagnante.
3. Donner l’ensemble des états finaux sur le graphe $P_4$, le chemin de longeur 4, de sommets $[|0;4|]$. On suppose que R commence par colorier le sommet 1.

4. Montrer que s’il existe une partie gagnée par R, alors G est biparti.

On suppose maintenant que G est biparti. On note $(S_1, S_2)$ bipartition des sommets, et l’on suppose que le premier sommet joué par R est dans $S_1$.

5. Montrer l’invariant suivant : "Tout sommet colorié en rouge est dans S1, et tout sommet colorié en bleu est dans S2."
6. Montrer que s’il reste des sommets non coloriés, alors au moins l’un d’entre eux est coloriable.
7. En déduire qu'un graphe G est biparti si et seulement si toutes les stratégies de R sont gagnantes.
8. En déduire un algorithme déterminant si un graphe connexe non orienté est biparti. Quelle est sa complexité?

== Jeu de nim généralisé#footnote[Sujet original~!]

Soit $A subset.eq NN^*$ fini avec $1 in A$. On considère un jeu à deux joueurs où $N>0$ objets sont disposés sur une table, et chaque joueur doit à tour de rôle retirer $t in A$ objets de la table (s'il peut). Le joueur qui retire le dernier objet perd.

On appellera (A)lice le joueur qui commence et (B)ob le deuxième joueur.

1. Montrer qu'il existe toujours une stratégie gagnante depuis l'état initial pour l'un ou l'autre des joueurs. 

2. Pour les valeurs de $A$ suivantes, pour quels $N$ Alice possède-t'elle une stratégie gagnante~?
 - $A = NN$ 
 - $A = {1}$
 - $A = {2k +1 | k in NN}$

3. Si $max(A) <= N$, proposer un algorithme qui décide si Alice possède une stratégie gagnante pour un $N$ donné.
4. Pour $A = PP$ l'ensemble des nombres premiers, pour quelles valeurs de $N$ Alice possède t'elle une stratégie gagnante~? Et pour $A = {2^i : i in NN}$ l'ensemble des puissances de $2$~? Et pour ${1,...,p}$~?
5. Montrer qu'il existe un ensemble $A$ tel que si on note $S_A$ l'ensemble des $N$ tel que Alice possède une stratégie gaganante, alors il n'existe pas $N_0,T > 0, forall n>N_0, n in S_A <==> n+T in S_A$. 


== Géographie dans les hypercubes#footnote[Le putnam de 2025]

Soit $Sigma = {a,b,c}$ et $n in NN^*$. Alice et Bob joue au jeu suivant: à tour de role, iels choisissent un mot dans $Sigma^n$ qui n'a pas déjà été choisi avant, et tel que il ne diffère que d'une lettre avec le dernier mot choisi. Alice choisi un mot quelquonque au début. Le premier joueur ne pouvant pas jouer perd. On cherche à établir une statégie gagnante.

On pose $w_a = underbrace(a...a,n "fois")$

1. Dessiner le graphe des états pour $n=1$ et $n=2$. Qui gagne~?
2. Montrer qu'un joueur $X$ possède une stratégie gagnante ssi et seulement il en possède une pour le jeu ou Alice commence par le mot $w_a$.

On supposera maintenant sans perte de généralité que le premier coup d'Alice est $a...a$. On pose $G_n = (V_n,E_n)$ le graphe définit par $V_n = Sigma^n$ et $(u,v) in E$ si $u$ et $v$ ne diffèrent que d'une lettre.

3. Montrer par récurrence sur $n in NN^*$ que $G_n - w_a $ possède une couplage parfais
4. En déduire que Alice possède une stratégie gagnante.
5. Généraliser pour $Sigma = {a,b,c,d}$ et puis après pour tout alphabet fini non vide $Sigma$

== Géographie#footnote[Marathon de math de Paris-Orsay 2021]

Soit $G = (V,E)$ un graphe, on définit le jeu à deux joueurs (A)lice et (B)ob tel que à tour de role, chaque joueur doit marquer un sommet non déjà marqué qui soit un voisin du dernier sommet marqué. Le premier joueur qui ne peut plus marquer de sommet perd. Le premier joueur (Alice) peut choisir ou commencer.

2. On considère $C_n$ le cycle de longueur $n$. Pour quel $n in NN$ est-ce que Alice a une stratégie gagnante sur $C_n$~? 
3. Montrer que si le graphe possède un couplage parfait, alors Bob possède une stratégie gagnante. La réciproque est-elle vraie~?
4. Proposer un algorithme dans le cas ou $G$ est un arbre pour savoir qui possède une stratégie gagnante.
5. On considère le cas ou $V subset.eq NN^2$ et $forall ((x,y),(x',y')) in E, |x-x'|+|y-y'| = 1$ avec $G$ connexe. A quelle condition sur $|V|$ est-ce que Alice possède une stratégie gagnante~? 

== Exercice 2 : Jeux et automates~#footnote[Sujet fait main!]

Soit $A subset.eq NN$ un ensemble d'objectifs et $n in NN$, Alice et Bob jouent à un jeu à 2 joueurs. A tour de role, Alice et Bob, en commençant par Alice, choisissent 0 ou 1. Après $n$ itérations, le jeu s'arrête et on obtient une séquence $(u_1,...,u_n)$, avec $u_i$ le choix fait au $i$-ème tour. Alice gagne si $ sum_(1 <=i <= n) u_i times 2^(n-i) in A $

1. Proposer un pseudo-code qui teste si Alice possède une stratégie gagnante pour un $n$ et un $A$ fini.
2. Montrer que pour $A = 2 NN$, Alice possède une stratégie gagnante ssi $n$ est impair.

On pose $A = 3 NN$.

3. Proposer un automate $cal(A)$ sur $Sigma = {0,1}$ qui reconnaît les écritures binaires des nombres congrus à $0$ modulo $3$.
4. En utilisant cet automate, déterminer pour quels $n$ Alice possède une stratégie gagnante.
5. Proposer un algorithme qui décide, pour un entier $n$ et un automate $cal(A)$ si Alice possède une stratégie gagnante pour l'objectif des entiers associés aux mots de $L(cal(A))$. Quelle est sa complexité?
6. Montrer que l'on peut faire la question 5 en complexité $O(k 2^k)$ pour $k$ le nombre d'états de l'automate. 


== Jeu de Shannon

On considère un jeu avec un graphe $G = (V, E)$ non orienté qui peut posséder plusieurs arêtes entre deux sommets. Deux joueurs (A)lice et (B)ob, où Alice commence, choisissent alternativement une arête de $G$ non encore choisie. Si, à un moment de la partie, les arêtes choisies par Bob forment un arbre couvrant de $G$ alors Bob gagne. Sinon, Alice gagne.

Pour $cal(P)$ une partition de $V$, on note $|cal(P)|$ le nombre de parties et $||cal(P)||$ le nombre d'arêtes de $G$ dont les deux extrémités sont dans des ensembles différents de $cal(P)$.

*Question 1* Soit $T_1, T_2$ deux arbres couvrants de $G$ et $e_1$ une arête de $T_1$. Montrer qu'il existe $e$ une arête de $T_2$ tel que $T_1 - e_1 + e_2$ soit un arbre couvrant de $G$

*Question 2* On suppose qu'il existe une partition $cal(P)$ de $V$ telle que $||P|| < 2(|P|-1)$. Montrer que Alice possède une stratégie gagnante.

*Question 3* Soit $T$ un arbre couvrant de $G$ et $e$ une arête de $T$. Soient $T'$ et $G'$ obtenus en contractant $e$ dans $T$ et $G$, c’est-à-dire en supprimant $e$ et identifiant ses extrémités. Montrer que $T'$ est un arbre couvrant de $G'$.

*Théorème* On admet le théorème de Tutte: $G$ possède $k$ arbres couvrant disjoints si et seulement si pour tout partition $P$ de $V$, $||P|| >= k(|P|-1)$

*Question 4* Montrer que Bob a une stratégie gagnante si et seulement si $G$ possède deux arbres couvrants disjoints.

== Parité du nombre de points fixes#footnote[Putnam 2023]

Soit $n in NN$. Alice et Bob jouent au jeu suivant: Bob choisi "pair" ou impair, puis à tour de role en commençant par Alice, iels choissisent un nombre entre $1$ et $n$ qui n'ont pas déjà été choisi. Bob gagne si, une fois que tous les entiers ont été choisi, le cardinal $|{1<=k <= n | k "choisit au" k-"ème tour de jeu" }|$ correspond à la parité qu'il a choisi.

Pour quels $n$ est-ce que Bob à une stratégie gagnante~?

*Exemple de partie pour $n=3$~:* Bob choisit "impair" et 
- Si Alice choisit 1, Bob choisit 2 et alice doit choisir 3. L'ensemble est ${1,2,3}$ et Bob gagne.
- Si Alice choisit 2, Bob choisit 1 et alice doit choisir 3. L'ensemble est ${3}$ et bob gagne
- Si Alice choisit 3, Bob choisit 2 et alice doit choisir 1. L'ensemble est ${2}$ donc Bob gagne.
Donc Bob a une stratégie gagnante pour $n=3$.


== Jeu du sous-mot#footnote[Sujet original~!]

Soit $Sigma$ un alphabet, on considère le jeu à deux joueurs (dénoté (A)lice et (B)ob) du sous-mot suivant: a tour de role, chaque joueur dit un mot $w in Sigma^* \\ {epsilon}$ qui ne contient aucun des mots déjà dit en sous-mot. Le premier joueur qui ne peux plus dire de mot perd. Par exemple, sur $Sigma = {a,b}$, la partie pourrait être $a b b -> b b b b -> a a b -> a -> b b b -> b b -> b$ et Alice perd (Alice étant la joueuse qui commence).

On admettera que ce jeu termine toujours (cette propriété viens du lemme d'higman).

*Question 1* On admet pour l'instant que Bob possède une stratégie gagnante pour $|Sigma|$ pair. Montrer que Alice possède une stratégie gagnante pour $|Sigma|$ impair.

*Question 2* Pour $Sigma = {a,b}$, on définit $overline(a) := b$ et $overline(b) :=a$, puis $overline(w_1 ... w_n) = overline(w_1) ... overline(w_n)$. Montrer que Bob possède une stratégie gagnante pour $Sigma = {a,b}$.

*Question 3* En généralisant la question précédente, montrer que Bob possède une stratégie gagnante pour $|Sigma|$ pair.

*Question 4* ($**$) Montrer que le jeu termine toujours, autrement dit que si $(w_n)_(n in NN) in (Sigma^*)^NN$ est une suite infinie de mots, alors il existe $i < j$ tel que $w_i$ soit un sous-mot de $w_j$.
