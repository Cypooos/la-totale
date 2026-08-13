= *Math: Théorie des ensemble et modeles en logique*

== Cours

- Logique intuitionniste, classique, minimale, peano, propositionelle.
- Logique du 1er ordre, du 2de ordre. Langage $cal(L)$. On note $F(cal(L))$ l'ensemble des formules d'un langage donné.
- Modèle, langage, structure, formules.
- Théorie cohérente, complete,  axiome récursivement énumérable.
- Théorème de complétude de Godel
- Théorème d'incomplétude de Godel
- Lowenheim Skolem
- Axiomes de ZF, ZFC (les deux avec fondation). Classes, ensembles.
- Ordinaux, Cardinaux (de von neumann). Ordinal associé à une relation bien ordonnée.
- Equivalents de l'axiome du choix simple (fonction de choix, produit non vide, lemme de zorn)
- Théorème de compacité

ZF sera supposé consistante ici.

*TODO:*
- Proof theoric ordinal
- https://en.wikipedia.org/wiki/Lindstr%C3%B6m%27s_theorem

== Completion de théorie

Soit $T$ une théorie du 1er ordre cohérente dans un langage $cal(L)$. On pose $ cal(W) = {U subset.eq F(cal(L)) | U "cohérent" and T subset.eq U} $

1. Soit $(U_i)_(i in I)$ une chaîne de $cal(W)$. Montrer que $U=union.big_(i in I) U_i$ est encore une théorie cohérente contenant $T$.\
  En déduire par lemme de Zorn qu'il existe une extension cohérente maximale $T^*$ de $T$. 
3. Montrer que la théorie $T^*$ est complete.
4. En déduire que si $T$ peut encoder Peano, alors $T^*$ n'est pas récursivement énumrable.

== Cloture par ordinal interne 

Soit $A$ un ensemble. Montrer qu'il existe un unique ensemble $B$ tel que $B = { x in A | x subset.eq B}$
/*
  - L'équation reviens à $B = P(B) sect A$ (un point-fixe de $X |-> P(X) sect A$)
  - On peut montrer que $B$ est transitif et inclus dans $A$
  - $B$ est en réalité le plus grand ensemble transitif inclus dans $A$
*/
== ZF intuitioniste et le tiers exclu

On considère les axiomes de ZF en logique intuitioniste. Les axiomes de ZF ne permettent pas de prouver le tiers exclu.

1. Montrer le tiers exclu est équivalent à $forall X subset.eq {*}, X = emptyset or X = {*}$.
2. Montrer que l'axiome du choix implique le tiers-exclu.\
  _Ind: on pourra poser $U = { x in {0,1} | P or x = 0}$ et $V = {x in {0,1} | P or x = 1}$_

Le _tiers exclu faible_ est la formule $not P or not not P$, et n'est pas prouvable dans ZF intuitioniste.

3. Montrer que le tiers exclu faible est équivalent à $forall X subset.eq {*}, X = emptyset or X != emptyset$. (?)


== Modèle dénombrable de ZFC et le graphe de Rado

Un graphe infini $G = (S,A)$ est dit comme respectant la _propriété de Rado_ si pour tout $U,V subset.eq S$ des ensemble disjoint fini de $S$,  
$ U inter V = emptyset ==> exists x in S, (forall u in U, (x,u) in E) and (forall v in V, (x,v) in.not E) $

Montrer que si $G, G'$ sont deux graphes respectant la _propriété de Rado_, alors $G equiv G'$ (i.e. les graphes sont isomorphes). On appelle donc _le graphe de Rado_ l'unique graphe à isomorphisme près avec cette propriétée.

On considère ZFC avec l'axiome de fondation que l'on suppose consistante. Soit $M$ un modèle de ZFC. Par Lowenheim Skolem on suppose que $M$ est dénombrable. On écrit $M = (V,E)$ avec $ E = {(x,y) in V^2 | x scripts(in)_M y}. $
On considère $overline(M)$ le symétrique de $M$ : c'est le graphe $(V,overline(E))$ avec $E = E union {(x,y) : (y,x) in E}$.

Montrer que $overline(M)$ est le graphe de Rado. On pourra considerer ${u_M : u in U} union {{v_M : v in V}} in M$.

== Nains et Axiome du Choix

On considère une suite de nains indéxé par $omega$, en file indienne, à la queue-le-le, à qui on va mettre des chapeaux. Le $i$-ème nain peut observer les chapeaux de tout les nains plus grand que lui (les $j > i$), mais ne peux voir ni son propre chapeau ni le chapeau des nains $j < i$. Les nains (qui peuvent utilliser l'axiome du choix de manière constructive et se mettre d'accord sur des systèmes de représentant par exemple), établissent une stratégie commune, avant que l'on distribue les chapeaux, qui sont soit blanc soit noirs. Ils vont tous en meme temps essayer de deviner la couleur de leurs chapeau, et il ne faut qu'un nombre fini d'entre eux fassent une erreur.

On modélise plus sérieusemennt le jeu. Soit $C$ un ensemble de couleurs de chapeau et $(X,<)$ une relation d'ordre, on pose $N(x) = {y in X | y > x}$. Une stratégie pour les nains consistent en une série de fonction $(f_x)_(x in X)$ tel que $f_x : C^N(x) --> C$. Le nombre d'erreur d'une stratégie sur une séquence $u in C^X$, en notant $u_(>x)$ la séquence démarrant sur $x$ (exclut), est défini comme le cardinal de ${x in X | f_x (u_(>x)) != u_x}$. 


1. Pour $u,v in {0,1}^omega$, on dit que $u tilde v$ si $exists i, forall j > i, u_j = v_j$. Montrer que c'est une relation d'équivalence.
2. Montrer que pour $C = {0,1}$ et la relation d'ordre $(omega,<)$ les nains peuvent toujours faire un nombre fini d'erreur.
3. Montrer que pour un $C$ quelquonque, sur $(omega, <)$ les nains peuvent toujours faire un nombre fini d'erreur.
4. On suppose que les nains ne connaissent pas leur position dans la suite, et ne peuvent que choisir en fonction de l'infinité devant eux, sans savoir le nombre d'éléments derrière eux. On modélisera ça par le fait qu'il existe $f : C^(omega \\ {0}) --> C$ de manière à ce que tout les $(f_i)_i$ sont juste $f$ qui à translaté $u_(>x)$ en un $u_(>0)$. Montrer que les nains peuvent toujours faire un nombre fini d'erreur.
5. Montrer que pour tout ordinal $alpha$, les nains ont une stratégie gagnante sur $(alpha,<)$ avec $C$ quelquonque. (?)
6. On suppose que $X$ soit un ordre total avec un minimum. Est-ce que les nains ont toujours une stratégie avec un nombre fini d'erreurs?

On suppose maintenant que les nains parlent à tour de role : d'abord le nain 0, puis 1 etc..., en sachant que le $i$-ème nain entend ce que dit tout les nains d'avant.

7. Proposer une modélisation du problème dans ce cas et montrer que les nains peuvent toujours atteindre 1 erreur pour $C = {0,1}$. Et pour $C$ quelquonque?

On considère maintenant une famille de nains indéxé sur $RR$, et une suite $(epsilon_x)_(x in RR)$. Le $x$-ème nain (pour $x in RR$) ne peux que voir les chapeaux des nains dans $]x-epsilon_x ; x+epsilon_x [space \\ {x}$. 

8. Montrer que les nains peuvent ne faire qu'un nombre dénombrable d'erreurs.


== Ordinal de Hartogs

On travaille dans $"ZF"$. Soit $X$ un ensemble, on cherche à construire le plus petit ordinal qui s'injecte pas dans $X$ sans l'axiome du choix. On défini $cal(W)(X)$ l'ensemble 
$ cal(W)(X) = {(A,R) subset.eq cal(P)(X) times cal(P)(A times A) | R "bon ordre sur" A } $


1. Montrer que $cal(W)(X)$ est un ensemble. Pour $(A,R) in cal(W)(X)$, on note $"ot"(A,R)$ l'unique ordinal isomorphe au bon ordre $(A,R)$.
2. Montrer que $H(X) = {"ot"(A,R) : (A,R) in cal(W)(X)}$ est un ordinal. On pose $h(X)=H(X).$ 
3. Montrer que, pour tout ordinal $alpha$, $ alpha<h(X) quad <=> quad "il existe une injection de" alpha "dans" X. $ En déduire qu'il n'existe aucune injection de $h(X)$ dans $X$.
4. Montrer que $h(X)$ est le plus petit ordinal qui ne s'injecte pas dans $X$. On l'appelle le _nombre de Hartogs_ de $X$.
5. Montrer que $X$ est bien ordonnable si et seulement s'il existe une injection $f : X >-> h(X).$ En déduire que l'énoncé « tout ensemble est bien ordonnable » est équivalent à la comparabilité de $X$ et $h(X)$ par injection, pour tout $X$.
//6. Expliquer pourquoi $h(X)$ n'est généralement pas « le cardinal de $X$ ». Pour obtenir un représentant de la classe d'équipotence de $X$, on pose $ alpha_X = min { "rang"(Y) : Y "est en bijection avec" X } $ puis $ "Sc"(X) = { Y in V_(alpha_X+1) : "rang"(Y)=alpha_X "et" Y "est en bijection avec" X }. $ Montrer que $"Sc"(X)$ est un ensemble et que $ "Sc"(X)="Sc"(Y) quad <=> quad X "et" Y "sont équipotents". $

== L'ordinal de Church–Kleene

Un ensemble est dit calculable lorsque sa fonction caractéristique est calculable. Un ordinal $alpha$ est dit _calculable_ s'il existe une partie calculable $D subset.eq NN$ et une relation calculable $prec$ sur $D$ telles que $(D,prec)$ soit un bon ordre de type $alpha$. On définit $ omega_1^"CK" = sup { alpha in "Ord" : alpha "est un ordinal calculable" }. $

1. Montrer qu'il n'existe qu'un nombre dénombrable de relations calculables sur les parties calculables de $NN$. En déduire que l'ensemble des ordinaux calculables est dénombrable.
2. Montrer que si $alpha$ est calculable, alors $alpha+1$ est calculable. En déduire que $omega_1^"CK"$ n'est pas un ordinal successeur.
3. Montrer que si $beta$ est un ordinal calculable et $alpha<beta$, alors $alpha$ est calculable.
4. Montrer que $omega_1^"CK"$ est un ordinal dénombrable, mais qu'il n'est pas calculable.

== Forcing pt 1, algèbre de Boole complète

Soit $(PP,<=)$ une relation d'ordre. On appelera les éléments de $PP$ les _conditions de forcing_, et on dira que $q$ est une condition _plus forte_ que $p$ si $q <= p$. On dira que $p$ est _compatible_ avec $q$ (noté $p || q$) s'il existe $r <= p,q$. Sinon, on dira que $p$ est incompatible avec $q$ (que l'on notera $p bot q$).

On suppose que $(PP,<=)$ respecte :
- Il existe $bold(1) in PP$ tel que $bold(1)$ soit une _condition maximale_ (i.e. $forall x, x <= bold(1)$)
- $PP$ est _séparatif_, c'est à dire que pour tout $p lt.eq.not q$ il existe $r <= p$ tel que $r bot q$. 

Poyur $U subset.eq PP$, on pose $arrow.b U = {p in PP | exists u in U, p <= u}$. On défini l'ensemble des ouverts $ cal(O)(PP) := { U subset.eq PP | arrow.b U = U } = {U subset.eq PP | forall p in U, forall q <= p, q in U} $

1. Montrer que $(cal(O)(U),subset.eq)$ forme un lattice complet (i.e. possèdes des sup et inf de taille arbitraire)
2. Pour $U, V in cal(O)(U)$, on pose 

== Forcing pt 2, $PP$-noms

