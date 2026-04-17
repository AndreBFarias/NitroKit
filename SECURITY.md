# Política de Segurança -- NitroKit

## Versões Suportadas

| Versão | Suportada |
| ------ | --------- |
| 2.0.x  | sim       |

## Escopo

Os scripts do NitroKit executam operações privilegiadas em sistemas Linux (kernel params, audio, pacotes). Cada script deve:

- Pedir confirmação antes de operação destrutiva
- Logar o que foi alterado
- Ter backup ou rollback quando aplicável

## Reportando

1. **Não** abra issue pública
2. Envie email ao mantenedor
3. Inclua: descrição, script afetado, impacto, passos para reproduzir

## Tempo de Resposta

- Recebimento: 48h
- Avaliação: 7 dias
- Correção: 30 dias

## Operações Sensíveis

- `oraculo_do_kernel.sh` -- altera parâmetros de boot; reversível via `kernelstub`
- `reparo_completo_sistema.sh` -- altera configurações de sistema
- `sentinela_da_paz.sh` -- gerencia processos
- `removedor_seguro_diretorio.sh` -- pede confirmação dupla

Execute scripts em VM ou em sistema com backup recente antes de uso em produção.
