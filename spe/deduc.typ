
= *MPI: Déduction naturelle*

== Cours
- Arbre d'inférence, contexte $Gamma$, séquent prouvable, variables libres, liées.
- Règle d'introduction et d'élimination de chaque opérateur $and, or, not, ->, forall, exists$
- Syllogisme de barbara, modus ponens.
- Etre capable de montrer la correction des règles
- Logique minimale, intuitionniste (+ $bot_e$), classique (HP)

*Exos à ajouter*~:
- LTS and bisumulation: formula with $a.phi, top, and$ characterise bisumulation Henessy-Milner Modal Logic, image finite iff ....

== Arbres à faire

Montrer les séquent suivant en logique minimale:
- $(p and (p -> q)) tack q$
- $A and B -> C tack A -> B -> C$ (la currification)
- $A -> B -> C tack A and B -> C$ (la co-currification)
- $p → q, q → r tack p → r$ (le syllogisme de barbara)
- $tack p and q -> q and p$ (la commutativité du $and$)
- $tack p or q -> q or p$ (la commutatitivté du $or$)
- $tack A -> B tack not B -> not A$ (le raisonnement par contraposé)
- $tack not not not A  -> not A$ (même si $not not A -> A$ n'est pas démontrable, ce séquent l'est~!)
- $p -> q tack not (p and not q)$ (l'équivalence de l'implication)

== Arbres des lois de morgan

Montre les séquents suivant en logique minimale: 
- $not (A or B) tack not A and not B$
- $not A and not B tack not (A or B)$ 
- $not A or not B tack not (A and B)$

Montrer le séquent $not (A and B) tack not A or not B$ en logique classique

== Arbre des lois de morgan avec quantificateurs

Montrer les séquents suivants en logique intuitioniste:
- $forall x, not A tack not exists x, A$ où $x in "VL"(A)$
- $exists x, not A tack not forall x, A$ où $x in "VL"(A)$
- $not exists x, A tack forall x, A$ où $x in "VL"(A)$

Montrer en logique classique (ce séquent n'est pas démontrable en logique intuisioniste~! )~:
- $not forall x, A tack exists x, A$ où $x in "VL"(A)$
== Equivalence entre les formules donnant la logique classique

Montrer que en logique intuitioniste, nous avons les jugements suivants:
- $A or not A tack ((A -> B) -> A) -> A$ (Tiers-exclu vers Peirce)
- $((A -> B) -> A) -> A tack A or not A$ (Peirce vers Tiers-exclu)
- $A or not A tack not not A -> A$ (Tiers-exclu vers élimination du double non)
- $not not A -> A tack A or not A$ (élimination du double non vers Tiers-exclu)

== Arbres nécésitant de deviner

On définit $a <-> b$ par $a -> b and b -> a$.

Montrer que les séquents suivant sont prouvables en utilisant la logique intuitioniste: 
- $tack not not (A or not A)$
- $tack not (A <-> not A)$ 

== Affaiblissement
Montrer que si le séquent $Gamma tack A$ est démontrable alors $Gamma, Delta tack A$ l'est aussi.

== XOR

On rajoute au langage des formules de logique propositionnelles l'opérateur $xor$ (prononcé XOR) d'arité 2, tel que pour $eta$ une valuation, on a $eta tack.double phi xor psi$ si et seulement si $eta tack.double phi$ et $eta tack.double.not psi$ ou bien $eta tack.double.not phi$ et $eta tack.double psi$.

1. Proposer 2 régles d'introduction et 1 règle d'élimination pour l'opérateur $xor$.
2. Montrer la correction de la règle, et utiliser la pour montrer la commutativité du $xor$.

== Equivalence
On rajoute au langage des formules de logique propositionnelles l'opérateur d'équivalence $<->$ d'arité 2 avec les règles suivantes:

$
 (Gamma, A tack B #h(15pt) Gamma, B tack A)/(Gamma tack A <-> B) scripts(<->)_i
 #h(50pt)
 (Gamma tack A <-> B)/(Gamma tack A -> B) scripts(<->)_l
 #h(50pt)
 (Gamma tack A <-> B)/(Gamma tack B -> A) scripts(<->)_r
$

Soit $mu$ une valuation, proposer une définition de $mu tack.double A <-> B$. Montrer la correction de la règle, et utiliser la pour montrer la commutativité de l'équivalence.

== L'opérateur de Sheffer

On rajoute au langage des formules de logique propositionnelles _l'opérateur de Sheffer_ $A arrow.t B$ tel que $A arrow.t B equiv not (A and B)$.

1. Montrer que $A -> B equiv A arrow.t (B arrow.t B)$
2. Proposer une règle d'introduction et une règle d'élimination pour l'opérateur de Sheffer et montrer qu'elles sont correcte.
3. Montrer que pour chaque formule $F$ il existe une formule $F^*$ équivalente n'utilisant que l'opérateur de sheffer et $top$ ou $bot$.
4. Montrer que si $tack F$ est prouvable alors $tack F^*$ l'est aussi.

== Sans implication

Soit $F$ une formule propositionnelle, on définit par induction $psi(F)$ la _transformé sans implications de $F$_ par

#columns(2)[
$ psi(A or B) & := psi(A) or psi(B)\ psi(A and B) & := psi(A) and psi(B)\ psi(A -> B) & := not psi(A) or psi(B)) $
#colbreak()
$ &psi(X) := X &"pour" X "une variable"\ 
&psi(not A) := not psi(A) \ 
&psi(top) := top, psi(bot) := bot $
]

Montrer que $tack F$ est prouvable si et seulement si $tack psi(F)$ est prouvable

== Complétude #footnote[Le magnifique livre de Mme. Galatée Hemery~!~!~!~! \<3]

On cherche à montrer que si $F$ une formule propositionnelle est vraie pour tout modèle, alors $tack F$ est démontrable en logique classique.

Pour $mu$ une valuation et $phi$ une formule on pose 
$ |phi|_mu = cases(phi &"si" mu tack.double phi, not phi &"sinon" ) $
1. Soit $F$ une formule et ${X_1, ...,X_n }$ les variables propositionnelles de $F$. Montrer que le séquent suivant est démontrable en logique classique pour toute valuation $mu$~:\ $ |X_1|_mu, ..., |X_n|_mu tack |A|_mu $
2. Montrer que en logique classique, si $Gamma, X tack phi$ et $Gamma, not X tack phi$ sont prouvable, alors $Gamma tack phi$ l'est aussi.
3. Montrer que si A est une tautologie, alors pour toute valuation $mu$, on a $|X_1|_mu, ..., |X_n|_mu tack A$ démontrable.
4. Conclure.
  
== Sans négation

Soit $F$ une formule propositionnelle, on définit par induction $psi(F)$ la _transformé sans négation de $F$_ par

#columns(2)[
$ psi(A or B) &= psi(A) or psi(B)\ psi(A and B) &= psi(A) and psi(B)\ psi(A -> B) &= psi(A) -> psi(B) $
#colbreak()
$ &psi(X) = X &"pour" X "une variable"\ 
&psi(not A) = psi(A) -> bot\ 
&psi(top) = top, psi(bot) = bot $

]

Montrer que $tack F$ est prouvable si et seulement si $tack psi(F)$ est prouvable

== Théorie déductive des graphes
On se donne le langage de la logique du premier ordre auquel on a rajouté une relation $R$ d'arité 2. En plus des règles concernant la déduction naturelle, on rajoute les règle suivantes, indiquant que $R$ est symétrique et n'est pas reflexif:
$
(Gamma tack R(x,y))/(Gamma tack R(y,x))"sym" #h(150pt) ()/(Gamma tack not R(x,x)) "nr"
$

On peut interpréter alors une formule $F$ de cette théorie comme une formule sur des graphes non orienté sans boucle: soit $G =(V,E)$ un graphe, on a $(x,y) in E$ si et seulement si $R(x,y)$. Par exemple, la formule "$forall x, R(s,x)$" est la formule qui indique que $s$ est connecté à tous les sommets.

1. Montrer que le séquent $tack not (forall x, forall y, R(x,y))$ est démontrable. 
2. Montrer à l'aide d'un arbre de preuve que dans un graphe, si un sommet est relié à tous les autres, alors chaque sommet admet au moins un voisin.

== Formule Duale
Pour $F$ une formule de la logique propositionnelle, on définit par induction $F^bot$ la _formule duale de $F$_ par:

#columns(2)[
$ (A or B)^bot & := A^bot and B^bot\ 
(A and B)^bot & := A^bot or B^bot\ 
(A -> B)^bot & := not A^bot or B^bot $
#colbreak()
$ &X^bot := not X &"pour" X "une variable"\ 
&(not A)^bot := not A^bot $
]

1. Montrer que si $mu$ est une valuation, alors $mu tack.double not F$ si et seulement si $mu tack.double F^bot$
2. Montrer par induction sur les formules $F$ de la logique propositionnelles que pour tout $Gamma$, si $Gamma tack not F$ alors il existe une preuve que $Gamma tack F^bot$ (en logique classique). On appellera cela la _loi de morgan généralisé_.

== Logique pertinente#footnote[Sujet custom!]

La logique pertinente est une logique déductive telle que si $Gamma tack F$ est prouvable, alors chaque hypothèse de $Gamma$ doit etre utillisé au moins une fois dans la preuve de $F$. Ainsi, $A tack A and A$ sera prouvable mais $A, B tack A$ ne sera pas prouvable car $B$ n'est pas utillisé.

On considère les formules propositionnelles construites à partir de variables propositionnelles, des connecteurs $and$, $or$ et de $->$. Les contextes $Gamma, Delta$ sont des ensembles finis de formules. On note $Gamma, A$ pour dénoter le contexte $Gamma union {A}$.

On définit la relation de prouvabilité $Gamma tack F$ par les règles de déduction naturelle suivantes :

$
()/(A tack A) "Ax"
#h(40pt)
(Gamma, A tack B)/(Gamma tack A -> B) scripts(->)_i
#h(40pt)
(Gamma tack A -> B quad Delta tack A)/(Gamma union Delta tack B) scripts(->)_e 
$$
(Gamma tack A)/(Gamma tack A or B) or_i^g
#h(40pt)
(Gamma tack B)/(Gamma tack A or B) or_i^d
#h(40pt)
(Gamma tack A or B #h(15pt) Delta, A tack C #h(15pt) Delta, B tack C)/(Gamma union Delta tack C) or_e
$$
(Gamma tack A #h(15pt) Delta tack B)/(Gamma union Delta tack A and B) and_i
#h(40pt)
(Gamma tack A and B #h(15pt) Delta, A, B tack C)/(Gamma union Delta tack C) and_e
$

1. Donner un arbre de preuve en logique pertinente pour les deux jugements suivants:
$ tack A -> B -> (A and B) #h(30pt) tack ((A or B) -> C) -> (A -> C) and (B -> C) $
2. Montrer que si la règle $and_e$ était remplacée par les deux règles suivantes, alors $tack A -> (B -> A)$ serai prouvable :
$
(Gamma tack A and B)/(Gamma tack A) and^g_e
#h(40pt)
(Gamma tack A and B)/(Gamma tack B) and^d_e
$

Pour $F$ une formule, on définit $[|F|]$ une collection d'ensembles de variables propositionelles de $F$ par induction :
$
[|X|] &= {{X}} &"pour" X "une variable"\
[|A and B|] &= {r union s | r in [|A|] and s in [|B|]}\
[|A or B|] &= {r_1 union ... union r_k | k >= 1 and forall i, r_i in [|A|] union [|B|]}\
[|A -> B|] &= { r : forall s in [|A|], r union s in [|B|]}
$


Pour un contexte $Gamma = {A_1, ..., A_n}$, on pose $[|Gamma|]  = {r_1 union ... union r_n | forall i, r_i in [|A_i|]}$. On posera $[|Gamma|] = {emptyset}$ pour $Gamma = emptyset$ le contexte vide. On dit que le jugement $Gamma tack A$ est _valide_ si $[|Gamma|] subset.eq [|A|]$

3. Donner les valeurs des ensembles suivants pour $A,B$ deux variables propositionelles:
$
[|A and B|], quad  [|A or B|], quad [|A -> B|].
$

4. Montrer que si $t_1,..,t_n in [|F|]$, alors $t_1 union ... union t_n in [|F|]$.
5. Montrer par induction que si $Gamma tack F$ est prouvable alors $Gamma tack F$ est valide.
6. En déduire que $A -> (B -> A)$ n'est pas prouvable en logique pertinente.

== Introduction à la logique linéaire multiplicative

On définit par induction les formules de la logique linéaire par le fait que:
- $X$ et $overline(X)$ sont des formules pour $X$ une variable propositionnelle
- $phi times.o psi, phi amp.inv psi$ sont des formules de la logique linéiare pour $phi, psi$ deux formules de la logique linéaire

L'on note $cal(L)$ l'ensemble des formules de la logique linéaire multiplicative. L'on muni ces formules des règles de déduction suivantes:
$
()/(tack A , overline(A) ) "ax" #h(40pt) (tack Gamma, A #h(15pt) tack Delta, B)/(tack Gamma, Delta, A times.o B) times.o #h(40pt) (tack Gamma, A, B)/(tack Gamma, A amp.inv B) amp.inv
$
Attention, dans ces définition $Gamma$ n'est pas un ensemble mais une liste d'hypothèses (que l'ont peut réordonnée). La multiplicité du nombre d'occurence des formules compte, et la séparation $Gamma, Delta$ dans $times.o$ doit être une partition des hypothèses.

1.  Montrer que le séquent $tack (A times.o A) amp.inv (overline(A) amp.inv overline(A))$ est prouvable en logique linéaire multiplicative.
Soit $F in cal(L)$, on définit par induction le dual de $F$, noté $F^bot$ par $(X times.o Y)^bot = X^bot space amp.inv space Y^bot$, $(X amp.inv Y)^bot = X^bot times.o Y^bot$, $X^bot = overline(X)$ et $overline(X)^bot = X$

/*
$
  prooftree(rule(
    label :amp.inv,
    tack (A times.o A) amp.inv (overline(A) amp.inv overline(A)),rule(
      label :amp.inv,
      tack A times.o A \, overline(A) amp.inv overline(A), rule(
        label :times.o,
        tack A times.o A \, overline(A) \, overline(A), rule(
          label :"Ax", tack A\, overline(A)
        ),rule(
          label :"Ax", tack A\, overline(A)
        )
      )
    )
  )) 
$
*/

2. Montrer que $tack F, F^bot$ pour $F in cal(L)$.

/*Par induction sur la taille de $F$, on a 3 cas:
- Si $F$ est une variable propositionnelle, alors c'est juste la règle d'axiome classique
- Si $F = A times.o B$, nous avons par hypothèse d'induction $tack A, A^bot$ et $tack B, B^bot$. On a alors l'arbre de preuve suivante:

  $ prooftree(rule(label :amp.inv,
      tack A times.o B\, A^bot amp.inv B^bot,rule(label :times.o,
      tack A times.o B\, A^bot\, B^bot, rule(tack A\, A^bot), rule(tack B\, B^bot))
    )) $
- Si $F = A amp.inv B$, nous nous retrouvons en réalité dans le cas 2, avec les même hypotheses et le même but a permutation de $Gamma$ près.
]*/


3. ($*$) Montrer que si $tack Gamma, F$ et $tack Delta, F^bot$, alors $tack Gamma, Delta$


/*
Par induction sur la taille de la formule puis selon la taille de l'arbre de preuve.

*Cas de l'axiome* Supposons que $tack Gamma, A$ et $tack Delta, A^bot $. On regarde la dernière règle de $tack Gamma, A$~:
 - Si c'est un axiome, alors $Gamma = overline(A)$. On a donc $tack Delta, Gamma$ qui est juste égal à $tack Delta, A^bot$ par induction.
 - Si c'est la règle $amp.inv$ dans $Gamma$ (pas possible que ça soit sur $A$ car c'est une variable), alors on écrit $Gamma = Gamma', X amp.inv Y$. On a alors $tack Gamma', X, Y, A$.

   Car on a $tack Gamma', X, Y, A$ et $tack Delta, overline(A)$ sur des arbres plus petits, par induction on a $tack Gamma', X, Y, Delta$ et par la règle $amp.inv$~:
   $ amp.inv (tack  Gamma', X, Y, Delta)/(tack Gamma', X amp.inv Y, Delta) $
   Le tout donnant une preuve de $tack Gamma, Delta$
 - Si c'est la règle $times.o$ dans $Gamma$ (pas possible que ça soit sur $A$ car c'est une variable), alors on écrit $Gamma = Gamma', Delta', X times.o Y$. On a alors soit $tack Gamma', X, A$ et $tack Delta', Y$ ou $tack Gamma', X$ et $tack Delta', Y, A$. Les deux cas étant symmétrique, l'on fait le premier. 

   On a donc $tack Gamma', X, A$, $tack Delta', Y$ et $tack Delta, A^bot$. Par hypothèse d'induction, on a donc $tack Gamma', X, Delta$, et enfin:
   $ times.o (tack Gamma', X, Delta #h(15pt) tack Delta', Y)/(tack Gamma', Delta, Delta', X times.o Y) $
   Le tout donnant une preuve de $tack Gamma, Delta$
*Cas de $times.o$* Suppossons que $tack Gamma, A times.o B$ et $tack Delta, A^bot amp.inv B^bot$. On regarde la dernière règle de $tack Gamma, A times.o B$~:
- On ne peut pas avoir la règle d'axiomes car dans $tack Gamma, A times.o B$ on a pas $A times.o B$ qui n'est pas de la bonne forme
- Si la dernière règle est $amp.inv$, alors elle n'est pas sur $A times.o B$. On fait alors la même chose que dans le cas de l'axiome pour $amp.inv$
- Si la dernière règle est $times.o$ dans $Gamma$, on fait aussi comme le cas de l'axiome pour $times.o$.
- Le seul cas restant est si la règle $times.o$ appliqué à $A times.o B$. Dans ce cas, on fait aussi une disjonction sur $tack Delta, A^bot amp.inv B^bot$ et simmilairement, le seul cas qui sera différent de l'axiome sera le cas ou la règle $amp.inv$ est appliqué à $A^bot amp.inv B^bot$. On se retrouve donc avec le cas ou:
  - On peut écrire $tack Gamma, A times.o B$ comme $tack Gamma', Delta', A times.o B$ avec $tack Gamma', A$ et $tack Delta', B$
  - On a $tack Delta, A^bot, B^bot$

  Comme on a $tack Gamma', A$ et $tack Delta, B^bot, A^bot$, by induction (arbre de preuve plus petit) on a $tack Gamma', Delta, B^bot$. Ducoup, comme on a $tack Gamma', Delta, B^bot$ et $tack Delta', B$, par induction (taille de la formule, pas vraiment arbre de preuve plus petit car $tack Gamma', Delta, B^bot$ à la même taille d'arbre de preuve que notre cas inductif actuel), on a $tack Gamma, Delta$.

*Cas de $amp.inv$* C'est simmilaire à $times.o$.

$square$
*/

*Contexte* On dit qu'une règle déductive est _admissible_ si en suppossant qu'il existe une preuve de toute ses prémisse, il existe une preuve de la conclusion. Une règle est admissible si elle est "inutile" au système mais est plus puissante qu'une règle dérivable (qui est elle juste qu'une macro). On a donc montré que la règle cut est admissible: 
$
(tack Gamma, F #h(15pt) tack Delta, F^bot)/(tack Gamma, Delta ) "cut"
$
Et avec ça, on a montré le théorème bien compliqué que s'il existe une preuve utilisant la règle cut, il existe une sans.

== Correspondance du système à la Hilbert #footnote[Partie 4 du projet de rocq du cours PRFA 2025/2026]


Si $F$ est une formule, on dit que $G$ est une sous-formule de $F$ (noté $G prec F$) si on peut remplacer des variable propositionnelle de $F$ en d'autres formules pour obtenir $G$. Par exemple, la formule $(X and Y) -> (X and Y) and (X -> Y)$ est une sous-formule de $A -> A and B$ obtenu en remplaçant $A$ par $X and Y$ et $B$ par $X -> Y$. On ne peut pas remplacer la même variable par deux formules différente.

Pour $R$ un ensemble de formules, on considère le _système logique à la hilbert sur $R$_ (on le note avec $triangle.r_H$) possédant les 2 règles suivantes:

#columns(1, gutter: 11pt)[
  $ ()/(triangle.r_R F) "Ax" #h(20pt) "pour" F prec G, G in R $ 
]
#v(15pt)
#columns(1, gutter: 11pt)[   
  $ (triangle.r_R A #h(20pt) triangle.r_R A -> B)/(triangle.r_R B )scripts(->)_e $
]

Remarquer que comme $R$ ne change jamais dans les règles, $triangle.r_R $ en une sorte de système ou les axiomes sont les formules $R$ avec uniquement la règle $->_e$

On fixe $H = {A -> B -> A, (A -> B -> C) -> (A -> B) -> (A -> C)}$ . On souhaite montrer que $triangle.r_H X$ si et seulement si $X$ est prouvable en logique minimale seulement avec les règles $->_i$, $->_e$, $"Ax"$.

1. Montrer le séquent $triangle.r_H (A -> B) -> (A -> A)$ est prouvable. 
2. Montrer que si $triangle.r_X F$ est prouvable et que on a $F' prec F$ et $X subset.eq X'$, alors $triangle.r_X' F'$ l'est aussi. En déduire que $triangle.r_H A -> A$ est prouvable avec une bonne instantiation de $B$ dans la question précédente.

On fixe $Gamma$ un ensemble de formules propositionnelle et $Delta = Gamma union H$
3. Montrer que si $triangle.r_Delta F$ est prouvable, alors $Gamma tack F$ est prouvable en logique minmale seulement avec les règles $->_i$, $->_e$, $"Ax"$
4. Montrer les 2 faits suivants:
  - Si $triangle.r_Delta B$ est prouvable alors $triangle.r_Delta A -> B$ est prouvable
  - Si $triangle.r_Delta A -> B -> C$ et $triangle.r_Delta A -> B$ sont prouvable alors $triangle.r_Delta A -> C$ est prouvable
5. Montrer que si $triangle.r_(Delta union {F}) G$ est prouvable alors $triangle.r_(Delta) F -> G$ l'est aussi.
6. En déduire la réciproque de la question 3

On peut s'amuser à ajouter les autres opérateurs~!
7. Proposer une formule $F_and^i$ de la forme $[...] -> A and B$ et deux formules $F_and^(e,g)$ et $F_and^(e,d)$ de la forme $A and B -> [...]$ de telle sorte a ce que $tack phi$ soit démontrable en logique minimale avec les règles $"Ax", ->_i, ->_e, and_i, and_e^g, and_e^d$ si et seulement si $triangle.r_(H union {F_and^i, F_and^(e,g), F_and^(e,d)}) phi$ est prouvable.
8. Meme question pour le $or$ et le $not$.

== $not not$-Traduction de Godel-Kolmogorov #footnote[Tiré de https://www.lirmm.fr/~retore/LL/nonnon.pdf]

On note $cal(L)$ l'ensemble des formules de logique propositionnelle. Pour $F in cal(L)$, on définit inductivement la non-non traduction de $F$ note $F^(not not)$ par:
#columns(2)[
$ (A and B)^(not not) & := A^(not not) and B^(not not)\ 
(A -> B)^(not not) & := A^(not not) -> B^(not not)\
(A or B)^(not not) & := not not(A^(not not) or B^(not not)) $
#colbreak()
$ &X^(not not) := not not X &"pour" X "une variable"\ 
&(not A)^(not not) := not A^(not not) $
]

Pour $Gamma = {Gamma_1,...,Gamma_n}$ on note $Gamma^(not not) := { Gamma_1^(not not), ..., Gamma_n^(not not)}$. On note $Gamma scripts(tack)_i F$ s'il existe une preuve de $Gamma tack F$ en logique intuitioniste (sans utiliser la règle $"raa"$ du raisonnement par l'absurde) et $Gamma scripts(tack)_c F$ s'il existe une preuve de $Gamma tack F$ en logique classique.

1. Montrer que $not not F^(not not) scripts(tack)_i F^(not not)$.
2. Montrer que $Gamma scripts(tack)_c F$ ssi $Gamma^(not not) scripts(tack)_i F^(not not)$.

== Logique multiplicative

On définit la logique déductive multiplicative sur les formules constitué seulements de $and$ et $->$ par celle respectant les règles suivantes. Attention, pour l'axiome, on n'a pas de $Gamma$~:
#columns(3, gutter: 11pt)[
  $ (Gamma, A tack' B)/(Gamma tack' A->B ) ->_i $
  #colbreak()
  $ (Gamma tack' A -> B #h(20pt) Delta tack' A)/(Gamma union Delta tack' B ) ->_e $
  #colbreak()
  $ ()/(F tack' F ) "Ax" $
]
#columns(3, gutter: 11pt)[
  $ (Gamma tack' A #h(20pt) Delta tack' B)/(Gamma union Delta tack' A and B ) and_i $
  #colbreak()
  $ (Gamma tack' A and B )/(Gamma tack' A ) and_e^g $
  #colbreak()
  $ (Gamma tack' A and B )/(Gamma tack' B ) and_e^d $
]

1. Montrer que le séquent $tack F$ est prouvable en logique minimale ssi $tack' F$ est prouvable en logique multiplicative.
2. Proposer des règles pour l'introduction et l'élimination du $or$ pour la logique multiplicative et traiter leur cas pour la question 1.


== Modèles de Kripke

On pose $cal(V)$ un ensemble dénombrable de variables propositionnelles. Soit $F$ une formule sur $cal(V)$, on appelle un *Modèle de Kripke* un arbre $T = (W,E)$ muni d'une fonction $rho : W --> cal(P)(cal(V))$ tel que pour tout enfant $e$ d'un parent $p$, on a $rho(p) subset.eq rho(e)$. On note $cal(E)(v)$ l’ensemble des descendants accessibles depuis $v$. On aura toujours $v in cal(E)(v)$.

On définit par induction le fait qu'une formule $F$ est vérifié par un noeud $v in V$ d'un modèle de Kripke $cal(M)$ (noté $cal(M), v tack.double F$) par:
  -  $cal(M), v tack.double X$ si $X in rho(v)$
  -  $cal(M), v tack.double A and B$ si $cal(M), v tack.double A$ et $cal(M), v tack.double B$
  -  $cal(M), v tack.double A or B$ si $cal(M), v tack.double A$ ou $cal(M), v tack.double B$
  -  $cal(M), v tack.double A -> B$ si pour tout $e in cal(E)(v)$, on a que $cal(M), e tack.double A$ implique $cal(M), e tack.double B$
  -  $cal(M), v tack.double not A$ si pour tout $e in cal(E)(v)$, on a pas $cal(M), e tack.double A$

On note $cal(M) tack.double F$ pour dit que pour tout $v in W$ on a $cal(M),v tack.double F$, et l'on notera $tack.double F$ si pour tout $cal(M)$ on a $cal(M) tack.double F$.

1. Donner un modèle de Kripke $cal(M)$ tel que $cal(M) tack.double.not X or not X$
2.
  - Montrer le lemme de persistance: si $cal(M), v tack.double F$ et $w in cal(E)(v)$, alors $cal(M),w tack.double F$.
  - Montrer par induction que si $Gamma tack F$ est prouvable en logique intuitioniste, alors pour tout modèle de Kripke tel que pour tout $A in Gamma$ on a $cal(M) tack.double A$, on aura nécessairement $cal(M) tack.double F$
3. En déduire que l'on ne peut pas démontrer ni $A or not A$ ni $not not A -> A$ en logique intuistioniste.

*Logiques intermédiaires* Pour $F$ une formule de variables propositionnelles $X_1,...,X_n$ et pour $F_1, ..., F_n$ des formules propositionnelles, on note $F' := F[X_1 <- F_1, ..., X_n <- F_n]$ la formule où, pour tout $i$, l'on a remplacé $X_i$ par $F_i$.
Dans ce cas on dit que $F'$ est une instanciation de $F$.
Par exemple, $(A -> B) or not (A -> B)$ est une instanciation de $F = A or not A$

Pour $F$ une formule on note par $scripts(tack)_F$ le système de la logique intuitioniste auquel on rajoute la règle 
$ ()/(Gamma scripts(tack)_F F') "Ax"_(F') "pour" F' "une instanciation de" F $

4. Montrer que $scripts(tack)_(A or not A) F$ est prouvable ssi $tack F$ est prouvable en logique classique.
5. Montrer que s'il existe un modèle $cal(M)$ tel que pour toute instanciation $F'$ de $F = A or not A$, on a $cal(M) tack.double F'$, alors on peut transformer $cal(M)$ en un modèle $cal(M)'$ reconnaissant les memes formules en un arbre de hauteur 0.

Soient $X_0,...,X_n,...$ une suite infinie dénombrable de variables propositionnelles. On définit 
$
  P_0 := X_0 or not X_0\
  forall n in NN, quad P_(n+1) := X_(n+1) or (X_(n+1) -> P_n)
$

6. Montrer que $scripts(tack)_(P_(n)) P_(n+1)$
7. Montrer qu'il nexiste pas de modèle $cal(M)$ de profondeur de moins que $n$ tels que $cal(M) tack.double P'$ pour toute instanciation de $P'$ de $P_(n+1)$
8. Montrer qu'il existe un moddèle de profondeur $n$ tels que $cal(M) tack.double P_(n)$
9. Pour $F$ une formule, on pose $cal(L)_F := {phi |space  scripts(tack)_F phi "est prouvable"}$. Montrer qu'il existe une suite infinie de formules $(phi_i)_(i in NN)$ telles que 
$  ... subset.neq cal(L)_(phi_(3)) subset.neq cal(L)_(phi_(2)) subset.neq cal(L)_(phi_(1)) subset.neq cal(L)_(A or not A) $

_Fun fact: avec de la théorie plus poussé, on a que il y a un continuium $aleph_1$ de logiques._
// TODO: continuium entre logique intuitioniste et classique

== Logique modale#footnote[Centrale Info 2026]

On cherche ici à représenter des formules déontiques, c'est-à-dire des formules représentant plusieurs situations analogues qui se déroule en même temps et qui sont liées. Soit $cal(V)$ un ensemble de variables propositionnelle, on définit par induction l'ensemble des formules déontique $cal(D)$ comme:
- Si $X in cal(V)$ alors $X in cal(D)$ ,
- Pour tout $phi, psi in cal(D)$, les formules $(phi or psi), (phi and psi), (phi -> psi)$ et $not phi$ sont des formules déontique,
- Si $phi in cal(D)$ alors $square phi in cal(D)$ et  $lozenge phi in cal(D)$.

La formule $square phi$ se lit "partout $phi$" et la formule $lozenge phi$ se lit "quelquepart $phi$"

1. Donner la formule représentant "si partout $A->B$, et si quelquepart A, alors quelquepart B".

On cherche maintenant à attribuer une valeur de vérité à de telle formules. Soit $F$ une formule de variables propositionnelles $V$, on définit un *modèle de Kripke de F* comme un couple $(mu_1,...,mu_n)$ tel que pour tout $i <= n$ on a $mu_i : V --> {top, bot}$ une valuation. Soit $cal(M) = (mu_1,...,mu_n)$ un modèle de Kripke, on définit $cal(M) scripts(tack.double)_i phi$ par induction:

$
  &cal(M) scripts(tack.double)_i A &"si" A in V "et" mu_i (A) = top\
  &cal(M) scripts(tack.double)_i phi and psi &"si" cal(M) scripts(tack.double)_i phi "et" cal(M) scripts(tack.double)_i psi \
  &cal(M) scripts(tack.double)_i phi or psi &"si" cal(M) scripts(tack.double)_i phi "ou" cal(M) scripts(tack.double)_i psi \
  &cal(M) scripts(tack.double)_i phi -> psi &#h(20pt)"si" cal(M) scripts(tack.double)_i phi "implique" cal(M) scripts(tack.double)_i psi \
  &cal(M) scripts(tack.double)_i not phi &"si" cal(M) scripts(tack.double)_i phi "est faux" \
  &cal(M) scripts(tack.double)_i lozenge phi &"si" exists j, cal(M) scripts(tack.double)_j phi \
  &cal(M) scripts(tack.double)_i square phi &"si" forall j, cal(M) scripts(tack.double)_j phi \
$
Dans ce cas on dit que $cal(M)$ _satisfait_ $phi$ au $i$-ème monde. Si $cal(M) = (mu_1,...,mu_n)$ et que pour tout $i$, $cal(M) tack.double_i phi$ on dira que $cal(M)$ satisfait $phi$. Si pour tout modèle $cal(M)$ de Kripke on a $cal(M) tack.double phi$, on dit que $phi$ est une _tautologie_, et on note cela $tack.double phi$.

2. Pour chacune des formules $phi$ suivante, indiquer s'il existe un modèle la satisfaisant, s'il existe un modèle satisfaisant $not phi$ et si elles sont des tautologies:
#columns(3)[
  $phi_1 = \"A and lozenge not A\"$
  #colbreak()
  $phi_2 = \"square (A and lozenge not A)\"$
  #colbreak()
  $phi_3 = \"square (square A -> square A)\"$
]

3. Montrer que $cal(M) scripts(tack.double)_i lozenge P$ est vrai si et seulement $cal(M) scripts(tack.double)_i not (square not P)$ est vrai.
4. En déduire un algorithme qui transforme une fomule déontique en une formule équivalente n'utilisant pas $lozenge$.

On étudie maintenant que les formules déontiques sans $lozenge$. On rajoute aux règles de la déduction naturelle de la logique classique les 3 règles suivantes:

#columns(3)[
$ (tack phi)/(tack square phi) D_1 $
#colbreak()
$ (Gamma tack square (phi -> psi ))/(Gamma tack square phi -> square psi) D_2 $
#colbreak()
$ (Gamma tack square phi)/(Gamma tack not square not phi) D_3 $
#colbreak()
]


5. Montrer que $tack not (square A and square not A)$
6. Montrer que $tack square (A and B) <-> (square A and square B)$
7. Montrer que le système est correct, c'est-à-dire que si $tack phi$ est démontrable pour $phi$ une formule sans $lozenge$ alors $tack.double phi$ est vrai.

== Logique linéaire temporelle & automates de Buchis (sujet d'écrit)

On cherche ici à représenter des formules qui utilise une certaine notion de temps qui passe. Soit $cal(V)$ un ensemble fini de variables propositionnelle, on définit par induction l'ensemble $cal(L)$ des formules temporelles linéaire comme:
- Si $X in cal(V)$ alors $X in cal(L)$ ,
- Pour tout $phi, psi in cal(L)$, les formules $(phi or psi), (phi and psi), (phi -> psi)$ et $not phi$ appartiennent à $cal(L)$,
- Si $phi in cal(L)$ alors $square phi in cal(L)$, $circle phi in cal(L)$ et $lozenge phi in cal(L)$.

La formule $square phi$ se lit "pour toujours $phi$", la formule $lozenge phi$ se lit "au bout d'un moment $phi$" et la formule $circle phi$ se lit "demain $phi$".

1. Donner la formule représentant "si au bout d'un moment on aura toujours $phi$, alors pour toujours au bout d'un moment $phi$".

On cherche maintenant à attribuer une valeur de vérité à de telle formules. Soit $F$ une formule de variables propositionnelles $cal(V)$, on définit un modèle $cal(M)$ de logique linéaire temporel comme une suite infinite de valuation $cal(M) = (mu_i)_(i in NN)$ tel que pour tout $i in NN$ la valuation $mu_i$ soit une valuation de $cal(V)$. L'idée est que la valuation $mu_i$ représente ce qui est vrai au jour $i$. On définit alors $cal(M) scripts(tack.double)_i phi$ par induction:
$
  &cal(M) scripts(tack.double)_i A &"si" A in V "et" mu_i (A) = top\
  &cal(M) scripts(tack.double)_i phi and psi &"si" cal(M) scripts(tack.double)_i phi "et" cal(M) scripts(tack.double)_i psi \
  &cal(M) scripts(tack.double)_i phi or psi &"si" cal(M) scripts(tack.double)_i phi "ou" cal(M) scripts(tack.double)_i psi \
  &cal(M) scripts(tack.double)_i phi -> psi &#h(20pt)"si" cal(M) scripts(tack.double)_i phi "implique" cal(M) scripts(tack.double)_i psi \
  &cal(M) scripts(tack.double)_i not phi &"si" cal(M) scripts(tack.double)_i phi "est faux" \
  &cal(M) scripts(tack.double)_i circle phi &"si" cal(M) scripts(tack.double)_(i+1) phi \
  &cal(M) scripts(tack.double)_i square phi &"si" forall j>=i, cal(M) scripts(tack.double)_j phi \
  &cal(M) scripts(tack.double)_i lozenge phi &"si" exists j>=i, cal(M) scripts(tack.double)_j phi \
$
Dans ce cas on dit que $cal(M)$ _satisfait_ $phi$ au $i$-ème jour. Si $cal(M) tack.double_0 phi$ on dira que $cal(M)$ satisfait $phi$. Si pour tout modèle $cal(M)$ on a $cal(M) tack.double phi$, on dit que $phi$ est une _tautologie_, et on note cela $tack.double phi$. La précédence de $circle,square,lozenge$ est la même que $not$, càd $square A and B = (square A) and B$ et $square A -> B = (square A) -> B$

2. Pour chacune des formules $phi$ suivante, indiquer s'il existe un modèle la satisfaisant, s'il existe un modèle satisfaisant $not phi$ et si elles sont des tautologies:
#columns(3)[
  $phi_1 = A and lozenge not A$
  #colbreak()
  $phi_2 = square lozenge phi -> lozenge circle phi$
  #colbreak()
  $phi_3 = square (phi -> psi) and not lozenge psi$
]

3. Montrer que $tack.double lozenge square  A -> square lozenge A$. Qu'est-ce que ça veux dire~?

Un *automate de Büchi* est un automate $(Q,Sigma,T,I,F)$ complet permettant de reconnaître des mots infinis, avec $I,F subset.eq Q$ et $T subset.eq Q times Sigma times Q$. Soit $X$ un ensemble de mots. On note $X^omega$ l'ensemble des mots infinis de $X$ défini formellement par $x in X^omega$ s'il existe une suite $(x_i)_(i in NN)$ telle que $x = x_0 x_1 x_2 ...$ 

Un mot infini $x$ sur $Sigma^omega$ est reconnu par un automate de Büchi lorsqu'il existe un chemin infini dans cet automate étiqueté par $x$, commençant par un état initial et passant une infinité de fois par un état final.

4. Quel est le langage reconnu par l'automate de Buchi:
#align(center)[#image("buchi_ex.png",width: 30%)]
5. Proposer un automate de Buchi recconnaissant $("01")^omega$.

Comme $cal(V)$ est fini, une valuation peut être représenté par $mu in {"true", "false"}^(cal(V))$ qui est un ensemble fini. On pose $Sigma_(cal(V)) = {"true", "false"}^(cal(V))$. Un modèle peut donc être assimilé à un mot infini $cal(M) in Sigma_(cal(V))^omega$. Pour $phi$ une formule de logique linéaire temporelle, on note $L(phi) = { cal(M) in Sigma_(cal(V))^omega | cal(M) tack.double phi}$ le langage reconnu par la formule.

6. Donner $L(square (x -> circle not x) and square (not x -> circle x))$
7. Montrer que si $L(phi)$ et $L(psi)$ sont reconnu par un automate de Buchi, alors $L(phi or psi)$ est reconnu par un automate de buchi.
8. Soit $cal(A) = (Q,Sigma,T,I,F)$ un automate de Buchi sur $Sigma$ fini. Pour chaque état $q in Q$, on pose $X_q$ une variable propositionnelle représentant le fait que l'automate soit à l'état $q$ et pour chaque $alpha in Sigma$, on pose $A_alpha$ la variable représentant le fait que l'on soit actuellement en train de lire un $alpha$. Donner des formules pour:
  - Le fait que à tout moment, on ne soit que dans un et un seul état.
  - Le fait que à tout moment, on ne lise qu'une et une seule lettre
  - Le fait que on passe de $X_q$ à $X_(q')$ vrais seulement si $A_alpha$ est vrai pour $(q,alpha, q') in T$
  - Le fait que l'on passe une infinité de fois par ${X_q : q in F}$

  En déduire que si $L$ est reconnu par automate de Buchi alors il existe une formule $phi$ tel que $L(phi) = L$


On va essayer de montrer que $L$ est reconnu par un automate de Buchi si et seulement si il existe $phi$ tel que $L = L(phi)$, et donc que de tester si une formule est vrai ou fausse est décidable. On a fait le sens simple, mais la preuve du sens retour est très délicate, principalement dans le cas de la négation.

Soient $phi, psi$ deux formules de langage reconnu par $cal(A) = (Q,Sigma,T,I,F)$ et $cal(A)' = (Q',Sigma,T',I',F')$.

9. Montrer que $L(square phi)$ et $L(circle phi)$ sont reconnus par des automates de Buchi.
10. Pourquoi l'automate produit classique de l'intersection ne marche pas pour reconnaître $L(phi and psi)$~?

En considérant une extension de l'automate produit $cal(A)_and = (Q_and,Sigma,T_and,I_and,F_and)$ avec un bit d'information bonus $b in {0,1}$~: on pose $Q_and = Q times Q' times {0,1}$ et $F_and = F times Q' times {0} union Q times F' times {0}$, tel que à chaque rencontre avec un $F_and$ on alterne le bit d'information $b <- 1 - b$.

10. Donner une définition formelle de $T_and$. Montrer que $L(phi and psi)$ est reconnu par $cal(A)_and$.

