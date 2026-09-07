= *Math: Algèbre (Linéaire) pour les Graphes*

== Définitions

Il y a 3 représentation matricelle qui seront utillisé pour représenté un graphe $G = (V,E)$ :
- Par $A in {0,1}^(V times V)$ sa *matrice d'ajascence*: Si $G$ orienté ou non avec ou sans boucle, $A_(u,v) = 1 <=> (u,v) in E$
- Par $M in {0,1}^(V times E)$ sa *matrice d'incidence*: Si $G$ non-orienté, $A_(u,e) = 1 <=> u in e$
- Par $L in {0,1}^(V times V)$ sa *matrice laplacienne*: Si $G$ non-orienté sans boucle, pour $D in NN^(V times V)$ la matrice diagonale des degrée définie par pour tout $u != v$, $D_(u,u) = deg u$ et $D_(u,v) = 0$, on a $L = D - A$


*LES EXOS DE CE CHAPITRE NE SONT PAS VERIFIEES ET JE NE SUIS PAS CAPABALE DE LES FAIRE.*

== Lights Out sur un graphe

Soit $G=(V,E)$ un graphe fini simple non orienté, avec $|V|=n$. Chaque sommet porte un interrupteur et une lampe, qui peut être allumée ou éteinte. Lorsque l'on appuie sur l'interrupteur d'un sommet $v$, on change l'état de la lampe située en $v$ ainsi que celui de toutes les lampes situées sur les voisins de $v$. On cherchera d'abord à montrer que à partir de la configuration ou toutes les lampes sont éteintes, on peut toujours toutes les allumer via une séquence d'appuis d'interrupteurs.


Une _configuration_ est une application $c : V arrow FF_2$, où $c(v)=1$ signifie que la lampe $v$ est allumée. Pour $v in V$, on dénote le voisinage fermé de $v$ par
$
  N[v] = {v} union {u in V | {u,v} in E}
$

1. Montrer que seul la parité du nombre de fois ou l'on a appuyé sur un interrupteur donné est important.

On pourra donc représenter une _stratégie_ comme étant une application $x : V arrow FF_2$.
où $x(v)=1$ signifie que l'on appuie sur le sommet $v$. On note $A in cal(M)_n (FF_2)$ la matrice d'adjacence de $G$, après avoir choisi une numérotation de ses sommets, et on pose $L = I_n+A$.

2. Montrer que la colonne de $L_G$ correspondant à un sommet $v$ est le vecteur indicateur de $N[v]$.
3. En déduire qu'il existe une stratégie gagnante à Lights Out! si et seulement si $(1,...,1) in "Im"(L)$

On munit l'ensemble $FF_2^V$ du produit scalaire :
$
  chevron.l x,y chevron.r
  = sum_(v in V) x(v)y(v).
$

4. Montrer que $"Im"(L)=ker(L)^bot$.
5. Montrer que l'on peut toujours allumer toutes les lampes si l'on commence initialement sur la configuration ou elles sont toutes eteintes.

/*
5. Montrer que une stratégie $x$ est telle qu'elle n'allume aucune lampe si et seulement si $
  forall v in V, #h(20pt) |N[v] inter X| = 0 mod 2.
  $ 
  En déduire une caractérisation des graphes pour lesquelles toutes les configurations sont atteignable.

7. On pose $r=dim ker(L).$

Montrer que:

- il existe exactement $2^(n-r)$ configurations résolubles ;
- toute configuration résoluble possède exactement $2^r$ stratégies qui la résolvent ;
- toute configuration est résoluble si et seulement si elle possède une unique stratégie de résolution ;
- ces propriétés sont équivalentes à l'inversibilité de $L_G$.

Exprimer la proportion de configurations résolubles parmi les $2^n$ configurations possibles.

*Question 8* Soit $c$ une configuration résoluble et $x_0$ une stratégie telle que
$
  L_G x_0=c.
$

Montrer que l'ensemble de toutes les stratégies résolvant $c$ est l'espace affine
$
  x_0+ker(L_G).
$

En déduire un algorithme qui, connaissant une base de $ker(L_G)$, détermine une stratégie utilisant un nombre minimal de pressions.

Donner sa complexité en fonction de $n$ et de
$
  r=dim ker(L_G).
$

*Question 9* Donner un algorithme qui, étant donnés $G$ et une configuration $c$:

1. décide si $c$ est résoluble ;
2. renvoie une stratégie qui résout $c$ lorsqu'il en existe une ;
3. renvoie une base de l'espace des stratégies silencieuses ;
4. renvoie une base de l'espace des configurations résolubles.

Déterminer sa complexité en temps et en espace en fonction de $n$.

*Question 10* On fixe désormais le graphe $G$, mais on souhaite traiter successivement un grand nombre de configurations.

Montrer qu'après un prétraitement en temps $O(n^3)$ et en espace $O(n^2)$, on peut décider si une configuration est résoluble et, le cas échéant, calculer une stratégie en temps $O(n^2)$ par configuration.

Expliquer quelles données doivent être conservées après l'élimination de Gauss.

*Question 11* Soient $G_1$ et $G_2$ deux graphes dont les ensembles de sommets sont disjoints, et soit
$
  G=G_1 union G_2
$
leur union disjointe.

Montrer que, quitte à réordonner les sommets,
$
  L_G =
  mat(
    L_(G_1),0;
    0,L_(G_2)
  ).
$

En déduire que
$
  ker(L_G)
  =ker(L_(G_1)) union.plus ker(L_(G_2))
$
et
$
  dim ker(L_G)
  =dim ker(L_(G_1))+dim ker(L_(G_2)).
$

Caractériser les configurations résolubles de $G$ en fonction de celles de $G_1$ et $G_2$.

*Question 12* Soient $G$ et $H$ deux graphes isomorphes. Montrer qu'il existe une matrice de permutation $P$ telle que
$
  L_H=P L_G P^(-1).
$

En déduire que les quantités suivantes sont des invariants d'isomorphisme:

- $"rank"(L_G)$ ;
- $dim ker(L_G)$ ;
- le nombre de configurations résolubles ;
- le nombre de stratégies résolvant chaque configuration résoluble.

*Question 13* On suppose que deux sommets distincts $u$ et $v$ vérifient
$
  N[u]=N[v].
$

Montrer que
$
  bold(1)_{u}+bold(1)_{v} in ker(L_G).
$

En déduire qu'une condition nécessaire pour que toute configuration soit résoluble est que les voisinages fermés des sommets soient deux à deux distincts.

Cette condition est-elle suffisante~?

*Question 14* Montrer que les assertions suivantes sont équivalentes:

1. toute configuration de $G$ est résoluble ;
2. la configuration constituée d'une unique lampe allumée en $v$ est résoluble pour tout $v in V$ ;
3. les vecteurs indicateurs des voisinages fermés $(bold(1)_(N[v]))_(v in V)$ forment une base de $FF_2^V$ ;
4. $G$ ne possède aucune stratégie silencieuse non nulle ;
5. $det(I_n+A)=1$ dans $FF_2$.

Donner finalement un algorithme polynomial décidant si un graphe donné est un graphe sur lequel toute configuration de Lights Out est résoluble.
*/

== Graphes d'amis (Version complete)

Soit $G = (S,A)$ un graphe non orienté. On dit que $G$ est un _graphe d'amis_ si pour tout $s_1,s_2 in S$ avec $s_1 != s_2$, il existe un unique $s'$ avec ${s_1,s'} in A$ et ${s_2,s'} in A$. On dit qu'un sommet $s^*$ est un _roi_ si pour tout $s in S\\{s^*}, {s,s^*} in A$.

On cherche à montrer que un graphe d'amis possède toujours un roi. Si vous avez fait l'exercice "Graphes2: Graphes d'amis non régulier" vous pouvez sauter à la question 7.

Soit $G$ un graphe d'amis.

1. Montrer que $G$ est connexe et que toute arête appartient à un unique triangle.
2. Soient $x$ et $y$ deux sommets non adjacents. Pour $u in N(x)$, on note $f(u)$ l'unique voisin commun à $u$ et $y$. Montrer que $f : N(x) --> N(y)$ est injective.
3. Montrer que si ${x,y} in.not E$, alors $deg(x) = deg(y)$.

Un graphe est dit _$k$-régulier_ si $forall v in V, deg(v) = k$. On suppose d'abord $G$ non régulier. Soient $x,y$ deux sommets de différent degrée et $z$ l'unique voisin commun. Comme $deg(x) != deg(y)$, on a que $deg(z)$ est différent d'au moins un des deux, que l'on suppose sans perte de généralité etre $x$.

Soit $w in.not {x,y,z}$.

4. Montrer que $w in (N(x) union N(y)) inter (N(x) union N(z))$.
5. Montrer que $w in.not N(y) in N(z)$, et en déduire que $w in N(x)$.
6. Conclure et montrer que si $G$ n'est pas régulier, alors $G$ possède un roi.

On suppose maintenant que $G$ est $d$-régulier pour un certain $d$. Par l'absurde, on suppose que $G$ possède un roi. On note $M in cal(M)_n (RR)$ la matrice d'adjacence de $G$, $J$ la matrice dont tous les coefficients valent $1$, et $bold(1)$ le vecteur dont toutes les coordonnées valent $1$.

7. Montrer que le coefficient $(i,j)$ de $M^2$ est le nombre de voisins communs aux sommets $i$ et $j$. En déduire $M^2=(d-1)I_n+J$ et que $M bold(1)=d bold(1).$
8. En déduire que $n=d^2-d+1$.

On pose $H=bold(1)^perp$ un hyperplan.
9. Montrer que $H$ est stable par $M$ et que $J$ est nul sur $H$.
10. En utilisant le théorème spectral, montrer que $H$ possède une base orthonormée de vecteurs propres de $M$. Si $lambda$ est une valeur propre associée à un vecteur de $H$, montrer que $lambda^2=d-1.$
11. En déduire que $"Sp"(M) = {d, sqrt(d-1), -sqrt(d-1)}$.
12. On note $r$ et $s$ les multiplicités respectives des valeurs propres $sqrt(d-1)$ et $-sqrt(d-1)$. Montrer que $ d+(r-s)sqrt(d-1)=0. $
// via la trace
13. En déduire donc que $sqrt(d-1)$ est rationnel, et meme que c'est un entier qui divise $d$ et $1$. Conclure que $u=1$, puis que $d=2$ et $n=3$.
14. Conclure que tout graphe d'amis possède un roi.

== Bornes du rayon spectral

Soit $G = (V,E)$ un graphe non-orienté mais avec pottentiellement des boucles, on note $A_G in {0,1}^(V times V)$ sa matrice d'adjascence, ou juste $A$ quand il n'y a pas d'ambiguitées.

1. Montrer que $"Tr"(A)$ est le nombre de boucle du graphe.
2. Montrer que toutes les valeurs propres de $A$ sont réelles. Dans quel cas $min "Sp"(A) = 0$ ?

On note $rho(A) = max { |lambda| : lambda in "Sp"(A)}$ le _rayon spectral_ de $A$ et $n := |V|$ le nombre de sommets. On suppose $G$ sans boucle.

3. Calculer $"Sp"(A)$ si $G$ est le graphe complet. Que vaux $rho(A)$ ?

Pour $k in NN$, on définit $v^((k))$ le vecteur $(sin((k pi)/(n+1)),...,sin((n k pi)/(n+1))$
4. Pour $G$ le chemin à $n$ sommets, montrer que $(v^((k)))_(1<=k <= n)$ sont des vecteurs propre de $A$.
5. En déduire $rho(A)$ pour $G$ le chemin à $n$ sommets.
6. Montrer que si $G$ est connexe, alors $rho(A) <= Delta$ avec $Delta$ le degrée maximal de $G$.

On a trouvé une borne supérieur de $rho(G)$, on cherche maintenant à établir une borne inférieur. On admet le théorème de Perron-Frobinus qui dit que si $M$ est positive, alors $rho(M)$ est bien valeur propre de $M$, associé à un vecteur propre $v$ dont toutes les composantes sont positives.

7. Montrer que si $T$ est un arbre couvrant de $G$, alors $rho(A_T)<= rho(A_G)$
8. Soit $T$ un arbre, montrer que pour $n>1$ il possède au moins deux sommets de degrée $1$
9. $(*)$ Montrer le lemme de greffe: Soient $a,b$ deux sommets de degrée $1$ d'un arbre $T$ différent d'un chemin. On suppose que le chemin entre $a$ et un sommet de degrée $>2$ est plus grand que le chemin entre $b$ et un sommet de degrée $>2$. On note $e$ l'unique arrete relié à $b$. Montrer que $ rho(A_(T-e+(a,b)))<= rho(A_(T)) $
8. En déduire que $2 cos(pi/(n+1)) <= rho(A)$.
