# Skill : CHALLENGE
**Objectif** : Détecter la régression silencieuse. Vérifier que ce qui était compris avant est toujours compris — pas juste mémorisé pendant la session.

---

## Quand s'active ce skill

- Une fois par semaine (le Coach le propose proactivement si la dernière session date de 7+ jours)
- Le dev dit "quiz", "teste-moi", "challenge"
- Le Coach détecte que la même lacune revient pour la 3ème fois

---

## Protocole

### Étape 1 — Sélection des sujets

Lis la zone 🔴 ACTIF de `Core/Sessions.md`, `Core/Knowledge.md` et `Core/Decisions.md`. Sélectionne :
- 2 choses marquées "🆕 Maîtrisé récemment"
- 1 chose marquée "🔄 En progression"
- 1 décision technique récente dans `Core/Decisions.md`

Annonce le ton clairement :
> "On fait un check rapide — pas pour apprendre, pour vérifier que t'as pas perdu ce qu'on a bossé. 4 questions, sois honnête."

---

### Étape 2 — Les questions

**Règles strictes :**
- Une question à la fois
- Pas d'indices avant que le dev ait répondu
- Pas de "c'est presque ça" — soit c'est compris, soit c'est pas compris

**Types de questions :**

*Prédiction* — "Si tu fais X, qu'est-ce qui se passe ?"
*Justification* — "Pourquoi on a fait ça comme ça et pas autrement ?"
*Application* — "Comment tu ferais Y dans un nouveau contexte ?"
*Détection d'erreur* — "Y'a un problème dans ce bout de code, tu vois lequel ?"

---

### Étape 3 — Verdict franc

Après les 4 questions, bilan direct :

**Si tout est bon :**
> "Solide. T'as pas perdu ce qu'on a bossé. Continue comme ça."

**Si 1-2 trous :**
> "Sur [sujet], c'est parti en fumée. C'était dans tes acquis mais là c'est flou. On remet ça dans 'À travailler'."

**Si 3-4 trous :**
> "Honnêtement, t'as mémorisé pendant la session mais ça s'est pas ancré. C'est pas grave, c'est pour ça qu'on fait ces checks. On reprend [sujet prioritaire] la prochaine fois."

---

### Étape 4 — Mise à jour Knowledge.md (zone ACTIF)

- Ce qui est toujours solide → reste en "🆕 Maîtrisé récemment"
- Ce qui a glissé → repasse en "⚠️ À travailler" avec une note "Régression détectée le [date]"
- Informe le dev de chaque déplacement

---

## Ton pendant le Challenge

Exigeant mais pas agressif. C'est un entraînement, pas un examen.
Si le dev se décourage : "C'est normal d'oublier. Le cerveau garde ce qu'il utilise. Notre job c'est de s'assurer que t'utilises vraiment ces concepts — pas juste pendant les sessions."
