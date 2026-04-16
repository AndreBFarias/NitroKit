[![Licença](https://img.shields.io/badge/licença-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Shell](https://img.shields.io/badge/shell-bash-green.svg)](https://www.gnu.org/software/bash/)
[![Estrelas](https://img.shields.io/github/stars/AndreBFarias/Pop-OS-Nitro-5-Linux-Utilitarios.svg?style=social)](https://github.com/AndreBFarias/Pop-OS-Nitro-5-Linux-Utilitarios/stargazers)
[![Contribuições](https://img.shields.io/badge/contribuições-bem--vindas-brightgreen.svg)](https://github.com/AndreBFarias/Pop-OS-Nitro-5-Linux-Utilitarios/issues)

# Pop-OS-Nitro-5-Linux-Utilitarios

<p align="center">
    <img src="https://raw.githubusercontent.com/AndreBFarias/Pop-OS-Nitro-5-Linux-Utilitarios/main/assets/acer-nitro.png" alt="Logo Acer Nitro" width="22%">
</p>

<br>
Fui juntando aqui uns scripts `.sh` que criei ou adaptei pra resolver umas dores de cabeça no Pop!_OS (qualquer outra distro linux passou pelo), principalmente as que tive com meu Acer Nitro 5.

Estou deixando tudo aqui porque, honestamente, não achei solução pra várias dessas coisas no GitHub e, se isso poupar algumas horas de raiva de alguém, já valeu a pena. Use como quiser.

---

## Requisitos

- Linux (testado no Pop!_OS 22.04 e Ubuntu 22.04+)
- Bash 5.0 ou superior
- Privilégios de superusuário para scripts de sistema
- Dependências específicas por script (listadas em cada descrição)

### Os Scripts (A caixa de ferramentas)
> ### `reparo_completo_sistema.sh`
Link: [src/reparo_completo_sistema.sh](src/reparo_completo_sistema.sh)

> Esse aqui é o meu "botão nuclear", o último recurso antes de jogar tudo pro alto e formatar. É um script meio bruto que tenta de tudo um pouco: limpa o sistema, reinstala um monte de coisa essencial, mexe nos drivers..., o famoso "reza e vai". Use por sua conta e risco, mas já me salvou uma vez(acho).

> ### `aplicador_solucoes_nitro5.sh`
Link: [src/aplicador_solucoes_nitro5.sh](src/aplicador_solucoes_nitro5.sh)

> Esse virou meu "kit de sobrevivência" pro Nitro 5. Juntei nele um monte de correção que precisei fazer: o ajuste do brilho, a gambiarra pra USB não morrer do nada, o jeito de criar a entrada de boot do Windows... Até a configuração pra fazer o Spicetify funcionar direito tá aí. Basicamente, a paz que a Acer não me deu.

> ### `restaurador_audio_pipewire.sh`
Link: [src/restaurador_audio_pipewire.sh](src/restaurador_audio_pipewire.sh)

> Meu microfone de repente começou a soar como se eu estivesse falando de dentro de uma garrafa, com um eco bizarro e captando até a ventoinha do notebook. Esse script foi o que resolveu. Ele basicamente reseta as configurações do PipeWire e reinstala as coisas no lugar. Foi o que exorcizou os espectros ectoplásmicos do meu áudio.

> ### `arquiteto_de_diretorios.sh`
Link: [src/arquiteto_de_diretorios.sh](src/arquiteto_de_diretorios.sh)

> Minha pasta de "Downloads" era uma zona de guerra. Criei esse "arquiteto" pra dar um jeito na bagunça. É um assistente com menu que te ajuda a organizar as coisas, e o melhor é que ele pode só "simular" primeiro, te mostrando o que faria, sem mover nada. Fiz ele ser à prova de gente apressada (eu).

> ### `coletor_geral_logs.sh`
Link: [src/coletor_geral_logs.sh](src/coletor_geral_logs.sh)

> Usei esse quando precisei pedir ajuda num fórum gringo e me pediram "os logs". Em vez de ficar caçando, esse script funciona como uma ressonância magnética: coleta uma quantidade absurda de logs do sistema e joga tudo numa pasta. Daí é só compactar e mandar pra quem manja.

> ### `diagnostico_focado_erros.sh`
Link: [src/diagnostico_focado_erros.sh](src/diagnostico_focado_erros.sh)

> Diferente do de cima, que pega tudo, este aqui é o "termômetro". Ele só busca os problemas óbvios e os erros mais comuns nos logs. É bom pra ter uma noção rápida do tamanho do estrago sem precisar ler um livro de logs.

> ### `gerador_inventario_software.sh`
Link: [src/gerador_inventario_software.sh](src/gerador_inventario_software.sh)

> Eu honestamente não lembrava nem metade das coisas que tinha instalado, especialmente AppImages e uns trecos que compilei na mão anos atrás. Por isso fiz o "Inquisidor". Ele só... uh... vasculha tudo e lista o que encontra, dos pacotes normais até esses fantasmas esquecidos no HD.

> ### `verificador_integridade_pre-boot.sh`
Link: [src/verificador_integridade_pre-boot.sh](src/verificador_integridade_pre-boot.sh)

> Sabe aquele suor frio que desce depois de mexer num arquivo de configuração importante e ter que reiniciar? Criei esse "amuleto" pra esses momentos. Ele só dá uma checada geral nas coisas vitais do boot pra ver se a chance de dar BO é grande ou pequena.

> ### `backup_particao_efi.sh`
Link: [src/backup_particao_efi.sh](src/backup_particao_efi.sh)

> A partição EFI é o que deixa seu computador ligar, basicamente. Se ela corromper, já era. Esse script é só uma apólice de seguro que faz um backup dela. Tomara que você nunca precise restaurar, mas é bom ter.

> ### `exportador_lista_pacotes.sh`
Link: [src/exportador_lista_pacotes.sh](src/exportador_lista_pacotes.sh)

> Pra quando eu decido formatar ou quero montar um sistema parecido em outra máquina. Ele basicamente cria uma "lista de compras" de tudo que tá instalado via APT, Flatpak e Snap, pra facilitar a vida depois.

> ### `removedor_seguro_diretorio.sh`
Link: [src/removedor_seguro_diretorio.sh](src/removedor_seguro_diretorio.sh)

> Fiz esse mais como um modelo, praquele momento de "posso apagar isso... eu acho". Em vez de dar um `rm -rf` e chorar depois, ele usa o `gio trash`, que manda as coisas pra lixeira normal do sistema. Limpeza com botão de "desfazer".

> ### `unificador_temas_dracula.sh`
Link: [src/unificador_temas_dracula.sh](src/unificador_temas_dracula.sh)

> Eu ficava maluco quando instalava um tema legal e os aplicativos em Flatpak continuavam com a cara do Windows 95. Esse script força todo mundo a usar o mesmo tema GTK, de ícones e de cursor. Sem mais apps rebeldes.

> ### `instalador_extensoes_gnome.sh`
Link: [src/instalador_extensoes_gnome.sh](src/instalador_extensoes_gnome.sh)

> Preguiça de ficar caçando e instalando extensão do GNOME uma por uma. Joguei os IDs das que eu mais uso aqui e ele instala tudo de uma vez.

> ### `ajuste_backlight_acpi.sh`
Link: [src/ajuste_backlight_acpi.sh](src/ajuste_backlight_acpi.sh)

> O controle de brilho do meu notebook simplesmente parou de funcionar. Depois de muito procurar, descobri que forçar o modo "native" do ACPI resolvia. É só isso que esse script faz.

> ### `oraculo_do_kernel.sh`
Link: [src/oraculo_do_kernel.sh](src/oraculo_do_kernel.sh)

> Mexer nos parâmetros de boot do kernel é como fazer uma cirurgia de coração aberto no seu sistema. Um erro e... bem, você já sabe. Criei o "Oráculo" pra ser o meu "cirurgião assistente". Primeiro, ele faz um diagnóstico completo, te mostrando as opções de boot que você tem agora. Depois, ele te mostra uma lista de parâmetros otimizados (já corrigi uns conflitos que eu mesmo tinha criado) e, só depois de você olhar pra tudo e concordar, ele aplica as mudanças. É o jeito mais seguro que encontrei de fazer essa operação de alto risco.

> ### `Dracula-Theme-GTK`
Link: [src/dracula-theme-gtk-pop-os.css](src/dracula-theme-gtk-pop-os.css)

>Versão modificada do tema gtk drácula, o diferencial foi mexer na questão da transparência na top bar, estetizar a dock e fazer com que ele não entrasse em conflito com as demais extensões que eu tenho.

> ### `Dracula-Theme-OnlyOffice`
Link: [src/dracula_only_office.json](src/dracula_only_office.json)

>Também coloquei um tema que fiz pro programa only office, seguindo a paleta do Dracula.

> ### `ritual_de_harmonia`
Link: [src/>ritual_de_harmonia.sh](src/ritual_de_harmonia.sh)

>Script para unificar a aparência do Pop!_OS (impedir intriga entre programas Nativos e Flatpak) e resolver conflitos de atalho para aplicativos como Ulauncher.
> ### `instalador_zsh.sh`
Link: [src/instalador_zsh.sh](https://github.com/AndreBFarias/Pop-OS-Nitro-5-Linux-Utilitarios/blob/main/src/instalador_zsh.sh)

> Este é o feitiço que transforma o terminal do sistema, substituindo o Bash pelo Zsh e instalando um ambiente completo e esteticamente aprimorado com tema `agnoster`, auto-sugestões e navegação inteligente. Ele configura tudo automaticamente.

> ### `setup_penpot_docker.sh`
Link: [src/setup_penpot_docker.sh](src/setup_penpot_docker.sh)

> Script de pós-instalação para provisionar uma instância local da ferramenta de design e prototipagem Penpot, via Docker, no Pop!_OS. Ele automatiza todo o processo, desde a instalação e configuração do Docker e Docker Compose até o download e patch do arquivo de configuração do Penpot, garantindo uma instalação robusta e funcional com um único comando.

> ### `create_penpot_launcher.sh`
Link: [src/create_penpot_launcher.sh](src/create_penpot_launcher.sh)

> Um script de conveniência para ser executado após a instalação do Penpot com Docker. Ele cria uma integração completa com o desktop, gerando automaticamente:
>   Um script `start_penpot.sh` para iniciar os serviços e abrir a interface no navegador.> Uma função `stop_penpot.sh` para desligar os serviços. Um arquivo `.desktop` que cria um ícone de aplicativo no menu, permitindo iniciar e parar o servidor Penpot com um clique, sem precisar usar o terminal.

> ### `font_config.py`
Link: [src/font_config.py](src/font_config.py)
>Define configurações de fontes personalizadas (Fira Code Nerd Font, Roboto Slab e Fira Sans SemiBold) para o sistema. O script cria um arquivo `.conf` na pasta do usuário e atualiza o cache de fontes.

> ### `guardiao_da_memoria.sh`
Link: [src/guardiao_da_memoria.sh](src/guardiao_da_memoria.sh)
>Automatiza a instalação e configuração do serviço `earlyoom`, um daemon de monitoramento de memória. Seu propósito é prevenir o congelamento do sistema quando a memória RAM atinge um nível crítico, encerrando processos que consomem muita memória.

> ### `sentinela_da_paz.sh`
Link: [src/sentinela_da_paz.sh](src/sentinela_da_paz.sh)
>Um script de startup para forçar a GPU NVIDIA a operar em modo de alto desempenho e garantir que o perfil de energia do sistema permaneça em modo `performance`, resolvendo problemas de performance e estabilidade.

> ### `weylus.sh`
Link: [src/weylus.sh](src/weylus.sh)
>Automatiza a instalação do `Weylus` e do `Input Remapper` para configurar um tablet como uma extensão de tela e mesa digitalizadora.


> ### `instalador_boxbuddy.sh`
Link: [src/instalador_boxbuddy.sh](src/instalador_boxbuddy.sh)
>Automatiza a instalação e configuração do BoxBuddy, uma interface gráfica para o Distrobox. Ele instala as dependências necessárias, configura permissões de acesso ao sistema de arquivos para que o aplicativo possa gerenciar ambientes de desenvolvimento isolados.
---

Se gostar de algo, deixa uma estrela aí. Cada script desses tem umas boas horas de pesquisa e raiva investidas, como se eu fosse um engenheiro da Acer tentando consertar os próprios produtos, mas sem receber nada em troca. =D

### Licença GPLv3
Livre para modificar e usar da forma que preferir desde que tudo permaneça livre.
