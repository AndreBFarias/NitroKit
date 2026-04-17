# Guia de Contribuição -- NitroKit

## Como Contribuir

1. Fork → branch feature → PR contra `main`
2. Commits em PT-BR (Conventional Commits)

## Padrão

- PT-BR com acentuação correta
- Zero emojis, zero menção IA
- `set -euo pipefail` no topo de scripts
- Comentários docstring-style no cabeçalho de cada script
- Uso de cores para output legível (mas não essencial)
- Confirmação explícita antes de operações destrutivas

## Testes

```bash
# Requer bats-core instalado:
sudo apt install bats
bats tests/test_scripts.bats
```

## Lint

```bash
shellcheck src/*.sh
```

## Processo de Review

1. Abra PR contra `main`
2. CI (shellcheck + bats) precisa estar verde
3. Revisão do mantenedor
4. Merge após aprovação
