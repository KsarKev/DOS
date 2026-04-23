# DOS — Developer Operating System

**Transforme Claude en mentor technique personnel.**

DOS est un système de progression pour développeurs propulsé par l'IA. Clone ce repo dans n'importe quel projet, ouvre-le dans Claude Code, et obtiens un mentor qui te connaît, te challenge, trace ta progression — et ne te mâche jamais le travail.

---

## Ce que DOS fait

- **Première fois** : DOS te pose des questions pour comprendre ton profil, ton projet, et ton univers d'analogies. Il adapte tout son comportement à partir de là.
- **À chaque session** : Il refuse de te donner du code sans que tu aies d'abord réfléchi. Il détecte quand tu utilises quelque chose sans le comprendre. Il logue tes décisions techniques.
- **En fin de session** : Il documente ce que tu as fait, tes lacunes, ta progression.
- **En mode révision** : Il génère des cours ciblés sur tes vraies lacunes, pas des tutoriels génériques.
- **Chaque semaine** : Il teste si ce que tu "maîtrisais" tient toujours.
- **Chaque mois** : Il compresse les fichiers pour garder le contexte léger et précis.

---

## Structure

```
DOS/
├── CLAUDE.md                          ← Cerveau : comportement, routing, règles
├── Core/
│   ├── Profile.md                     ← Profil dev + univers d'analogies (auto-rempli)
│   ├── Project.md                     ← Projet en cours + mode Coach (auto-rempli)
│   ├── Knowledge.md                   ← Lacunes et maîtrises (zone ACTIF / ARCHIVE)
│   ├── Decisions.md                   ← Décisions techniques justifiées (zone ACTIF / ARCHIVE)
│   ├── Sessions.md                    ← Journal de sessions (zone ACTIF / ARCHIVE)
│   └── Reviews.md                     ← Index des révisions générées
├── .claude/skills/
│   ├── onboard/SKILL.md               ← Setup initial, profil, mode contextuel
│   ├── coach/SKILL.md                 ← Mode dev actif, anti-copier-coller, analogies
│   ├── review/SKILL.md                ← Bilan de session, mise à jour mémoire
│   ├── teach/SKILL.md                 ← Révisions personnalisées sur tes lacunes
│   ├── challenge/SKILL.md             ← Détecteur de régression hebdomadaire
│   └── compress/SKILL.md              ← Compression mensuelle du contexte
├── Output/                            ← Fiches de révision générées (gitignored)
└── .gitignore
```

---

## Démarrage rapide

### Installation dans un projet existant (recommandé)

```bash
cd /chemin/vers/ton-projet
curl -s https://raw.githubusercontent.com/KsarKev/DOS/main/install.sh | bash
```

### Après installation

```bash
claude .
```

Dis n'importe quoi. DOS détecte le contexte et prend les rênes.

### Structure après installation

```
ton-projet/
├── Core/                              ← Progression personnelle (gitignored)
│   ├── Profile.md
│   ├── Project.md
│   ├── Knowledge.md
│   ├── Decisions.md
│   ├── Sessions.md
│   └── Reviews.md
└── .claude/
    ├── CLAUDE.md                      ← Section DOS ajoutée automatiquement
    └── skills/
        ├── dos-onboard/SKILL.md
        ├── dos-coach/SKILL.md
        ├── dos-review/SKILL.md
        ├── dos-teach/SKILL.md
        ├── dos-challenge/SKILL.md
        └── dos-compress/SKILL.md
```

---

## Les 6 skills

| Skill | Rôle | Se déclenche quand |
|-------|------|--------------------|
| **Onboard** | Setup initial, profil + projet | Première fois ou nouveau projet |
| **Coach** | Guide sans donner le code | Tu travailles sur une feature |
| **Review** | Bilan de session + mémoire | Fin de session |
| **Teach** | Révision sur tes lacunes réelles | Tu veux apprendre / réviser |
| **Challenge** | Détecte la régression silencieuse | Quiz hebdo ou "teste-moi" |
| **Compress** | Nettoie le contexte | Mensuel ou fichiers trop gros |

Tu n'actives jamais un skill manuellement. DOS détecte et applique.

---

## Gestion du contexte — ACTIF vs ARCHIVE

Chaque fichier Core a deux zones :

**🔴 ACTIF** — lu à chaque session. Max 4 semaines. Toujours léger.
**🗄️ ARCHIVE** — historique condensé. Lu seulement si tu cherches quelque chose de précis.

Le skill `compress` tourne une fois par mois et déplace automatiquement ce qui est trop vieux vers l'archive. Tu ne perds jamais rien — tu allèges juste ce que Claude lit par défaut.

---

## Philosophie

La plupart des devs qui utilisent l'IA perdent progressivement leur capacité à raisonner par eux-mêmes. Ils produisent plus, mais comprennent moins. La dette technique devient une dette intellectuelle.

DOS attaque ça à la racine :

1. **Contrôle** : Tu ne copies jamais de code que tu ne peux pas expliquer.
2. **Compréhension** : Les lacunes sont détectées, tracées, et traitées.
3. **Mémoire** : Tes décisions sont justifiées et conservées.
4. **Progression** : Ta carte de connaissances évolue — et se vérifie chaque semaine.

L'IA comme amplificateur, pas comme substitut.

---

## Licence

MIT — Utilise-le, fork-le, améliore-le, partage-le.
