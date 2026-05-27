#!/bin/bash
set -e

python3 - <<'EOF'
import os

at_token = os.environ.get('AT_TOKEN', '')
oai_key  = os.environ.get('OAI_KEY', '')

if not at_token:
    raise SystemExit('ERROR: AT_TOKEN is not set')
if not oai_key:
    raise SystemExit('ERROR: OAI_KEY is not set')

with open('index.html', 'r') as f:
    content = f.read()

content = content.replace('__AT_TOKEN__', at_token)
content = content.replace('__OAI_KEY__', oai_key)

with open('index.html', 'w') as f:
    f.write(content)

print(f'Done — AT_TOKEN ends ...{at_token[-6:]}, OAI_KEY ends ...{oai_key[-6:]}')
EOF
