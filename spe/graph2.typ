
= *MPI: Graphes avancé*

== Cours
- Chemin alternant.
- Cliques et graphe biparti. Biparti ssi pas de cycle impair.
- Couplage maximal, maximum, parfait.
- Arbre couvrant, Kruksal
- Tri topologique, recherche de composante fortement connexes, Kosaraju
- Algo couplage max dans biparti
- Sous-graphe, graphe induit (HP)
- Multigraphe, hypergraphe (HP)
- $k$-coloration (HP)
- Graphes planaire (HP)

*Question de Cours*
- Montrer qu’un couplage est maximum si et seulement s’il n’existe pas de chemin alternant augmentant pour ce couplage.
- Montrer qu'un graphe est biparti ssi il ne contient pas de cycles impair

== Graphes à unique sortie 

On dit que $G = (V,E)$ un graphe orienté est un _graphe à unique sortie_ si $forall v in V, d_+(v) = 1$. Dans ce cas, on le représentera par un tableau $T$ de longueur $|V|$ tel que $T[i]$ corresponde à l'unique sommet $u in V$ tel que $(i,u) in E$.

*Question 1* Dessiner le graphe correspondant au tableau $[0,2,1,2,4,1,3]$

*Question 2* Montrer que le graphe contient autant de cycles que de composantes faiblement connexe.

*Question 3* Proposer un algorithme pour calculer le nombre de cycles du graphe.

*Question 4* Proposer un algorithme qui teste si le graphe possède un couplage parfait dans sa version non orienté (où l'on ignore les directions).

== Kruskal en recherche locale

Soit $G = (V,E)$ un graphe connexe pondéré par $w : E -> RR_+$, on pose $"Couv"(G)$ l'ensemble des arbres couvrants. Si $T = (V,E')$ est un arbre couvrant, on note $T[e' <- e]$ le graphe obtenu en retirant l'arête $e' in E'$ de $T$ et en y ajoutant l'arête $e in.not E'$.

*Question 1* Dans quel cas est-ce que $T[e' <- e]$ est aussi un arbre couvrant~?
// Si e' est dans le cycle de T union e


*Question 2* Montrer qu'une arête $e in E$ est choisie par tous les arbres couvrants si et seulement si $G - e$ n'est plus connexe.
// Si G-e pas connexe, alors e pris par tous les arbres.
// Si e est pris par tous les arbres, supposons G-e connexe par l'absurde. Alors il y a un chemin de e.a -> e.b. Pour T un arbre couvrant, on retire e et ajoute cette arête: marche car Q2.

*Question 3* Montrer que s'il n'existe pas de $e,e'$ tel que $w(T[e' <- e]) < w(T)$ avec $T[e' <- e] in "Couv"(G)$ , alors $T$ est un arbre couvrant de poids minimal.
// <= simple
// Si pas minimal mais toute paire de e, e' augmente. On prend un MIST T*. Comme différent et plus petit, existe arête e' meilleure que tous les arête de T différence symétrique de T'. On considère le chemin de e'.a à e'.b dans T. On sait que il y a une arête de T pas dans T' car T' ayclique, mais e plus petit, contradiiction.

On considère alors l'algorithme qui commence sur un arbre couvrant quelquonque $T$ et qui remplace $T$ par $T[e' <- e]$ tant que c'est possible pour diminuer $w(T)$. C'est ce que on appelle un algorithme de _recherche locale_ car il (localement) change l'arbre de manière à atteindre un arbre couvrant de poids minimum.

*Question 4* Donner la complexité d'un tel algorithme.
// On regarde pour une arête donné la suite de ses changement qu'elle subit qui décroit. Elle est changé $|E|$ fois. Il y a $|V|-1$ arêtes, donc $O(|V| times |E|)$ itérations.

== Graphes $k$-réguliers

On dit que $G = (V,E)$ est un graphe $k$-régulier si $forall v in V, deg(v) = k$

*Question 1* Proposer un algorithme qui donne un couplage maximal dans un graphe 2-régulier.

*Question 2* Montrer qu'il existe un graphe $k$-régulier à $2n$ sommets si $2n >= k+1$

*Question 3* Montrer qu'il existe un graphe $2k$-régulier à $n$ sommets si $n >= 2k+1$

*Question 4* Montrer qu'il existe un graphe $k$ régulier si et seulement si $n >= k+1$ avec $n k$ pair.

== Théorème de Hall

Soit $G = (V,E)$ un graphe, soit $A subset.eq V$, on définit l'ensemble $cal(V)(A)$ des _voisins_ de $A$ dans $G$ par
#align(center,$cal(V)(A) = {u in V\\ A | exists v in A, (v,u) in E}$)

On dit qu'un graphe biparti $G = (U union.sq V,E)$ de parties $U,V$ vérifie la _condition des mariages_ si pour tout $A subset.eq U$ ou $A subset.eq V$, on a $|A| <= |cal(V)(A)|$

On cherche à montrer le lemme des mariages: un graphe biparti $G = (U union.sq V,E)$ de parties $U,V$ admet un couplage parfait si et seulement si $G$ vérifie la condition des mariages.

*Question 1* Montrer que $G$ est connexe si et seulement si pour tout $A subset.neq V$ non vide, $|cal(V)(A)|>=1$

*Question 2* Montrer que s'il existe $A subset.eq U$ tel que $|A|>|cal(V)(A)|$, alors il n'existe pas de couplage parfait.

Soit $G$ respectant la condition des mariages. Soit $H$ le plus petit ensemble d'arêtes de $G$ tel que $G_H = (V,H)$ respecte toujours la condition des mariages. On note $deg_H (v) = |cal(V)({v}) inter H|$

*Question 3* Montrer que $|U| = |V|$, et que $forall v in V, deg_(H)(v) >=1$.

*Question 4* Montrer que $H$ est un couplage parfait.

== Maille d'un graphe 

Le _diamètre_ de $G$ est la longueur du plus long chemin dans G. On définit la _maille_ d'un graphe $G$ comme étant la plus petite longueur d'un cycle de $G$. On la note, si elle existe, par $cal(M)(G)$. Si la maille existe on dit que le graphe est _maillé_.

*Question 1* Soit $d$ le diamètre d'un graphe maillé. Montrer que $cal(M)(G) <= 2d+1$

*Question 2* Montrer que si $G$ est un graphe biparti maillé, alors $cal(M)(G)$ est pair.

*Question 3* Montrer qu’un graphe à $n$ sommets qui contient au plus un cycle contient au plus $n$ arêtes.

*Question 4* Montrer que la maille d’un graphe à $n$ sommets et au moins $n + 1$ arêtes est majorée par $floor((2n+2)/(3))$

*Question 5* Soit $G = (V,E)$ un graphe maillé, on note $m = cal(M)(G)$ et $delta$ le plus petit degré de $G$. Montrer que$ |V| <= 2/(delta -2) ((delta - 1)^(m/2) -1) $

== Largeur de bande

Soit $G = (V,E)$ un graphe non orienté connexe. Le diamètre de $G$, noté $d(G)$, est la longueur du plus long chemin dans G. Pour une fonction dite _d'étiquetage_ $f : V -> [|1 ; |V| |]$ bijective, on définit la _largeur de $f$ dans $G$_ comme $ psi(f,G) := max { |f(u) - f(v)| : {u,v} in E} $
La _largeur de bande de G_, notée $psi(G)$, est la plus petite largeur d'une fonction d'étiquetage de $G$ possible

*Question 1* Calculer la largeur de bande du graphe de la question 1 (ignorer les poids).

*Question 2* Que vaux la largeur de bande d'un cycle à $n >= 3$ sommets~?

*Question 3* Soit $Delta(G)$ le degré maximal de $G$, montrer que $Delta(G) <= 2 psi(G)$

*Question 4* On considère un coloriage des sommets de G tel que chaque arête de G relie deux sommets de couleurs distinctes. Montrer que le nombre minimal de couleurs utilisées pour un tel coloriage est majoré par $psi(G)+1$.

*Question 6* Montrer que

$  (|S|-1)/(d(G)) <= psi(G) <= |S|-d(G) $

== Graphes planaires

Un graphe $G = (V,E)$ est _planaire_ s'il existe $p : V --> RR^2$ tel que pour tout $(a,b),(a',b') in E$, les segments ouverts $]p(a),p(b)[$ et $]p(a'),p(b')[$ ne se croisent pas. Soit $n in NN$, on dénote par $K_n$ le graphe complet à $n$ sommets. On dénote par $K_(a,b)$ le _graphe biparti complet_ contenant $a+b$ sommets, tel que tous les sommets de $1$ à $a$ soient relié à tous les sommets de $a+1$ à $b$ (sans aucune autre aretes).

Une _face_ d'un graphe planaire est un cycle délimitant une zone de la représentation (aka une des parties connexe de $RR^2$ auquel on a retiré tous les points dans un segment de $G$).

*Question 1* Montrer que $K_4$ et $K_(3,2)$ sont planaire

*Question 2* Soit $G=(V,E)$ un graphe planaire, on note $c$ le nombre de composante connexes et $f$ le nombre de faces. Montrer que $f + |V| = |E| + c +1$

*Question 3* Montrer que dans tout graphe planaire, $3f <= 2a$. En déduire que $a <= 3(n-2)$ dans un graphe connexe planaire et que donc $K_5$ n'est pas planaire.

*Question 4* Montrer que dans un graphe sans triangle (sans 3 sommets reliés entre eux), $a<=2(n-2)$. En déduire que $K_(3,2)$ n'est pas planaire.

*Question 5* Montrer que tout graphe planaire à au moins un noeud de degré $<= 5$.

*Question Bonus* Montrer que si $G = (V,E)$ est un graphe planaire à plus de $9$ sommets, alors $overline(G) = (V,overline(E))$ n'est pas planaire.

== Couverture d'aretes et couplages

Soit $G = (V,E)$ un graphe connexe, on dit que $A subset.eq E$ est une _couverture d'arette_ si pour tout $v in V$, on a un $e in A$ tel que recouvre $v$. On dit que $A$ est une couverture d'arêtes _minimale_ si $A$ est une couverture d'arête de plus petit cardinal. \
Un graphe _étoile_ est un graphe tel qu'il existe un sommet $u$ tel que toutes les arêtes sont de la forme ${u,x}$.

On cherche à montrer que si $M$ un couplage maximal et $A$ une couverture d'arête minimale, alors
$ |A| + |M| = |V| $

*Question 2* Montrer que s'il existe un couplage parfait $M$, alors c'est une couverture d'arêtes minimale.

On fixe $A$ une couverture d'arête minimale. 

*Question 3* Montrer que les graphes étoiles sont exactement les graphes ou il n'existe pas de chemin de longueur strictement plus grande que $2$. En déduire que $A$ est une union disjointe de composantes connexe qui sont des graphes étoile.

*Question 4* Montrer que $|A| + |M| >= |V|$

*Question 5* Montrer que $|A|+|M| = |V|$. _Indication: On montrer l'inégalité dans l'autre sens. On se fixe un couplage maximal $M$ et on construit une couverture minimale $X$ en prenant $M$ et en ajoutant une arête par sommet non couvert. Borner la taille de $X$._

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


== Calcul de triangles #footnote[Tiré de Mallory Marin]


*Question 1* Montrer qu’un graphe est biparti si et seulement si il n’admet pas de cycle impair.

*Définition* Pour $G = (V,E)$ un graphe non orienté avec $V = {1,..., n}$, on dit que ${x,y,z} subset.eq V$ est un _triangle_ si ${x,y},{y,z},{z,x} in E$. On cherche à calculer tous les triangles sans doublons d'un graphe $G$.

*Question 2* Proposer un algorithme en $O(|V|^3)$

*Question 3* Soit $L_1, L_2$ deux listes trié d'entiers de $1$ à $n$, montrer que l'on peut calculer la liste triée des élément appartenant aux deux listes en temps $O(|L_1| + |L_2|)$.

*Question 4* Donner un algorithme en $O(|E| times Delta)$ pour calculer tous les triangles sans doublons d'un graphe $G$ ou $Delta$ est le degré maximal de $G$. On supposera que $G$ est donné sous la forme d'une liste d'adjacence.

*Question 5* Dans quels cas est-ce que l'algorithme de la question 4 est meilleur que celui de la question 2~?


== Planaire et degré

Un graphe $G = (V,E)$ est dit $k^+$-régulier si $forall v in V, deg(v) >= k$. Un graphe $G$ est dit planaire s'il existe une assignation $phi : V --> RR^2$ tel que pour toute paire d’arête $(x,y),(x',y') in E$, les segments $[phi(x) ;phi(y)]$ et $[phi(x') ;phi(y')]$ ne se coupent pas.

Soit $G$ connexe planaire. On définie $f$ le nombre de face comme le nombre de composante connexe de $RR^2 \\ union.big_((x,y) in E) [phi(x) ;phi(y)]$.

1. Montrer le théorème d’Euler: $|E| = |V| + f -2$
2. En déduire que $|E| < 3|V|$
3. En déduire que si $G$ est planaire alors il n'est pas $6^+$-régulier.

/*#correct[
  1. Par récurrence sur $|E|$
  2. On montre $|E| <= 3|V|-6$~: Chaque arête est présente dans au plus deux faces et un minimum de 3 arêtes sont nécessaire pour avoir une face, donc $3f <= 2|E|$, donc $3|E| = 3|V| + 3f - 6 <= 3|V|+2|E|-6$ donc $|E| <= 3|V|-3$
  3. On a $|E| < 3|V|$. Donc $sum_(v in V) deg v < 6|V|$. Donc le degré moyen est
  $ (sum_(v in V) deg v)/(|V|) < 6$ donc il y a au moins un sommet de degré $< 6$
]*/


== Graphes d'amis sans $C_5$

Soit $G = (S,A)$ un graphe non orienté. On dit que $G$ est un _graphe d'amis_ si pour tout $s_1,s_2 in S$ avec $s_1 != s_2$, il existe un unique $s'$ avec ${s_1,s'} in A$ et ${s_2,s'} in A$. On dit qu'un sommet $s^*$ est un _roi_ si pour tout $s in S\\{s^*}, {s,s^*} in A$.

On cherche à montrer que un graphe d'amis sans $C_5$ possède toujours un roi.

1. Montrer que le cycle de longueur $4$ n'est pas un graphe d'amis.
2. Montrer que dans un graphe d'amis, toutes les arêtes font parti d'un cycle. 
3. Proposer un algorithme pour calculer le roi (s'il en existe un) avec un graphe représenté en matrice d'adjacence.

On admet qu'un graphe d'amis ne possède pas de cycle de longeur $5$.

4. Montrer que que si $G$ possède un cycle de longueur $>= 4$ alors $G$ n'est pas un graphe d'amis. 
5. Montrer que tout les graphes d'amis possède un roi.

_Version Complete de cet exercice sans l'hypothèse sans $C_5$ dans `math/algb-graph`_

== Graphes d'amis non régulier

Soit $G = (S,A)$ un graphe non orienté. On dit que $G$ est un _graphe d'amis_ si pour tout $s_1,s_2 in S$ avec $s_1 != s_2$, il existe un unique $s'$ avec ${s_1,s'} in A$ et ${s_2,s'} in A$. On dit qu'un sommet $s^*$ est un _roi_ si pour tout $s in S\\{s^*}, {s,s^*} in A$. Un graphe est dit $k$-régulier si $forall v in V, deg(v) = k$. 

On cherche à montrer que un graphe d'amis non régulier possède toujours un roi.

Soit $G$ un graphe d'amis.

1. Montrer que $G$ est connexe et que toute arête appartient à un unique triangle.
2. Soient $x$ et $y$ deux sommets non adjacents. Pour $u in N(x)$, on note $f(u)$ l'unique voisin commun à $u$ et $y$. Montrer que $f : N(x) --> N(y)$ est injective.
3. Montrer que si ${x,y} in.not E$, alors $deg(x) = deg(y)$.
On suppose d'abord $G$ non régulier. Soient $x,y$ deux sommets de différent degrée et $z$ l'unique voisin commun. Comme $deg(x) != deg(y)$, on a que $deg(z)$ est différent d'au moins un des deux, que l'on suppose sans perte de généralité etre $x$.

Soit $w in.not {x,y,z}$.

4. Montrer que $w in (N(x) union N(y)) inter (N(x) union N(z))$.
5. Montrer que $w in.not N(y) in N(z)$, et en déduire que $w in N(x)$.
6. Conclure et montrer que si $G$ n'est pas régulier, alors $G$ possède un roi.

_Version Complete de cet exercice sans l'hypothèse de régularité dans `math/algb-graph`_

== Graphes d'amis 2

Soit $m >=3$. Soit $G =(S,A)$ un graphe non orienté tel que pour tout $m$ personnes choisies, il existe un unique $s in S$ qui est reliées aux $m$ personnes. Quel est le dégrée max du graphe~?


== Un Graphe dénombrable

On prend $phi :NN --> cal(P)_f (NN)$ une bijection de $NN$ dans les parties finies de $NN$. Montrer qu'a isomorphisme près, et en retirant les boucles, le graphe $(NN, {{x,y} : y in phi (x)})$ est unique.

Trouver l'isomorphisme pour $phi_1, phi_2$ deux bijections.

/*

#correct([
C'est le graphe de Rado (vérifier que le graphe respecte la propriété de Rado)
])

*/

== Graphes $d$-dégénéré #footnote[InfoFonda 2026 partie I]

Un graphe $G = (V_G, E_G)$ est dit $d$-dégénéré s'il existe un ordre $v_1,...,v_n$ des sommets de $G$ tel que, pour tout $i <= n$, le sommet $v_i$  au plus $d$ voisins parmis ${v_1,...,v_(i-1)}$. La dégénéresence d'un graphe, noté $cal(D)(G)$, est le plus petit $d$ tel que $G$ est $d$-dégénéré.

*Question 1* Montrer que si $G$ contient une clique de taille $k$ alors $cal(D)(G)>= k-1$

*Question 2* Montrer que tout sous-graphe d'un graphe $d$-dégénérer est aussi $d$-dégénéré.

*Question 3* Montrer que $G$ est $d$-dégénéré si et seulement si $forall S subset.eq V_G$, $G[S]$ possède un sommet de degré $<= d$

*Question 4* Donner un algo polynomial qui prend un graphe $d$-dégénéré et renvoie $(d+1)$-coloration
// prend degré <= d et met à la fin pour avoir l'ordre.
// à partir de l'ordre, glouton.

== Coeur de $k$-domination #footnote[InfoFonda 2026 partie IV]

Soit $G = (V_G, E_G)$ un graphe. On dit que $D subset.eq V_G$ domine $X$ si $X subset.eq N(D)$ avec $N(A)$ les voisins de $A$ (incluant $A$). Si $X = V_G$, on dit que $D$ domine $X$. On dit que $D$ _quasi-domine_ $X$ si $D$ domine tout $X$ sauf au plus un point. 

Soit $k >= 2$. Un coeur de $k$-domination est un $X$ tel que tout dominant de $X$ de taille $k$ domine nécessairement tout le graphe.

*Question 1* Soit $X$ tel que $forall x in V_G, |N(v) inter X| < floor(|X|/k)$. Montrer que $G$ n'admet pas d'ensemble quasi-dominant de $X$ de taille au plus $k$.

Un graphe est dit sans $K_(t,t)$ si le graphe biparti complet à deux parties de $t$ sommets n'est pas présent comme sous-graphe. On considère l'algo suivant:
#rect[
  *Entrée:* Un graphe $G$ sans $K_(t,t)$, $X subset.eq V_G$.\
  $Y <- G$\
  $S <- emptyset$\
  *tant que* $exists v in.not S, |N(v) inter Y| >= floor(|Y|/k)$ *faire:*\
  #h(20pt) $S <- S union {v}$\
  #h(20pt) $Y <- N(v) inter Y$\
  *fin tant que* \
  *retourner* $Y,S$
]

*Question 2* Montrer que si $|X|>= 2t k^t$ alors l'algorithme termine en au plus $t-1$ itérations de la boucle.

On suppose que $|X|>= 2t k^t$, et on se donne $S,Y$ le résultat de l'algorithme

*Question 3* Montrer que tout ensemble quasi-dominant de taille au plus $k$ intersecte $S$. En déduire que, soit $y in Y$, si $D$ domine $G-y$ alors $D$ domine $G$

*Question 5* En déduire un algorithme polynomial qui prend un $k >= 2$ et un graphe $G$ sans $K_(t,t)$ qui retourne un coeur de $k$-domination de taille au plus $2t k^t$.

== Théorème de vizig #footnote[InfoFonda 2026 partie V]

Soit $G = (V,E)$ un graphe, on note $Delta$ le degré maximal d'un graphe, on dit que $gamma : E --> {1,...,k}$ est une _$k$-coloration d'aretes_ si pour toute paire d'arête $e,e'$ partageant une extrémité, on a $gamma(e) != gamma(e')$. Une coloration est dite partielle si la fonction l'est.

On cherche à montrer que tout graphe est $(Delta+1)$-coloriable en arête.

*Question 1* Montrer que tout graphe est $2Delta-1$-arête coloriable

*Question 2* Montrer qu'un graphe ne peux pas être $k$-coloré pour $k < Delta$.

Pour $gamma$ une coloration on note $overline(gamma)(u)$ l'ensemble des couleurs des arête d'extrémité $u$ qui *ne* sont *pas* prise. Soient $a,b$ deux couleurs, on définit $K(a\/b)$ la *chaine de Kempe* comme étant un ensemble d'arettes maximal pour l'inclusion contenant que des arettes de couleur $a$ ou $b$

*Question 3* Montrer que $G[K(a\/b)]$ est une union disjointe de cycle de longueur pair ou de chemins.

*Question 4* Soit $G$ biaprti, $gamma$ une coloration partielle, $(u,v) in E_G$ avec $a in overline(gamma)(u)$ et $b in overline(gamma)(v)$. Montrer que si $u$ et $v$ ne peuvent pas être dans la même composante connexe de $K(a\/b)$

*Question 5* Montrer que si $G$ est biparti alors $G$ est $Delta(G)$-arête-colorable

*Question 6* Soit $(u,v) in E$ une arête non coloré d'une coloration partielle $gamma$ et soient $a,b$ deux couleurs telle que $a,b in overline(gamma)(u)$ et $b in overline(gamma)(v)$. Montrer qu'il existe $gamma'$ qui colorie les même arêtes telle que
- $overline(gamma')(u) = overline(gamma)(u)$,
- $a in overline(gamma')(v)$ et
- $overline(gamma')(x) = overline(gamma)(x)$ pour tout $x in V \\ {u,v}$ sauf au plus un qui vérifie alors $(overline(gamma')(x) \\ overline(gamma)(x)) union (overline(gamma)(x) \\ overline(gamma')(x)) = {a,b}$

*Question 6* Soit $gamma$ une $k$-coloration partielle de $G$ dont tous les arêtes non coloré $e_1,..., e_r$ sont toutess de la forme $e_i = (u,v_i)$. On suppose que $|overline(gamma)(u)| >= r$, $|overline(gamma)(v_1) inter overline(gamma)(u)| >= 1$ et que pour tout $i >= 2$, on a $|overline(gamma)(v_i) inter overline(gamma)(u)| >= 2$. Montrer que $G$ est $k$-colorable.

*Question 7* En déduire que tout graphe est $(Delta+1)$-arête-colorable.

*Question 8* Montrer que pour tout $d>1$ il existe un graphe $G$ non $d$-arete colorable de degré maximum $d$.

== FPT: Kernelisation de Feedback vertex set

On considère le problème FEEDBACK-VERTEX-SET suivant:
#rect[
  - *Entrée:* Un multigraphe $G = (V_G,E_G)$ et $k in NN$
  - Est-ce qu'il existe $S subset.eq V_G$ avec $|S|<= k$ tel que\
    pour tout cycle $C$ de $G$, $C inter S != emptyset$
]
1. Montrer que pour $k =1$ et $k=2$ le problème est polynomial
2. Soit $(G,k)$ une instance et $v$ un sommet de degré $1$. Montrer que $(G,k)$ est une instance positive ssi $(G-v,k)$ l'est aussi.
3. Soit $G$ une instance et $v$ un sommet de degré $2$ relié $ u,u' != v$. Montrer que $(G,k)$ est une instance positive ssi $(G -u + "uu"',k)$ l'est aussi
4. Soit $G$ une instance et $v$ un sommet avec une boucle. Montrer que $(G,k)$ est une instance positive ssi $(G-v,k-1)$ l'est aussi.
Soit $G$ le graph obtenu après exécution des deux règles précédentes autant de fois que possible. On a donc que le degré minimum de $G$ est 3. On note $V_(3k)$ les $3 k$ sommets de plus grand degré. Soit $S$ est une solution de FEEDBACK-VERTEX-SET, on suppose par l'absurde que $S$ n'intersecte pas $V_(3k)$.

5. Montrer que, pour $d = min_(x in V_(3k)) deg(x)$, on a
  $ sum_(v in X union V_(3k)) deg v >= 3|X|+3k d $
6. Montrer que $G[X union V_(3k)] <= |X|+3k -1$
7. En déduire une contradiction.
8. Montrer alors que pour tout $k <= log(log(n))$ il existe un algorithme polynomial pour FEEDBACK-VERTEX-SET. On donnera la complexité.

== FPT: Kernelisation de Vertex cover
// 2 approx + NP-Dur possible à donné + algo proba

On considère le problème VERTEX-COVER suivant:
#rect[
  - *Entrée:* Un graphe $G = (V_G,E_G)$ et $k in NN$
  - Est-ce qu'il existe $S subset.eq V_G$ avec $|S|<= k$ tel que toutes les arêtes sont adjascente à un $s in S$~?
]

1. Montrer que pour tout $k$ fixé, le problème est polynomial. _On admet qu'il est NP-Complet dans le cadre général_
2. Soit $(G,k)$ une instance et $v$ un sommet de degré $0$. Montrer que $(G,k)$ est une instance positive ssi $(G-v,k)$ l'est aussi.
3. Soit $(G,k)$ une instance et $v$ un sommet de degré $>= k+1$. Montrer que $(G,k)$ est une instance positive ssi $(G-v,k-1)$ l'est aussi.
4. Montrer que après exécution des deux règles précédentes autant de fois que possible, on a $|V| <= k^2 +k$
5. En déduire que VERTEX-COVER possède un algorithme correcte dont la complexité peut s'exprimer sous la forme $O(f(k)n^c)$ pour $f,c$ que l'on donnera.

_Avec une décomposition en couronne on peut réduire la taille de $G$ par d'autres règles tel que $|V| <= 3k$._

_Avec de la programmation linéaire et de la relaxation on peut montrer qu'on peut réduire la taille de $G$ tel que $|V| <= 2k$._

== FPT: Kernelisation de Edge clique cover

On considère le problème EDGE-CLIQUE-COVER suivant:
#rect[
  - *Entrée:* Un graphe $G = (V_G,E_G)$ et $k in NN$
  - Est-ce qu'il existe $S_1,...,S_k subset.eq V_G$ tel que\ $G[S_i]$ soit une clique pour tout $i <= k$ et que $E_G = union.big_(i) E(G[S_i])$
]

1. Montrer que pour $k=1$ et $k=2$ le problème est polynomial
2. Soit $(G,k)$ une instance et $v$ un sommet de degré $1$. Montrer que $(G,k)$ est une instance positive ssi $(G-v,k-1)$ l'est aussi
3. Soit $(u,v) in E$ tel que $N(u) = N(v)$ (avec $N(x)$ le voisinage de $x$). Montrer que $(G,k)$ est une instance positive ssi $(G - u,k)$ l'est.
4. Montrer que après exécution des deux règles précédentes autant de fois que possible, on a $|V| <= 2^k$
4. En déduire que pour $k <= log_2(|V|)$, le problème EDGE-CLIQUE-COVER est polynomial.
