# Como preparar o ambiente para fazer os exercícios

Escolha **uma** das opções abaixo. Se a turma vai usar as próprias máquinas, a
**Opção A (XAMPP)** costuma ser a mais tranquila para quem nunca instalou nada
de banco de dados.

---

## Opção A — XAMPP (recomendado, mais simples)

O XAMPP instala o MySQL/MariaDB junto com o **phpMyAdmin**, uma interface
visual pelo navegador — não precisa digitar comando nenhum no terminal.

1. Baixe em: https://www.apachefriends.org/pt_br/index.html (escolha a versão
   para Windows).
2. Rode o instalador. Na tela de componentes, deixe marcados pelo menos:
   **Apache** e **MySQL** (o phpMyAdmin já vem incluso).
3. Termine a instalação com as opções padrão (pode dar "Next" em tudo).
4. Abra o **XAMPP Control Panel** (fica no menu iniciar ou na pasta onde
   instalou).
5. Clique em **Start** na linha do **Apache** e na linha do **MySQL** — as
   duas devem ficar verdes.
6. Abra o navegador em: http://localhost/phpmyadmin
7. Clique na aba **"SQL"** no topo (não precisa usar o botão "Novo" — você vai
   criar o banco digitando o comando, como parte do desafio). Escreva e
   execute os comandos que estão no início do
   [01_desafio_criar_banco.md](01_desafio_criar_banco.md) (Parte 2).
8. A partir daí, toda vez que for testar um comando, use essa mesma aba
   **"SQL"**: escreva o comando e clique em **"Executar"** (Go).

Não importe nenhum arquivo pronto por enquanto — o objetivo é você digitar
cada `CREATE TABLE` e `INSERT` sozinho, seguindo o
[01_desafio_criar_banco.md](01_desafio_criar_banco.md). O arquivo
`02_solucao_criacao.sql` só existe para conferência depois.

Para parar tudo no fim do dia, volte ao XAMPP Control Panel e clique em
**Stop** no Apache e no MySQL.

---

## Opção B — MySQL Workbench (mais "profissional")

Ferramenta oficial do MySQL, com editor de SQL mais completo. Um pouco mais
de passos para configurar.

1. Baixe o instalador em:
   https://dev.mysql.com/downloads/installer/
2. Rode o instalador e escolha o tipo de instalação **"Developer Default"**
   (já traz o MySQL Server e o MySQL Workbench juntos).
3. Durante a instalação, ele vai pedir para definir uma **senha do usuário
   root** — anote essa senha, você vai usá-la sempre que conectar.
4. Ao terminar, abra o **MySQL Workbench**.
5. Clique na conexão local (geralmente já aparece como
   `Local instance MySQL`), digite a senha definida no passo 3.
6. Abra uma aba de SQL nova (ícone de folha em branco) e siga o
   [01_desafio_criar_banco.md](01_desafio_criar_banco.md) a partir da Parte 2
   — digite ali mesmo os comandos `CREATE DATABASE`, `CREATE TABLE` e
   `INSERT` que você for escrevendo, e rode com o ícone de raio (⚡,
   "Execute").

Não use **File → Open SQL Script** para abrir `02_solucao_criacao.sql` agora
— esse arquivo é a solução pronta, só para conferir depois.

---

## Opção C — Sem instalar nada (para testar rapidinho)

Se for só para experimentar ou não puder instalar nada na máquina:

1. Acesse https://www.db-fiddle.com/
2. No canto superior, em **"Database"**, escolha **MySQL** (alguma versão
   recente).
3. No painel da esquerda (**Schema SQL**), digite os `CREATE TABLE` que você
   for escrevendo seguindo o desafio.
4. No painel da direita (**Query SQL**), coloque os `INSERT` e depois as
   consultas que quiser testar.
5. Clique em **Run**.

Essa opção é boa para testar rapidamente, mas os dados **não ficam salvos**
entre sessões — para um curso/turma, prefira a Opção A.

---

## Depois de instalado

Siga a pasta nesta ordem:

1. [01_desafio_criar_banco.md](01_desafio_criar_banco.md) — você cria o banco
   `loja`, as 4 tabelas e digita os dados de exemplo, do zero.
2. [02_solucao_criacao.sql](02_solucao_criacao.sql) — solução do passo 1, só
   para conferir depois ou resetar se travar.
3. [03_exercicios_consultas.md](03_exercicios_consultas.md) — exercícios de
   `SELECT`/`JOIN`/etc. em cima do banco que você acabou de montar.
4. [04_gabarito_consultas.sql](04_gabarito_consultas.sql) — gabarito do
   passo 3 (uso do professor), com explicação curta em cada resposta.
