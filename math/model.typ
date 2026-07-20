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
