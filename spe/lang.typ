
= *MPI: Langages*


== Cours

- Définir un alphabet, un mot, le mot vide $epsilon$, un langage
- Longeur $|u|$ d'un mot, $|u|_a$ nombre d'occurence d'une lettre
- Concaténation, union, intersection de langages, complémentaire, étoile de Kleene
- Préfixe, suffixe, facteur, sous-mot
- Langage clot par opération, classes de langages
- Mirroir, palindrome (HP)
- Le monoide libre $(Sigma^*, dot)$ et morphismes de mots (HP)
- Mots infinis, concaténation de mots infinis, morphismes (HP)

*Questions de Cours*
- Donner les préfixes, suffixes, facteurs et sous-mots de $"abbab"$ et $"abcba"$.
- *Lemme de levy:* Soient $x,y,x',y' in Sigma^*$ tel que $x y = x' y'$. Montrer qu'il existe $z in Sigma^*$ tel que soit $x = x'z$ et $y' = z y$, soit $x' = x z$ et $y = z y'$. 
- Soient $u,v in Sigma^*$ tel que $u v = v u$. Montrer qu'il existe $w in Sigma^*$ et $p,q in NN$ t.q. $u=w^p$ et $v = w^q$

*Petites questions*
1. Donner le plus petit langage clot par préfixe contenant tous les mots qui peuvent s'écrire de la forme ${a^n b^n : n in NN}$
2. Soient $u,v in Sigma^*$ et $a,b in NN$ tel que $u ^a = v^b$. Montrer qu'il existe $w in Sigma^*$ et $p,q in NN$ tel que $u=w^p$ et $v = w^q$
3. Soient $x,y,z in Sigma^*$ tel que $x y = y z$ avec $x != epsilon$. Montrer qu'il existe $k in NN$ et $u, v in Sigma^*$ tels que $x = u v$, $z = v u$ et $y = (u v)^k u$. 
4. Un mot est dit _primitif_ s’il n’est puissance d’aucun autre mot que lui-même. Montrer que pour tout mot non vide, il existe un unique mot primitif dont il est une puissance.

*Exercices à rajouter*
- Equations de mots https://diplome.di.ens.fr/informatique-ens/annales/2022_InfoLCR-rapport.pdf

== Opérations de langages

Pour les paires de $L_i, L_i'$ suivantes sur $Sigma = {a,b,c}$, expliciter les valeurs de $L_i inter L'_i$, $L_i union L_i'$, $L_i . L_i'$ et  $L^*_i$~:
1. $L_1 = {"abb","ba","c"}, L'_1 = {"abb","cc",epsilon}$
2. $L_2 = {a^n : n in NN^*}, L'_2 = L_2$
3. $L_3 = {a^n b^n : n in NN^*}, L'_3 = {c^n : n in NN}$
4. $L_3 = {a^n b^n : n in NN^*}, L'_3 = {a^n : n in NN}$
5. $L_4 = {a^n b^m : n < m}, L'_4 = {b^n : n in NN}$
6. $L_5 = {a^n b^m : n < m}, L'_5 = {b^n c^m : n < m}$

== Language contenant $epsilon$
Soit $L$ un langage, montrer que $epsilon in L <=> L subset.eq L^2$

== Cloture de langages
Pour chacun des langages suivant, indiquer le plus petit langage $L$ clot par étoile de kleene, préfixe, suffixe, sous-mot

1. $L = {a^n : n in NN}$
1. $L = {a^n b^n : n in NN}$
1. $L = {a^n b^n : n in NN}$

== Suite de mots par récurrence 

On définit sur l’alphabet $Sigma = {a,b}$ la suite de mots $(u_n)_(n>=0)$ définie par récurrence par $u_0 = a$, $u_1 = b$ et $u_(n+2) = u_(n+1) u_(n)$

1. Montrer que si $n >= 2$, alors $u_n$ se termine par $b a$ si n est pair et par $a b$ sinon.
2. Proposer un algorithme qui pour un $n in NN$ calcule $|u_n|$ la longueur de $u_n$
3. On définit $v_n$ comme étant $u_n$ où l'on a retiré les deux dernières lettres. Montrer que pour tout $n in NN_(>=2)$, $v_n$ est un palindrome.

== Mot circulaire 

Étant donnés deux mots $u,v in Sigma^n$ et $p < n$, proposer un algorithme qui trouve des indices $i,j$ tels que $u[i . . . i+p−1]$ et $v[j . . . j +p−1]$ ont le plus grand nombre de caractères identiques.

Les indices sont à prendre au sens circulaire (i.e. $w[ |w|+l] = w[l]$, pour tout $l < |w|$).

== Hypercubes et mots

On définit l'hypercube de dimension $n$ comme étant le graphe non orienté $G = (V,E)$ avec $V = {0,1}^n$ et $E$ l'ensemble des couples $(u,v)$ de mots qui ne diffèrent que d'un bit.

1. Montrer que l’hypercube de dimension $n$ possède un cycle hamiltonien.
2. En déduire qu'on peut énumérer les mots de ${0,1}^n$ ne ne modifiant à chaque fois qu'un seul mot (une telle énumération est un _code de Gray_). 
3. Proposer un algorithme prenant un $n$ et renvoyant un code de Gray des mots de longueur $n$
4. Proposer un algorithme (de bonne complexité) qui à un mot associe son suivant dans cette liste.

== Mots univers 

On dit qu'un mot $w in Sigma^*$ est $n$-univers si tous les mots de $Sigma^n$ sont des facteurs de $w$. On s'intéresse à créer les plus petits mots $n$-univers.

1. Montrer qu'un mot $n$-univers sur un alphabet à $k$ lettres à au moins une longueur de $k^n+n-1$

Soit $G=(V,E)$ un graphe *orienté*, on définit $L(G)$ le _graphe ligne_ de $G$ par le graphe orienté $(E,E')$ avec $E'$ l'ensemble des arêtes de la forme $((x,y),(y,z))$ pour $(x,y),(y,z) in E$.

2. Donner le graphe ligne du cycle à $4$ éléments et d'un arbre binaire parfait de hauteur 2.

On construit alors la famille des graphes de Bruijn $("DB"(n))_(n in NN^*)$ par $"DB"(1) = ({0,1},{0,1}^2)$ et $"DB"(n+1) = L("DB"(n))$.

3. Construire $"DB"(2)$
4. Montrer que pour tout $n in NN^*$, chaque sommet de $"DB"(n)$ à autant d’arêtes sortantes que entrantes. Combien de sommets et d'arêtes $"DB"(n)$ possède t'il~?
5. Montrer que pour tout graphe orienté fortement connexe tel que pour tout sommet le degré entrant est le même que le degré sortant, il existe un cycle eulérien (un cycle passant par toutes les arêtes du graphe). 

   En déduire que pour tout $n in NN^*$, $"DB"(n)$ possède un cycle eulérien.
6. En voyant les sommets de $"DB"(n)$ comme des mots dans ${0,1}^(n-1)$, et en étiquetant les arêtes par $0$ ou $1$, montrer qu'il existe un mot $n$-univers sur l'alphabet ${0,1}$ de taille $2^n+n-1$
7. Généraliser la question précédente pour des alphabets plus grand.


== Ensemble inévitables #footnote[oral info Ulm ENS 2019]

On fixe un alphabet fini $Sigma = {a,b}$. Pour $w in Sigma^*$, on écrit $w = w_1 ... w_n$ où $n := |w|$ est la longueur
de $w$. On dit qu’un mot $w in Sigma^*$ évite un mot $s in Sigma^*$ si $s$ n’apparaît pas comme facteur de $w$. On dit
que $w$ évite un ensemble de mots $S subset.eq Sigma^*$ s’il évite chaque mot de $S$.

1. Donner un mot de longueur au moins 12 qui évite $S = {a a a a, a a a b, a b a, b a a a, b a b, b b b b}$.
2. Donner un algorithme qui étant donné un ensemble fini de mot $S$ et un $w$, teste si $w$ évite $S$.

On dit qu’un ensemble $S subset.eq Sigma^*$ est inévitable s’il n’existe qu’un nombre fini de mots $w in Sigma^*$ qui
évitent $S$. Sinon, on dit que $S$ est évitable.

3. Est-ce que $S$ est évitable~? Et l'ensemble ${a a a, a b b, b a a, a b a b}$~?
4. Montrer que pour tout $Sigma$ un alphabet, et pour tout $k in NN$, il existe un $n in NN$ tel que pour tout mot $w in Sigma^*$ avec $|w|>n$, il existe $p<q$ tel que pour tout $l in [|0 ;k|]$, on a $w_(p+l) = w_(q+l)$
5. Montrer que, pour tout ensemble inévitable $S subset.eq Sigma^*$, il existe un sous-ensemble $S' subset.eq S$ fini tel que $S'$ soit inévitable.

== Mots sans cube#footnote[Oral de l'ENS Info 2019 et sujet de CCINP d'Informatique 2026]

On dit qu'un mot $w$ est sans carré s'il n'a pas de facteur de la forme $u^2$ pour $u != epsilon$. On dit qu'il est sans cube s'il ne contient pas de $u^3$ en 

1. Donner tous les mots sans carré sur $Sigma = {a,b}$

On définit $overline(h) : Sigma --> Sigma^*$ par $overline(h)("a") = "ab"$ et $overline(h)("b") = "ba"$ que l'on étend en $h : Sigma^* union Sigma^NN --> Sigma^*$ par $h(w_1...w_(|w|)) = overline(h)(w_1)...overline(h)(w_(|w|))$ et $h(w_1 ... w_n ...) = overline(h)(w_1)...overline(h)(w_n)) ...$

2. Montrer que $h^i (a)$ est un préfixe de $h^(i+1) (a)$. 
3. Montrer que pour tout $i$, $h^i (a)$ est sans cube
4. En déduire l'existance d'un mot arbitrairement grand sans cube.
== Facteurs de points fixe de morphismes #footnote[Tiré de l'Info D 2026 de décembre]

On dit que $h : Sigma^* --> Sigma^*$ est un _morphisme_ si pour tout $u,v in Sigma^*, h(u v) = h(u) h(v)$. On dit qu'un morphisme $h$ est une _substitution_ si pour tout $alpha in Sigma, |h(alpha)| >= 1$. Une telle substitution est dite _$alpha$-prolongeable_ pour $alpha in Sigma$ si $alpha$ est un préfixe strict de $h(alpha)$.

1. Soit $h$ une substitution $alpha$-prolongeable. Montrer que pour tout $n in NN$, $h^n (alpha)$ est un préfixe strict de $h^(n+1) (alpha)$
2. En déduire l'existence d'un unique mot infini $u$ commençant par $alpha$ dont tous les préfixes $h^n (alpha)$ sont préfixes, et tel que $h(u) = u$.

Dans ce cas, on définit $lim_(n->oo) h^n (alpha)$ l'unique mot infini qui soit point fixe de $h$ commençant par $alpha$. Une substitution (pas forcément $alpha$-prolongeable) est dite _primitive_ s'il existe $k in NN$ tel que $forall alpha, beta in Sigma, |f^k (alpha)|_beta > 0$.

Soit $f$ une substition primitive sur un alphabet $Sigma$ à au moins 2 lettres.

3. Montrer qu'il existe $k in NN$ et $alpha in Sigma$ tel que $f^k$ soit $alpha$-prolongeable.
  // Il existe $k in NN$ et $alpha in Sigma$ tel que $f^k$ soit $alpha$-prolongeable., car phi: alpha -> la première lettre de f(alpha) est une permutation de Sigma -> Sigma, donc existe puissance ou phi^2k = phi^k (monoide fini). 
3. On définit $F(w)$ l'ensemble des facteurs de $w$ pour $w in Sigma^*$. Soient $L = union.big_(n in NN) F(f^(n k) (alpha))$ et $w in L$, montrer qu'il existe $B in NN^*$ tel que tout $u in L$ de longueur $>= B$ contient $w$ en facteur.
  // la distance entre deux lettres alpha et beta dans u est bornée par un B
// Puis chaque préfixe de longueur > B contient les deux lettres, donc si w un facteur de u de longueur <p, existe n tq w dans f^kn (a). On prend n = max pour tout w. En posant T = max f^kn (a) pour tout alpha, on a TB une borne qui marche.

== Langage sans étoile

Soit $Sigma$ un alphabet, on définit par induction la classe des langages sans étoile $cal(M)$ par:
- $Sigma^*$ est sans étoile,
- Pour tout $alpha in Sigma$, ${alpha}$ est sans étoile,
- Pour tout $L_1, L_2$ deux langages sans étoile, $L_1 union L_2$, $L_1 \\ L_2$ et $L_1 dot L_2$ sont sans-étoile.

1. Montrer ${a b^n : n in NN}$ est un langage sans étoile sur $Sigma = {a,b}$.
2. Montrer que pour tout $u in Sigma^*$, le langage des mots qui n'ont pas $u$ comme facteur est sans étoile.
3. En déduire que ${ (a b)^n : n in NN}$ est un langage sans étoile.

== $(*)$ Egalité pour les résiduels

Soit $Sigma$ un alphabet. Donner $L$ un langage sur $Sigma$ tel que $forall t in Sigma^*, u t in L <=> v t in L$ ssi $u = v$

== $(*)$ Lemme d'Higman

Soit $Sigma$ un alphabet fini à $n$ lettres. On note le fait que $u$ soit un sous-mot de $v$ par $v eq.succ u$.

Montrer que pour toute suite de mot infinie $(v_i)_(i in NN)$, on a l'existence de $i< j$ tel que $v_i eq.succ v_j$.