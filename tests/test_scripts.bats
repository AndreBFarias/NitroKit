#!/usr/bin/env bats
# Testes de sanidade para os scripts shell do NitroKit.

setup() {
    RAIZ="$(cd "$(dirname "${BATS_TEST_FILENAME}")/.." && pwd)"
    SCRIPTS_DIR="${RAIZ}/src"
}

@test "diretorio src/ existe" {
    [ -d "${SCRIPTS_DIR}" ]
}

@test "src/ contem pelo menos 20 scripts .sh" {
    count=$(find "${SCRIPTS_DIR}" -maxdepth 1 -name "*.sh" -type f | wc -l)
    [ "${count}" -ge 20 ]
}

@test "todos os scripts .sh tem sintaxe bash valida" {
    for script in "${SCRIPTS_DIR}"/*.sh; do
        bash -n "${script}" || {
            echo "Syntax error em: ${script}"
            return 1
        }
    done
}

@test "scripts .sh tem permissao de leitura" {
    for script in "${SCRIPTS_DIR}"/*.sh; do
        [ -r "${script}" ] || {
            echo "Nao-leivel: ${script}"
            return 1
        }
    done
}

@test "font_config.py tem sintaxe Python valida" {
    if command -v python3 >/dev/null 2>&1; then
        python3 -m py_compile "${SCRIPTS_DIR}/font_config.py"
    else
        skip "python3 nao disponivel"
    fi
}
