
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

#let shuffle = $union.sq #h(-5pt) union.sq$

On fixe $Sigma = {a,b,c}$. Pour deux mots $u,v in Sigma^*$, on dit que $w in Sigma^*$ est un entrelacement de $u$ et $v$ s'il existe une partition ${i_1,...,i_n} union {j_1,...,j_m}$ de $[|1;|w| |]$ avec $i_1 < ... < i_n$ et $j_1 < ...< j_m$ tel que $u = w_(i_1)...w_(i_n)$ et $v = w_(j_1) ... w_(j_m)$. On note $u shuffle v$ l'ensemble des entrelacements de $u$ et $v$.

Pour $L,L'$ deux langages sur $Sigma$, on définit
$ L shuffle L' = union.big_(u in L\ v in L') u shuffle v $

1. Donner $"ab" shuffle "ac"$.
2. Proposer un algorithme qui prend en entrée $u,v,w in Sigma^*$ et qui teste si $w in u shuffle v$.

On admet que $L_3 = {a^n (b c)^n a^n : n in NN}$ n'est pas un langage hors-contexte.

3. Est-ce que si $L,L'$ sont hors-contexte, alors $L shuffle L'$ est forcément hors-contexte?
4. Montrer que si $L$ est hors-contexte et $R$ régulier, alors $L shuffle R$ est hors-contexte.


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

== Algorithme CYK

Une grammaire non-contextuelle $G$ pondéré est un n-uplet $(Gamma,Sigma,S,R, rho)$ tel que $(Gamma,Sigma,S,R)$ soit une grammaire non-conextuelle, et $rho : R --> RR_+$ soit une pondération qui a chaque règle $X -> w$ associe un poids $rho(X -> w)$.

Pour $w => w'$ une dérivation avec $w = u A v$ et $w' = u z v$, on défini le poids de la dérivation $rho(w => w') = rho(A -> z)$. Pour $D = (S => w_1 => ... => w_n)$ une séquence de dérivation, on définit son poids $rho(D)$ comme la somme des poids des $n$ dérivations. 

Pour $w in Sigma^*$, on définit $rho(u)$ le poid de $u$ pour $G$ comme le poid minimal d'une série de dérivation de $u$ si $u in L(G)$ et $+oo$ sinon. Soit $G$ une grammaire non-contextuelle pondéré sur $Sigma$ un alphabet, on cherche à calculer le poids minimal d'un mot $u$.

1. Est-ce que le poid minimal existe toujours? Est-ce que le poid maximal existe toujours?

On admet qu'un grammaire peut etre ramené à une grammaire ou la seule règle de la forme $X --> epsilon$ est pour $X = S$.

Soit $u in Sigma^*$, $1 <= i <= j < |u|$ et $X in Gamma$, on pose $ P[i,j,X] = min {rho(D) | D "une dérivation" X scripts(=>)^* m_i...m_j } $

2. Proposer une relation de récurrence pour les $P[i,j,X]$
3. En déduire un algorithme de programmation dynamique pour résoudre le problème. Quelle est la complexité?
4. Pourquoi ne pas avoir de règle de la forme $X -> epsilon$ pour $X != S$ est important?

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


== Sens réciproque de Ginsburg-Spanier

Soit $Sigma$ un alphabet fini. Un langage $L subset.eq Sigma^*$ est dit _borné_ s'il existe $u_1,...,u_k in Sigma^+$ tels que $L subset.eq u_1^* ... u_k^*.$ Pour un tel langage, on définit son _ensemble d'exposants_ $E(L)$ par
$
E(L) = { (n_1,...,n_k) in NN^k : u_1^(n_1) ... u_k^(n_k) in L }.
$

Un ensemble $S subset.eq NN^k$ est dit _linéaire_ s'il existe $b, p_1, ..., p_m in NN^k$ tels que
$
S = { b + lambda_1 p_1 + ... + lambda_m p_m : (lambda_1,...,lambda_m) in NN^m }.
$
Les vecteurs $p_i$ sont appelés _périodes_. On note $"Supp"((x_1,...,x_k)) = { i : x_i != 0 }.$ le support d'un vecteur. Un ensemble linéaire $S$ est dit _stratifié_ si :
- pour toute période $p_i$, on a $|"Supp"(p_i)| <= 2$ et 
- il n'existe pas deux périodes de supports ${a,b}$ et ${a',b'}$, avec $a<b$ et $a'<b'$, telles que $a < a' < b < b'.$

Un ensemble est _semi-linéaire stratifié_ s'il est union finie d'ensembles linéaires stratifiés.

On va prouver un des deux sens du théorème de Ginsburg-Spanier, qui affirme que pour $L$ un langage bornée, on a
$
L " est hors-contexte "
<==>
E(L) " est semi-linéaire stratifié".
$


Soit $L$ un langage bornée tel que $E(L)$ est *linéaire* (pas semi-linéaire) stratifié via $b, p_1, ..., p_m in NN^k$. Pour chaque $0 < i <= j <= k$, on ajoute un symbole non terminal $H_(i,j)$ tel que $H_(i,j)$ engendre les $L inter L(u_1^* ... u_j^*)$.
1. Pour $"Supp"(p) = {i}$, proposer des règles de grammaire pour $H_(i,i)$. Attention à ne pas oublier l'impact du vecteur $b$.
2. Pour $"Supp"(p) = {i,j}$ avec $i< j$, proposer des règles de grammaire pour $H_(i,j)$ en fonction de $H_(i+1,j-1)$
3. En déduire une grammaire $G$ tel que $E(L(G)) = E(L)$.
4. Conclure sur le sens réciproque

// 
// == Théorème de Ginsburg-Spanier
// 
// Soit $Sigma$ un alphabet fini et $L$ un langage sur $Sigma$. $L$ est dit _bornée_ s'il existe $u_1,...,u_k in Sigma^*$ tel que $L subset.eq L(u_1^* ... u_k^*)$.
// 
// Pour $L$ un langage bornée par $u_1,...,u_k in Sigma^*$, on définit son _nombre d'exposants_
// $ 
// E(L) = { (n_1,...,n_k) in NN^k | u_1^(n_1) ... u_k^(n_k) in L}
// $
// 
// Un ensemble $S subset.eq NN^k$ est dit _linéaire_ s'il existe $b, p_1, ..., p_m in NN^k$
// tels que
// $
// S = { b + lambda_1 p_1 + ... + lambda_m p_m : (lambda_1,...,lambda_m) in NN^m }.
// $
// 
// Les $(p_i)_i$ sont nommé _périodes_. On note $"Supp"((x_1,...,x_k)) = {i : x_i != 0}$ _le support_ d'un $(x_1,...,x_k) in NN^k$.
// Un ensemble linéaire est dit _stratifié_ si $forall i, |"Supp"(p_i)| <= 2$ et que pour deux périodes $p_i, p_j$ de support de cardinal 2 que l'on écrit $"Supp"(p_i) = {a,b}$ et $"Supp"(p_j) = {a',b'}$, on ai pas $a < a' < b < b'$.
// 
// On cherche à montrer le théorème de Ginsburg-Spanier, qui dit qu'un langage $L$ bornée est non-contextuel ssi son nombre d'expossants est semi-linéaire stratifié. 
// 
// Soit $L$ un langage bornée tel que $E(L)$ est linéaire stratifié via $b, p_1, ..., p_m in NN^k$.
// Pour chaque période $p_i = (x_1,...,x_k)$ on crée un symbole non terminal $X_(p_i)$, tel que:
// - Si $"Supp"(p_i) = {a}$ alors $X_(p_i)$ reconnait les mots ${ w_a^(lambda x_a) : lambda in NN }$
// - Si $"Supp"(p_i) = {a,b}$ alors $X_(p_i)$ reconnait les mots ${ w_a^(lambda x_a) w_(a+1)^(lambda_1) ... w_(b-1)^(lambda_t) w_b^(lambda x_b) : lambda in NN, (underbrace(0\,...\,0,a+1 "fois"),lambda_1,...,lambda_t, underbrace(0\,...\,0,k-b+1 "fois")) in E(L) }$
// 1. Proposer des règles de grammaire pour les $X_(p_i)$
// 2. Proposer une règle à ajouter sur un symbole initial $S$ pour avoir que $E(L(S)) = E(L)$.
// 3. En déduire un sens du théorème.
// 
// On cherche à montrer l'autre sens. Soit $L$ un langage non-contextuel borné. On admet que $L$ peut être mise en forme normale de Chomsky, c'est à dire que toutes les règles de la grammaire sont soit $X -> Y Z$, soit $X -> alpha$ ou soit $S -> epsilon$ avec $X,Y,Z in Gamma$, $alpha in Sigma$ et $S$ le symbole initial.
// 
// 
// 
// 

// Un ensemble est dit _semi-linéaire stratifié_ s'il est union finie d'ensembles linéaires stratifié. Un ensebmel 


// 1. Calculer l'image de Parikh des langages suivants:
//   - $L_1 = {a^n b^n : n in NN}$,
//   - $L_2 = {a^n b^m c^(n+m) : n,m in NN}$,
//   - $L_3 = L(a b^*)$,
// 2. Montrer que si $A,B subset.eq NN^k$ sont semi-linéaire, alors $A union B$ et $A + B$ le sont aussi.
// 3. Montrer que si $L$ est régulier, alors $Psi(L)$ est semi-linéaire.

// On cherche à montrer le théorème de Ginsburg-Spanier: Si $L$ est bornée, alors $L$ est hors-contexte ssi son nombre d'exposant est semi-linéaire stratifié.




// Un ensemble est dit _semi-linéaire_ s'il est union finie d'ensembles linéaires.


// //On dit que $L$ est _stable par permutation des lettres_ si pour tout $w_1...w_n in L$ et pour toutes permutations $sigma : [|1;n|] --> [|1;n|]$ on a $w_(sigma(1)) ... w_(sigma(n)) in L$.

// Pour un mot $w in Sigma^*$, on définit son _image de Parikh_ par $Psi(w) = (|w|_(a_1), ..., |w|_(a_k)) in NN^k$. Pour un langage $L subset.eq Sigma^*$, on pose $Psi(L) = {Psi(w) : w in L} subset.eq NN^k.$

// Un ensemble $S subset.eq NN^k$ est dit _linéaire_ s'il existe $b, p_1, ..., p_m in NN^k$
// tels que
// $
// S = { b + lambda_1 p_1 + ... + lambda_m p_m : (lambda_1,...,lambda_m) in NN^m }.
// $

// Un ensemble est dit _semi-linéaire_ s'il est union finie d'ensembles linéaires.


// Le thérème de Parikh dit que si $L$ est non-contextuel, alors $Psi(L)$ est semi-linéaire. La preuve (exercice suivant) est dure, on cherche à prouver une version plus simple seulement sur des $L$ stable par permutation des lettres.

// Un langage $L$ est dit _trié_ si $L subset.eq L(a_1^* ... a_n^*)$ pour un certain ordre $a_1 < ... < a_n$ des lettres de $Sigma$.

// 4. Montrer que si $L$ est un langage non-contextuel stable par permutation alors il existe un langage trié $R$ non-contextuel tel que $Psi(L) = Psi(R)$.

// On admet que tout grammaire peut être mise en forme normale de Chomsky, c'est à dire que toutes les règles de la grammaire sont soit $X -> Y Z$, soit $X -> alpha$ ou soit $S -> epsilon$ avec $X,Y,Z in Gamma$, $alpha in Sigma$ et $S$ le symbole initial.

// Soit $G = (Sigma, Gamma, R, S)$ une grammaire hors-contexte sous forme normale de Chomsky reconnaissant $L$ un langage non-contextuel trié. On ordonne nos lettres $a_1,...,a_n$ telles que $L subset.eq L(a_1^* ... a_n^*)$. On suppose que $epsilon in.not L$.

// Pour $A in Gamma$ et $1 <= i <= j <= |Sigma|$, on introduit un nouveau symbole non-terminal $A_(i,j)$. L'idée est que $A_(i,j)$ représente les dérivations de $A scripts(=>)^* w$ telle $w subset.eq L(a_i^* a_(i+1)^* ... a_j^*)$.



// 5. TODO

== Théorème de Parikh (TODO: Vérifier) #footnote[Tiré d'une preuve simplifié https://arxiv.org/pdf/2301.00047]


1. Montrer que tous les langages régulier sont non contextuels.

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

On admet que tout grammaire peut être mise en forme normale de Chomsky, c'est à dire que toutes les règles de la grammaire sont soit $X -> Y Z$, soit $X -> alpha$ ou soit $S -> epsilon$ avec $X,Y,Z in Gamma$, $alpha in Sigma$ et $S$ le symbole initial. Soit $G = (Sigma, Gamma, R, S)$ une grammaire hors-contexte sous forme normale de Chomsky.

On dit d'un arbre de dérivation $T$ d'un mot $w in (Sigma union Gamma)^*$ qu'il est un _arbre plein_ si $w in Sigma^*$ et que c'est un _arbre-bloc de $A in Gamma$_ si $A scripts(=>)^* w$ avec $w = u A v$ pour $A in Gamma$ et $u,v in Sigma^*$. Pour un arbre plein $T$ on pose $Psi(T) = Psi(w)$ et pour un arbre-bloc $T_w$ de forme $A scripts(=>)^* u A v$, on pose $Psi(T) = Psi(u v)$.

4. Donner un exemple d'arbre-bloc pour la grammaire $S -> a S b | epsilon$. Calculer son image de Parikh.

On dit qu'un arbre $T'$ est un sous-arbre de $T$ si on retrouve $T'$ en entier de manière connexe dans $T$ (pas forcément à la racine, et $T$ peut continuer après les feuilles de $T'$). Soit $T$ un arbre de dérivation. On dit que $T$ est _minimal_ s'il ne contient pas strictement un arbre-bloc comme sous-arbre.

5. Montrer qu'un arbre plein minimal ne peut pas contenir deux occurrences d'un même non-terminal sur une même branche. 

Le meme lemme est vrai sur les arbre-bloc minimal par une preuve simmilaire que l'on admet: ils ne peuvent pas contenir deux occurrences d'un même non-terminal sur une même branche, sauf les deux occurrences de $A$ qui définissent l'arbre bloc.

6. En déduire qu'il n'existe qu'un nombre fini d'arbres minimaux pleins et d'arbres-blocs minimaux, à isomorphisme près.
7. Soit $T$ un arbre plein non minimal. Montrer qu'il existe un sous-arbre-bloc strict $B$ de $T$ tel qu'en supprimant $B$, on obtient un arbre de dérivation $T'$ vérifiant $Psi(T) = Psi(T') + Psi(B).$

On appelle cette opération une _compression_.
8. Montrer qu'en appliquant successivement des compressions, tout arbre plein $T$ se décompose en un arbre plein minimal $T_0$, et une famille finie d'arbres-blocs minimaux $B_1, ..., B_r$, tels que
$
  Psi(T) = Psi(T_0) + sum_(i <= r) Psi(B_i).
$

Soient $T_1,T_2$ deux arbres minimaux. On dit qu'un arbre $T$ est une _composition_ de $T_1$ et $T_2$ si $T_2$ à pour racine un $A in Gamma$ et que $T$ s'obtient en remplacant une occurrence d'une feuille de $T_1$ par $T_2$.

9. Montrer que, si $T$ est une composition de $T_1$ et $T_2$, alors
$
  Psi(T) = Psi(T_1) + Psi(T_2).
$

On appelle _multiensemble bien formé_ un multiensemble $M$ d'arbres minimaux tel qu'en composant successivement ses arbres, on obtient un arbre plein.

10. Montrer que si $M$ est bien formé et se compose en un arbre plein $T$, alors, en tenant compte des multiplicités,
$
  Psi(T) = sum_(U in M) Psi(U),
$
11. Montrer que tout arbre plein $T$ peut être décomposé en un multiensemble bien formé $M_T$ d'arbres minimaux. _Indication :_ si $T$ n'est pas minimal, extraire un sous-arbre-bloc strict, puis recommencer.
12. Soit $M$ un multiensemble bien formé d'arbres minimaux. On suppose qu'un arbre-bloc minimal $B$ apparaît dans $M$. Montrer que le multiensemble $M union {B}$ est encore bien formé. 
13. Soit $M$ un multiensemble bien formé d'arbres minimaux. On suppose qu'un arbre-bloc minimal $B$ apparaît au moins deux fois dans $M$. Montrer que l'on peut supprimer une occurrence de $B$ et obtenir encore un multiensemble bien formé.
14. Soient $M$ et $M'$ deux multiensembles d'arbres minimaux. On suppose que :
  - $M$ est bien formé,
  - $M$ et $M'$ contiennent le même arbre plein minimal,
  - pour tout arbre-bloc minimal $B$, $B$ apparaît dans $M$ si et seulement si $B$ apparaît dans $M'$.

  Montrer que $M'$ est bien formé.

Pour un multiensemble bien formé $M$, contenant un unique arbre plein minimal $T_0$, on note $M^0$ l'ensemble obtenu en supprimant les répétitions dans $M$.

On définit
$
  "Lin"(M^0)
  =
  {
    Psi(M^0) + sum_(B in M^0\ B " bloc") lambda_B Psi(B)
    : lambda_B in NN
  }.
$

15. Montrer que $"Lin"(M^0) subset.eq Psi(L(G))$.
16. Montrer que $Psi(T) in "Lin"(M_T^0)$ pour tout arbre plein $T$, où $M_T$ est une décomposition de $T$ en arbres minimaux.
17. Montrer qu'il n'y a qu'un nombre fini de possibilités pour $M_T^0$ lorsque $T$ parcourt tous les arbres pleins de $G$.
18. Conclure que $Psi(L(G)) = union.big_(M^0) "Lin"(M^0)$, où l'union porte sur un nombre fini d'ensembles $M^0$.
19. En déduire que si $L$ est hors-contexte, alors $Psi(L)$ est semi-linéaire. Ce résultat s'appelle le _théorème de Parikh_.
20. Montrer que si $S subset.eq NN^k$ est semi-linéaire alors il existe un langage régulier $L$ tel que $Psi(L) = S$.
21. En déduire que sur $Sigma = {a}$, tout langage hors-contexte est régulier.

