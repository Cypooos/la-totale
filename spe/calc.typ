
= *MPI: Calculabilité*
== Cours
- Problème décidable, indécidable
- Le problème de l'arret est indécidable
- Réduction calculable
- Problèmes semi-décidable, co-semi-décidable (HP).
- Fonction calculable (HP)

*Question de Cours*
- Rapeller le problème de l'arret. Montrer qu'il est indécidable.
- Donner un exemple de problème semi-décidable et montrer qu'il est semi-décidable. (HP)
- Donner un exemple de problème qui n’est pas semi-décidable et le prouver. (HP)

== Indécidabilité

Montrer que les problèmes sont indécidables:

- *$epsilon$-Arret:* *Entrée:* Un programme $P$, *Sortie:* Est-ce que $P(epsilon)$ termine~?
- *$42$-Arret:* *Entrée:* Un programme $P$, *Sortie:* Est-ce que $P(42)$ termine~?
- *$not$-Arret:* *Entrée:* Un programme $P$ et une entrée $w$, *Sortie:* Est-ce que $P(w)$ ne termine pas~?
- *Equivalence:* *Entrée:* Deux programmes $P,Q$ prenant en entrée des naturels, *Sortie:* Est-ce que pour tout $n in NN$, $P(n)$ termine ssi $Q(n)$ termine~?
- *Arret-$exists$~:* *Entrée:* Un programme $P$ prenant en entrée un naturel, *Sortie:* Est-ce qu'il existe un $n$ tel que $P(n)$ termine~?
- *Arret-$forall$~:* *Entrée:* Un programme $P$ prenant en entrée un naturel, *Sortie:* Est-ce que pour tout $n in NN$ on a $P(n)$ qui termine~?

== ARRET $"Bool" -> "Bool"$ #footnote[Un mines-télécom bof de 2024]

On considère la grammaire $G$ suivante (en gras les symboles non terminaux)~:
$
bold(S) --> &"bool f (bool x[]) {" bold(I) " return false ;}"\
bold(E) --> &"true" | "false" | bold(V) | bold(E) "==" bold(E)  \
bold(V) --> &"x[i]" &forall i in NN \
bold(I) --> &"return" bold(E) " ;" | bold(B) | bold(C)\
bold(B) --> &"while ("bold(E)") {"bold(I)"}"\
bold(C) --> &"if ("bold(E)") {"bold(I)"} else {"bold(I)"}"
$

On considère $L_"bool" = L(G)$ et $L_"bool bool"$ le langage engendrée par $G$ sans la dérivation $B$. 

1. Est-ce que le problème suivant est décidable~?
  - *Entrée:*$kappa in L_"bool bool"$, 
  - *Sortie:* Est-ce que $kappa(x)$ termine (avec ou sans erreur) pour tout $x$~?
2. Soit $eta$ obtenue à partir de $bold(E)$. Montrer qu'il existe une formule $psi_eta$ tel que pour tout $nu$ une valuation, $psi_eta (nu)$  correspond à la valuer de sortie de $eta$ pour $x[i] = nu(X_i)$
3. Donner une formule équivalente à ce code 
  ```c
  if (x[0]) {
    if (x[0] == x[1]) {return false;}
    else {return true;}
  } else {
    return {x[1] == x[2];}
  }
  ```
4. Est-ce que le problème suivant est décidable~?
  - *Entrée:*$kappa in L_"bool"$, 
  - *Sortie:* Est-ce que $kappa(x)$ termine pour tout $x$~?
5. Est-ce que le problème suivant est décidable~?
  - *Entrée:*$kappa in L_"bool"$, 
  - *Sortie:* Est-ce qu'il existe $x$ tel que $kappa(x)$ termine~?

== Entrée bornée 
Montrer que le problème suivant est indécidable:
- *Entrée:* Une fonction calculable $P : NN -> NN$ qui termine toujours.
- *Sortie:* Est-ce qu'il existe un $n$ tel que $P(n) = 0$~?

== L'indécidable est partout
Soit $S$ un ensemble de string, on considère le problème $P_S$ suivant:
- *Entrée:* $s$ une chaine de caractères
- *Sortie:* Est-ce que $n in S$~?

1. Montrer qu'il existe des $S$ tel que $P_S$ est indécidable.
2. Montrer que si $C$ est infini, alors il existe $K subset.eq C$ tel que $P_K$ est indécidable. Est-ce vrai si $C$ est fini~?


== Complexité et décidabilité #footnote[tiré d'un oral d'Ulm 2021 https://a3nm.net/work/exams/ens/exercices_info_ulm_2021.pdf] <dur>

Montrer que pour toute fonction calculable $g : "String" -> NN$, il existe une fonction calculable $f : "String" -> "char"$ si complexe que pour tout programme $P$ qui calcule $f$, il existe une entrée $u in "String"$ sur laquelle $P(u)$ prend plus de $g(u)$ étapes de calcul.

/*
Soit la fonction f qui, pour son entrée u, exécute exec(u, u, g(u)).
Si exec(u, u, g(u)) ∈ {0, 1}, c’est-à-dire si exec(u, u, g(u)) ∈ {⊥} ∪ N \ {0, 1}, f (u) peut être n’importe
quelle valeur, et on fixe f (u) = 0. Si exec(u, u, g(u)) = i pour un i ∈ {0, 1}, on fixe f (u) = 1 − i.
Montrons que f satisfait la propriété désirée. Soit P un programme tel que P (u) renvoie la valeur
de f (u) en au plus g(u) étapes. Soit w la représentation du programme par un mot binaire. On a alors
exec(w, w, g(w)) = P (w), et f (w) est définit de telle sorte que exec(w, w, g(w)) 6 = f (w). On a donc
P (w) 6 = f (w).
*/

== Existence d'une quine
Donner un code OCaml non vide $w in "ASCII"^*$ tel que l'exécution de ce code affiche le `string` $w$.

== Réels calculables

1. Rappeler la représentation binaire des flottants en machine.

Les flottants machine ne peuvent pas représenter tout les nombres décimaux qui existe, et encore moins tout les réel. On introduit ici une autre manière de représenter plus de réels via des fonctions. 

Un réel $x in [0,1[$ est dit _calculable au sens de Cauchy_ s'il existe un programme $P : NN -> QQ$
tel que, pour tout $n in NN$,
$
abs(P(n) - x) <= 2^(-n).
$
On dit alors que $P$ est un _nom de Cauchy_ de $x$. On note $KK$ l'ensemble des réels calculables.

2. Montrer que tout rationnel $q in [0,1[$ est calculable.
3. Montrer que si $x,y in KK$, alors $x+y$ (quand $x + y < 1$) et $x y$ sont calculables.\
  _Ind:_ On rappelle que $|a b - a' b'| <= |a b - a b'|+ |a b' - a' b'|$.
4. Montrer que le probleme de tester si deux nombres réels sont égaux est indécidable avec cette représentation. On pourra admettre que le problème suivant est indécidble:
  - *Entrée:* Un programme $A : NN -> "bool"$ qui termine toujours
  - *Sortie:* Est-ce qu'il existe un $n$ tel que $A(n) = "true"$ ?

On dit qu'un problème de décision est _semi-décidable_ s'il existe un algorithme $A$ tel que :
- $A$ répond VRAI sur toutes les instances positives
- $A$ répond FAUX ou ne termine pas sur toutes les instances négatives.

5. Montrer que le problème suivant est semi-décidable : 
  - *Entrée:* $x,y in [0;1[$ représenté par leur nom de Cauchy.
  - *Sortie* Est-ce que $x < y$ ?
6. Montrer qu'il existe des réels qui ne sont pas calculable.

On étudie maintenant les réels calculable sur tout $RR$ et pas que $[0;1[$. On garde la meme définition, mais pour $x in RR$.

7. Montrer que $KK$ est un $QQ$-espace vectoriel.
8. $(*)$ Est-ce qu'il existe un algorithme $A : NN --> KK$ tel que $(A(n))_(n in NN)$ forme une base de $KK$ en tant que $QQ$-espace vectoriel?


== Représentation d'ensembles infini 

On se propose ici de créer une structure de données permettant de représenter un ensemble infini sous la forme d’une fonction de `'a -> bool` déterministe et qui *termine toujours*. On définit donc le type suivant en OCaml:

```ml
type 'a set = 'a -> bool;;
```

1. Donner un ensemble $A subset.eq NN$ que l’on ne pourra pas représenter avec notre structure. Le nombre d’ensembles non représentable est-t’il fini~? Dénombrable~? Indénombrable~?
2. Montrer que la fonction ```ml val is_empty: int set -> bool``` qui à un ensemble donné indique s'il est vide ou non n'est pas calculable.
3. Soit ```ml val P: int set set```, montrer qu’il existe un $N in NN$ tel que pour tout ```ml val x: int set```, dans le calcul de `P x`, `P` n'évalue `x` que sur entrées inférieure à $N$. Est-ce vrai avec ```ml val P: (int -> int) set```~?
4. ($*$) Montrer que la fonction ```ml val is_empty: (int set set) -> int set``` qui à un ```ml int set set``` donné indique s'il est vide ou non est calculable.

#pagebreak()
