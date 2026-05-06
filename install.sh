#!/bin/bash

# ============================================================
# DOS — Developer Operating System
# Script d'installation universel
# Usage : curl -s https://raw.githubusercontent.com/[username]/DOS/main/install.sh | bash
# Ou en local : bash install.sh (depuis le dossier DOS)
# ============================================================

set -e

# --- Couleurs ---
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
BOLD='\033[1m'
RESET='\033[0m'

# --- Config ---
DOS_REPO="https://raw.githubusercontent.com/KsarKev/DOS/main"
TARGET_DIR="$(pwd)"
CLAUDE_DIR="$TARGET_DIR/.claude"
SKILLS_DIR="$CLAUDE_DIR/skills"
CORE_DIR="$TARGET_DIR/Core"
CLAUDE_MD="$CLAUDE_DIR/CLAUDE.md"

echo ""
echo -e "${BOLD}${BLUE}╔══════════════════════════════════════╗${RESET}"
echo -e "${BOLD}${BLUE}║   DOS — Developer Operating System   ║${RESET}"
echo -e "${BOLD}${BLUE}║         Installation en cours...      ║${RESET}"
echo -e "${BOLD}${BLUE}╚══════════════════════════════════════╝${RESET}"
echo ""
echo -e "${BLUE}📁 Dossier cible : ${BOLD}$TARGET_DIR${RESET}"
echo ""

# ============================================================
# DÉTECTION DU MODE (local ou remote)
# ============================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$SCRIPT_DIR/.claude/skills/coach/SKILL.md" ] || [ -f "$SCRIPT_DIR/Core/Profile.md" ]; then
  # On est dans le dossier DOS lui-même — mode local
  SOURCE_DIR="$SCRIPT_DIR"
  MODE="local"
else
  MODE="remote"
fi

# Sécurité : empêcher d'installer DOS dans son propre dossier
if [ "$MODE" = "local" ] && [ "$TARGET_DIR" = "$SOURCE_DIR" ]; then
  echo -e "${RED}⚠️  Tu es dans le dossier DOS lui-même.${RESET}"
  echo -e "${RED}   Place-toi dans le dossier de ton PROJET avant de lancer ce script :${RESET}"
  echo ""
  echo -e "   ${BOLD}cd /chemin/vers/ton-projet${RESET}"
  echo -e "   ${BOLD}bash $SOURCE_DIR/install.sh${RESET}"
  echo ""
  exit 1
fi

# ============================================================
# FONCTIONS
# ============================================================

copy_file() {
  local src="$1"
  local dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ "$MODE" = "local" ]; then
    cp "$src" "$dest"
  else
    curl -sf "$DOS_REPO/$src" -o "$dest" 2>/dev/null || {
      echo -e "${RED}  ✗ Impossible de télécharger : $src${RESET}"
      return 1
    }
  fi
}

get_file_content() {
  local src="$1"
  if [ "$MODE" = "local" ]; then
    cat "$SOURCE_DIR/$src"
  else
    curl -sf "$DOS_REPO/$src"
  fi
}

# ============================================================
# ÉTAPE 1 — Créer les dossiers
# ============================================================

echo -e "${BOLD}1. Création des dossiers...${RESET}"

mkdir -p "$CORE_DIR"
mkdir -p "$SKILLS_DIR/dos-onboard"
mkdir -p "$SKILLS_DIR/dos-coach"
mkdir -p "$SKILLS_DIR/dos-review"
mkdir -p "$SKILLS_DIR/dos-teach"
mkdir -p "$SKILLS_DIR/dos-challenge"
mkdir -p "$SKILLS_DIR/dos-compress"

echo -e "${GREEN}  ✓ Core/ créé${RESET}"
echo -e "${GREEN}  ✓ .claude/skills/dos-*/ créés${RESET}"

# ============================================================
# ÉTAPE 2 — Copier les fichiers Core
# ============================================================

echo ""
echo -e "${BOLD}2. Installation des fichiers Core...${RESET}"

CORE_FILES=("Profile.md" "Project.md" "Knowledge.md" "Decisions.md" "Sessions.md" "Reviews.md")

for file in "${CORE_FILES[@]}"; do
  dest="$CORE_DIR/$file"
  if [ -f "$dest" ] && [ -s "$dest" ] && ! grep -q "sera rempli" "$dest" 2>/dev/null; then
    echo -e "${YELLOW}  ~ Core/$file existe et contient des données — ignoré${RESET}"
  else
    if [ "$MODE" = "local" ]; then
      cp "$SOURCE_DIR/Core/$file" "$dest"
    else
      copy_file "Core/$file" "$dest"
    fi
    echo -e "${GREEN}  ✓ Core/$file${RESET}"
  fi
done

# ============================================================
# ÉTAPE 3 — Copier les skills DOS
# ============================================================

echo ""
echo -e "${BOLD}3. Installation des skills DOS...${RESET}"

SKILLS=("onboard" "coach" "review" "teach" "challenge" "compress")

for skill in "${SKILLS[@]}"; do
  dest="$SKILLS_DIR/dos-$skill/SKILL.md"
  if [ "$MODE" = "local" ]; then
    cp "$SOURCE_DIR/.claude/skills/$skill/SKILL.md" "$dest"
  else
    copy_file ".claude/skills/$skill/SKILL.md" "$dest"
  fi
  echo -e "${GREEN}  ✓ dos-$skill/SKILL.md${RESET}"
done

# ============================================================
# ÉTAPE 4 — CLAUDE.md : fusion ou création
# ============================================================

echo ""
echo -e "${BOLD}4. Configuration CLAUDE.md...${RESET}"

DOS_SECTION='
---

## 🎓 DOS — Mentor Personnel

> Couche d'\''apprentissage et de progression. Indépendante du système de prod ci-dessus.
> Fichiers Core dans `Core/` à la racine. Skills dans `.claude/skills/dos-*/`.

### Priorité des systèmes

Les skills AXNT (`axnt-*`) et les rules de prod ont **toujours priorité** sur DOS.
DOS s'\''active uniquement quand la demande est orientée apprentissage ou bilan — jamais pendant une tâche de prod urgente sauf si demandé explicitement.

### Surcharge du CLAUDE.md global

Quand DOS est actif sur ce projet, ses règles **surchargent** les préférences de `~/.claude/CLAUDE.md` qui entrent en conflit — notamment "ne fais que ce qui est demandé", "réponses courtes" et "pas de récap final". Ici on questionne, on explique, on trace la progression.

Ordre de priorité (du plus fort au plus faible) :
1. Instructions explicites du dev dans la conversation.
2. Règles personnalisées dans `Core/Profile.md`.
3. Ce fichier projet + skills `dos-*`.
4. `~/.claude/CLAUDE.md` global.

### Fichiers Core — lus au démarrage si présents (zone ACTIF uniquement)

- `Core/Profile.md` → profil dev, univers d'\''analogies, règles coach personnalisées
- `Core/Project.md` → contexte projet en cours, mode coach
- `Core/Knowledge.md` → lacunes actives et progression
- `Core/Decisions.md` → décisions techniques récentes

### Routing DOS

| Situation | Skill |
|---|---|
| `Core/Profile.md` vide ou nouveau projet | `dos-onboard` |
| Dev travaille sur du code | `dos-coach` |
| Fin de session | `dos-review` |
| "Révise-moi", "apprends-moi", "quiz" | `dos-teach` |
| "Teste-moi", 7 jours sans session | `dos-challenge` |
| Fichiers trop gros, 30 jours sans compress | `dos-compress` |'

if [ -f "$CLAUDE_MD" ]; then
  # Vérifie si DOS est déjà installé
  if grep -q "DOS — Mentor Personnel" "$CLAUDE_MD"; then
    echo -e "${YELLOW}  ~ DOS déjà présent dans CLAUDE.md — ignoré${RESET}"
  else
    # Fusionne : ajoute la section DOS à la fin
    echo "$DOS_SECTION" >> "$CLAUDE_MD"
    echo -e "${GREEN}  ✓ Section DOS ajoutée à ton CLAUDE.md existant${RESET}"
  fi
else
  # Crée un CLAUDE.md minimal
  mkdir -p "$CLAUDE_DIR"
  cat > "$CLAUDE_MD" << 'MINIMAL'
# Mémoire Projet

> Ce fichier sert d'index. Les détails vivent dans les skills et docs — chargés à la demande.

MINIMAL
  echo "$DOS_SECTION" >> "$CLAUDE_MD"
  echo -e "${GREEN}  ✓ CLAUDE.md créé avec la section DOS${RESET}"
fi

# ============================================================
# ÉTAPE 5 — .gitignore
# ============================================================

echo ""
echo -e "${BOLD}5. Mise à jour .gitignore...${RESET}"

GITIGNORE="$TARGET_DIR/.gitignore"

if [ -f "$GITIGNORE" ]; then
  if grep -q "^Core/$" "$GITIGNORE"; then
    echo -e "${YELLOW}  ~ Core/ déjà dans .gitignore — ignoré${RESET}"
  else
    echo "" >> "$GITIGNORE"
    echo "# DOS — Developer Operating System" >> "$GITIGNORE"
    echo "Core/" >> "$GITIGNORE"
    echo -e "${GREEN}  ✓ Core/ ajouté au .gitignore${RESET}"
  fi
else
  cat > "$GITIGNORE" << 'GITIGNORE_CONTENT'
# DOS — Developer Operating System
Core/
GITIGNORE_CONTENT
  echo -e "${GREEN}  ✓ .gitignore créé avec Core/${RESET}"
fi

# ============================================================
# RÉSUMÉ FINAL
# ============================================================

echo ""
echo -e "${BOLD}${GREEN}╔══════════════════════════════════════╗${RESET}"
echo -e "${BOLD}${GREEN}║        ✓ DOS installé avec succès    ║${RESET}"
echo -e "${BOLD}${GREEN}╚══════════════════════════════════════╝${RESET}"
echo ""
echo -e "${BOLD}Ce qui a été installé :${RESET}"
echo -e "  📁 Core/              ← tes fichiers de progression (gitignored)"
echo -e "  🧠 6 skills dos-*     ← onboard, coach, review, teach, challenge, compress"
echo -e "  📝 CLAUDE.md          ← section DOS ajoutée"
echo -e "  🚫 .gitignore         ← Core/ exclu du repo"
echo ""
echo -e "${BOLD}Pour démarrer :${RESET}"
echo -e "  ${BLUE}claude .${RESET}   ← ouvre Claude Code dans ce dossier"
echo -e "  Puis dis n'importe quoi — DOS prend les rênes."
echo ""
echo -e "${YELLOW}💡 Si c'est ta première fois, DOS va te poser des questions"
echo -e "   pour construire ton profil. Prends 5 minutes pour y répondre"
echo -e "   honnêtement — c'est la base de tout le système.${RESET}"
echo ""
