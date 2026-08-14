= *More: Lambda calcul et Types*

== Cours

Pas besoin de cours!

== Introduction au lambda calcul

Soit $cal(V)$ un ensemble dénombrable de variable. On définit l'ensemble des lambda-termes comme les mots générés par la grammaire 
$ M -> M M | lambda x. M | x #h(20pt) "pour tout" x in cal(V) $

Que l'on parenthèsera pour dé-sambiguier les mots. On apellera la règle $M M$ comme étant _l'application_ et la règle $lambda x.M$ comme étant la $lambda$-abstraction. L'idée est que $lambda x. S$ représente la fonction $x |-> M$ et que $M_1 M_2$ représente la fonction $M_1$ évalué par $M_2$.

On définit di