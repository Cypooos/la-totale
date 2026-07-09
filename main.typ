//  seq, func, ind, tree, graph, prop, db, algo, lang, reg, gram, graph2, game, data, system, proba, deduc, class, calc, all


// Ceci permet de compiler le fichier avec chap=<chapitre> pour avoir un pdf avec 1 exos par page et que les exos du chapitre. 
// Par exemple, `typst compile totale.typ out.pdf --input chap=reg` pour avoir les exos en langages réguliers.
#let orga = (
  "sup": (  "seq", "func", "ind", "tree", "graph", "prop", "db", "algo" ),
  "spe": ( "lang", "reg", "gram", "graph2", "game", "data", "system", "proba", "deduc", "class", "calc"),
)
#let template(body) = {
  let chapter = sys.inputs.at("chap",default:"all");
  let result = none;
  for (folder,values) in orga {
    if (values.find(x => x == chapter) != none) {
      result = "./"+folder+"/"+chapter + ".typ";
      break;
    }
  }
  if (result != none) {
    set page(height: auto, width:16cm, margin: 15pt)
    show heading: it => context [
      #if counter(heading).get().at(0) > 1 {pagebreak()}
      #counter(heading).update(x => x+1)
      *#it*
    ]
    include result
  } else {
    body
  }
}
#show:template 


= *La Totale -- Introduction*

Document créé par Codaline Bourotte, compilant tous les exercices d'informatique que je connais et que je trouve intéressants et pédagogiques.
Ce doc vise surtout les profs de prépa qui veulent créer une feuille de TD ou préparer des colles, les agrégatifs, normaliens, chercheurs ou étudiants qui veulent découvrir / s'entraîner, ou encore les préparationnaires qui veulent aller plus loin.

Les exos sont faits pour être indépendants les uns des autres, sauf mention contraire. Ils sont plutôt durs: n'hésitez pas à rajouter des questions intermédiaires si vous voulez les donner à des élèves. L'idée, c'est qu'ils correspondent à peu près à ce qu'on pourrait faire en une bonne colle, même si certains sont plutôt de l'ordre d'une partie d'un sujet d'écrit. J'essaie autant que possible de donner un lien vers l'inspiration bibliographiques de l'exercice quand je l'ai~; ça permet souvent d'avoir un autre point de vue, mais ce n'est pas toujours facile à retrouver.

Ce document est bourré de fautes d'orthographe, et probablement de quelques fautes de logique. À la base, c'est un document très personnel et assez brouillon, mais il peut intéresser plus d'une personne.

N'hésitez pas à m'envoyer d'autres exercices, des corrections, ou des demandes de corrigés pour certains exos. Normalement, je sais tous les faire, et je les rescanne de temps en temps. Vous pouvez me contacter à #link("mailto:la-totale@bourotte.com", [la-totale\@bourotte.com]).

Lien vers le github du document: #link("https://github.com/Cypooos/la-totale").
Dans le futur, je bougerai en dehors de github pour des raisons étique. N'hésitez pas à faire des push request avec d'autres exercices !

*Certaines inspirations bibliographique utilisées:*
- Le livre de Galatée Hemery (mon ancienne prof de prépa~!) et Lou Chalmain: https://www.fnac.com/a22502218/Lou-Chalmain-Informatique-MPI-MPI
- Anciens oraux d'Ulm: https://a3nm.net/work/exams/ens/
- Des super exos de spé avec correction: https://anthonylick.com/wp-content/uploads/MPI_exos_xens_corrige.pdf
- Le Requin (certains sont vraiment bien)
- Le PDF des colles donné par Mallory Marin au Lycée du Parc pour la 1ère promo de MP2I/MPI
- Le PDF de la totale de tous les exercices à la Martinière par Quentin Fortier
- Les exercices du TD de Maxime Bridoux à la prépa Fénelon Sainte-Marie
- Des sujets d'oraux et de concours de chaque année
- Des sujets d'agrég
- Des sujets provenant de mes cours au MPRI ou à l'ENS de Lyon
- Mes sujets d'Info D
- Des colles données par José en informatique à Fénelon Sainte-Marie
- Le Putnam


#outline(depth: 2)

#pagebreak()

#parbreak()

#include "sup/seq.typ"
#include "sup/func.typ"
#include "sup/ind.typ"
#include "sup/tree.typ"
#include "sup/graph.typ"
#include "sup/prop.typ"
#include "sup/db.typ"
#include "sup/algo.typ"


#include "spe/lang.typ"
#include "spe/reg.typ"
#include "spe/gram.typ"
#include "spe/graph2.typ"
#include "spe/game.typ"
#include "spe/data.typ"
#include "spe/system.typ"
#include "spe/proba.typ"
#include "spe/deduc.typ"
#include "spe/class.typ"
#include "spe/calc.typ"

