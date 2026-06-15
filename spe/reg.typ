
= *MPI: Langages réguliers et Automates*

== Cours
- Définition d'un automate $(Sigma, Q, q_"init", F, delta)$ avec $delta$ une fonction ou $(Sigma, Q, q_"init", F, Delta)$ avec $Delta$ un ensemble.
- Automate déterministe, complet, émondé. Etat finaux, initiaux, accesible, co-accesible.
- La fonction de transition étendue $delta^*$
- Rapeller la méthode de Glushkov pour obtenir un automate à partir d'une expression régulière.
- Rapeller la méthode de Berry-Sethi pour obtenir un automate à partir d'une expression régulière.
- Rapeller la méthode de Thompson pour obtenir un automate à partir d'une expression régulière. (HP)
- Montrer que la classe des langages régulier est stable par complémentaire, union, intersection.
- Montrer que si $cal(A)$ est un automtate non déterministe alors il existe $cal(A)'$ un automate déterministe qui reconnaît le même langage que $cal(A)$ .
- Montrer le lemme de l’étoile.
- Montrer que le langage ${a^n b^n : n in NN}$ n'est pas régulier.
- Montrer le lemme d’Arden (HP).
- $L$ est régulier ssi existe morphisme $phi : Sigma^* --> M$ monoide fini et $F subset.eq M$ tq $L = phi^(-1) (F)$. Le monoide $M = {delta^*(u,dot) : u in Sigma^*}$ (HP)

*Exos à rajouter*
- Oracle hors-contexte aux langages réguliers
- Automates d'arbres

== Berry-Sethi
Que vaux les automates obtenu par la méthode de Berry-sethi appliqué aux expressions suivantes:
- $(a | b)^*$
- $(a | b)^* a a a b$
- $(a | b)^* (c (b a | c))^*$

== Langages réguliers

Soit $L, L'$ deux langages réguliers. Montrer que les langages suivants sont réguliers:
- ${w_1 w_1 w_2 w_2 ... w_(|w|) w_(|w|) : w in L}$
- ${w_1 w_3 w_5 .... w_k : w in L "avec" k=|w| "si" |w| "impair et" k=|w|-1 "sinon"}$
- $overline(L) = {overline(u) : u in L}$ le langages des mirroirs
- $union.big_(w in L) S(w)$ pour $S(w)$ l'ensemble des sous-mots de $w$
- $L\/L' = {w in Sigma^* | exists x in L', w x in L}$
- $u^(-1)L = {w in Sigma^* | u w in L}$ pour $u in Sigma^*$
 
== Non régulier

Montrer que les langages suivant ne sont pas réguliers:
- ${a^(2^n) : n in NN}$
- ${a^(n^2) : n in NN}$
- ${a^n b^m : n <= m}$
- ${w in {a,b}^* : |w|_a = |w|_b}$
- ${a^(p) : p in PP}$ pour $PP$ l'ensemble des nombres permiers.
- ${a^n b^m : n >= m}$ (petite subtilité)

== Petites questions

- Monter que l’on peut réécrire une expression régulière sans $emptyset$ si le langage dénoté n’est pas vide.
- Soit $L$ un langage reconnaissable reconnu par $cal(A)$, on pose pour $q,q' in Q_cal(A)$ le langage $L_(q,q')$ des mots étiquetant un chemin de $q$ à $q'$. Montrer que $L_(q,q')$ est régulier.

== Cloture interne par préfixe

Soit $w in Sigma^*$, on définit $"Pref"(w)$ (respectivement $"Suff"(w)$) l'ensemble des préfixes (respc. suffixes) de $w$. Pour $L$ un langage, on pose $psi(L) = {w in Sigma^* | "Pref"(w) subset.eq L}$

1. Montrer que si $L$ est régulier, $psi(L)$ l'est aussi.
2. Proposer un algorithme pour tester si un automate $cal(A)$ vérfie $L(cal(A)) = psi(L(cal(A)))$ 

== Factorisation arbitraire de l'étoile

Montrer les 3 lemmes suivants plus forts que le lemme de l'étoile:

*Lemme 1* Soit $L$ un langage régulier sur $Sigma$. Alors il existe $N in NN^*$ tel que pour tout $u,w,v in Sigma^*$ tel que $u w v in L$ et $|w| > N$, il existe $x,y,z in Sigma^*$ tels que:
- $w = x y z$,
- $|y| > 0$,
- $forall i in NN, u x y^i z v in L$.

*Lemme 2* Soit $L$ un langage régulier sur $Sigma$. Alors il existe $N in NN^*$ tel que pour tout mot de la forme
$
u_0 w_1 u_1 w_2 u_2 ... w_k u_k in L
$
avec $k in NN$ et $|w_j| > N$ pour tout $j in {1,...,k}$, il existe, pour tout $j <= k$, une factorisation $w_j = x_j y_j z_j$ telle que $|y_j| > 0$ pour tout $j <= k$, et pour tous $i_1,...,i_k in NN$,
$
u_0 x_1 y_1^(i_1) z_1 u_1 x_2 y_2^(i_2) z_2 u_2 ... x_k y_k^(i_k) z_k u_k in L.
$

*Lemme 3, positions marquées* Soit $L$ un langage régulier sur $Sigma$. Alors il existe $N in NN^*$ tel que pour tout mot $w in L$ de longueur $n = |w|$ et $I subset.eq [| 1 ; n|]$ avec $|I|>N$ un "marquage" d'au moins $N$ positions, il existe une factorisation $w = x y z$ telle que:
- $y$ contient au moins une position marquée,
- $x y$ contient au plus $N$ positions marquées,
- $forall i in NN, x y^i z in L$.

== Mots ordonnés #footnote[CCINP 2024?]

Soit $Sigma$ un alphabet et $<=$ un ordre sur $Sigma$ – pas nécessairement total.
On défini l'ordre préfixe $subset.eq.sq$ par $u subset.eq v$ si et seulement si $u$ est un préfixe de $v$.
On définit l'ordre $prec.eq$ comme étant l'ordre lexicographique concu à partir de $<=$. 

1. Rapeller la définition de l'ordre lexicographique.
2. Montrer que l'ordre $subset.eq.sq$ est bien fondé.
3. Est-ce que l'ordre $prec.eq$ est toujours bien fondé?

Pour $L$ un langage sur $Sigma$, on définit $min L = {u in L | forall v in L, not v prec.eq u}$

4. On pose $Sigma = {a,b,c}$ avec $a <= b$ et $c$ incomparable à $b$ et $c$. Donner $min { "abb", "ba", "ca", "cba", "ac" }$
5. Montrer que si $L$  est un langage régulier, alors $min L$ l'est aussi.

== Automates à sauts#footnote[Oral Mines-Télécom 2024, https://beos.prepas.org/sujet.php~?id=8151]

Soit $cal(A)$ un automate à un seul éta initial $q_"init"$. On note $Q$ l'ensemble des sommets $R = Q times Sigma^* times Q$ les transitions, $F$ les états finaux.

Soient $u,v,u',v' in Sigma^*$, $a in Sigma union {epsilon}$ et $(q_1, q_2) in Q^2$. On pose la relation $(u, q_1, a v) arrow.cw.half (u', q_2, v')$ valable uniquement si $(q_1, a, q_2) in R and u v = u' v'$

On a $(u,q_1, a v) scripts(arrow.cw.half)^* (u', q_2, v')$ si un nombre fini de $arrow.cw.half$ permettent de passer de $(u,q_1, a v)$ à $(u', q_2, v')$.

On définit le langage à saut de l'automate comme suit:
$ L_dagger.double (A) = {u v in Sigma^* | exists f in F, (u, q_"init",v) scripts(arrow.cw.half)^* (epsilon, f, epsilon) } $

1. Montrer que $L_"ab" = {w in Sigma^* | |w|_a = |w|_b }$ n'est pas régulier.
2. Montrer que $L_"ab"$ est reconnu par le langage à saut d'un automate.

On note $"Perm"(L) = {u in Sigma^* | exists v in L, u "est une permutation des lettres de" v}$.

3. Si $L$ est régulier, est-ce que $"Perm"(L)$ aussi~?
4. Si $L$ est régulier, est-ce que $"Perm"(L)$ est le langage à saut d'un automate~?

== Automates avec couts (algo $A^*$, sujet bof)

On considère un automate $cal(A)$ pas forcément déterministe muni d'une fonction de cout $c : delta --> RR$ sur les transitions. Le cout d'un chemin est la somme des couts de chaque transition. Soit $u$ un mot accepté par l'automate, on définit son cout $c(u)$ comme le cout minimal d'un chemin acceptant $u$, si c'est bien définit.

Soit $C in RR$, on pose $L(cal(A))_C = {u in L | c(u) = C }$

1. Montrer que $c(u)$ est bien définit dans un automate sans $epsilon$-transition. On se place maintenant dans ce contexte.
2. Donner un automate pondéré $cal(A)$ tel que $L(cal(A))_C = {a^n b^n : n in NN}$ pour un certain $C$
3. Montrer que si $c : delta --> RR^+$ est positive, alors pour tout $C$, $L(cal(A))_C$ est un langage régulier.
4. Toujours si $c : delta --> RR^+$, proposer un algorithme qui renvoie un des plus petits mots en longueur $u in L(cal(A))_C$. Pouvez-vous trouver une heuristique admissible et utiliser l'algorithme $A^*$~?

== Langage croisé


Soit $Sigma$ un alphabet et $L_1,L_2$ deux langages, on définit le langage croisé $L_1 || L_2$ par: $ L_1 || L_2 = { x y z : (x,y,z) in (Sigma^*)^3 | x y in L_1 and y z in L_2 } $

1. Montrer que ${a^n b^n : n in NN} || {b^n a^n : n in NN}$ n'est pas régulier.
// c'est les a^n b^n' a^n'' avec n + n'' >= n' >= max(n,n'')
2. Montrer que si $L_1$ et $L_2$ sont régulier alors $L_1 || L_2$ l'est aussi.
// Concaténation de A1 --(sans condition)--> A1 x A2 ---(si (q1 in F1))--> A2

/*
= Pliage#footnote[Anthony Lick, professseur à Janson de Sailly https://anthonylick.com/wp-content/uploads/MPI_TD03.pdf]

On définit la fonction de $"pl" : Sigma^* --> Sigma^*$ telle que:
$ "pl"(ep) $
*/

== Sous-langage palindromique
Soit $Sigma$ un alphabet, pour $w = w_1w_2...w_n in Sigma^*$, on note $overline(w) = w_n...w_2w_1$ le mot _miroir_ de $w$.
Soit $L$ un langage sur $Sigma$, on pose $overline(L) = {overline(w) : w in L}$. On pose aussi  $psi(L) = { w overline(w) : w in L}$

1. Donner un langage régulier non vide $L$ tel que $psi(L)$ soit régulier.
2. Montrer que si $L$ est régulier, alors $overline(L)$ aussi.
3. Montrer qu'il existe $L$ régulier, tel que $psi(L)$ ne le soit pas.
4. $(*)$ Proposer un algorithme qui teste si un automate donné $cal(A)$ est tel que $psi(L(cal(A)))$ soit régulier.

== Langage régulier à partir de l'automate#footnote[Colle de José]

On se fixe un alphabet $Sigma$ dans tout l’exercice. On se donne $K,L$ des langages sur $Sigma$, tels que $epsilon in.not K$, et on
considère l'équation suivante, d'inconnue le langage $X$~:
$ X = K X union L $

1. Dans le cas $K = {a}$, $L = {b}$, donner la forme de $X$. Une preuve formelle n’est pas attendue ici.
2. Généraliser ce résultat pour $K$ et $L$ quelconques vérifiant les hypothèses. Montrer ce résultat, que l’on appelle Lemme d’Arden. Que dire des langages solutions si K et L sont réguliers~?
  _Indication: pour l'un des sens, on pourra raisonner par récurrence_
3. Comment le résultat précédent se trouve-t'il modifié si K contient le mot vide~?
  _Indication: que perd-t’on dans la démonstration précédente~?_
  
On se fixe $n in NN^*, (K_(i,j))_(i <= i,j <= n)$, des langages ne contenant pas $epsilon$, et $L_1, ..., L_n$ des langages sur $Sigma$. On
considère le système d'équation suivant:

$
cases(
X_1 &= K_(1,1)X_1 union ... union K_(1,n)X_n union L_1,
X_2 &= K_(2,1)X_1 union ... union K_(2,n)X_n union L_2,
...,
X_n &= K_(n,1)X_1 union ... union K_(n,n)X_n union L_n,
)
$
4. Montrer que ce système admet une solution. Que dire des langages solutions si les $K_(i,j)$ et $(L_i)_i$ sont réguliers~?
5. En déduire une méthode/algorithme permettant de construire l’expression régulière dénotant le langage reconnu par un automate fini éterministe A.


== Langage rotationel

Soit $L$ un langage sur un alphabet $Sigma$. On définit $R(L) = { x y : y x in L}$ le _rotationel_ de $L$.

1.  Montrer que $R(R(L)) = R(L)$

Soit $cal(A) = (Sigma, Q, q_"init", delta, F)$ un automate déterministe complet, pour $q_1,q_2 in Q$, on pose $L_(q_1,q_2) = {w : delta^*(q_1,w) = q_f}$ (autrement dit, l'ensemble des mots étiquetant un chemin de $q_1$ à $q_2$).

2. Montrer que pour tout $q_1,q_2 in Q$, on a que $L_(q_1,q_2)$ est régulier.
3. Montrer que si $L$ est un langage régulier, alors $R(L)$ aussi.

== Langage entrelacé

Soient $Sigma$ un alphabet et $u,v in Sigma^*$ avec $|u| = m_u$ et $|v| = m_v$. Pour $w = w_1...w_n in Sigma^*$ un mot, on dit que c'est un _entrelacement_ de $u$ et $v$ s'il existe $phi_u : [| 1 ; m_u|] --> [|1 ;n|]$ et $phi_v : [| 1 ; m_v|] --> [|1 ;n|]$ strictement croissantes telles que $phi_u, phi_v$ sont à image disjointes avec $u = w_(phi_u (1)) ... w_(phi_u (m_u))$ et $v = w_(phi_v (1)) ... w_(phi_v (m_v))$. Intuitivement, $u,v$ sont deux sous-mots disjoints de $w$. On note l'ensemble des mots qui sont des entrelacements de $u$ et $v$ par $u harpoons.lbrb v$.

Pour $L,L'$ deux langages on pose $ L harpoons.lbrb L' = union.big_(u in L\ v in L') u harpoons.lbrb v. $

1. Montrer que si $L,L'$ sont régulier, alors $L harpoons.lbrb L'$ l'est aussi.

On généralise maintenant à des entrelacements de $k$ mots: soient $u_1,...,u_k in Sigma^*$ de longeurs $m_1,...,m_n$, on dit que $w in Sigma^*$ est un entrelacement de $u_1,...,u_k$ s'il existe $phi_1,...,phi_k$ toutes strictement croisssante tel que $union.sq.big_(i <= k) "Im"(phi_i)$ forme une partition de $[|1 ; |w| |]$ pour tout $i <= k$, on a 
$ phi_i : [|1 ; m_i|] --> [|1 ; |w| |] "tel que" u_i = w_(phi_i (1)) w_(phi_i (2)) ... w_(phi_i (m_i)) $

On note l'ensemble des entrelacements de $u_1,...,u_k$ par $arrow.double.b (u_1,...,u_k)$. On définit l'entrelacement de $k$ langages $L_1,..., L_k$ comme 
$ arrow.double.b (L_1,...,L_k) = union.big_(u_1 in L_1) ... union.big_(u_k in L_k) arrow.double.b (u_1,...,u_k) $

2. Montrer que $arrow.double.b (L_1,...,L_k) = L_1 harpoons.lbrb (L_2 harpoons.lbrb (...  harpoons.lbrb (L_(k-1) harpoons.lbrb L_k))...)$. En déduire que l'entrelacement de $k$ langages réguliers est toujours un langage régulier.
3. Soit $L$ régulier, est-ce que $union.big_(i in NN) arrow.double.b (L^i)$ est régulier~?
// L = {ab}, si régulier alors arrow.double.b (L^*) inter {a^* b^*} = {a^n b^n}
== Mots univers

On dit qu'un mot $w in Sigma^*$ est $n$-univers si tous les mots de $Sigma^n$ sont des facteurs de $w$. On cherche à créer les plus petits mots $n$-univers.

1. Pour $Sigma = {a,b,c}$, donner un mot $2$-univers.
2. Montrer qu'un mot $n$-univers sur un alphabet à $k$ lettres à au moins une longueur de $k^n+n-1$

Soit $n >=2$ et $Sigma$ un alphabet, on pose l'automate (vu comme un graphe) dont les états sont $Q = Sigma^(n-1)$ et les transitions de la forme $alpha w -->_alpha' w alpha'$ pour tout $alpha, alpha' in Sigma, w,w' in Sigma^(n-2)$, avec quelquonques états initial et finaux (ils ne vont pas avoir d'importance).

3. Montrer que tout graphe fortement connexe orienté tel que tout sommet possède autant d'arêtes entrante que d'arêtes sortante possède un chemin  eulérien (qui passe par toutes les aretes une et une seule fois)
4. Montrer qu'il existe un mot $n$-univers de longueur $|Sigma|^n + n -1$

== Astucieux langage #footnote[Le fabuleux cours de théorie des langages formels d'Olivier Carton]
Soit $Sigma = {a,b}$

1. Montrer que le langage des mots ayant autant de $a$ que de $b$ sur $Sigma$ n'est pas régulier
2. Montrer que le langage des mots ayant autant de $a b$ que de $b a$ sur $Sigma$ est régulier

== Régulier à une lettre
On dit que $S subset.eq NN$ est _ultimement périodique_ si $exists N,T in NN, forall n > N, n in S <=> n + T in S$. Pour $L$ un langage régulier sur $Sigma = {a}$, on pose $S(L) := {n in NN : a^n in L }$. Réciproquement, pour $S subset.eq NN$, on pose $L(S) = {a^n : n in S}$ 

Montrer que $L$ sur $Sigma = {a}$ est régulier si et seulement si $S(L)$ est ultimement périodique.

== Permuté
On définit pour $L$ un langage le _permuté_ $sigma(L)$ par
$ sigma(L) = {w in Sigma^* | exists u in L, forall alpha in Sigma, |u|_alpha = |w|_alpha} $

1. Donner un langage régulier $L$ tel que $sigma(L)$ soit non régulier.
2. On pose $L_"ab" = {a^n b^n : n in NN}$. Montrer que si $L$ est un langage tel que $L_"ab" subset.eq L subset.eq sigma(L_"ab")$, alors $L$ n'est pas régulier

== Langages surprenants

Soit $Sigma = {a,b}$.
1. Montrer que $L_1 = {a^k y | |y|_(a) > k }$ est régulier.
2. Montrer que $L_2 = {a^k y | |y|_(a) < k }$ ne l'est pas.
3. Montrer que $L_1 = {a^k u a^k : k >= 1, u in Sigma^* }$ est régulier.
4. Montrer que $L_2 = {a^k b u a^k : k >= 1, u in Sigma^*}$ ne l'est pas.

== Automates de Büchi #footnote[Mines-Télécom 2024 https://beos.prepas.org/sujet.php~?id=8156]

Un automate de Büchi est un automate $(Q,Sigma,T,I,F)$ permettant de reconnaître des mots infinis, avec $I,F subset.eq Q$ et $T subset.eq Q times Sigma times Q$.

Soit $X$ un ensemble de mots. On note $X^omega$ l'ensemble des mots infinis de $X$~: $x in X^omega$ s'il existe une suite $(x_i)_(i in NN)$ telle que $x = x_0 x_1 x_2 ...$ 

Un mot infini $x$ sur $Sigma^omega$ est reconnu par un automate de Büchi lorsqu'il existe un chemin infini dans cet automate étiqueté par $x$, commençant par un état initial et passant une infinité de fois par un état final.

1. Quel est le langage reconnu par l'automate de Buchi:
#align(center)[#image("buchi_ex.png",width: 30%)]
2. Proposer un automate de Buchi recconnaissant $("01")^omega$.

Soient $A,B$ deux automates de Buchi.

3. Montrer que $L(A) union L(B)$ est reconnu par un automate de Buchi.
4. Soit $K$ un langage régulier, Montrer que $K dot.c L(A)$ est reconnu par un automate de Buchi.
5. Montrer que $L(A) inter L(B)$ est reconnu par un automate de buchi.
6. Montrer que si $K$ est un langage régulier, alors $K^omega$ est reconnu par un automate de buchi.

== Automates partiellement ordonnés #footnote[Oral ENS 2022 C2 https://diplome.di.ens.fr/informatique-ens/annales/2022_InfoU-exercices.pdf]
Un automate (déterministe ou non) $cal(A)$ est dit partiellement ordonné si tous les cycles dans le graphe de $cal(A)$ sont de taille au plus 1.

1. Montrer que l'union et l'intersection de deux langages partiellement ordonné est aussi partiellement ordonné. Est-ce le cas si on se restreint à des langages déterministes~?
2. Montrer que sur $Sigma = {a}$, un langage $L$ est partiellement ordonné si et seulement si il est fini ou il est le complémentaire d'un langage fini.
3. Donner un langage $L$ partiellement ordonné de complémentaire non partiellement ordonné.

== Commuteurs de Langages

Soit $L_1, L_2$ deux langages sur $Sigma = {a,b}$, on définit le langage commutateur de $L_1, L_2$ par:
$ [| L_1 ; L_2 |] := { x x' y y' : x y in L_1 and x' y' in L_2 }   $

1. Montrer que $[| L_1 ; L_2 |]$ n'est pas régulier pour $L_1 = {a^n b^n : n in NN}$ et $L_2 = {b^n a^n : n in NN}$.\ _Ind: vous n'etes pas obligé de calculer $[| L_1 ; L_2 |]$_
2. Soit $L$ un langage reconnaissable reconnu par $cal(A)$, on pose pour $q,q' in Q_cal(A)$ le langage $L_(q,q')$ des mots étiquetant un chemin de $q$ à $q'$. Montrer que $L_(q,q')$ est régulier.
3. Montrer que si $L_1, L_2$ sont régulier, alors $[| L_1 ; L_2|]$ l'est aussi.

== Langage résiduel & langages régulier

Soit $Sigma$ un alphabet fini. Pour $u in Sigma^*$ et $L$ un langage sur $Sigma$, on définit 
$ 
  u^(-1)L = {w in Sigma^* | u w in L}
$
1. Montrer que si $L$ est régulier, alors pour tout $u in Sigma^*$, $u^(-1) L$ est régulier.
2. Montrer que pour tout $u,v in Sigma^*$, on a $u^(-1)(v^(-1)L) = (u v)^(-1) L$

Soit $cal(A)$ un automate complet déterministe d'état initial $q_"init"$. On note $delta^* : Q times Sigma^* --> Q$ la fonction de transition étendu, formellement définie par $delta^*(q,epsilon) = q$ et $delta^*(q, alpha w) = delta^*(delta(q,alpha),w)$ pour tout $(q,alpha,w) in Q times Sigma times Sigma^*$.
3. Montrer que pour tout $u,v in Sigma^*$ et $q in Q$ on a $delta^*(q,u v) = delta^*(delta^*(q,u), v)$ 
4. Montrer que pour tout $u in Sigma^*$ on a $u^(-1) (L(cal(A))) = {v in Sigma^* | delta^*(q_"init",u v) in F}$
5. En déduire que si $L$ est régulier alors ${ u^(-1) L : u in Sigma^*}$ est fini. 
6. Est-ce que la réciproque de la question 5 est vraie~? Justifier.



== Commutant de Langage#footnote[Sujet de José]
Soit $u in Sigma^*$ un mot, on pose $"Comm"(u) = {v in Sigma^* | u v = v u}$

1. Décrire $"Comm"("abab")$
2. Soient $u,v in Sigma^*$ tels que $u v = v u$. Montrer qu'il existe $w in Sigma^*$ et des entiers $r,s$ tels que $u = w^r$ et $v = w^s$
3. En déduire que $"Comm"(u)$ est toujours régulier pour $u in Sigma^*$.

On souhaite généraliser à un langage. Pour $L$ un langage, on pose 
$ "Comm"(L) = inter.big_(u in L) "Comm"(u) $
Soit $L$ tel que $"Comm"(L) != emptyset$

4. Montrer que pour tout $x,y in Sigma^*$ tels que $x^k = y^s$ avec $r,s >= 1$, il existe un mot $w$ tel que $x$ et $y$ soient des puissances de $w$. _On pourra utiliser la question 2 _
// pour x^k qui commute avec y^s on a w^r = x^k et w^p = y^s. Ducoup les deux sont des puissances de w
5. Montrer qu'il existe un mot $w$ tel que tout mot de $L$ soit une puissance de $w$
6. En déduire que $"Comm"(L)$ est régulier.


== Langage coupé au millieu

Soit $Sigma$ un alphabet et $L$ un langage, on pose
$
"TM"(L) & := {w in Sigma^* | exists u,v, u w v in L and |u|=|v|=|w|} \
overline("TM")(L) & := {u w v in Sigma^* | w in L and |u|=|v|=|w|}
$

*Question 2* Est-ce que $"TM"(overline("TM")(L)) = L$~? Et est-ce que $overline("TM")("TM"(L)) = L$

*Question 3* Montrer qu'il existe un langage régulier $L$ tel que $overline("TM")(L)$ ne soit pas régulier.

*Question 4* Soit $L$ un langage reconnaissable reconnu par $cal(A)$, on pose pour $q,q' in Q_cal(A)$ le langage $L_(q,q')$ des mots étiquetant un chemin de $q$ à $q'$. Montrer que $L_(q,q')$ est régulier.

*Question 5* Montrer que si $L$ est régulier, alors $"TM"(L)$ aussi.

== Langages fins
Soit $L$ un langage, on définit sa fonction de densité $delta_L : NN --> NN $ par $delta_L (n) = |Sigma^n inter L|$. On dit qu'un langage est fin si $delta_L$ est majoré par une constante $M$.

On cherche à charactériser les langages fins.

1. Montrer que pour tout $k in NN, u_1, ... u_k, v_1,..., v_k, w_1,..., w_k in Sigma^*$, le langage suivant est fin:
$ L = union.big_(i = 1)^k L( u_i v_i^* w_i) $
2. Soit $cal(A)$ un automate émondé reconnaissant un langage fin, soit $q_"init" -->^(a_1) .... -->^(a_n) q_f in F$ un chemin acceptant acyclique dans $cal(A)$. Montrer qu'il intersecte au plus un cycle.
3. En déduire la réciproque de la question 3, c'est à dire que pour tout langage fin il existe des mots $u_1,...,w_k$ tel que $L$ à la forme attendue.
4. Proposer un algorithme qui prend en entré un automate et qui indique si $cal(A)$ reconnaît un langage fin. Quel est sa complexité~? 

== Langages épars#footnote[ENS Ulm oral d'info, je ne sais plus de quand]

Soit $L$ un langage, on définit sa fonction de densité $delta_L : NN --> NN $ par $delta_L (n) = |Sigma^n inter L|$. On dit qu'un langage est épars si pour tout $k$, ultimement, on a $delta_L (n) > n^k$.

1. Proposer une condition nécessaire et suffisante sur les automates pour que le langage reconnu soit épars
2. Donner un algorithme testant si un automate reconnaît un langages épars ou non.

== Langages rationel infinis 

Un langage est dit infini s'il contient une infinité de mot. 

1. Montrer que tout langage rationnel infini est la réunion disjointe de deux langages rationnels infinis.
2. Montrer que tout langage rationnel infini sur un alphabet $Sigma^*$ contient un sous-langage non rationnel.

Soit $A,B$ deux langages, on note $A subset.double B$ si $A subset.eq B$ et que $B\\ A$ contient une infinité de mots.

3. Montrer que si $A subset.double C$ avec $A,C$ deux langages réguliers, alors il existe un langage régulier $B$ tel que $A subset.double B subset.double C$


== Racine de langage #footnote[Oral de l'X]

Soit $L$ un language régulier sur $Sigma = {a,b}$

1. Montrer que $sqrt(L) := {u in Sigma^* | u u in L}$ est régulier.
1. Montrer que pour tout $k in NN$, $sqrt(L)^k := {u in Sigma^* | u^k in L}$ est régulier.
2. ($*$) Montrer que $W(L) := {u in Sigma^* | u ^(|u|) in L}$ est régulier.

== Arithmétique de Presburger (+ déduction)

On pose $Sigma_n = {0,1}^n$ l'alphabet des vecteurs de taille $n$ à valeurs dans ${0,1}$. Par exemple,

#align(center)[
  $Sigma_3  = {mat(0 ;0 ;0), mat(1 ;0 ;0), mat(0 ;1 ;0), mat(1 ;1 ;0),... mat(1 ;1 ;1) }$
]
  
Un mot sur $Sigma_n$ peut être lu comme $n$ nombres binaire (un sur chaque ligne) tel que pour $w in Sigma_n^*$ l'on dénote $w[1], w[2],...,w[n]$. Par exemple, pour $w = mat(0 ;1 ;1) mat(1 ;1 ;0) mat(0 ;0 ;0) mat(1 ;0 ;1) in Sigma_3$, on aura $w[1] = 0101_2 = 5, w[2] = 1100_(2) = 12, w[3] = 1001_2=9$

1. Montrer que le language $L = {w in Sigma_2^* | w[1] <= w[2]}$ est régulier.
2. Est-ce que le langage $L = {w in Sigma_3^* | w[0] = w[1] times w[2]}$ est régulier~?

On définit l'arithmétique de Presburger comme les formules du premier ordre qui peuvent être construite avec le prédicat $R_+$ d'arité 3, représentant moralement $R_+(x,y,z) <=> x=y+z$, et le prédicat d'égalité. Pour cela, pour $phi$ une formule avec ${x_1,...,x_n}$ comme variable libre, on montrer par induction sur $phi$ qu'il existe un automate $cal(A)(phi)$ sur $Sigma_n$ tel que $ L(cal(A)) = {w in Sigma^*_n | phi(x_1 = w[1],...,x_n=w[n]) "est vraie"} $

3. Faites le cas des formules "$x=y$" et $R_+(x,y,z)$.
4. Montrer que si on possède un automate $cal(A)(phi)$ et un automate $cal(A)(psi)$ alors on a un automate pour $phi and psi$ et $not phi$. On fera attention aux alphabets et aux ensemble sde variables libre. On l'admettera pour $phi -> psi$ et $phi or psi$.
5. Montrer que si on possède un automate pour $cal(A)(phi)$ et que $x$ est une variable libre de $phi$ alors $cal(A)(exists x. phi)$ existe.
6. En déduire un algorithme qui prend en argument une formule du premier ordre de presburger et qui teste si elle est satisfiable.

== Cloture par sur-mot #footnote[Oral ENS Ulm, je ne sais plus quand]

Soit $Sigma$ un alphabet avec $|Sigma| > 1$. On dit que $w in Sigma^*$ est un _sous-mot_ de $u in Sigma^*$ (ou que $u$ est un _sur-mot_ de $w$), noté $w prec.eq u$, s'il existe $phi : [|1,...,|w||] --> [|1,...,|u||]$ strictement croissante telle que
  
$ forall 0<i <= |w|, w_i = u_(phi(i)) $

Pour $L$ un language, on note $hat(L) = {w in Sigma^* | exists u in L, u lt.eq w}$

1. Montrer que si $L$ est régulier, alors $hat(L)$ aussi.

On admet le lemme d'higman suivant pour l'instant: \
*Lemme d'Higman* Soit $(u_n)_(n in NN) in (Sigma^*)^NN$ une suite de mot, il existe $i<j$ tel que $u_i prec.eq u_j$

2. En addmettant le lemme d'higman, montrer que pour tout language $L$, il existe un language fini $F$ tel que $hat(F) = hat(L)$. En déduire que tout langage clos par sur-mot est régulier.
3. $(*)$ Montrer le lemme d'Higman

== Automates $(n,d)$-locaux ($*$)

On cherche à charactériser les langages réguliers de la forme $Sigma^* \\ Sigma^* I Sigma^*$ pour $I$ un ensemble de facteurs "interdit" fini. 

On dit qu'un automate $cal(A) = (A, Q, I, delta, F)$ est $(n,d)$-local avec $d <= n$ ssi $I = F = Q$ et que pour tout $q_0 -->^(a_1) q_1 -->^(a_2) ... -->^(a_n) q_n$ et $q'_0 -->^(a_1) q'_1 -->^(a_2) ... -->^(a_n) q'_n$ (de même étiquettage), on a $q_d = q'_d$. Un automate est dit local s'il est $(n,d)$-local pour des certains $n,d$.\
Attention à ne pas confondre avec la définition d'automate local du cours, qui se rapproche des automates $(1,1)$-locaux.

1. Montrer que les langages de la forme $Sigma^* \\ Sigma^* I Sigma^*$ sont reconnu par des automates locaux. 
2. Montrer que si $cal(A)$ est fortement connexe déterministe, alors $cal(A)$ est local ssi il n'existe pas de mot $w$ et deux états distincts $q,q'$ tel que $q -->^w q$ et $q' -->^w q'$.
3. Soit $cal(A)$ un automate $(n,d)$-local. On pose $I = { w in Sigma^(n+1) | not space exists p, q in Q, p -->^w q}$. Montrer que $L(cal(A)) = Sigma^* \\ Sigma^* I Sigma^*$
4. Montrer qu'il existe un algorithme polynomial pour tester si un automate fortement connexe dénote un langage local ou non.

== Langages continuables et mots primitifs
On dit qu'un langage $L$ est continuable si $forall u in L, exists v in Sigma^*$ tel que $u v in L$. 
On dit qu'un mot $w in Sigma^*$ est primitif s'il n'existe pas de $p > 1$ et de $x in Sigma^*$ tel que $x^p = w$.

1. Montrer qu'il est possible de tester si un mot $w$ est primitif en $O(|w|^(1.5))$. _C'est possible de le faire en $O(|w|)$_
2. Proposer une condition nécessaire et suffisante sur un automate pour que le langage reconnu soit continuable.
3. Montrer que tout langage continuable régulier sur $Sigma = {a,b}$ admet une infinité de mot primitif.
4. $(*)$ Montrer que tout langage continuable régulier sur $Sigma = {a,b}$ admet une infinité de mot non primitif.