
= *MPI: Langages Hors-contexte*

== Cours
- Grammaire, grammaire hors-contexte, dérivation.
- Grammaires générales, contextuelles (HP)
- Arbre d'analyse, dérivation à gauche, à droite.
- Ambiguité d'une grammaire. Ambiguité du sinon pendant.
- Forme normale de Chompsky (HP)

*Question de Cours*
- Montrer que les langages réguliers sont hors contexte par induction.
- Montrer que les langages réguliers sont hors contexte par construction de la grammaire à partir de l’automate.
- Montrer que l'intersection d'un langage régulier et d'un langages hors-contexte est hors-contexte.

*To Do*
- Sujet sur les images de Parikh 

== Langage hors-contexte
Soit $L, L'$ deux langages hors-contexte. Montrer que les langages suivants sont hors-contexte:
- ${w_1 w_1 w_2 w_2 ... w_(|w|) w_(|w|) : w in L}$
- $overline(L) = {overline(u) : u in L}$ le langages des mirroirs, avec $overline(u_1 ... u_n) = u_n ... u_1$
- $union.big_(w in L) "Pref"(w)$ pour $"Pref"(w)$ l'ensemble des préfixes de $w$
- $union.big_(w in L) S(w)$ pour $S(w)$ l'ensemble des sous-mots de $w$
- ${w_1 w_3 w_5 .... w_i : w in L}$, une lettre sur deux des mots de $L$

== Paires différentes

On pose $Sigma = {a, b}$. On considère tout d’abord les langages suivants
$ L_a &= { u a v : u,v in Sigma^* | |u| = |v|} \
L_b &= { u b v : u,v in Sigma^* | |u| = |v|} \
L_1 &= { w w' | w != w' and |w| = |w'|} $

1. Montrer que $L_a$ et $L_b$ sont hors-contexte.
2. Montrer que $L_1 = L_a L_b union L_b L_a$. En déduire que $L_1$ est hors-contexte.

On admet que $L' = {u u : u in Sigma^*}$ n'est pas hors contexte
3. Montrer que les langages hors-contexte ne sont pas stable par complémentaire.

== Autant de lettres

Soit $Sigma = {a,b}$, on pose $f : Sigma^* -> ZZ$ tel que $f(w) = |w|_a - |w|_b$. 
On considère les langages suivants:
$
L &= { w in Sigma^* | |w|_a = |w|_b } = f^(-1) ({0}) \
L_+ &"engendré par" S -> S S | a S b | epsilon\
L_- &"engendré par" S -> S S | b S a | epsilon
$

On cherche à trouver une grammaire non-ambigue pour $L$ (les mots avec autant de $a$ que de $b$)

1. Est-ce que la grammaire définissant $L_+$ est ambigue~? Donner une grammaire pour $L$ (sans preuve)
2. Montrer que $L_+$ est l'ensemble des mots $w$ tel que $f(w)=0$ et que pour tout $w'$ préfixe de $w$ on a $f(w') >=0$
3. En remarquant qu'un mot de $L_+$ commence forcément par un $a$, donner une grammaire non-ambigue pour $L_+$.
4. Donner une grammaire non-ambigue pour $L$
 est hors-contexte

== Forme normale de Chompsky

Soit $G$ une grammaire, montrer qu'il existe une grammaire équivalente à $G$ tel que toutes les règles sont soit de la forme $X -> a$ pour $a$ un symbole terminal, soit $X -> A B$ pour $A,B$ non terminaux, soit $S -> epsilon$ pour $S$ le symbole initial.

== Morphisme de langage hors-contexte

On dit que $phi : Sigma_1^* --> Sigma_2^*$ est un morphisme si pour tout $u,v in Sigma_1^*$, $phi(u v) = phi(u) phi(v)$. Montrer que si $L$ est hors-contexte, alors $phi(L)$ l'est aussi.

== Lemme d'itération pour les langages hors-contexte

On veut montrer que $L_3 = {a^n b^n c^n : n in NN}$ n'est pas hors contexte. Pour cela on montre un lemme analogue au lemme de l'étoile mais pour les langages hors-contexte.

Soit $G = (Sigma, Gamma, R, S)$ une grammaire hors-contexte reconnaissant le langage $L$. On définit $||R||_oo = max {|w| : (X -> w) in R }$

1. Montrer que si $w in L$ est un mot tel que $|w| >|Gamma| times ||R||_oo$, alors il existe $A in Gamma$ et $u,v,x,y,z in Sigma^*$ avec $x z != epsilon$ tel que $S scripts(=>)^* u A v$ et $A scripts(=>)^* x A z$ et $A scripts(=>)^* y$.
2. En déduire le lemme _d'itération pour les langages hors-contexte_: pour tout $L$ un langage hors contexte, il existe $N > 0$ tel que pour tout $w in L$ tel que $|w|>N$ il existe $u,x,y,z,v in Sigma^*$ tel que 
  - $u x y z v = w$ 
  - $u x y z v = w$  
  - $forall n in NN, u x^n y z^n v in L$  
3. En déduire que ${a^n b^n c^n : n in NN}$ n'est pas hors-contexte.
4. Montrer que l'ensemble des langages hors-contexte n'est pas stable par intersection.

== Automates à pile

On cherche à donner un modèle de calcul équivalent aux grammaires hors-contexte: les _automates à pile_. Un automate à pile est un tuple$cal(A) = (Q, Sigma, Gamma, delta, q_0, Z_0, F)$
où~:
- $Sigma$ est l'alphabet d'entrée
- $Q$ est un ensemble fini d'_états_ et $q_0 in Q$ est l'état initial,
- $Gamma$ est l'alphabet de pile, et $Z_0 in Gamma$ est le symbole initial de pile,
- $F subset.eq Q$ est l'ensemble des états finaux,
- $delta : Q times (Sigma union {epsilon}) times Gamma  --> cal(P)(Q times Gamma^*)$ est une relation finie de transition.

Une _configuration_ est un couple $(q,p) in Q times Gamma^*$. Pour $alpha in Sigma union {epsilon}$ et $beta in Z$, on dit qu'il y a _une transition_ de la configuration $(q, beta p)$ vers $(q',p' p)$ si $(q',p') in delta(q,alpha,beta)$. On note cela $ (q, beta p) -->^alpha (q', p' p). $ 

S'il existe une suite de transition $(q,p) ->^(a_1) ... ->^(a_n) (q',p')$ avec $u = a_1 ... a_n$, on note cela $(q,p) ->^u (q',p')$. Remarquer que l'on n'a pas forcément $|u| = n$. On dit qu'un mot $u$ est reconnu par $cal(A)$ si $(q_0,Z_0) -->^u (q_f,epsilon)$ avec $q_f in F$. On note par $L(cal(A))$ le langage des mots reconnu par $cal(A)$ un automate à pile. Ces automates sont connu pour être "acceptant par pile vide" dans la littérature.

1. Montrer que ${a^n b^n : n in NN}$ est un langage reconnu par un automate à pile.
2. Montrer que si un langage est régulier alors il est reconnu par un automate à pile.

On va montrer que tout langage hors-contexte est reconnu par un automate à pile. Soit $G = (Sigma, Gamma, R, S)$ une grammaire hors-contexte. On construit un automate à pile $cal(A)_G = (Q, Sigma, Gamma', delta, q, Z_0, F)$ de la manière suivante:
- On pose $Gamma' = Gamma union Sigma$, $Q = {q_0}$, $F = {q}$ et $Z_0 = S$,
- Pour chaque règle $(A -> w) in R$, on ajoute $(q, w)$ à $delta(q, epsilon, A)$,
- Pour chaque lettre terminale $a in Sigma$, on ajoute $(q, epsilon)$ à $delta(q, a, a)$.

3. Dessiner l'automate à pile associé à la grammaire $S -> a S b S | epsilon$.
4. Soient $u in Sigma^*$ et $p in (Gamma union Sigma)^*$. Montrer que $(q,S)-->^u (q',p')$ si et seulement si $S scripts(=>)^* u p$
5. Montrer que $L(cal(A)_G) = L(G)$, et en déduire que tout langage hors-contexte est reconnu par un automate à pile.

On va maintenant montrer la réciproque par la méthode des triplets de Ginsburg. Soit $cal(A) = (Q, Sigma, Gamma, delta, q, Z_0, F)$ un automate à pile. Pour tout $q,q' in Q$ et $gamma in Gamma$, on pose
$ L_([q, gamma, q']) = {u in Sigma^* | (q, gamma) -->^u (q',epsilon) } $

6. Montrer que si $(q, gamma) -->^u (q',epsilon)$, alors pour tout $p in Gamma^*$ on a $(q, gamma p) -->^u (q',p)$.
7. Montrer que, pour tout $q,q' in Q$ et $gamma in Gamma$,
$
L_([q,gamma,q'])
&=
{ alpha in Sigma union {epsilon} : (q,gamma) -->^alpha (q',epsilon) }
union\
&union.big_(alpha in Sigma union {epsilon})
quad
union.big_(
  (q,gamma) -->^alpha (q_1,gamma_1 ... gamma_k)
)
quad
union.big_(q_2,...,q_(k-1) in Q)
quad
alpha
L_([q_1,gamma_1,q_2])
L_([q_2,gamma_2,q_3])
...
L_([q_(k-1),gamma_k,q'])
$

8. En déduire qu'il existe une grammaire $G = (Sigma, Gamma', R, S)$ avec $Gamma' = Q times Gamma times Q$ tel que $L(G) = L(cal(A))$


== Mélange et grammaires
On fixe $Sigma = {a,b,c}$. Pour deux mots $u,v in Sigma^*$, on dit que $w in Sigma^*$ est un entrelacement de $u$ et $v$ s'il existe une partition ${i_1,...,i_n} union {j_1,...,j_m}$ de $[|1;|w| |]$ avec $i_1 < ... < i_n$ et $j_1 < ...< j_m$ tel que $u = w_(i_1)...w_(i_n)$ et $v = w_(j_1) ... w_(j_m)$. On note $u sha v$ l'ensemble des entrelacements de $u$ et $v$.

Pour $L,L'$ deux langages sur $Sigma$, on définit
$ L sha L' = union.big_(u in L\ v in L') u sha v $

1. Donner $"ab" sha "ac"$.
2. Proposer un algorithme qui prend en entrée $u,v,w in Sigma^*$ et qui teste si $w in u sha v$.

On admet que $L_3 = {a^n (b c)^n a^n : n in NN}$ n'est pas un langage hors-contexte.

3. Est-ce que si $L,L'$ sont hors-contexte, alors $L sha L'$ est forcément hors-contexte?
4. Montrer que si $L$ est hors-contexte et $R$ régulier, alors $L sha R$ est hors-contexte.


== Circular shift

Soit $L$ un langage. On définit
$
"Circ"(L) = { u v | v u in L }.
$

*Question 1* Montrer que si $L$ est régulier, alors $"Circ"(L)$ l'est aussi.

On cherche maintenant à généraliser le résultat pour les langages hors-contexte. Soit $G = (Sigma, Gamma, R, S)$ une grammaire hors-contexte telle que $L = L(G)$. Pour $A in Gamma$, on pose 
$
  C_(A) = {v u in Sigma^* | S scripts(=>)^* u A v }
$

*Question 2* Montrer que pour tout $A in Gamma$, $C_(A)$ est hors-contexte.

*Question 3* Montrer que pour tout $u, v in Sigma^*$ tel que $u v in L \\ {epsilon}$, il existe $A in Gamma$ et $x,y in Sigma^*$ et $x',y' in (Sigma union Gamma)^*$ tel que $S scripts(=>)^* x A y$ et $A scripts(=>)^1 x' y'$ avec $x x' scripts(=>)^* u$ et $y y' scripts(=>)^* v$

Soit $A -> w_1... w_n$ une règle de $G$, pour tout $0<= i <= n$, on pose $L_A^(i-) = {u in Sigma^* | w_1 ... w_i scripts(=>)^* u}$ et $L_A^(i+) = {u in Sigma^* | w_(i+1) ... w_n scripts(=>)^* u}$. On remarque qu'ils sont presque par définition hors conexte.

*Question 4* En considérant le langage suivant, montrer que $"Circ"(L)$ est hors-contexte:
$
E union union.big_((A -> w_1... w_n) in R) union.big_(0<=i <= n) L_A^(i-) C_(A) L_A^(i+)
$
où $E = {epsilon}$ si $epsilon in L$, et $E = emptyset$ sinon.

== Théorème de Chomsky-Schützenberger#footnote[Exos de la martinière MPI]

Soit $n in NN^*$, on définit $Sigma_n = {a_1, overline(a_1),..., a_n, overline(a_n)}$. Les lettres $a_i$ représentent des parenthèses ouvrantes et les lettres $overline(a_i)$ représentent des parenthèses fermanantes.

On considère la grammaire $cal(G)_n$ engendrée par les règles
#align(center)[$S -> a_1 S overline(a_1) S | ... | a_n S overline(a_n) S | epsilon$]

On pose $D_n = L(cal(G)_n)$ le langage des mots de dyck engendrée par $cal(G)_n$.

1. Donner un arbre de dérivation pour le mot $a_1 a_2 overline(a_2) overline(a_1) a_3 overline(a_3)$

On dit que $phi : Sigma_1^* -> Sigma_2^*$ et un morphisme de mot si $forall u v in Sigma^*_1, phi(u v) = phi(u) phi(v)$

2. Donner une expression régulière dénotant $phi(D_1)$ pour $phi$ telle que $phi(a_1) = a a$ et $phi(overline(a_1)) = a$
3. Montrer que si $L$ est régulier alors $phi(L)$ aussi. Meme question si $L$ est hors-contexte.

On s'intéresse à montrer le théorème de Chomsky-Schützenberger:

#align(center)[
  Un langage $L$ est hors-contexte si et seulement il existe un langage régulier $K$,\
  un langage de Dyck $D_n$ et un morphisme alphabétique $phi$ tels que $L = phi(D_n inter K)$.
]

4. Montrer que l'intersection d'un langage régulier et d'un langage hors-contexte est hors-contexte. En déduire un sens du théorème.

On admet que tout grammaire peut être mise en forme normale de Chompsky, c'est à dire que toutes les règles de la grammaire sont soit $X -> Y Z$, soit $X -> alpha$ ou soit $S -> epsilon$ avec $Y,Z in Gamma$ et $alpha in Sigma$ et $S$ le symbole initial.

Soit $G = (Sigma, Gamma, S, R)$ une grammaire hors-contexte sous forme normale de chompsy. On ordonne les $k := |R|$ règles $r_1,...,r_k$. On pose $G' = (Sigma', Gamma', S, R')$ avec:
$ Sigma' = Sigma union {overline(alpha) : alpha in Sigma} union union.big_(i in [k]) { a_i, overline(a_i), b_i, overline(b_i), c_i, overline(c_i) } $

Et les règles $R'$ sont: 
- $X -> a_i b_i Y overline(b_i) c_i Z overline(c_i) overline(a_i) $ pour chaque $r_i = X -> Y Z$
- $X -> alpha overline(alpha)$ pour toute règle de la forme $X -> alpha$

5. Donner un morphisme de mot $phi$ tel que $L(G) = phi(L(G'))$
6. Proposer un langage régulier $K$ tel que $K inter D_n = L(G)$. Conclure la preuve du théorème.


== Image de Parikh de langage #footnote[Tiré d'une preuve simplifié https://arxiv.org/pdf/2301.00047]


1. Montrer que tous les langages régulier sont hors-contexte.

On cherche à montrer que la réciproque est vraie sur $Sigma = {a}$. Pour cela, on va étudier l'image de parikh d'un langage. 

Soit $Sigma = {a_1, ..., a_k}$ un alphabet fini. Pour un mot $w in Sigma^*$, on définit son _image de Parikh_ par $Psi(w) = (|w|_(a_1), ..., |w|_(a_k)) in NN^k$. Pour un langage $L subset.eq Sigma^*$, on pose $Psi(L) = {Psi(w) : w in L} subset.eq NN^k.$

Un ensemble $S subset.eq NN^k$ est dit _linéaire_ s'il existe $b, p_1, ..., p_m in NN^k$
tels que
$
S = { b + lambda_1 p_1 + ... + lambda_m p_m : (lambda_1,...,lambda_m) in NN^m }.
$

Un ensemble est dit _semi-linéaire_ s'il est union finie d'ensembles linéaires.

1. Calculer l'image de Parikh des langages suivants:
  - $L_1 = {a^n b^n : n in NN}$,
  - $L_2 = {a^n b^m c^(n+m) : n,m in NN}$,
  - $L_3 = L(a b^*)$,
2. Montrer que si $A,B subset.eq NN^k$ sont semi-linéaire, alors $A union B$ et $A + B$ le sont aussi.
3. Montrer que si $L$ est régulier, alors $Psi(L)$ est semi-linéaire.

On admet que tout grammaire peut être mise en forme normale de Chompsky, c'est à dire que toutes les règles de la grammaire sont soit $X -> Y Z$, soit $X -> alpha$ ou soit $S -> epsilon$ avec $Y,Z in Gamma$ et $alpha in Sigma$ et $S$ le symbole initial. Soit $G = (Sigma, Gamma, R, S)$ une grammaire hors-contexte sous forme normale de Chompsky. 

On dit d'un arbre de dérivation $T$ d'un mot $w in (Sigma union Gamma)^*$ qu'il est un _arbre plein_ si $w in Sigma^*$ et que c'est un _arbre-bloc_ un arbre de dérivation si $w$ est de la forme $u A v$ pour $A in Gamma$ et $u,v in Sigma^*$. Pour un arbre plein $T$ on pose $Psi(T) = Psi(w)$ et pour un arbre-bloc $T_w$ de forme $A scripts(=>)^* u A v$, on pose $Psi(T) = Psi(u v)$.

4. Donner un exemple d'arbre-bloc pour la grammaire $S -> a S b | epsilon$. Calculer son image de Parikh.

Soit $T$ un arbre de dérivation. On dit que $T$ est _minimal_ s'il ne contient pas strictement un arbre-bloc comme sous-arbre.

5. Montrer qu'un arbre minimal ne peut pas contenir deux occurrences d'un même non-terminal sur une même branche.

TODO: FINISH.

