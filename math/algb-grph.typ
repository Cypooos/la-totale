= *Math: Algèbre (Linéaire) pour les Graphes*

== Définitions

Il y a 3 représentation matricelle qui seront utillisé pour représenté un graphe $G = (V,E)$ :
- Par $A in {0,1}^(V times V)$ sa *matrice d'ajascence*: Si $G$ orienté ou non avec ou sans boucle, $A_(u,v) = 1 <=> (u,v) in E$
- Par $M in {0,1}^(V times E)$ sa *matrice d'incidence*: Si $G$ non-orienté, $A_(u,e) = 1 <=> u in e$
- Par $L in {0,1}^(V times V)$ sa *matrice laplacienne*: Si $G$ non-orienté sans boucle, pour $D in NN^(V times V)$ la matrice diagonale des degrée définie par pour tout $u != v$, $D_(u,u) = deg u$ et $D_(u,v) = 0$, on a $L = D - A$


*LES EXOS DE CE CHAPITRE NE SONT PAS VERIFIEES*

== Bornes du rayon spectral

Soit $G = (V,E)$ un graphe non-orienté mais avec pottentiellement des boucles, on note $A_G in {0,1}^(V times V)$ sa matrice d'adjascence, ou juste $A$ quand il n'y a pas d'ambiguitées.

1. Montrer que $"Tr"(A)$ est le nombre de boucle du graphe.
2. Montrer que toutes les valeurs propres de $A$ sont réelles. Dans quel cas $min "Sp"(A) = 0$ ?

On note $rho(A) = max { |lambda| : lambda in "Sp"(A)}$ le _rayon spectral_ de $A$ et $n := |V|$ le nombre de sommets. On suppose $G$ sans boucle.

3. Calculer $"Sp"(A)$ si $G$ est le graphe complet. Que vaux $rho(A)$ ?

Pour $k in NN$, on définit $v^((k))$ le vecteur $(sin((k pi)/(n+1)),...,sin((n k pi)/(n+1))$
4. Pour $G$ le chemin à $n$ sommets, montrer que $(v^((k)))_(1<=k <= n)$ sont des vecteurs propre de $A$.
5. En déduire $rho(A)$ pour $G$ le chemin à $n$ sommets.
6. Montrer que si $G$ est connexe, alors $rho(A) <= Delta$ avec $Delta$ le degrée maximal de $G$.

On a trouvé une borne supérieur de $rho(G)$, on cherche maintenant à établir une borne inférieur. On admet le théorème de Perron-Frobinus qui dit que si $M$ est positive, alors $rho(M)$ est bien valeur propre de $M$, associé à un vecteur propre $v$ dont toutes les composantes sont positives.

7. Montrer que si $T$ est un arbre couvrant de $G$, alors $rho(A_T)<= rho(A_G)$
8. Soit $T$ un arbre, montrer que pour $n>1$ il possède au moins deux sommets de degrée $1$
9. $(*)$ Montrer le lemme de greffe: Soient $a,b$ deux sommets de degrée $1$ d'un arbre $T$ différent d'un chemin. On suppose que le chemin entre $a$ et un sommet de degrée $>2$ est plus grand que le chemin entre $b$ et un sommet de degrée $>2$. On note $e$ l'unique arrete relié à $b$. Montrer que $ rho(A_(T-e+(a,b)))<= rho(A_(T)) $
8. En déduire que $2 cos(pi/(n+1)) <= rho(A)$.

== $k$-régulier et rayon spectral

Soit $G = (V,E)$ un graphe non-orienté mais avec pottentiellement des boucles, on note $A in {0,1}^(V times V)$ sa matrice d'adjascence. On note $rho(A) = max { |lambda| : lambda in "Sp"(A)}$ le _rayon spectral_ de $A$ et $n := |V|$ le nombre de sommets.

On dit qu'un graphe est $k$-régulier si $forall x in V, deg x = k$

1. Montrer que si $G$ est $k$-régulier, alors $rho(A) = k$
2. Montrer que la multiplicité de cette valeur propre est exactement le nombre de composante connexe de $G$.

