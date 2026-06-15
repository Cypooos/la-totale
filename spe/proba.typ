
= *MPI: Proba & Approx*

== Cours
- Algorithme déterministe, de Las Vegas, Monte Carlos.
- Problème de décision, approximation, instance positive, instance négative.
- Fonction de cout, algorithme d'approximation.

*Question de Cours*
- Qu'est-ce qu'un algorithme de Monte-Carlo et de Las vegas~?
- Comment transformer un problème d'approximation en un problème de décision~?

*Petites Questions*
- Soit $P$ un problème de minimisation et $overline(P)$ le problème de décision associé. On suppose que $overline(P)$
- Quelle est la probabilité que la fonction suivante termine~? ```c random()``` renvoie un flottant aléatoire de manière uniforme dans $[0 ;1[$
  ```c
  void f() {
    if (random() < 0.5f) {f();f();}
    return;
  }
  ```

*A ajouter*
- Polya's Urn, Exchangeable random variables
- Chinese restaurant process
- Indian bufffet process
- Moris approximate counting algorithm https://en.wikipedia.org/wiki/Approximate_counting_algorithm (count to $n$ with $log log n$ bits)

== Espérence pour tout choisir
On choisi uniformément des entiers dans ${1,...,n}$ avec remis j'usqu'à ce que tous les entiers ont été choisi. On note $X$ la variable aléatoire du temps d'exécution. Montrer que $EE[X] = n ln n + o(n ln n)$

== Le programme de Von Neumann

Soit ```c bool random(float p);``` une fonction qui génère le booléen `true` avec probabilité $p$ et le booléen `false` avec probabilité $1-p$.
1. Soit $0<p<1$. Montrer que le code suivant renvoie `true` avec probabilité 1/2~:
  ```c
  bool von_neumann(float p) {
    bool a = random(p);
    bool b = random(p);
    if (a!= b) { return a; }
    if (a == b) { return von_neumann(p);};
  };
  ```
2. Que veux l'espérence du temps d'exécution en fonction de $p$~?
// liste de tirage, vérifie sans carré en position puissances de 2, => min amounth of sampling. C'est quoi l'espérence 


== 2-approximation du circuit eulérien (TSP)

Soit $G = (V,E)$ un graphe non orienté pondéré par $w : E -> RR_+^*$. On note pour $c := (c_i)_(i <= n)$ un chemin $w(c) = sum_(i<n) w((c_i,c_(i+1)))$ son poids. Similairement, on définit $w(T)$ le poids d'un arbre $T$ sur $G$ comme la somme du poids de toutes ses arêtes. Un circuit est un cycle où l'on a le droit de repasser sur des sommets déjà vu.
  
On cherche un circuit passant par tous les sommets au moins une fois et pouvant repasser sur lui-même tel que le poids de tout le chemin soit minimal. On note $w^*$ le poids du circuit de poids minimal.

*Question 1* On suppose que tous les aretes du graphe sont de poids différents. Montrer que le plus petit arbre couvrant est unique.

*Question 2* Montrer que si $T$ est arbre couvrant de poids minimal, alors $w(T) < w^*$

*Question 3* En déduire via un parcours de cet arbre un circuit repassant sur lui-même $c$ de poids $w(c) < 2 w^*$

*Question 4* Proposer un algorithme pour calculer un tel arbre. Quel est sa complexité~?

== $3\/2$-approx de TSP
On considère le problème du voyageur de commerce (TSP)~:
- *Entrée* Un graphe $G = (V,E)$ avec $d : V^2 --> RR_+$ une distance (respecte les axiomes de la distance).
- *Sortie* Le poids minimum d'un cycle passant par tous les sommets. 

On note $w(C)$ pour $C$ un chemin (ou arbre) son poids. On pose $T^*$ un arbre couvrant de $G'$ de poids minimal et $I$ l'ensemble des sommets impair de $T^*$. On note $w^"OPT"$ le poids optimal d'une instance du problème.

*Question 1* Montrer que $w(T^*) < w^"OPT"$. En déduire une 2-approximation du problème en utilisant un parcours de $T^*$

*Question 2* Montrer que $|I|$ est pair et en déduire que $G'$ restraint à $I$ possède un couplage de poids minimal que l'on notera $M$.

*Question 3* Montrer que si $G$ est un graphe connexe tel que $forall v in V, deg v in 2 NN$, alors $G$ possède un cycle eulérien (passant par toutes les aretes). En déduire que le multigraphe $T^* + M$ possède un cycle eulérien que l'on notera $h$.

*Question 4* Montrer que le problème du voyageur de commerce admet une $3/2$-approximation.

== $C$-approx du couplages maximum#footnote[TD11 L3 ENS Lyon Algo 1]

Pour $M$ un couplage, on note $S(M)$ les sommets saturé de $M$.

On considère l'algorithme suivant:
#rect[
  *Entrée:* $G$ un graphe\
  $M <-$ un couplage maximal de $G$\
  *tant que* $exists {u',u},{u,v}, {v,v'} in E$ avec ${u,v} in M$ et $u',v' in.not S(M)$~:\
  #h(30pt) $M <-- (M\\{u,v{}}) union {{u',u},{v,v'}}$\
  *fin tant que*\
  *retourner $M$*
]

1. Quelle est la complexité de l'algorithme~?
2. Montrer que l'algorithme est une $C$-approx du couplage maximum pour un certain $C$ que l'on déterminera.
On change la boucle pour chercher un chemin alternant $P$ de longueur $2t+1$, et si on en trouve un on effectue $M <-- (M\\P) union (P\\M)$. L'algorithme donné correspond donc au cas $t=1$.

3. Donner le facteur d'approximation en fonction de $t$, et en déduire un _PTAS_, c'est-à-dire que pour tout $epsilon>0$ on a un algorithme polynomial qui renvoie une $(1-epsilon)$-approximation. On déterminera exactement la complexité en fonction de $epsilon$.

== Vertex cover

Soit $G = (V,E)$ un graphe. On dit que $S subset.eq V$ est _une couverture_ si pour toute arête $e in E$, au moins une des extrémitées de $e$ est dans $S$. On s'intéresse au problème VERTEX-COVER suivant:
- *Entrée:* $G = (V,E)$ un graphe
- *Sortie:* Une couverture $C$ de taille minimale en cadinal

1. Donner la version problème de décision de VERTEX-COVER.

On considère un algorithme glouton qui, tant qu'il reste des arêtes au graphe, en choisit une et retire les deux sommets du graphe. On note $C$ les arêtes choisies la fin.

2. Montrer que si $S$ est une couverture, alors $|S| <= 2|C|$
3. En déduire une 2 approximation de VERTEX-COVER

On considère l'algorithme qui, tant que le graphe possède encore des arêtes, prend un sommet de degré non nul au hasard uniformément, le choisi et retire toutes les arêtes relié à ce sommet.

4. Quel est ce type d'algorithme~? Soit $G=(V,E)$ un graphe, on note $V_f$ la variable aléatoire de l'ensemble choisi à la fin de l'exécution de l'algorithme sur $G$. Montrer que 
  
$ EE[ |V_f| ] = sum_(v in V) (deg v)/(deg v +1) $

== Set cover

On considère le problème SET-COVER suivant:
#rect[
  *Entrée:* $n,m in NN$, $U_1, ...,U_n subset.eq [| 1 ; m|]$ \
  *Sortie:* Le plus petit $I$ en cardinal tel que $union.big_(i in I) U_i = [| 1 ; m|]$
]

Dans toute cette colle on supposera que toutes les entrées sont telles que $union.big_(i <= n) U_i = [|1 ;m|]$ 

*Question 1* Résoudre le problème pour les instances de la forme $n in NN ;m :=n+1 ;U_i = {i,i+1}$

*Question 2* Donner une $log(m)$-approximation de SET-COVER. _Ind: On fera un algorithme glouton et on pourra utiliser le fait que $1/2 + ... + 1/n <= log n$_

On considère maintenant que la sortie doit être un $I$ qui maximise le nombre de $x in [|1 ;m|]$ tel que $x$ appartienne à un nombre impair d'ensembles de $(U_i)_(i in I)$

*Question 3* Soit $(U_i)_(i<=n)$ une instance du problème. On choisi avec probabilité $1/2$ chaque $U_i$. On note $N$ la variable aléatoire du nombre de $x in [|1 ;m|]$  appartennant à un nombre impair d'ensembles choisi.

*Question 4* Montrer que $EE[N] = m/2$

*Question 5* En déduire un algorithme un algorithme de Las Vegas qui est une $2$-approximation. Existe t'il une 2-approximation déterministe~?

== 2-approx de Bin-Packing#footnote[CCINP 2025]

On s'intéresse au problème `BIN-PACKING` suivant :
- *Entrée:* Des objets de tailles $t_1, dots, t_n in ]0,1]$
- *Sortie* Le plus petit nombre de boites $n in NN$ de capacité 1 nécéssaire pour ranger tout les objets.

On note $"OPT"$ le nombre minimal de boîtes nécessaires.

On étudie l’algorithme `Next-Fit` suivant :
#align(center)[#rect[#align(left)[
  $N, T <-- 0$\
  *Pour* $i$ allant de $1$ à $n$:\
  #h(30pt) *Si* $T + t_i <= 1$ *alors:*\
  #h(60pt) $T <-- T + t_i$\
  #h(30pt) *Sinon:*\
  #h(60pt) $T <-- t_i$\
  #h(60pt) $N <-- N +1$\
  *Retourner* $N$
]]]

1. Appliquer `Next-Fit` à la suite $(0.4, 0.7, 0.3, 0.6, 0.5, 0.5).$ Que vaux $N$ à la fin?
2. Montrer que si `Next-Fit` ouvre une nouvelle boîte, alors la boîte précédente et la nouvelle boîte ont ensemble une charge strictement supérieure à $1$.
3. On suppose que `Next-Fit` utilise $k$ boites. Montrer que :
$
"OPT" >= sum_(i=1)^n t_i > (k-1)/2.
$
4. En déduire que `Next-Fit` est une $2$-approximation.
5. Est-ce que `Next-Fit` est meilleur qu'une $2$-approximation?

== $log(n)$-approx de MLST

Un _multi-graphe_ est un graphe dans lequel on peut avoir plusieurs fois une arête entre 2 sommets. 
On considère le problème MIN-COLOR-TREE suivant:
- *Entrée:* $G = (S,A)$ un multigraphe et $c : A --> NN$ une coloration des arrettes.
- *Sortie:* Un arbre couvrant $T = (S,A')$ de $G$ qui minimise $"Card"({c(e) : e in A'})$

On note $n$ le nombre de sommets et $m$ le nombre d'arêtes. 

1. Donner la version problème de décision, et montrer qu'elle est NP.
2. Montrer que si toutes les arêtes sont de couleur différentes alors il existe un algorithme polynomial.

On considère l'algorithme glouton suivant. Il initialise une structure union-find avec une classe par sommet et, a chaque étape, on choisit parmi les couleurs non encore choisies une couleur qui minimise le nombre de composantes après ajout de toutes les arêtes de cette couleur. Une fois que toutes les classes sont regroupées, alors il retourne un arbre couvrant des arêtes des couleurs choisies.

5. Montrer que l'algorithme renvoie bien une solution.

On note $q$ le nombre de couleurs de la solution optimale et $p_i$ le nombre de classes de la structure union-find à l'étape $i$ de l'algorithme.

6. Montrer que
$ p_(i+1) -1<= (1-1/q) (p_i-1) $
7. En déduire une $log(n)$-approximation.

== Arbres ternaires complets (+Jeux)#footnote[Exercice 100% recopié de Florian Bourse : https://www.di.ens.fr/~fbourse/enseignement/Proba.pdf]

Un arbre $T$ est dit ternaire complet si chaque noeud interne possède exactement $3$ fils et que les feuilles sont toutes à la meme profondeur. On note $cal(F)(T)$ les feuilles de $T$ et $cal(N)(T)$ les noeuds de $T$ (incluant les feuilles).

On dispose d'une valuation $sigma : cal(F)(T) --> {V,F}$ qui associe à chaque feuille une valeur booléene. On étend $sigma$ à $cal(N)(T)$ en posant $sigma(u) = b$ pour tout $u in cal(N)(T)$ ayant deux fils $u_1, u_2$ tels que $sigma(u_1) = sigma(u_2) = b$. On cherche à évaluer la valeur de $sigma$ à la racine.

1. Exprimer $|cal(F)(T)|$ et $|cal(N)(T)|$ en fonction de la hauteur de l'arbre $T$.

On considère l'algorithme probabiliste récursif qui consiste à tirer aléatoirement deux enfants $u_1$ et $u_2$, et n'évaluer $sigma$ sur $u_3$ l'enfant non choisi seulement si $sigma(u_1) != sigma(u_2)$.

2. Quel type d'algorithme s'agit t'il? Montrer que l'éspérence du nombre de feuilles que l'algorithme visite et inférieure à $(8/3)^h$ pour $h$ la hauteur de $T$.
3. En déduire un algorithme probabiliste qui, en espérance, est de complexité $O(|cal(N)(T)|^(0.9))$ (donc sous-linéaire). _On indique que $log_3 (8) approx 1,893$_

On cherche maintenant à montrer qu'un algorithme déterministe correct doit forcément inspecter toutes les feuilles. On pose $n = |cal(F)(T)|$. Soit $F subset.eq cal(F)(T)$, on dit que $F$ _détermine_ un noeud $u in cal(N)(T)$ soit si $u in F$ ou s'il a deux fils $u_1$ et $u_2$ déterminés par $F$ tels que $sigma(u_1) = sigma(u_2)$

4. Montrer que pour tout $u in cal(N)(T)$ non déterminé par $F$, on peut modifier les valeurs de $sigma$ sur $cal(F)\\ F$ de manière à changer la valeur de $sigma(u)$.
5. On considère le jeu à deux joueurs suivant : à chacun des $n-1$ tours, Alice choisi une feuille $x in cal(F)(T)$ non déjà choisit et Bob décide si $sigma(x) = V$ ou $sigma(x) = F$. Alice gagne si l'ensemble des $n-1$ feuilles détermine la racine, et Bob gagne dans le cas contraire. Montrer que Bob dispose d'une stratégie gagnante.
6. En déduire qu'un algorithme déterministe ne peut pas faire mieux que du $O(|cal(N)(T)|)$.

== Unique graphe infini aléatoire

On dit que deux graphe $G = (V,E)$ et $G' = (V', E')$ sont isomorphe s'il existe $phi : V --> V'$ bijective tel que $(u,v) in E <=> (phi(u), phi(v)) in E'$

On cherche à montré que les graphes aléatoire infinis dénombrable sont isomorphes avec probabilité 1. On considère pour cela les variables aléatoire de bernoulli $(X_(u,v))_(u,v in NN)$ indépendantes de probabilité $p$ qui représente s'il existe une arête entre $u$ et $v$. On note $G_p$ cette famille de variables aléatoire.

*Question 1* Quelle est la probabilité que le graphe possède le chemin $(0,1,2,...,k)$~?

On dit qu'un graphe infini possède _la propriété de Rado_ si pour tout $U, V subset.eq NN$ disjoint fini, il existe $x in NN$ tel que $x$ soit connecté à tout $U$ et a aucun $V$.

*Question 2* Soit $U,V subset.eq NN$ fini, montrer que la probabilité qu'un $x in NN \\ (U union V)$ satisfaite la propriété de rado est non nul. En déduire l'existence d'un tel $x$ avec probabilité 1.

*Question 3* Montrer que si $G$ et $G'$ possède la propriété de Rado, alors ils sont isomorphes.

*Question 4* Généraliser la question 3 pour montrer que la probabilité que $G_p$ soit isomorphe a $G_p'$ est 1 si $0<p,p' < 1$.

== $(Delta+1)$-approx de Maximum independant set

*Question de Cours* Rapeller la définition d'un algorithme de monte-carlo et d'un algorithme de las-vegas.

*Question 1* Montrer que si $L$ est un langage hors-contexte alors $overline(L) = { overline(w) :  w in L}$ (l'ensemble des mirroirs de $L$) l'est aussi.


On considère le problème MIS suivant:
#rect[
  *Entrée:* Un graphe $G=(V,E)$ non orienté\
  *Sortie:* Un $I subset.eq V$ de cardinal maximal tel que $E inter I^2 = emptyset$
]

Pour $G=(V,E)$ un graphe, on note $Delta(G) = max_(v in V) deg(v)$.
  
*Question 2* Donner la version problème de décision de MIS

*Question 3* Donner un $(Delta(G)+1)$-approximation de MIS qui tourne en $O(|S|^2)$

On considère l'algorithme qui, tant que le graphe possède encore des arêtes, prend un sommet de degré non nul au hasard uniformément, le choisi et retire toutes les arêtes relié à ce sommet.

*Question 4* Quel est ce type d'algorithme~? Soit $G=(V,E)$ un graphe, on note $V_f$ la variable aléatoire de l'ensemble choisi à la fin de l'exécution de l'algorithme sur $G$. Montrer que
  
$ EE[ |V_f| ] = sum_(v in V) (deg v)/(deg v +1) $



== Coloration aléatoire

*Question de Cours* Montrer que les langages réguliers sont hors-contexte

Soit $k in NN$ fixé. On regarde le problème du $k$-PATH:
#rect[
  *Entrée:* Un graphe $G=(V,E)$ non orienté\
  *Sortie:* Est-ce qu'il existe un chemin de longueur $k$~?
]

On définit une $k$-coloration comme une fonction  $mu : V --> {1,..,k}$. On dit qu'un chemin est arc-en-ciel si tous les sommets sont de couleur différente.

*Question 1* Quelle est la probabilité qu'un chemin de longueur $k$ soit arc-en-ciel~?

*Question 2* Donner un algorithme de programmation dynamique qui, soit $G$ et une $k$-coloration, vérifie si $G$ possède un chemin arc-en-ciel en $O(2^k times |E| )$.

*Question 3* En déduire un algorithme à erreur unilateralle de même probabilité que celle obtenu question 1. Quel type d'algorithme est-ce~?

*Question 4* En déduire un algorithme à erreur unilateralle de probabilité $1/2$. Quel est son temps d'exécution~?

== K-Centres

On fixe $V subset.eq RR^d$ un jeu de donnée. Pour $arrow(y) in RR^d$ on définit $d(arrow(y),V) = max_(arrow(x) in V) ||arrow(y) - arrow(x)||$. On cherche à choisir $k$ points de $V$ tel qu'ils minimise 
$max_(v in V) d(v,X)$. On regarde donc le $k$-CENTRES suivant:
- *Entrée:* $v_1,..., v_n subset.eq RR^d$ une liste de points finis
- *Sortie*~: un $X := {x_1,...,x_k} subset.eq V$ qui minimise $max_(v in V) d(v,X) $

*Question 1* On cherche à montrer que l'algorithme du cours de la question ne donne pas de bonne approximation du problème des $k$-centres. Pour cela on pose $k=2$, $d=1$ et on pose $N$ points en 0, $N$ points en 1 et un point en $D$. Montrer que pour des bonnes valeurs de $N$ et $D$ on peut avoir le ratio $"opt-k-moyennes"/"opt-k-centre"$ arbitrairement large.

*Question 2* Proposer un algorithme glouton pour le problème des $k$-centres.

*Question 3* On note $p_1,..., p_k$ les $k$ points retrourné par notre algorithme et $p^*_1,...,p^*_k$ la solution optimale. On partitionne $V = union.sq.big_(i in NN) V_i$ avec $V_i$ l'ensemble des points les plus proches de $p^*_i$. Montrer que
- Si $forall i, V_i inter {p_1,...,p_n} != emptyset$ alors on a une 2-approximation
- Sinon, on a aussi une 2-approximation

== Paire de points

Pour tout $x,y in RR$ deux points distincts inconnus, on te donne avec probabilité $1/2$ le point $x$ et sinon le point $y$. Tu peux décider de garder ou d'échanger de points avec une certaine probabilité qui dépend seulement du point que l'on te donne. Avec quelle probabilité dois-tu échanger de manière à ce que quel que soit la paire $(x,y) in RR^2$ tu prend le plus grand point avec probabilité strictement plus grande que $1/2$~? 

/*
== COmplexité en $log^*$ de Union Find #footnote[Colle de José]
TODO

== Complexité en $alpha$ de Union-find #footnote[Algo 1, TD 4 ENS Lyon]
TODO
*/