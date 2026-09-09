# Como instalar o MySQL (MySQL Installer + MySQL Workbench)

Este guia usa **só um caminho**: o instalador oficial da Oracle/MySQL, que
instala o **MySQL Server** (o banco de verdade) e o **MySQL Workbench** (a
ferramenta profissional para escrever SQL, ver tabelas e administrar o
banco). É a mesma ferramenta usada no mercado de trabalho, então o que você
aprender aqui vale fora da sala de aula também.

O passo a passo abaixo foi cruzado com a documentação oficial da Oracle e
vários tutoriais atuais (GeeksforGeeks, Simplilearn, CodeLucky — links no
fim do arquivo) para cobrir também os erros mais comuns de cada etapa.

---

## 0. Antes de baixar (pré-requisitos)

- **Windows 10 ou 11, 64 bits.**
- Cerca de **500 MB livres** de espaço em disco.
- **Acesso de Administrador** na conta do Windows. Instalar sem ser
  administrador é a causa nº 1 de instalação "que parece ter dado certo mas
  não funciona depois" — o instalador não consegue criar o serviço do
  Windows nem abrir a porta necessária.
- O instalador da Oracle já baixa e instala sozinho os dois componentes que
  ele precisa (Microsoft **.NET Framework 4.5.2+** e o **Visual C++
  Redistributable 2015-2022**). Se algum desses já estiver desatualizado no
  seu Windows, o próprio instalador vai te avisar e linkar o download — pode
  seguir o link dele.

---

## 1. Baixar o MySQL Installer

1. Acesse: https://dev.mysql.com/downloads/installer/
2. Baixe a versão **maior** listada (ex: `mysql-installer-community-8.x.x.msi`),
   não a "web" — a versão completa já vem com tudo dentro do arquivo e evita
   falha de download durante a instalação.
3. Se a Oracle pedir login/cadastro na tela seguinte, procure o link
   **"No thanks, just start my download"**, bem abaixo do botão de login —
   não precisa criar conta.

---

## 2. Rodar o instalador

1. Ache o arquivo baixado e **clique com o botão direito → "Executar como
   administrador"** (não dê só duplo clique — veja o motivo no passo 0).
2. Na tela **"Choosing a Setup Type"**, marque **"Developer Default"**.
   Essa opção instala de uma vez: MySQL Server, MySQL Workbench, MySQL
   Shell, conectores e os bancos de exemplo da própria Oracle. É a opção
   recomendada por todos os tutoriais consultados para quem está montando o
   ambiente pela primeira vez.
3. Clique **Next** → na tela de verificação de requisitos ("Check
   Requirements"), se aparecer algo faltando, clique em **Execute** para o
   instalador baixar/instalar sozinho, e depois **Next**.
4. Na tela **"Installation"**, clique **Execute** e espere a barra de
   progresso terminar em todos os itens (fica um "✔" verde do lado de cada
   um). Clique **Next**.

---

## 3. Configurar o MySQL Server (a parte que mais gera dúvida)

Depois da instalação dos arquivos, o instalador abre o **"Product
Configuration"**, com várias telas de configuração. As que importam:

1. **Type and Networking** — pode deixar tudo no padrão: tipo de
   configuração "Development Computer" e porta **3306**. Anote mentalmente
   o número **3306**: é a "porta" que o Workbench vai usar para achar o
   banco depois.
2. **Authentication Method** — escolha **"Use Strong Password Encryption for
   Authentication (RECOMMENDED)"**. É a opção padrão e mais nova; a outra
   ("Legacy") só existe para compatibilidade com programas bem antigos.
3. **Accounts and Roles** — aqui você define a **senha do usuário `root`**.
   Este é o passo mais importante do tutorial inteiro:
   - Digite uma senha que você vá **lembrar ou anotar em lugar seguro**
     (bloco de notas, gerenciador de senhas). Existe uma barra de força de
     senha — não precisa ser complexa, mas evite deixar em branco.
   - **Se você esquecer essa senha depois, não tem "recuperar senha" fácil**
     — o processo de reset envolve reinstalar ou editar arquivos de
     configuração manualmente. Anote antes de continuar.
   - Não precisa adicionar nenhum "MySQL User" extra nesta tela — o `root`
     já é suficiente para os exercícios.
4. **Windows Service** — deixe marcado **"Start the MySQL Server at System
   Startup"** e o nome padrão do serviço (`MySQL80` ou similar). Isso faz o
   banco ligar sozinho toda vez que o Windows iniciar, sem precisar nenhum
   comando manual.
5. Clique **Next**, depois **Execute** para aplicar essa configuração, e
   **Finish**/**Next** até a tela final. Deixe marcado **"Start MySQL
   Workbench after Setup"** e clique **Finish**.

### Erros comuns nesta etapa

| Sintoma | Causa | Solução |
|---|---|---|
| Instalador trava ou reclama de porta durante "Type and Networking" | Já existe outro programa usando a porta 3306 (outra instalação de MySQL/MariaDB, XAMPP, WAMP, etc. de uma tentativa anterior) | Desinstale a instalação antiga (Painel de Controle → Programas) antes de tentar de novo, ou troque a porta nesta tela para `3307` (aí lembre de usar `3307` no Workbench depois também) |
| "A DLL is missing" ou erro de Visual C++ / .NET logo no início | Faltam os componentes do Windows que o instalador tentou instalar sozinho e não conseguiu (sem internet, ou sem permissão) | Baixe manualmente o "Microsoft Visual C++ Redistributable" mais recente no site da Microsoft, instale, e rode o MySQL Installer de novo |
| Instalação "termina" mas o serviço nunca aparece rodando | Instalador foi executado **sem** ser como administrador | Desinstale, e repita o passo 2 clicando em "Executar como administrador" |

---

## 4. Primeira conexão no MySQL Workbench

1. Abra o **MySQL Workbench** (se marcou a opção no fim da instalação, ele
   já abre sozinho).
2. Na tela inicial, em **"MySQL Connections"**, deve aparecer um quadradinho
   chamado **"Local instance MySQL80"** (ou parecido). Clique nele.
3. Vai pedir a **senha do root** — digite a senha que você definiu no passo
   3.3. Marque "Save password in vault" se quiser não digitar de novo depois.
4. Se aparecer a tela do editor SQL com um painel à esquerda chamado
   **"Navigator"**, deu certo — o Workbench está conectado ao seu MySQL
   Server.

### Erro comum: "Access denied for user 'root'@'localhost'"

Essa é a mensagem de erro mais comum de todo o processo. Significa que a
senha digitada não bate com a senha configurada no passo 3.3. Não existe
outro motivo na grande maioria dos casos.
- Confira se não digitou a senha errada (maiúsculas/minúsculas importam).
- Confira se o teclado não está com "Caps Lock" ligado sem querer.
- Se realmente esqueceu a senha, o caminho mais simples para quem está
  começando é desinstalar tudo (MySQL Installer → botão "Remove") e refazer
  a instalação do zero, definindo uma senha nova que você vá anotar desta
  vez.

---

## 5. Digitando os primeiros comandos

1. Com a conexão aberta, clique no ícone de **folha em branco com um "+"**
   (canto superior esquerdo, "Create a new SQL tab") para abrir uma aba de
   edição de SQL.
2. Digite um comando de teste, por exemplo:
   ```sql
   SELECT 'Meu MySQL está funcionando!' AS status;
   ```
3. Rode com o ícone de **raio (⚡)** na barra de ferramentas (ou `Ctrl+Enter`).
   O resultado aparece numa grade (tabela) logo abaixo do editor, na área
   chamada **"Result Grid"**.

Se esse teste funcionou, você está pronto para seguir para
**[01_desafio_criar_banco.md](01_desafio_criar_banco.md)** e criar o banco
`loja` de verdade, digitando você mesmo os `CREATE DATABASE`, `CREATE TABLE`
e `INSERT` nessa mesma aba de SQL.

---

## 6. Como visualizar o banco (tabelas e dados) sem escrever SELECT

Depois de criar o banco `loja` (parte 1 do desafio), você pode **ver** as
tabelas e os dados sem escrever nenhuma query, direto pela interface:

1. No painel **"Navigator"**, à esquerda, clique na aba **"SCHEMAS"** (se
   não tiver essa aba visível, vá em **View → Panels → Show Schemas**).
2. Se o banco `loja` não aparecer na lista, clique com o botão direito
   dentro do painel e escolha **"Refresh All"** (o Workbench só atualiza
   essa lista quando você manda).
3. Clique na setinha ao lado de `loja` para expandir, depois na setinha ao
   lado de **"Tables"** — devem aparecer `clientes`, `produtos`, `pedidos` e
   `itens_pedido`.
4. Clique com o botão direito em cima de uma tabela (ex: `clientes`) e
   escolha **"Select Rows - Limit 1000"**. Isso monta e roda um `SELECT *`
   sozinho e mostra os dados em forma de planilha, na "Result Grid".
5. Para ver só a estrutura (colunas e tipos) sem os dados, clique com o
   botão direito na tabela e escolha **"Table Inspector"** ou dê duplo
   clique na tabela — abre uma aba com as informações da coluna, chaves
   primárias e estrangeiras.

Isso é útil para conferir rapidamente se os `INSERT` do desafio realmente
gravaram os dados certos, sem precisar montar uma query manualmente.

---

## Ordem completa da pasta

1. **00_como_instalar.md** *(este arquivo)*
2. [01_desafio_criar_banco.md](01_desafio_criar_banco.md) — você cria o banco
   `loja`, as 4 tabelas e digita os dados de exemplo, do zero.
3. [02_solucao_criacao.sql](02_solucao_criacao.sql) — solução do passo 2, só
   para conferir depois ou resetar se travar.
4. [03_exercicios_consultas.md](03_exercicios_consultas.md) — exercícios de
   `SELECT`/`JOIN`/etc. em cima do banco que você acabou de montar.
5. `04_gabarito_consultas.sql` — gabarito do passo 4 (uso do professor, fora
   do repositório público).

---

### Fontes consultadas para este guia

- [MySQL Workbench Manual — Installing (documentação oficial)](https://dev.mysql.com/doc/workbench/en/wb-installing-windows.html)
- [How to Install SQL Workbench For MySQL on Windows — GeeksforGeeks](https://www.geeksforgeeks.org/installation-guide/how-to-install-sql-workbench-for-mysql-on-windows/)
- [MySQL Workbench Installation: A Step-by-Step Guide — Simplilearn](https://www.simplilearn.com/tutorials/mysql-tutorial/mysql-workbench-installation)
- [MySQL Windows Installation: A Comprehensive Guide — CodeLucky](https://codelucky.com/mysql-windows-installation/)
- [Access denied for user 'root@localhost' — phoenixNAP](https://phoenixnap.com/kb/access-denied-for-user-root-localhost)
