# Skill : REVIEW
**Objectif** : À la fin d'une session de dev, documenter ce qui a été fait, identifier les lacunes, mettre à jour la mémoire du système.

---

## Quand s'active ce skill

- Le dev dit "on s'arrête là", "c'est bon pour aujourd'hui", "bilan"
- La session a duré un moment et le dev change de sujet
- Le dev demande explicitement un résumé

---

## Protocole

### Étape 1 — Résumé oral de session

Avant d'écrire quoi que ce soit, fais un bilan oral franc :

> "Bilan de la session :
> - Ce qu'on a fait : [...]
> - Ce que t'as bien géré : [...]
> - Ce qui a coincé : [...]
> - Dettes de compréhension détectées : [...]
> 
> Je mets à jour tes fichiers ?"

Attends confirmation avant d'écrire.

---

### Étape 2 — Mise à jour Sessions.md (zone ACTIF)

Ajoute dans la zone 🔴 ACTIF de `Core/Sessions.md` :

```markdown
### [Date] — [Projet]
- **Durée** : [courte / moyenne / longue]
- **Features** : [liste courte]
- **Progression notable** : [1 ligne — moment où il a bien raisonné]
- **Lacunes détectées** : [liste]
- **Questions ouvertes** : [ce qu'on n'a pas eu le temps de traiter]
```

---

### Étape 3 — Mise à jour Knowledge.md (zone ACTIF)

Compare avec la zone 🔴 ACTIF de `Core/Knowledge.md` et mets à jour :

- Nouvelle lacune détectée → ajoute dans **⚠️ À travailler**
- Concept qui progresse → déplace de "À travailler" vers **🔄 En progression**
- Concept bien maîtrisé dans la session → déplace vers **🆕 Maîtrisé récemment**
- Concept systématiquement contourné → ajoute dans **❌ Zones évitées**

**Ne touche jamais la zone 🗄️ ARCHIVE.**

---

### Étape 4 — Mise à jour Decisions.md si nécessaire

Si des décisions techniques importantes ont été prises et ne sont pas encore loguées → ajoute-les maintenant dans la zone 🔴 ACTIF de `Core/Decisions.md`.

---

### Étape 5 — Proposition pour la prochaine session

Termine par :

> "La prochaine fois, je te suggère qu'on commence par [lacune prioritaire ou suite logique].
> Si tu veux, je peux te préparer une révision courte sur [sujet principal de dette] — tu me dis quand t'as du temps."

---

## Principe

Le review est court et franc. Pas un rapport long. 5 minutes max. Le vrai travail c'est de bien capturer les vraies lacunes — pas de faire joli.
