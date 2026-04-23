# Skill : COMPRESS
**Objectif** : Éviter l'explosion du contexte. Condenser les fichiers Core pour garder le système rapide et précis — sans perdre l'historique.

---

## Quand s'active ce skill

- Une fois par mois (le Coach le propose proactivement)
- Le dev dit "compresse", "nettoie le contexte", "les fichiers sont trop gros"
- `Core/Sessions.md` dépasse 200 lignes
- `Core/Knowledge.md` dépasse 100 lignes
- `Core/Decisions.md` dépasse 150 lignes

---

## Principe fondamental

Chaque fichier Core a **deux zones** :

```
## 🔴 ACTIF — [Ce que Claude lit à chaque session]
[Max 50 lignes — résumé vivant, mis à jour régulièrement]

---

## 🗄️ ARCHIVE — [Historique condensé]
[Tout ce qui dépasse 4 semaines — compressé, pas supprimé]
```

Claude ne lit la zone ARCHIVE que si le dev demande explicitement à retrouver quelque chose d'ancien.

---

## Protocole de compression

### Étape 1 — Diagnostic

Lis tous les fichiers Core et annonce :
> "Voilà l'état du contexte :
> - Sessions.md : [X] lignes
> - Knowledge.md : [X] lignes
> - Decisions.md : [X] lignes
> Je vais compresser ce qui dépasse 4 semaines. Ça prend 2 minutes."

---

### Étape 2 — Compression de Sessions.md

**Zone ACTIF** : garder uniquement les 4 dernières semaines de sessions, format condensé :
```markdown
## 🔴 ACTIF — Sessions récentes (4 dernières semaines)

### Semaine du [date]
- [Projet] : [Ce qui a été fait en 1-2 lignes]
- Lacunes détectées : [liste courte]
- Progrès notable : [1 ligne]
```

**Zone ARCHIVE** : tout le reste, condensé en blocs mensuels :
```markdown
## 🗄️ ARCHIVE

### [Mois Année] — Résumé
- Features construites : [liste]
- Concepts appris : [liste]
- Patterns de lacunes : [ce qui revenait souvent]
```

---

### Étape 3 — Compression de Knowledge.md

**Zone ACTIF** : 
- Tout ce qui est "⚠️ À travailler" (priorité max)
- Tout ce qui est "🔄 En progression" (suivi actif)
- Les 5 derniers éléments dans "🆕 Maîtrisé récemment"
- Tout ce qui est "❌ Zones évitées"

**Zone ARCHIVE** :
- Les éléments "🆕 Maîtrisé récemment" plus anciens que 4 semaines → archivés simplement comme "Maîtrisé"
- Format : liste simple groupée par mois, pas de détail

---

### Étape 4 — Compression de Decisions.md

**Zone ACTIF** : décisions des 4 dernières semaines + toute décision marquée "⚠️ Impact fort"

**Zone ARCHIVE** : décisions plus anciennes, condensées :
```markdown
### [Mois Année] — Décisions archivées
- [Titre décision] : [Choix retenu] — [Raison en 1 ligne]
```

---

### Étape 5 — Mise à jour Profile.md

Profile.md ne grandit pas beaucoup mais vérifie :
- L'univers d'analogies est toujours à jour
- Le niveau estimé reflète la progression réelle des derniers mois
- Mets à jour si nécessaire

---

### Étape 6 — Confirmation

Après compression, annonce :
> "Contexte nettoyé. Voilà ce qui est actif maintenant :
> - [X] lacunes à travailler
> - [X] concepts en progression  
> - [X] décisions récentes tracées
> Tout l'historique est conservé en archive si t'as besoin de retrouver quelque chose."

---

## Ce que tu ne fais JAMAIS

- Supprimer de l'information — tu condenses, tu archives, tu ne supprimes pas
- Compresser sans confirmation du dev
- Toucher à la zone ACTIF des 4 dernières semaines
