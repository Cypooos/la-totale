
= *MPI: Apprentissage*

== Cours
- Différece entre apprentissage supervisé et non supervisé.
- Algorithme des $k$-plus proches voisins.
- Arbre de décision, Matrice de confusion.
- Entropie de Shannon, gain, algorithme ID3.
- Algorithme CHA (Classification hiérachique ascendente)
- L'Algorithme des $k$-moyennes.


*Petites questions*
1. Donner un algorithme qui ajoute un sommet $arrow(x) in RR^k$ à un arbre $k$-dimensionnel. Quel est sa complexité~?
2. Écrire une fonction ```c int* voisins1D(float x, float* X, int k, int n)``` permettant de trouver efficacement les k plus proches voisins de $x$ dans l’ensemble de $n$ données $X$ trié par ordre croissant, où chaque donnée est un réel (en dimension 1). La fonction renvoie un tableau d’entiers contenant les indices des $k$ plus proches voisins de $x$ dans $X$. Quelle est sa complexité~?
3. Rappeler l’intêret et le fonctionnement de l’algorithme de classification hiérarchique ascendante.
== Single-pass (CCINP 2024) #footnote[https://prepas-mp2i.fr/documents/sujets/2024/CCINP-INFO.pdf ]

On considère l'algorithme suivant pour catégoriser des données $X = {arrow(x_1), ..., arrow(x_n)} subset.eq RR^d$. On note $delta(arrow(x), arrow(y)) = sum_(i=1)^d |arrow(x)_i - arrow(x)_i|$ la distance entre $arrow(x)$ et $arrow(y)$. La distance de $arrow(x)$ à une classe $C$ est la distance de $arrow(x)$ au centre de $C$. On note $"Cl"(arrow(x),C)$ la classe dont le centre est le plus proche de $arrow(x)$ pour $delta$.

Soit $theta in RR_+$, on considère:
#align(center,rect(align(left,[
  $C <- emptyset$\
  Pour $i$ de $1$ à $n$~:\
  #h(15pt) Si $forall arrow(c) in C, delta(arrow(x)_i,arrow(c)) > theta$:\
  #h(30pt) $C <- C union {{arrow(x)_i}}$ \/\/ On crée une nouvelle classe\
  #h(15pt) Sinon:\
  #h(30pt) $overline(C) <- "Cl"(arrow(x)_i, C)$\
  #h(30pt) $overline(C)' <- overline(C) union {arrow(x_i)}$\
  #h(30pt) $C <- C\\ {overline(C)} union {overline(C)'}$\
  Renvoyer $C$
])))

*Question 1* Proposer une implémentation en $C$ de la fonction $delta$. On représentera un $arrow(x) in RR^d$ par un ```c float* x```, et $d$ sera traité comme une constante.

*Question 2* Montrer que l'ordonnancement des $arrow(x)_1,...,arrow(x)_n$ importe.

*Question 3* Soit $arrow(x) in X$, on note $C_"ini"$ la classe de $arrow(x)$ au moment ou il a été ajouté, et $C^*$ sa classe à la fin. Montrer que

$ delta(arrow(x), C^*) <= theta ln(|C^*| - |C_"ini"|) $
_On admettera que $1/2 + 1/3+...+1/k <= ln (k)$_

*Question 4* Quel sont les avantages de cet algorithme par rapport aux $k$-moyennes~? Proposer des améliorations à l'algorithme.


== Clustering en dimension 1#footnote[tiré de https://mpi-lamartin.github.io/mpi-info/docs/ia/non_supervise/td_apprentissage]

*Définition* Soit $K in NN^*$ et $E = {x_0, ..., x_(N-1)}$ un ensemble de réels avec $x_0 <= ... <= x_(N-1)$. Pour $X subset.eq E$, on note $mu_X$ son centre et $S(X)$ son score, formellement définit par
$
  mu_X := 1/(|X|) sum_(x in X) x #h(50pt) S(X) := sum_(x in X) (x - mu_X)^2
$
On pose $S(i,j)= S({x_i,...,x_j})$. On cherche à résoudre l'algorithme des $k$-moyennes sur $E$ de manière exacte. C'est à dire que l'on cherche une partition $cal(P) = {X_1,...,X_K}$ de $[|0 ;N-1|]$ qui minimise la somme des scores de chaque $X_i$

*Question 2* Montrer que l'algorithme CHA ne permet pas de résoudre de manière exacte le problème. On pourra prendre $N=4$ et $K=2$.

*Question 3* On note $I(n,k)$ le score minimale d'une partition de ${x_0,...,x_n}$ en $k$ classes. Que vaux $I(n,1)$~?

*Question 4* Montrer que $ forall n > 0, forall k > 1, I(n,k) = min_(k-1<=m<= n-1) (I(m,k-1) + S(m,n)) $

*Question 5* En déduire une fonction ```c double inertie(double* E, int N, int K)``` qui calcule le score minimale possible d’une parition de $E$ en $K$ classes non vides.

*Question 6* Montrer que l'on peut calculer l'ensemble des $S(i,j)$ en $O(N^2)$

== $k$-centres

*Définition* On fixe $V subset.eq RR^d$ un jeu de donnée. Pour $arrow(y) in RR^d$ on définit $d(arrow(y),V) = max_(arrow(x) in V) ||arrow(y) - arrow(x)||$. On cherche à choisir $k$ points de $V$ tel qu'ils minimise 
$max_(v in V) d(v,X)$. On regarde donc le problème $k$-CENTRE suivant:

#rect[
  *Entrée:* $v_1,..., v_n subset.eq RR^d$ une liste de points finis\
  *Sortie:* $X := {x_1,...,x_k} subset.eq V$ qui minimise $max_(v in V) d(v,X) $
]

*Question 1* Rapeller le fonctionnement de l'algorithme des $k$-moyennes. Quel sont les différences avec le problème des $k$-centres~?

*Question 2* On cherche à montrer que l'algorithme du cours de la question ne donne pas de bonne approximation du problème des $k$-centres. Pour cela on pose $k=2$, $d=1$ et on pose $N$ points en 0, $N$ points en 1 et un point en $D$. Montrer que pour des bonnes valeurs de $N$ et $D$ on peut avoir le ratio $"opt-k-moyennes"/"opt-k-centre"$ arbitrairement large.

*Question 3* Proposer un algorithme glouton pour le problème des $k$-centres.

*Question 4* On note $p_1,..., p_k$ les $k$ points retrourné par notre algorithme et $p^*_1,...,p^*_k$ la solution optimale. On partitionne $V = union.sq.big_(i in NN) V_i$ avec $V_i$ l'ensemble des points les plus proches de $p^*_i$. Montrer que
- Si $forall i, V_i inter {p_1,...,p_n} != emptyset$ alors on a une 2-approximation
- Sinon, on a aussi une 2-approximation


== Algorithme ID3 avec intervalles

On cherche ici à effectuer l'algorithme ID3 pour des attributs non discret (un intervalle des réels par exemple). Pour cela, on considère des attributs $(A_i)_i$ tel que $A_i$ est soit fini, soit $A_i = [alpha_i, beta_i]$, et un ensemble de classes $C$ fini. Pour $S subset.eq A_1 times .... times A_k times C$ un ensemble fini d'apprentisage, et pour $A_i$ de la forme $A_i = [alpha,beta]$, pour $k in ]alpha,beta[$, on définit $S_(<k),S_(>=k)$ la coupure à $k$ telle que $S_(<k) = {arrow(s) in S | arrow(s)_i < k}$ et $S_(>=k) = {arrow(s) in S | arrow(s)_i >= k}$

*Question 1* On suppose que on a un attribut "taille (en cm)" qui est un naturel. Quel est le problème avec ID3~?

*Question 2* On cherche à trouver une "bonne coupure"~: une qui maximise le gain d'information sur la coupure. Proposer une formule pour le gain d'information dans ce contexte similaire.


*Question 3* Proposer un algorithme en $O(|S| log |S| + |C| times |S|)$ qui trouve le meilleur $k in [alpha ; beta]$ pour effectuer une coupure.

*Question 4* Quelle est la complexité de l'algorithme ID3 avec notre généralisation en fonction de $|S|$, de $|C|$ et des $(A_i)_i$~?
