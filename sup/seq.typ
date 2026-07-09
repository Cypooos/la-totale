
= *MP2I: Structures de données séquentielles*

== Cours

*Partie mémoire et preuve de programme*
- Paradigmes: impératif structuré, déclaratif fonctionnel, logique
- Savoir coder en C
- Différence entre compilé et interprété
- Représentation des entiers: signé, non signé, bytes/bits
- Représentation des flottants: signe, mantisse, exposant
- Preuve sur programme. Invariant de boucle. Correction partielle (vrai si termine), correction totale (vrai et termine)
- Complexité~: pire cas, cas moyen, coût amorti
- Spécialisation d'une fonction. Commentaires, annotation
- Programmation défensive, assertions
- Jeu de test. Graphe de flot de contreole. Chemin faisable. Couverture des sommets, couverture des arêtes. Test exaustif d'une boucle.
- Pointeurs, allocation, stack, heap, call stack, stack overflow.

*Structure séquentielles*
- Définition d'une liste. Liste doublement chainée. D'un tableau. Cout des opérations de création, ajout, supression en temps et mémoire.
- Différence entre struture immuable et mutable.
- Définition d'une pile. Implémentation d'une pile par tableau dynamique.
- Définition d'une file. Implémentation par une liste doublement chainé, et par un tableau dynamique.
- Table de Hachage, tableau associatif.
- Hachage: Collision, densité, structure hachable (HP)  
- Sérialisation d'un tableau ou d'une table de hashage (ou d'un arbre). 

== Complexité des opérations de bases

Pour chacune des structure entre tableau, liste, liste doublement chainée, tableau dynamique, pile, file, que l'on considèrent toutes de longeur $n$ indiquer les complexitées au pire des cas, meilleurs des cas et amortis des opérations suivantes :
#columns(3)[
  1. Lire le premier élément.
  2. Lire le dernier élément.
  3. Ajouter un élément à la fin.
  #colbreak()
  4. Ajouter un élément au début.
  5. Retirer le premier élément. 
  6. Retirer le dernier élément. 
  #colbreak()
  7. Inverser l'ordre.
  8. Tester si il y a un $42$.
  9. Insérer un élément au milleu.
]

== Merge de liste
Soit $L_1, L_2$ deux listes triées. Proposer un algoritme en OCaml qui calcule la liste trié des éléments contenue dans $L_1$ et $L_2$.

== Calcul des différences

Proposer un algorithme qui prend un tableau d'entiers $T$ de longueur $N$ et qui en $O(n)$ renvoie $sum_(0<=j<i<n) T[i]-T[j]$

_On peut facilement transformer cet exercice en un autre en changeant la formule_

== Permutation suivante
On représente une permutation $sigma$ comme un tableau $T$ de longueur $n$ tel que $forall i<N, T[i] = sigma(i)$

Donner le code d'une fonction qui à une permutation de $[|0 ;N|]$ représenté par $T$ retourne la prochaine permutation de $[|0 ;N|]$ dans l'ordre lexicographique.

== Tableaux binaire

On considère le problème suivant:
#rect(outset: 3pt)[
  *Minimum change binary matrix*\
  *Entrée:* Une matrice $M in cal(M)_(n,m) ({0,1})$ \
  *Sortie:* Le nombre minimum de coefficients à changer pour que chaque ligne\ et chaque collone ait un nombre pair de 1.
]

Donner un algorithme résolvant ce problème en $O(N M)$ avec $N,M$ les dimensions du tableau.\ Montrer sa correction.

== Sous-tableau connexe

Soit $A$ un tableau de $n$ entiers relatifs, on cherche un algorithme en $O(n)$ qui calcule le sous-tableau connexe qui maximise la somme de ses éléments, i.e. le couple $(i,j)$ avec $0<=i<=j<=|T|$ tel que $sum_(k in [|i ;j|]) A[k]$ soit maximal.

== Le glouton par défault#footnote[Algo 1 ENS Lyon]
Étant donné un ensemble ${x_1,...,x_n}$ de $n$ points sur une droite, décrire un algorithme qui détermine
le plus petit ensemble d’intervalles fermés de longueur 1 qui contient tous les points donnés.

Prouver la correction de votre algorithme et donner sa complexité.

== Recherche dans une matrice

*Question 1* Donner le code C d'une fonction ```c int find(int *arr, int n, int key);``` qui prend en argument un tableau `arr` trié de longueur `n` et qui trouve un indice `i` tel que `arr[i] == key`.

On cherche à faire un algorithme efficace aussi dans le cadre de matrice trié. On dit qu'une matrice $M$ de taille $n times m$ est _linéairement trié_ si chaque ligne est trié de haut en bas et que chaque colone est trié de gauche à droite.

*Question 2* Donner le code d'un fonction $C$ ```c bool is_ordered(int **mat, int n, int m)``` qui à une matrice `mat` de taille $n times m$ teste si elle est linéairement trié.

*Question 3* Donner le code d'une fonction ```bool is_in(int **mat, int n, int m, int key)``` qui teste si `key` est présent dans la matrice `mat` linéairement trié de taille $n times m$ par diviser pour reigner.

*Question 4* Meme question en $O(n + m)$

*Question 5* Donner le code d'une fonction $C$ qui en $O(n)$ trouve un minimum local dans une matrice $n times n$

== Tableau cumulatif


Soit $T$ un tableau de $n$ entiers relatifs, on note $C_T$ le tableau de longueur $N$ tel que $ C_T [i] = sum_(j=0)^i T[j] $

*Question 1* Donner le code de la fonction ```c int* get_cumulatif(int* T, int n);``` qui, à un tableau $T$ de longueur $N$ associe son tableau cumulatif.

*Question 2* Montrer par récurrence sur la longueur de $T$ que si $max C_T > N$ avec $N$ la longueur du tableau alors il existe un élément $i$ avec $T[i]>1$.

On cherche maintenant $s <= t <= N$ tel que $sum_(i=s)^t T[i]$ soit maximale

*Question 3* Proposer un algorithme qui, étant donné un tableau $T$, renvoie $i < j$ tel que $T[j] - T[i]$ soit maximal. En déduire un code C qui répond au problème en utilisant un tableau cumulatif.

*Question 4* On cherche maintenant à calculer le nombre de couples $(i,j)$ avec $i<j$ tel que $sum_(i=s)^t T[i]$ soit maximale. Proposer un algorithme répondant au problème.

== Multiplication rapide de polynome#footnote[Algo 1 ENS Lyon]

Ici on considère des polynômes d'entiers $ZZ[X]$. Soient $P,Q in ZZ_n [X]$, leur produit $R = P Q in ZZ_(2d) [X]$

On représente un polynome par un tableau d'entiers $T$, tel que pour $P in ZZ_d [X]$, si on écrit $P = sum_(i <= d) a_i X^i$ on a $T[i] = a_i$.

1. Donner une fonction C ```c int* multiply(int* p, int* q, int n)``` qui prend deux polynômes de degré $<= n$ représenter par deux tableaux de longueur $n$ et qui renvoie le polynome produit.
2. Soit $n=2m$, pour $P in ZZ_n [X]$, montrer que on peut décomposer $P = P_1 + X^m P_2$ avec $P_1,P_2 in ZZ_m [X]$.
Soient $P,Q in ZZ_n [X]$, on décompose $P = P_1 + X^m P_2$ et $Q = P_1 + X^m P_2$. On définit alors $R_1 = P_1 Q_1$, $R_2 = P_2 Q_2$ et $R_3 = (P_1 + P_2) times (Q_1 + Q_2)$.
3. Exprimer $P times Q$ en fonctions de $R_1, R_2, R_3$.
4. En déduire un algorithme récursif pour calculer le produit de polynome.
5. Quelle est la complexité de cet algorithme~?

== Structure efficace pour représenter des ensembles

On cherche à implémenter une structure de données pour représenter un sous-ensemble de $[|0 ;N|]$ ($N$ sera fixé par la fonction `create`). Pour cela, on chercherait à définir une structure avec 3 opérations:
- ```ml val create: int -> set``` telle que `create N` renvoie $emptyset$ (un sous-ensemble de $[|0 ;N|]$)
- ```ml val add: set -> int -> unit``` telle que `add x i` renvoie $X union {i}$ (si $0<= i <= N$)
- ```ml val del: set -> int -> unit``` telle que `del x i` renvoie $X \\ {i}$ (si $0<=i <= N$)

1. Proposer une implémentation de cette structure en utilisant des listes. Quelles sont les complexités des différentes opérations en mémoire et en espace~?

On cherche à avoir une complexité spatiale aussi petite que possible. Attention, à partir de maintenant, on prendra en compte la taille des entiers. On rappelle qu'un entier $N$ à une taille de mémoire $log_2(N)$.

2. On considère la représentation qui à $1 <= a_1 <= ... <= a_m <= n$ associe la liste 
$ [a_1, a_2-a_1, a_3-a_2,...,a_m-a_(m-1)] $
Montrer que cette représentation est en $O(n)$ de mémoire.
3. Implémenter les fonctions `add` et `del` pour cette représentation. Quels sont les complexités~?
4. Proposer une implementation tel que `add` et `del` soient en $O(1)$ en complexité, mais que la structure soit toujours en $O(N)$ d'espace. La fonction `create` peut-être en $O(N)$. //_Ind: On pourra essayer d'utiliser des tableaux de booléens_
5. Peut-on faire mieux en complexité spatiale que $O(N)$~?

== Inverser une liste sans toucher aux pointeurs 

On considère le type suivant d'une liste en C :
```c
struct list_t {
  int v;
  struct list_t *next;
};
typedef struct list_t list_t;
```

1. Donner le code $C$ d'une fonction ```c list_t* invert(list_t *liste);``` qui inverse la liste donné en entrée en $O(n)$ de temps et $O(1)$ d'espace.

On cherche a crée une solution de la meme complexité telle que les pointeurs des différentes listes ne changent pas, et seules les valeurs `v` sont inversé à la fin de l'évaluation. Durant l'évaluation, on a le droit de modifier les pointeurs ```c *next``` tant qu'ils sont remis à leur état initial à la fin.
2. Proposer une solution en $O(n^2)$ de temps et $O(1)$ d'espace.
3. Donner une solutionn en $O(n)$ de temps et $O(1)$ d'espace. On pourra considérer couper la liste en 2 bouts et en inverser qu'un seul en utillisant la méthode usuelle.


== Liste cyclique sans lièvre et torture

1. Proposer une structure pour implémenter une liste simplement chainé en C.

Remarquer que le pointeur "next" pourrait être n'importe quel maillon de la liste, y compris un des éléments précédemment vu. On dit qu'une liste est cyclique si un pointeur "revient" sur un des maillons précédent. Dans ce cas, la liste représenté est infinie et, à partir d'un certain rang, devient périodique.
2. Proposer un code C pour définir la liste cyclique qui représente $[1,2,3,2,3,...]$ en n'utilisant que 3 maillons.
3. Proposer un algorithme pour tester si une liste est cyclique. On fera bien attention à ce que l'algorithme termine.
4. Donner une fonction ```c liste_t* reverse(liste_t* list);``` qui inverse une liste simplement chainé en C. Que ce passe-t'il si on inverse une liste cyclique~?
5. On cherche maintenant à calculer le nombre de maillons d'une liste cyclique. Proposer un algorithme en $O(n)$ de temps et $O(1)$ de mémoire.

_Info bonus:_ Sachez que l'on peut définir de telle listes en OCaml~! Le code suivant définit la liste de la question 2~: ```ml let q2 = 1 :: (let rec l = 2 :: 3 :: l in l) ```

== Tableaux auto-référents

Pour $T$ un tableau de longueur $n$, on définit l'histogramme de $T$ noté $H_T$ comme le tableau de longueur $n$ tel que $H_T [i]$ correspond au nombre de $i$ dans $T$. Formellement, $H_T [i] = |{j : T[j] = i}|$

On dit que $T$ est auto-référent si $H_T = T$. Par exemple, $[1,2,1,0]$ est un tableau autoréférent.

*Question 1* Donner le code d'une fonction ```c int* histogramme(int *t, int n);``` qui, à un tableau $t$ de longueur $n$ renvoie $H_t$ son histogramme.

*Question 2* Donner tous les tableaux auto-référent de longueur $4$ et $5$

*Question 3* Donner le code d'une fonction ```c bool is_autoref(int *t, int n);``` qui teste si un tableau $t$ est auto-référent.

*Question 4* Donner le code d'une fonction de recherche exhaustive ```c int count_autoref(int n);``` qui donne le nombre de tableaux auto-référents de longueur $n$.

*Question 5* Montrer que pour tout $n > 6$ il existe un tableau autoréférent de longueur $n$

*Question 6* ($*$) Montrer qu'il est unique

#pagebreak()
= *MP2I: Inductions & ordres #footnote[Maxime Bridoux, MP2I]*
== Cours 
- Définition d'une relation d'équivalence.
- Définition d'une relation d'ordre, ordre total = bon ordre.
- Minimum, éléments comparables, incomparables, chaine, antichaine.
- Les deux définitions d'un ordre bien fondé, et la démonstration de leur équivalence.
- Préordre, préordre bien fondé = WQO (HP) 
- Montrer que $(NN, <=)$ est bien fondé.
- Ordre lexicographique, ordre produit. Démonstration que si $A,B$ sont bien ordonné, alors $A times B$ l'est aussi pour l'ordre produit et l'ordre lexicographique
- Qu'est-ce qu'un ensemble inductif~?

== Des ordres
Les ordres suivant sont-ils bien fondés~?
#columns(3)[
  1. $<=$ sur $ZZ$
  2. $<=$ sur $RR^+$
  #colbreak()
  3. $<=$ sur $QQ^+$
  4. $scripts(<=)_"lex"$ sur $NN^2$
  #colbreak()
  5. $subset.eq$ sur $cal(P)(NN)$
  6. $subset.eq$ sur $cal(P)_"finie" (NN)$
]

== Des ensembles inductifs
Proposer une définition inductive de chacun des ensemble suivants
#columns(3)[
  1. $2NN$
  2. Les mots sur un alphabet $Sigma$ fixé
  #colbreak()
  3. Les puissances de 2
  4. ${ (x,y) in NN^2 : x < y}$
  #colbreak()
  5. ${ (x,y) in NN^2 : 2x = y}$
  6. Les listes d'entiers contenant un `42` 
]

== Soustraction entière
La soustraction entière est la fonction $"sub" : NN^2 --> NN$ définit par:
$
cases(
  "sub"(m, 0) = m,
  "sub"(0, n) = 0,
  "sub"(m, n) = "sub"(m − 1, n − 1),
)
$

1. Montrer que sub est bien définie.
2. Montrer que $forall m,n in NN, "sub"(m,n) <= m$

== Ordre sur les mots
Étant donné un ensemble alphabet $Sigma$, on pose pour $n in NN^*$ l'ensemble
$ Sigma^n = underbrace(Sigma times ... times Sigma,n "fois") $
des mots d’exactement n lettres. L’ensemble $Sigma^* = union.big_(n in NN) Sigma^n$ est alors l’ensemble de tous les mots sur Σ.

1. Soit un ensemble ordonné $(Sigma, <=)$ tel que $Sigma = {a,b,c}$ et $a < b < c$. Donner une définition de l’ordre lexicographique $scripts(<=)_"lex"$ sur $Sigma^3$ puis l’utiliser pour ordonner les mots aba, baa, caa, aaa, abc, bbb.
2. Montrer que l’ordre lexicographique $scripts(<=)_"lex"$ sur $Sigma^n$ est une relation d’ordre bien fondée.
3. Est-ce que l’ordre lexicographique $scripts(<=)_"lex"$ est une relation d’ordre bien fondée sur $Sigma^*$~?
4. Montrer que l’ordre $scripts(<=)_m$ sur $Sigma^*$ définit par
$ u scripts(<=)_m v "si et seulement si" |u| < |v| "ou" (|u| = |v| "et" u scripts(<=)_"lex" v) $
  est une relation d’ordre totale sur $Sigma^*$. Est-ce que $scripts(<=)_m$ est bien fondé~?
5. En déduire que l’ensemble $Sigma^*$ est dénombrable.

== Tri aléatoire
On considère l'algorithme de tri suivant:
- Tant qu'il existe $i<j$ tel que $T[i]>T[j]$, on échange $T[i]$ et $T[j]$
1. Montrer que cet algorithme termine toujours
2. Quel est sa complexité dans le pire des cas~?

== Langage de Dyck
On se fixe un ensemble fini de lettres $Sigma = {a,b}$. On déifni un _mot_ comme étant une suite finie de lettres de $Sigma$. Le mot vide (la suite vide) sera noté $epsilon$, et la concaténation de deux mots $u,v$ sera noté par la concaténation $u v$. On définit par induction l'ensemble $A$ par:
- $epsilon in A$
- Si $u in A$, alors $a u b in A$
- Si $u,v in A$, alors $u v in A$

1. Montrer que tous les mots dans $A$ ont autant de $a$ que de $b$
2. Monter que l'ensemble de ces règles sont ambigues. Proposer sans justifier une verison non-ambigue (et faite la vérifier par la colleuse avant de passer à la suite).
3. Soit $w_1 ... w_n$ un mot de A, montrer qu'il existe un $i<=n$ tel que  pour tout $j < i$, le mot $w_1...w_j$ possède strictement plus de $a$ que de $b$ et que le mot $w_1... w_i$ possède autant de $a$ que de $b$
4. Montrer que votre définition de la question 2 est équivalente à la définition question 1.

== Système MIU

On pose $Sigma = {M,I,U}$ et on définit inductivement l'ensemble $S subset.eq Sigma^*$ par les règles suivantes:
- $M I in S$
- Si $x in Sigma^*$ et $x I in S$ alors $x I U in S$
- Si $x in Sigma^*$ et $M x in S$ alors $M x x in S$
- Si $x,y in Sigma^*$ et $x I I I y in S$ alors $x U y in S$
- Si $x,y in Sigma^*$ et $x U U y in S$ alors $x U y in S$

Ce système est extrait du livre « Gödel, Escher, Bach » de Douglas Hofstadter, sous la forme du puzzle suivant: est-ce que la chaîne MU appartient au système MIU~?

1. Montrer que $M U I U in S$
2. Donner l'ensemble des chaines de $S$ que l'on peut dériver en appliquant au plus 3 règles.
3. Démontrer que toute chaine $s in S$ commence par un $M$
4. Démontrer que pour toute chaine $s in S$, son nombre de $|s|_M$ de $M$ est exactement 1
5. Démontrer que pour tout chaine $s in S$, son nombre de $|s|_I$ de $I$ n'est jamais un multiple de $3$. Conclure.

== Sous-ordres indénombrable de $(cal(P)(NN), subset.eq)$
1. Est-ce qu'il existe $A subset.eq cal(P)(NN)$ indénombrable tel que tous les éléments de $A$ sont incomparable deux à deux pour $subset.eq$~?
2. *($*$)* Est-ce qu'il existe $T subset.eq cal(P)(NN)$ indénombrable tel que $(T, subset.eq)$ soit une relation d'ordre totale~?
3. Montrer qu'il existe une infinité indénombrable d'ordre totaux sur $NN$ non isomorphes les uns aux autres.


// TODO: https://mail.google.com/mail/u/1/#search/Induction/FMfcgzQfBZcMLdpQzDCxddxpTcPwfwph
