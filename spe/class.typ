
= *MPI: Classes de Complexités*

== Cours
- Problème de décision, d'optimisation, de maximisation/minimisation. Comment transformer un problème d'optimisation en un problème de décision.
- Taille d'une instance. 
- Définition d'une classe de complexité. Définition de P, NP, NP-Dur, NP-Complet
- Réduction polynomiale
- $k$-SAT, SAT, certificat

*Question de Cours*
- Comment transformer un probleme de maximisation en un problème de décision~?
- Montrer que 3-SAT est NP-Complet
/*
== SAT-LIKE#footnote[Algo 1 ENS Lyon]

Pour chacune des variantes de SAT suivantes, indiquer si c'est P ou NP-Complet:
- 2-SAT
- 4-SAT
- 3-SAT NAE (Not All Equal)
- 3-SAT OIT (exacly One in Three are true)
- XOR-SAT

== Liste de pottentielle réductions classique

TODO: 3-color, SOMME, 2-Partition, Hamiltonien, Arbre minimal couvrant $X subset.eq V$
*/
== Max 2-SAT

On consdière le problème d'optimisation suivant:
#rect[
  *Entrée:* $phi$ une formule en FNC \
  *Sortie:* Une valuation $phi$ qui maximise le nombre de clauses satisfaites\
]
1. Donner la version problème de décision
2. Montrer que si $k$ est le nombre de clauses le problème deviens polynomial
3. Montrer que la version décisionnel du problème est NP-Complet

== SUBSET-SUM

On considère le problème SUBSET-SUM suivant:
- *Entrée* $n in NN$ et $a_1, a_2, ..., a_n, S in NN$
- *Sortie:* Est-ce qu'il existe $I subset.eq [|1 ;n|]$ tel que $sum_(i in I) a_i = S$

1. Pour les suites suivante de $(a_n)_n$ et les valeurs de $S$ suivantes, indiquer si le problème est satisfiable ou non:
  - $(a_n)_n = (1,2,4,8,16), S = 7$
  - $(a_n)_n = (31,24,2,43,12,12,18), S = 29$
  - $(a_n)_n = (1001,1010,101,100,11), S = 1111$
2. Montrer que le problème SOMME est dans la classe NP
3. Donner un algorithme qui en $O(n S)$ résoud le problème


On cherche à prouver que le problème précédent est NP-Complet. Pour cela on considère une généralisation du problème sur des $k$-uplets intitulé SUBSET-SUM-VECT: 
- *Entrée* $k,n in NN$ et $a_1, a_2, ..., a_n, S in NN^k$
- *Sortie:* Est-ce qu'il existe $I subset.eq [|1 ;n|]$ tel que $sum_(i in I) a_i = S$

4. Montrer que on peut réduire le problème *SOMME-VECT* au problème *SOMME*
5. Montrer que *SOMME-VECT* est NP-Complet à partir de 3-SAT.
6. Est-ce que avec la question 3 on a démontré que P=NP~? Justifier.

== INDEPENDANT-SET et CLIQUE

On considère les deux problèmes CLIQUE-MAX et INDEPENDANT-SET suivant:

CLIQUE:
- *Entrée:* Un graphe $G=(V,E)$ non orienté
- *Sortie:* Le plus grand $S subset.eq V$ en cardinal tel que $V^2 subset.eq E$

INDEPENDANT-SET:
- *Entrée:* Un graphe $G=(V,E)$ non orienté et un $k in NN$
- *Sortie:* Est-ce qu'il existe $S subset.eq V$ tel que $S^2 inter E = emptyset$ avec $|S| >= k$~?

1. Donner la version problème de décision de CLIQUE. Montrer que elle est NP.
2. Donner une réduction polynomiale de INDEPENDANT-SET dans la version porblème de décision de CLIQUE.
3. En réduisant depuis 3-SAT, et en considérant un graphe avec $3k$ noeuds avec $k$ le nombre de clauses, montrer que CLIQUE est NP-Complet.

== MIN-COLOR-PATH

On considère le problème MIN-COLOR-PATH suivant:
- *Entrée:* $G = (V,E)$ un graphe, $s,t in V$ deux sommets et $c : V --> NN$ une coloration
- *Sortie:* Un chemin $s = x_1,..,x_n$ de $s$ à $t$ qui minimise $"Card"({c(x_1), ..., c(x_n)})$

1. Donner la version problème de décision, et montrer qu'elle est NP.
2. Donner un algorithme pour résoudre le problème si $G$ est un cycle.
3. Montrer que le problème de décision associé à MIN-COLOR-PATH est NP-Complet.

On suppose maintenant que l'on rajoute la condition $|"Im"(c)| <= k$ avec $k in NN$ fixé.

4. Montrer maintenant que le problème est P.

On considère l'algorithme qui prend des couleurs uniformément au hasard dans $"Im"(c)$ jusqu'à ce qu'il existe un chemin de $s$ à $t$

5. Quel est ce type d'algorithme~? Proposer des exemples arbitrairement grand ou cet algorithme renvoie une solution d'éspérence en $O(n)$ au lieu de $O(1)$.

== DOMINATING-SET

Soit $G = (V,E)$, on dit que $S subset.eq V$ est un _ensemble dominant_ si tous les sommets de $V$ sont soit dans $S$, soit voisin d'un sommet de $S$. On note $gamma(G)$ le cardinal minimum d'un ensemble dominant de $G$.

On considère le problème DOMINATING-SET suivant:
- *Entrée:* $G = (V,E)$ un graphe
- *Sortie:* $gamma(G)$

1. Donner la version problème de décision de DOMINATING-SET. Montrer qu'elle est NP.
2. Montrer que $gamma(G) <= |V|\/2$
3. Montrer que la version problème de décision de DOMINATING-SET est NP-Complet.
4. Montrer que si l'on restrain l'entrée du problème à des arbres, alors le problème est dans P.
5. Pour $G$ un graphe, on note $Delta_G$ son degré maximal. Donner une $Delta_G $-approximation de DOMINATING-SET.
6. Donner similairement une $log (|V|) $-approximation. Est-ce qu'une des approximations fait les deux~?

== Langages NP-Complets sur $Sigma={a}$#footnote[Mallory Marin, doc de colles]

Un langage $L$ est dit unaire si c'ets un langage sur un alphabet à une lettre, donc si $L subset.eq {a}^*$. $L$ est dit _NP-Difficile_ si le problème de tester si $x in L$ est NP-Difficile. Dans ce problème, la taille de l'entrée est $|x|$.

1. On note $"SAT"^+$ l'ensemble des entrée positives au problème SAT et $"S"$. Montrer que $L$ est NP-Difficile ssi il existe une fonction $f$ de complexité polynomiale telle que $ forall phi, phi in "SAT"^+ <==> f(phi) in L $

On cherche à montrer le théorème suivant

*Théorème de Berman:* S'il existe un langage unaire NP-Dur alors $"P"="NP"$

Soit $phi(x_1,x_2,...,x_n)$ une instance de SAT. On suppose que $L$ est un langage unaire NP-Difficile.
2. On note $phi_top (x_2,...,x_n) := phi(top, x_1,...,x_n)$ et $phi_bot (x_2,...,x_n) := phi(bot, x_1,...,x_n)$. Montrer que $ phi in "SAT"^+ <==> phi_top in "SAT"^+ or phi_bot in "SAT"^+ $

On note $|phi|$ la taille d'une formule $phi$, et on suppose que $forall i, |top|, |bot| < |x_i|$

3. Soit $phi$ une formule à $n$ variables. Donner un algorithme qui, pour tout $i <= n$, construit un ensemble de formules $Phi_i$ tel que toute formule de $Phi_i$ contient $n-i$ variables et $phi in "SAT"^+ <==> exists phi in Phi_i, phi in "SAT"^+$ 
4. Montrer qu'il existe un polynome $p$ tel que $sum_(phi in Phi_i) |phi| <= p(|phi|)$
5. En déduire que $"P" = "NP"$, et donc le théorème de Berman.

== Arbre couvrant minimum en couleurs (MLST)

Un _multi-graphe_ est un graphe dans lequel on peut avoir plusieurs fois une arête entre 2 sommets. 
On considère le problème MIN-COLOR-TREE suivant:
- *Entrée:* $G = (S,A)$ un multigraphe et $c : A --> NN$ une coloration des arrettes.
- *Sortie:* Un arbre couvrant $T = (S,A')$ de $G$ qui minimise $"Card"({c(e) : e in A'})$

On note $n$ le nombre de sommets et $m$ le nombre d'arêtes. 

1. Donner la version problème de décision, et montrer qu'elle est NP.
2. Montrer que si toutes les arêtes sont de couleur différentes alors il existe un algorithme polynomial.
3. Soit $k in NN$ fixé. Montrer que si le nombre de couleurs distinctes de $c$ est au plus $k$, il existe un algorithme en $O(2^k (n+m))$ résolvant le problème.

On considère le problème SET-COVER suivant : 
- *Entrée:* $n, m, k in NN$ et des ensembles $U_1, ..., U_m subset.eq [| 1;n|]$
- *Sortie:* Est-ce qu'il existe $I subset.eq [|1;m|]$ avec $|I| <= k$ tel que $union.big_(i in I) U_i = [|1;n|]$ ?
4. On admet que le problème SET-COVER est NP-dur. Montrer que le problème de décision associé à MIN-COLOR-TREE est NP-Dur.

== Activation de Processus #footnote[copie presque exacte CCINP 2023 sujet A]

Soit un système temps réel à $n$ processus asynchrones $i in [|1;n|]$ et $m$ ressources $(r_j)_(j <= m)$. Quand un processus $i$ est actif, il bloque un certain nombre de ressources listées dans un ensemble $P_i$ et une ressource ne peut être utilisée que par un seul processus. On cherche à activer simultanément le plus de processus possible.
Le problème de décision `ACTIVATION` correspondant ajoute un entier $k$ aux entrées et cherche à répondre à la question : "Est-il possible d’activer au moins $k$ processus en même temps ?""

1. Soit $n = 4$ et $m = 5$. On suppose que $P_1 = {r_1, r_2}$, $P_2 = {r_1, r_3}$, $P_3 = {r_2, r_4, r_5}$ et $P_4 = {r_1, r_2, r_4}$. Est-il possible d’activer 2 processus en même temps ? Même question avec 3 processus. 
2. Dans le cas où chaque processus n’utilise qu’une seule ressource, proposer un algorithme résolvant le problème `ACTIVATION`. Évaluer la complexité de votre algorithme.

On souhaite montrer que `ACTIVATION` est NP-complet

3. Donner un certificat pour ce problème.
4. Ecrire en pseudo code un algorithme de vérification polynomial. On supposera disposer de trois primitives, toutes trois de complexité polynomiale :
  - `appartient(c,i)` qui renvoie Vrai si le processus `i` est dans l’ensemble d’entiers `c`.
  - `intersecte(`$P_i$`,R)` qui renvoie `Vrai` si le processus `i` utilise une ressource incluse dans un ensemble de ressources `R`.
  - `ajoute(`$P_i$`,R)` qui ajoute les ressources $P_i$ dans l’ensemble `R` et renvoie ce nouvel ensemble.

En théorie des graphes, le problème `STABLE` se pose la question de l’existence dans un graphe non orienté $G = (S, A)$ d'un ensemble d’au moins k sommets ne contenant aucune paire de sommets voisins. En d’autres
termes, existe-t-il $S' subset.eq S, |S'|>= k$ tel que $forall s,p in S', (s,p) in.not A$ ?

5. En utilisant le fait que `STABLE` est NP-complet, montrer par réduction que le problème `ACTIVATION` est également NP-complet.

== Intersection d'automates #footnote[Algo 1 ENS Lyon TD 8]

On considère le problème NONEMPTY-REGULAR-INTERSECTION suivant:
#rect[
  *Entrée:* $A_1,...,A_n$ une liste d'automate sur $Sigma = {a,b}$\ 
  *Sortie* Est-ce que $ inter.big_(i <= n) L(A_i) != emptyset $
]

1. Montrer que NONEMPTY-REGULAR-INTERSECTION est NP
2. Donner une instance du problème tel que le plus petit mot dans l'intersection est de longueur exponentielle en la taille de l'entrée.
3. Montrer que si $Sigma = {a}$ alors le problème est polynomial.
4. Montrer que NONEMPTY-REGULAR-INTERSECTION est NP-Complet à partir de 3-SAT

== Sheffer

On définit l'opréateur de sheffer $X arrow.t Y := not (X and Y)$ et l'opérateur $X xor Y := (X or Y) and (not X or not Y)$. Indiquer si les problèmes suivant sont Np-Complet ou Polynomial:
- *Entrée:* Une formule $phi$ avec que des $xor$ *Sortie:* Si $phi$ est satisfiable.
- *Entrée:* Une formule $phi$ avec que des $and$ et $not$ *Sortie:* Si $phi$ est satisfiable.
- *Entrée:* Une formule $phi$ avec que des $arrow.t$ *Sortie:* Si $phi$ est satisfiable.

Plus dur, essayer de trouver une réduction de SAT (pas 3-SAT) aux formules avec $arrow.t$.

