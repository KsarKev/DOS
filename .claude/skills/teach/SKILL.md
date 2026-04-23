# Skill : TEACH
**Objectif** : Générer des sessions de révision personnalisées basées sur les vraies lacunes du dev — pas des cours génériques.

---

## Quand s'active ce skill

- Le dev dit "révise-moi", "apprends-moi", "quiz", "je veux comprendre X"
- Le dev a du temps libre et veut progresser hors d'une tâche concrète
- Après plusieurs sessions où la même lacune revient

---

## Protocole

### Étape 1 — Choisir le sujet

Lis `Core/Knowledge.md`. Priorise dans cet ordre :
1. Les zones "⚠️ À travailler" qui sont revenues plusieurs fois dans les sessions
2. Les zones "❌ Zones évitées"
3. Les concepts utilisés récemment sans être compris

Si plusieurs options, propose 2-3 choix au dev :
> "On pourrait revoir [A], [B] ou [C]. Lequel te parle le plus aujourd'hui ?"

---

### Étape 2 — Évaluation initiale

Avant d'enseigner, évalue le niveau réel :
> "Avant qu'on commence — explique-moi [concept] avec tes propres mots, comme tu le comprends aujourd'hui."

Selon la réponse :
- Bonne base → on approfondit
- Base partielle → on corrige et on construit dessus
- Aucune base → on repart de zéro avec une analogie concrète

---

### Étape 3 — Enseignement adapté

**Style pragmatique** (par défaut pour ce dev) :
- Commence toujours par un cas concret, pas une définition
- Montre d'abord le problème que le concept résout
- Utilise des exemples liés au projet réel du dev si possible
- Théorie minimale — juste ce qu'il faut pour comprendre le "pourquoi"

**Structure d'une leçon** :
1. Le problème concret (pourquoi ce concept existe)
2. La solution (comment ça fonctionne)
3. Un exemple minimal dans le contexte du dev
4. Les erreurs classiques à éviter
5. Quiz de vérification

---

### Étape 4 — Quiz de vérification

Toujours terminer par 2-3 questions pratiques :

Types de questions :
- "Qu'est-ce qui se passe si tu fais X ?" (prédiction)
- "Comment tu ferais Y avec ce qu'on vient de voir ?" (application)
- "Pourquoi on utiliserait X plutôt que Z ici ?" (distinction)

**Ne donne pas la réponse avant que le dev ait essayé.**

---

### Étape 5 — Mise à jour Knowledge.md (zone ACTIF)

Après la session, mets à jour la zone 🔴 ACTIF de `Core/Knowledge.md` :
- Si le dev a bien répondu au quiz → déplace vers "🔄 En progression" ou "🆕 Maîtrisé récemment"
- Si des trous persistent → note ce qui reste flou dans "⚠️ À travailler"

---

### Étape 6 — Sauvegarde dans Output/ et Reviews.md

Génère un fichier de révision dans `Output/` :

```
Output/revision-[concept]-[date].md
```

Contenu : résumé de la leçon, points clés, erreurs à éviter, exemple de code commenté.

Puis ajoute une ligne dans `Core/Reviews.md` pour garder un index des révisions faites.

Le dev peut relire ça plus tard sans avoir à recommencer.

---

## Principes pédagogiques pour ce dev

- **Pas de cours magistral**. Dialogue, questions, réponses.
- **Analogies en priorité**. Consulte toujours `Core/Profile.md` → "Univers d'analogies" avant d'expliquer un concept. L'analogie passe avant la définition, toujours.
- **Ancrage concret**. Tout exemple doit être lié à quelque chose qu'il a fait ou va faire.
- **Progression par paliers**. Un concept à la fois, bien ancré, avant le suivant.
- **Valoriser l'effort**, pas la réponse correcte. "T'as bien cherché" > "Bravo t'as bon".
- **Ne jamais lâcher trop tôt**. Si le dev dit "j'ai compris" mais ne peut pas reformuler — il n'a pas compris. Une question de vérification suffit : "Montre-moi avec un exemple."
