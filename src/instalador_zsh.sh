#!/bin/bash
# instalador_zsh.sh

# Este script automatiza a instalação e configuração completa do Zsh,
# do framework Oh My Zsh e dos plugins essenciais.
# Ele também configura a paleta de cores para o terminal e a fonte
# (com a FiraCode Nerd Font), preparando o ambiente para o tema agnoster.
# A documentação de cada etapa está comentada ao longo do script.

# --- 1. Verificação e Instalação de Dependências ---
# @docs #1: Este bloco de código garante que o sistema tenha o Zsh,
# Git e Wget instalados. O fastfetch é o programa que exibe informações
# do sistema na inicialização do terminal.
echo "--> Iniciando o ritual de instalação..."
echo "--> Verificando e instalando dependências essenciais: zsh, git, wget, fastfetch..."
sudo apt update
sudo apt install zsh git wget fastfetch -y

# --- 2. Instalação do Oh My Zsh e Plugins ---
# @docs #2: O Oh My Zsh é o framework que irá gerenciar os plugins e temas.
# Ele é o "motor" que dá vida e funcionalidade ao Zsh. Os plugins
# abaixo são os "superpoderes" do seu terminal.
echo "--> Verificando e instalando o Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh já está instalado."
fi

ZSH_CUSTOM_DIR="$HOME/.oh-my-zsh/custom"

echo "--> Instalando plugins e temas..."
if [ ! -d "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions"
fi
if [ ! -d "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting"
fi
if [ ! -d "$ZSH_CUSTOM_DIR/plugins/zsh-history-substring-search" ]; then
    git clone https://github.com/zsh-users/zsh-history-substring-search.git "$ZSH_CUSTOM_DIR/plugins/zsh-history-substring-search"
fi

# --- 3. Criação do arquivo .zshrc ---
# @docs #3: Este bloco sobrescreve o arquivo de configuração do Zsh
# com uma versão unificada que inclui o tema 'agnoster', todos os plugins
# e as suas funções e aliases personalizados. Ele também inclui a nova
# função 'explore' para abrir pastas no gerenciador de arquivos.
echo "--> Criando o arquivo .zshrc no seu diretório home..."
ZSHRC_FILE="$HOME/.zshrc"
cat << EOF > "$ZSHRC_FILE"
# ~/.zshrc - O seu Grimório Unificado
# Este arquivo é o coração da sua nova shell Zsh.

# --- 1. Inicialização do Oh My Zsh e Temas ---
# O Zsh é uma tela em branco; o Oh My Zsh é a sua moldura.
# O tema 'agnoster' é a paleta de cores para a sua obra de arte.
export ZSH="\$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

# Plugins são os seus aliados.
# 'git' para comandos mais ágeis.
# 'zsh-autosuggestions' para prever seus pensamentos.
# 'zsh-syntax-highlighting' para dar vida ao seu código com cores.
# 'zsh-history-substring-search' para uma busca poderosa no seu histórico.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-substring-search
)

source \$ZSH/oh-my-zsh.sh

# --- 2. Custom Keybindings (Ligamentos de Tecla Customizados) ---
# Aqui criamos um feitiço para a tecla Tab.
# Ele tenta usar a auto-sugestão primeiro. Se não houver, usa o auto-completar padrão.
bindkey '^[[Z' reverse-menu-complete
bindkey '^I' autosuggest-accept-or-complete
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'

_complete_or_suggest() {
  # Tenta aceitar a sugestão do histórico, se houver
  if [[ -n "\$ZSH_AUTOSUGGEST_LAST_SUGGESTION" ]]; then
    zle autosuggest-accept
  else
    # Se não houver sugestão, usa o auto-completar padrão do Zsh
    zle complete-word
  fi
}
zle -N _complete_or_suggest
bindkey '^I' _complete_or_suggest

# --- 3. Aliases e Funções Pessoais ---
# Seus feitiços e encantamentos pessoais, migrados do seu antigo grimório (.bash_aliases).
# Eles agora vivem aqui, no santuário principal.

# Aliases de listagem de arquivos
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Aliases rápidos do dia a dia
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias update="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"
alias duso="du -sh * | sort -rh"
alias ports="sudo netstat -tulanp"
alias myip="curl -s ifconfig.me"
alias f="find . -name"
alias grepr="grep -rIl"
alias gs="git status -s"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"

# Função para abrir pastas no gerenciador de arquivos
explore() {
  if [ -d "\$1" ]; then
    xdg-open "\$1"
  else
    echo "Erro: O diretório '\$1' não existe."
  fi
}

# Funções do Meta-Encantamento
# Função para criar .gitignore (mantida do arquivo original)
__santuario_criar_gitignore() {
    echo "--> Feitiço de proteção (.gitignore) não encontrado. Forjando um novo..."
    cat << 'EOG' > .gitignore
# Ambientes Virtuais
.venv/
venv/
env/
des/
.pipelines/

# Cache do Python
__pycache__/
*.py[cod]
*py.class

# Arquivos de IDEs e editores
.vscode/
.idea/
*.sublime-project
*.sublime-workspace

# Logs e bancos de dados locais
*.log
*.db
*.sqlite3
build/
dist/
*.egg-info/
*.egg

# Arquivos do Jupyter Notebook
.ipynb_checkpoints

# Pastas de configuração e binários
Temas/
alma/
ferramentas/
pipelines-main/
EOG
    git rm -r --cached . >/dev/null 2>&1
    git add .gitignore
    echo "--> O santuário agora está protegido contra impurezas."
}

# Função do Santuário para navegação e ativação de ambientes
santuario() {
    if [ -z "\$1" ]; then
        echo -e "\e[1;33mSantuário não especificado. Escolha um dos domínios abaixo:\\e[0m"
        echo "--------------------------------------------------------"
        find "\$HOME/Desenvolvimento" -maxdepth 1 -mindepth 1 -type d -printf "%f\n" | sort | while read -r dir; do printf "  \e[1;34m%s\n\e[0m" "\$dir"; done
        echo "--------------------------------------------------------"
        echo "Uso: santuario <NomeDoDominio>"
        return 1
    fi
    local projeto_nome="\$1"
    local dev_dir="\$HOME/Desenvolvimento"
    local projeto_encontrado
    projeto_encontrado=\$(find "\$dev_dir" -maxdepth 1 -type d -name "\$projeto_nome")

    if [ -z "\$projeto_encontrado" ]; then
        echo "Erro: Santuário '\$projeto_nome' não foi encontrado em '\$dev_dir'."
        return 1
    fi

    echo "Adentrando santuário: \$projeto_encontrado"
    cd "\$projeto_encontrado" || return

    echo "--- Conteúdo do Santuário ---"
    ls -F --color=auto
    echo "---------------------------"

    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Sincronizando com as estrelas (git pull)..."
        git pull origin main --quiet --rebase
        [ ! -f ".gitignore" ] && __santuario_criar_gitignore
    fi

    local venv_path=""
    if [ -f ".venv/bin/activate" ]; then
        venv_path=".venv/bin/activate"
    elif [ -f "venv/bin/activate" ]; then
        venv_path="venv/bin/activate"
    elif [ -f "des/bin/activate" ]; then
        venv_path="des/bin/activate"
    fi

    if [ -n "\$venv_path" ]; then
        source "\$venv_path"
        echo "Círculo de poder de '\$projeto_nome' reativado."
    else
        echo "--> Círculo de poder não encontrado. Forjando um novo em '.venv'..."
        python3 -m venv .venv
        source .venv/bin/activate
        echo "--> Novo círculo de poder ativado."
        if [ -f "requirements.txt" ]; then
            echo "--> Alquimia de dependências detectada. Transmutando..."
            pip install -r requirements.txt
            echo "--> Transmutação concluída."
        fi
    fi
    echo "Santuário '\$projeto_nome' pronto. As sombras o recebem."
    code .
}

# Função do Pacto do Espelho para sincronização de arquivos
atualizar_documentacao() {
    local DOC_DIR="\$HOME/Controle de Bordo/Documentação/"
    local DEV_DIR="\$HOME/Desenvolvimento/"

    echo "==> Iniciando o Pacto do Espelho Bidirecional..."
    echo "--------------------------------------------------------"

    mkdir -p "\$DOC_DIR"
    mkdir -p "\$DEV_DIR"

    # A lista de exclusão agora é uma lista precisa de demônios conhecidos.
    local EXCLUDE_RULES=(
      # Padrões de ambientes virtuais
      --exclude 'venv/'
      --exclude '.venv/'
      --exclude 'des/'
      --exclude '.pipelines/'

      # Padrões de cache e versionamento
      --exclude '__pycache__/'
      --exclude '.git/'

      # Pastas de projetos específicos que contêm binários ou dados pesados
      --exclude 'alma/'        # Contém modelos de voz da Luna
      --exclude 'ferramentas/' # Contém binários da Luna

      # Pastas de projetos inteiros ou de configuração que não devem ser espelhadas
      --exclude 'pipelines-main/'
      --exclude 'Temas/'
      --exclude 'Configurações/'
    )

    echo "--> Etapa 1: Sincronizando Oficina -> Cofre..."
    rsync -avhu --prune-empty-dirs "\${EXCLUDE_RULES[@]}" "\$DEV_DIR" "\$DOC_DIR"

    echo "--> Etapa 2: Sincronizando Cofre -> Oficina..."
    rsync -avhu --prune-empty-dirs "\${EXCLUDE_RULES[@]}" "\$DOC_DIR" "\$DEV_DIR"

    echo "--------------------------------------------------------"
    echo "==> Pacto concluido. Os planos se refletem, a verdade mais recente prevalece."
}

# --- 4. Inicialização de Ferramentas e Configurações de Sistema ---
# @docs #4: Este bloco de código cuida da exibição de informações do sistema
# na inicialização do terminal (usando fastfetch) e do status da GPU NVIDIA.
# Ele também configura os caminhos do sistema (PATH) para ferramentas
# como NVM e Rust.
# Exibir informações do sistema no início do terminal
if [[ \$- == *i* ]] && command -v fastfetch >/dev/null 2>&1; then
  clear
  fastfetch
fi

# Exibir status da GPU (NVIDIA)
if command -v nvidia-smi >/dev/null 2>&1; then
  echo "[GPU] NVIDIA ativa:"
  nvidia-smi --query-gpu=name,driver_version,temperature.gpu --format=csv,noheader
else
  echo "[GPU] NVIDIA nao ativa ou nao instalada."
fi

# Configurações de PATH do sistema
export PATH="\$PATH:\$HOME/.local/bin"
export PATH="\$PATH:\$(npm root -g)/../bin"
. "\$HOME/.cargo/env" 2>/dev/null

# Configuração do Node Version Manager (NVM)
export NVM_DIR="\$HOME/.nvm"
[ -s "\$NVM_DIR/nvm.sh" ] && \\. "\$NVM_DIR/nvm.sh"
[ -s "\$NVM_DIR/bash_completion" ] && \\. "\$NVM_DIR/bash_completion"

# Importar chaves e segredos pessoais do seu cofre
# Este arquivo DEVE ser criado manualmente por você!
# Exemplo: export GITHUB_TOKEN="sua_chave_aqui"
if [ -f ~/.zsh_secrets ]; then
    . ~/.zsh_secrets
fi
EOF

# --- 5. Configuração da Paleta de Cores do Terminal ---
# @docs #5: Este comando usa o gsettings para definir a paleta de cores do
# terminal. Ele usa uma paleta inspirada no tema Dracula.
# Ele assume que o perfil padrão do terminal será usado.
echo "--> Configurando a paleta de cores do terminal..."
PROFILE_ID=$(gsettings get org.gnome.Terminal.Legacy.Settings default | tr -d "'")
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_ID/ palette "['#282A36', '#FF5555', '#50FA7B', '#F1FA8C', '#BD93F9', '#FF79C6', '#8BE9FD', '#F8F8F2', '#44475A', '#FFB86C', '#50FA7B', '#F1FA8C', '#BD93F9', '#FF79C6', '#8BE9FD', '#F8F8F2']"

# --- 6. Definindo o Zsh como o Shell Padrão ---
# @docs #4: Esta é a última etapa. Ela define o Zsh como o shell padrão
# do sistema. O usuário precisará fechar e reabrir o terminal para que as
# alterações sejam aplicadas.
echo "--> Definindo o Zsh como o shell padrão..."
chsh -s $(which zsh)

# --- 7. Finalizando o Ritual ---
# @docs #5: Instruções finais para que o novo reino se manifeste em toda a sua glória.
echo "----------------------------------------"
echo "--> Ritual concluido. O novo reino esta pronto."
echo "Por favor, feche e reabra o terminal para que as alterações tenham efeito."
echo "Em seguida, ajuste a fonte para 'FiraCode Nerd Font' nas preferências do GNOME Terminal para a estética completa."

