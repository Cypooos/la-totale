# La Totale

**La Totale** est un recueil collaboratif d’exercices d’informatique théorique, initialement créé par Codaline Bourotte.

L’objectif est simple : rassembler un grand nombre d’exercices intéressants, pédagogiques, classiques ou originaux, pour aider à préparer des colles, des TD, des oraux, des écrits, ou simplement pour découvrir de belles idées d’informatique théorique.

Le document vise notamment :
* les profs de prépa ou d'université qui veulent préparer des feuilles de TD ou des colles
* les agrégatifs, chercheurs et étudiants qui veulent s’entrainer ou découvrir de nouvelles notions
* les colleurs et colleuses qui cherchent des exercices
* les préparationnaires curieux qui veulent aller plus loin que le programme strict, ou qui ont finis leurs TDs

Les exercices sont trié par section, chapitre, puis dans chaque chapitre par ordre (très) approximatif de difficulté :
- `sup/`: Contiens les chapitres `imp` (impératif), `func` (fonctionnel), `seq` (structures de données séquentielles), `ind` (inductions et ordres), `tree` (arbres et structures inductives), `graph` (théorie des graphes), `prop` (logique propositionelle), `db` (base de données, SQL), `algo` (algorithmique)
- `spe/` : Contiens les chapitres `lang` (théorie des langages), `reg` (langages régulier), `gram` (grammaires non-contextuelles), `graph2` (théorie des graphes 2), `game` (théorie des jeux), `data` (apprentissage), `system` (mutex, sémaphores), `proba` (algorithmes d'approximation et probabilistes), `deduc` (déduction naturelle), `class` (classes de complexitées), `calc` (calculabilité)

Dans le futur, les 2 sections suivantes seront rajoutées:
- `math/` : Contiens les chapitres de mathématiques utile pour l'informatique, comme `g-alg` (utilliser l'algèbre pour la théorie des graphes), `model` (Théorie des modèles, ZFC, Godel), `ord` (Relations d'ordres, wqo), `denom` (Dénombrement, série génératrices de langages), `topo` (Topologie pour l'informatique)
- `compl/` : Contiens les chaptres complémentaire / avancés d'informatique non présent dans le programme, comme `lamb` (lambda calcul, le chapitre le plus accesible), `parra` (algorithmes parralélisés), `fpt` (FPT, tree-width), `logic` (Logique avancé, Système F, Rocq)

Les exercices sont conçus pour être aussi indépendants que possible, sauf mention contraire. Ils sont souvent difficiles : beaucoup correspondent plutôt à une bonne colle, voire à une partie de sujet d’écrit. Il ne faut donc pas hésiter à ajouter des questions intermédiaires si vous souhaitez les donner à des élèves.

Quand c’est possible, une note bibliographique indique l’inspiration de l’exercice : sujet de concours, oral, article, problème classique, discussion, cours, etc. Ces références servent surtout à donner un autre point de vue ou une piste de lecture supplémentaire.

## État du document

Ce projet est encore a ses débuts, est incomplet, et encore imparfait.
La dernière version "stable" du document est téléchargable [ici](https://github.com/Cypooos/la-totale/releases/latest), mais il faut garder en tete que tant que la version n'atteint pas encore les `v1.x`, toutes les versions sont a considérer comme des betas.

Il contient encore de nombreuses fautes d’orthographe, des exercices non finis, et probablement quelques erreurs de logique ou de difficulté.
À l’origine, c’est un document personnel et assez brouillon. Le but du dépôt est justement de le rendre plus propre.

Pour demander une indication ou demander un corrigé, vous pouvez ouvrir une issue, écrire à `la-totale@bourotte.com` ou me contacter sur discord `@cypooos` (normalement je sais résoudre presque tout les exercices)

Pour corriger des fautes d'orthographes, de logique ou pour contribuer, faites une PR **sur la branche `dev`** (voir la prochaine section).

**Roadmap pour la version `v1.0`:**
- [ ] Régler des problèmes de copyright, nottamment concernant les sujets CCINP
- [ ] Finir tout les exercices possédant un TODO
- [ ] Harmoniser les sections "Cours" de chaque chapitre
- [ ] Ajouter des problèmes sur union-find dans `spé/graph2`
- [ ] Avoir plus de 300 exercices uniques (~250/300)
- [ ] Uniformiser le style graphique, nottamment pour le compteur des questions

Par la suite, 2 autres sections seront rajouté pour du post-prépa : `math` pour les exercices mélangeant mathématiques et informatique, et `complement` pour des sujets non abordés tels que le lambda-calcul, modèles en logique, ZFC, MSO et tree-width, la dynamique symbolique, assistants de preuves, parralélisme, bio-info etc...

À terme, le projet pourra être déplacé hors de GitHub pour des raisons éthiques et pratiques. En attendant, les issues et pull requests restent le moyen le plus simple de contribuer.

## Contribuer

Toute forme de contribution sont les bienvenues! 
Les contributions se font de préférence via pull request **sur la branche `dev`**.

L’usage d’outils d’IA est autorisé, mais vous devez relire attentivement tout ce que vous proposez.
En contribuant, vous êtes responsable du contenu soumis. Mais ce n'est pas grave de faires des erreurs, ça arrive !

**Règles de rédactions:**
* Les exercices situés dans `sup/` et `spe/` doivent rester accessibles avec le programme de prépa, rappelé dans l’exercice `Cours` de chaque section.
* Les exercices peuvent être classiques, mais ils doivent présenter un intérêt pédagogique réel.
* Des exercices plus mécaniques peuvent etre acceptés, par exemple pour s’entraîner sur une technique précise : mise en FNC, algorithme de Berry-Sethi, calcul d’automates, etc.
* Ce git n'a pas pour but de faire un corrigé. Toutefois, il est possible d’ajouter, en commentaire sous une question, des indications, des étapes clefs ou des éléments de correction.
* Les règles globales `#set` et `#show` sont interdites, et tout ce qui impacte de manière globale les autre exercice.s Crée des variables temporaire `#let sha = ...` est autorisé tant que c'est raisonnable. 
* Les imports sont interdits, sauf exception.
* Si un exercice qui est principalement dans un chapitre utillise un chapitre qui est plus loin dans l'ordre, indiquer entre parenthèse dans le titre de l'exercice, le chapitre en question qui est nécéssaire.
* Si un exercice utillise plusieurs chapitre du programme de manière équivalente et qu'il ne peux pas etre découpé, mettez-le dans le chapitre le plus loins dans l'ordre. Ainsi, par exemple, si un exercice parle de grammaire non-contextuelles et de langage régulier, il sera mis dans le chapitre grammaire.
* Un exercice peut faire appel à des petits points des chapitres précédents sans soucis.