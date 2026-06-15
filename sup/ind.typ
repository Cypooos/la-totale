
= *MP2I: Inductions & ordres*
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
