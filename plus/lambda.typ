= *Plus: Lambda calcul et Types*

== Cours

Pas besoin de cours, les exercices dans l'ordre suffisent !

== Introduction et $alpha$-renommage

Soit $cal(V)$ un ensemble dénombrable de variable. On définit l'ensemble $Lambda$ des lambda-termes par induction par :
- Pour toute variable $x in cal(V)$, on a $x in Lambda$
- Si $e_1, e_2 in Lambda$, on a $e_1 e_2 in Lambda$ (_l'application de $e_1$ par $e_2$_)
- Si $e in Lambda$ et $x in cal(V)$, on a que $lambda x. e in Lambda$ (_l'abstraction de $x$ dans $e$_)

Pour les questions d'algorithmique, on pourra représenter les lambda-terme par le type OCaml suivant (les variables $cal(V)$ seront assimilées a des entiers)
```ml
type lambda = | Var of int | App of lambda * lambda | Abs of int * lambda 
```


On utilisera des parenthèses pour lever les ambiguitée de ces règles. par défault, le parenthésage est à gauche, on a donc $lambda x. a space b space c = lambda x. ((a space b) space c)$. L'idée est que $lambda x. e$ représente la fonction $x |-> e$ et que $e_1 e_2$ représente la fonction $e_1$ évalué par $e_2$, comme en OCaml (```ocaml f 45```).

On définit par induction sur $e in Lambda$ l'ensemble des _variables libres_ $"FV"(e)$ par 
$
  "FV"(x) &= {x} &("pour" x in cal(V))\
  "FV"(e_1 e_2) &= "FV"(e_1) union "FV"(e_2)\
  "FV"(lambda x. e') &= "FV"(e') \\ {x}
$

L'ensemble des variables est définit par induction par
$
  "Var"(x) &= {x} &("pour" x in cal(V))\
  "Var"(e_1 e_2) &= "Var"(e_1) union "Var"(e_2)\
  "Var"(lambda x. e') &= "Var"(e') union {x}
$

1. Coder ```ml get_free (l:lambda) : int list``` qui renvoie la liste des variables libres. Quel est la complexité de votre fonction? Justifier que l'on peut le faire en $O(n log n)$ (on ne vous demande pas de le faire) 

On définit inductivement l'opération de substitution $e[x <- a]$ pour $x in cal(V)$ et $e,a in Lambda$ inductivement par 
$ e[x <- a] := cases(
  a &"si" e=x,
  e &"si" e in cal(V)\\{x},
  e_1[x <- a] space e_2[x <- a] &"si" e = e_1 e_2,
  lambda x. e' &"si" e = lambda x. e',
  lambda y. (e'[x <- a]) &"si" e = lambda y. e' "avec" y in cal(V)\\ {x},
) $

Informellement, $e[x <- a]$ est $e$ dans laquelle on a remplacé toutes les occurrences de la variable libre $x$ par $a$. Une variable $z$ est dite _liée_ si elle apparait dans une sous-expression de la forme $lambda z.e$.

2. Coder ```ml subst (e:lambda) (x:int) (a:lambda) : lambda``` qui effectue la substitution de $x$ par $a$ dans $e$.

On définit la relation d'alpha-équivalence $scripts(equiv)_alpha$ inductivement par 
- Pour tout $x in cal(V)$, on a $x scripts(equiv)_alpha x$
- Si $e_1 scripts(equiv)_alpha e'_1$ et $e_2 scripts(equiv)_alpha e'_2$, alors $e_1 e_2 scripts(equiv)_alpha e'_1 e'_2$
- Si $e [x <- z] scripts(equiv)_alpha e' [y <- z]$ pour $z in cal(V) \\ ("Var"(e) union "Var"(e'))$, alors $lambda x. e scripts(equiv)_alpha lambda y. e'$



3. Montrer que $lambda x. lambda y. x y scripts(equiv)_alpha lambda y.lambda x. y x$. Est-ce que $lambda x. lambda y. y scripts(equiv)_alpha lambda x. lambda x. x$ ?
4. Montrer que $scripts(equiv)_alpha$ est une relation d'équivalence.
5. Montrer que si $e scripts(equiv)_alpha e'$, alors $"FV"(e) = "FV"(e')$.
6. Montrer que si $e_1 scripts(equiv)_alpha e_2$, alors $e_1[x <- e'] scripts(equiv)_alpha e_2[x <- e']$

L'alpha-équivalence est assez bien comprise et assez peu étudiée: elle correspond au fait que des noms de variables différents ont utillisé dans le code, sans changer fondamentalement le lambda-terme ni son évaluation / son sens. Un exercice sera fait sur une forme canonique pour l'alpha équivalence, apellée la représentation en indice de Bruijn. Dans tout les autres exercices, sauf si explicitement dit, on considère les termes à alpha-équivalence près.

== Evaluation (béta-réduction)

Un _redex_ est un terme de la forme $(lambda x. e) e'$. L'évaluation d'un tel redex est le terme $e[x <- e']$. Par exemple, cela correspond au fait que ```ocaml (fun x -> add x x) 42``` s'évalue en ```ocaml add 42 42```. Un terme $e$ se _dérive_ en $e'$ si il existe un sous-terme de $e$ qui soit un redex, et tel que $e'$ est obtenu en remplaçant ce redex par son évaluation. On note cela $e -> e'$. Par exemple, $lambda y. (lambda x. x) z -> lambda y. z$.

On apelle aussi cela une _béta-réduction_ de $e$ et dans la littérature on le note aussi souvent $e scripts(->)_beta e'$.

Un terme est dit en _forme normale_ si il n'existe aucune dérivation possible depuis ce terme. On appelle _un calcul_ de $e$ une suite de dérivation finie $e -> e_1 -> ... -> e_n$. On note cela $e scripts(->)^n e_n$, ou tout simplement $e scripts(->)^* e_n$. Si $e scripts(->)^* e'$ avec $e'$ sous forme normale, on appelle cela un calcul normalisant. Si tout les calculs depuis $e$ sont fini, on dit que $e$ est fortement normalisant.

On pose $I := lambda x.x$, $K := lambda y. lambda x.y$, $Delta := lambda x. x x$

1. Donner un calcul normalisant de $I I$, de $K K I$, et de $K I Delta$
2. Montrer que $Delta Delta$ ne possède pas de calcul normalisant. 
3. Montrer que si $e in Lambda$ est sous forme normale, alors on peut décomposer $e$ de la forme $ lambda x_1. lambda x_2. ... lambda x_n. (((y space e_1) ...) e_k) $ avec $e_1,..., e_k$ en forme normale et $y in cal(V)$. En déduire un algorithme pour tester si un lambda-terme est sous forme normale ou non.

== Graphe de réduction

Soit $e in Lambda$, on pose $G_e = (V_e, E_e)$ le graphe orienté de la béta-réduction, avec
$
V_e &:= { M in Lambda | e scripts(->)^* M}\
E_e &:= { (e,e') in V_e^2 | e scripts(->) e'}\
$

Par exemple, comme $Delta Delta -> Delta Delta$ est la seule réduction possible depuis $Delta Delta$, on a que $G_(Delta Delta)$ est un graphe avec un seul sommet ($Delta Delta$) et une boucle.

1. Donner le graphe des réductions de $K I (Delta Delta)$ et de $Delta ((lambda x.Delta) I)$
2. Donner une expression donnant un graphe des réduction infinis
3. Montrer que le graphe des réduction de $e$ est acyclique fini ssi $e$ est fortement normalisant.
4. Montrer que $e$ à un nombre fini de calcul possible ssi $e$ est fortement normalisant.#footnote[Ceci est similaire à la preuve du _lemme de Konig_.]
5. (\*) Montrer que pour tout $n in NN$, il existe un lambda-terme $e_n in Lambda$ tel que $G_(e_n)$ soit le cycle de longeur $n$.

== Encodage des booléens et entiers

On pose $top := lambda x. lambda y. x$, $bot := lambda x. lambda y. y$ et $"if" := lambda b. lambda e_top. lambda e_bot. b e_top e_bot $. On pose $B = {top,bot}$.

1. Montrer que $"if" top space e space e' scripts(->)^* e$ et $"if" top space e space e' scripts(->)^* e'$.
2. Définir un lambda-terme $"not" in Lambda$ tel que $"not" top scripts(->)^* bot$ et $"not" bot scripts(->)^* top$
3. Définir un lambda-terme $"and" in Lambda$ tel que pour $b_1,b_2 in B$:
  - $"and" b_1 b_2 scripts(->)^* top$ si $b_1 = b_2 = top$
  - $"and" b_1 b_2 scripts(->)^* bot$ sinon.

Pour $n in NN$, on définit $overline(n) := lambda f. lambda x. underbrace(f f dots.c f,n "fois") x$. Par exemple, $overline(0) := lambda f. lambda x. x$, $overline(1) := lambda f. lambda x. f x$ etc...

On appelle $overline(n)$ l'_entier de Church_ associé à $n$.

4. Donner une expression $"succ" in Lambda$ tel que $"succ" overline(n) scripts(->)^* overline(n+1)$.
5. Définir deux expressions $"add", "mul" in Lambda$ telle que $"add" overline(n) space overline(m) scripts(->)^* overline(n + m)$ et $"mul" overline(n) space overline(m) scripts(->)^* overline(n times m)$

On cherche à définir l'opération de soustraction $"sub" in Lambda$ telle que $"sub" overline(n) space overline(m) scripts(->)^* overline(max(n-m,0))$. Pour cela, pour $e,e' in Lambda$ on pose $[e,e'] := lambda z. z space e space e'$ et $"Pair" := lambda x. lambda y. [x,y]$

6. Montrer que pour tout $e,e' in Lambda$, $[e,e'] space top scripts(->)^* e$ et $[e,e'] space bot scripts(->)^* e'$
7. Définir un terme $A in Lambda$ tel que $A space [e, overline(n)] scripts(->)^* [overline(n),overline(n+1) space]$
8. $(*)$ En déduire un terme $"monus" in Lambda$ tel que $"monus" overline(n) scripts(->)^* overline(max(n-1,0))$
9. Définir $"sub" in Lambda$ tel que $"sub" overline(n) space overline(m) scripts(->)^* overline(max(n-m,0))$

== Beta-équivalence et Church-Rosser

On définit $scripts(equiv)_beta$ une relation binaire sur $Lambda$ comme la fermeture symétrique réflexive et transitive de $->$. Formellement on dit que $e scripts(equiv)_beta e'$ si et seulement s'il existe une suite $e_1,...,e_n in Lambda$ tel que $e_1 = e, e_n = e'$ et que pour tout $i < n$, $e_i -> e_(i+1)$ ou $e_i <- e_(i+1)$.

1. Montrer que si $e scripts(->)^* e'$, alors $e scripts(equiv)_beta e'$.


Une relation $cal(R)$ sur $X$ est dite _localement confluente_ si pour tout $e,e_1,e_2 in X$ tel que $e cal(R) e_1$ et $e cal(R) e_2$, il existe $e^* in X$ tel que $e_1 cal(R) e^*$ et $e_2 cal(R) e^*$. $cal(R)$ est dite _confluente_ si sa fermeture réflexive et transitive est localement confluente.

La propriétée de _Church-Rosser_ dit que $scripts(->)^*$ est localement confluente (ou de manière équivalente, que $->$ est équivalente). On admet pour les 2 prochaines questions ce théorème.

2. Montrer que si $e in Lambda$ possède une forme normale, alors elle est unique.
  _On vient ici de montrer que quelquesoit la manière d'évaluer un programme, le résultat sera toujours le meme. Autrement dit, le calcul est toujours déterministe, quelquesoit son implémentation, tant qu'il termine._
3. Montrer que si $e_1 scripts(equiv)_beta e_2$, alors il existe $e'$ tel que $e_1 scripts(->)^* e'$ et $e_2 scripts(->)^* e'$.
  _On vient de justifier que la béta-équivalence représente le fait que deux programmes s'évaluent en la meme chose._

On souhaite maintenant montrer le théorème de Church-Rosser. On va passer par la méthode de la réduction parrallèle. On définit la relation $triangle.r$ de _réduction parrallèle_ par induction par 
$
  x &triangle.r x' &("pour" x in cal(V))\
  lambda x. t &triangle.r lambda x.t' &"si" t triangle.r t'\
  e_1 e_2 &triangle.r e'_1 e'_2 &#h(20pt)"si" e_1 triangle.r e'_1 "et" e_2 triangle.r e'_2 \
  e &triangle.r e' &"si" e -> e'
$

4. Montrer que $e triangle.r e'$ si et seulement si $e scripts(->)^* e'$.
5. Montrer les règles suivantes d'interversion de la substitution: soient $t,t', e in Lambda$ et $x,y in cal(V)$, on a 
 - Si $x != y$, alors $t[x <- t'][y <- e] = t[y <- e][x <- t'[y <- e]]$
 - Si $x = y$, alors $t[x <- t'][y <- e] = t[x <- t'[y <- e]]$
6. Donner un $e in Lambda$ ayant un $x in "FV"(e)$ tel que si $t -> t'$, alors $e[x <- t]$ ne se dérive pas en $e[x <- r']$
7. Toutefois, montrer que si $e_1 triangle.r e'_1$ et $e_2 triangle.r e'_2$, alors $e_1[x <- e_2] triangle.r e'_1 [x <- e'_2]$.
8. En déduire le théorème de Church-Rosser. $(\*)$

/*== Point-fixe et récursivité

On dit qu'un terme $"fix" in Lambda$ est un opérateur point-fixe si 
$ forall e in Lambda, "fix" e scripts(equiv)_beta e space ("fix" e) $

1. Montrer que si pour tout $e in Lambda$, $"fix" e scripts(->)^* e ("fix" e)$, alors $"fix"$ n'est pas fortement normalisant.
2. 
*/