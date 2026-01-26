#!/usr/bin/env bash
set -Eeuo pipefail

# Required env
: "${TGAPIS_PAT:?TGAPIS_PAT is required}"
: "${BOT_TOKEN:?BOT_TOKEN is required}"
: "${OWNER_ID:?OWNER_ID is required}"

# Config
GIT_USER="ankit-chaubey"
GIT_EMAIL="70747360+ankit-chaubey@users.noreply.github.com"

STATUS_TGDOCSAPI="skipped"
STATUS_WEBCLIENT="skipped"
STATUS_BOTAPIDOCS="skipped"

START_TIME="$(date -u)"

symbol() {
  [[ "$1" == "updated" ]] && printf "✓" || printf "✗"
}

on_error() {
  EXIT_CODE=$?
  LINE_NO=$1

  MESSAGE=$'✗ *Telegram API Update FAILED*\n\n'
  MESSAGE+=$'• Exit code: '"$EXIT_CODE"$'\n'
  MESSAGE+=$'• Line: '"$LINE_NO"$'\n'
  MESSAGE+=$'• Time: '"$(date -u)"$'\n\n'
  MESSAGE+=$'Check GitHub Actions logs for details.'

  curl -s -X POST \
    "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
    -d chat_id="${OWNER_ID}" \
    -d parse_mode="Markdown" \
    -d text="$MESSAGE" || true

  exit "$EXIT_CODE"
}

trap 'on_error $LINENO' ERR

echo "▶ Starting Telegram API update"

# Clone sources
git clone --branch data --depth 1 https://github.com/tgapis/x tgapis-x
git clone https://x-access-token:${TGAPIS_PAT}@github.com/tgapis/tgdocsapi output

# Python deps
python -m pip install --upgrade pip
pip install beautifulsoup4 lxml

# Generate tlapi.json
mkdir -p output/docs
cp -r tgapis-x/Telegram output/docs/
(
  cd output
  TG_DOCS_PATH="$(pwd)/docs/Telegram" python tl.py
)
rm -rf output/docs

# Fetch botapi.json
curl -fsSL https://raw.githubusercontent.com/tgapis/x/data/botapi.json -o output/botapi.json

# Push tgdocsapi
cd output
git config user.name "$GIT_USER"
git config user.email "$GIT_EMAIL"

git add tlapi.json botapi.json
if git diff --cached --quiet; then
  echo "ℹ tgdocsapi: no changes"
else
  git commit -m "auto: update tlapi.json & botapi.json"
  git push
  STATUS_TGDOCSAPI="updated"
fi
cd ..

# Fan-out
if [[ "$STATUS_TGDOCSAPI" == "updated" ]]; then
  git clone https://x-access-token:${TGAPIS_PAT}@github.com/tgapis/botapi-webclient webclient
  cp output/botapi.json webclient/botapi.json
  cd webclient
  git config user.name "$GIT_USER"
  git config user.email "$GIT_EMAIL"
  git add botapi.json
  if git diff --cached --quiet; then
    echo "ℹ botapi-webclient: no changes"
  else
    git commit -m "auto: update botapi.json"
    git push
    STATUS_WEBCLIENT="updated"
  fi
  cd ..

  git clone https://x-access-token:${TGAPIS_PAT}@github.com/tgapis/botapidocs botapidocs
  cp output/botapi.json botapidocs/botapi.json
  cd botapidocs
  git config user.name "$GIT_USER"
  git config user.email "$GIT_EMAIL"
  git add botapi.json
  if git diff --cached --quiet; then
    echo "ℹ botapidocs: no changes"
  else
    git commit -m "auto: update botapi.json"
    git push
    STATUS_BOTAPIDOCS="updated"
  fi
  cd ..
fi

# Success notification
MESSAGE=$'✓ *Telegram API Update Summary*\n\n'
MESSAGE+=$'• tgdocsapi: '$(symbol "$STATUS_TGDOCSAPI")$'\n'
MESSAGE+=$'• botapi-webclient: '$(symbol "$STATUS_WEBCLIENT")$'\n'
MESSAGE+=$'• botapidocs: '$(symbol "$STATUS_BOTAPIDOCS")$'\n\n'
MESSAGE+=$'⏱ Started: '"$START_TIME"$'\n'
MESSAGE+=$'⏱ Finished: '"$(date -u)"$'\n'

curl -s -X POST \
  "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
  -d chat_id="${OWNER_ID}" \
  -d parse_mode="Markdown" \
  -d text="$MESSAGE"

echo "✓ Update completed successfully"
