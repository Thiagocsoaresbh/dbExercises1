# Desafio: construa o banco de dados você mesmo

Diferente de copiar e colar um script pronto, aqui você vai **pensar, decidir e
digitar** cada peça do banco. É assim que o conteúdo realmente fica — errando
e corrigindo no caminho.

Não existe "01_gabarito" pronto para colar. A solução só aparece no arquivo
**[02_solucao_criacao.sql](02_solucao_criacao.sql)**, e a ideia é você só abrir
esse arquivo depois de tentar (ou se travar de verdade e precisar seguir em
frente).

---

## Cenário

Você foi contratado(a) para montar o banco de dados de uma **loja online**.
O dono contou como o negócio funciona:

- A loja tem **clientes**, cada um com nome, cidade, estado e (às vezes,
  nem sempre) data de nascimento.
- A loja vende **produtos**, cada um com nome, categoria (ex: Eletrônicos,
  Livros, Móveis), preço e quantidade em estoque.
- Um cliente pode fazer **pedidos**. Cada pedido tem uma data e um status
  (`pendente`, `enviado`, `entregue` ou `cancelado`), e pertence a **um**
  cliente.
- Um pedido pode ter **vários produtos diferentes**, e de cada produto pode
  vir mais de uma unidade. Precisamos guardar, para cada produto dentro de um
  pedido, a quantidade e o preço que foi cobrado naquele momento (o preço do
  produto pode mudar no futuro, mas o que foi pago no pedido tem que ficar
  registrado do jeito que foi).

---

## Parte 1 — Pensar antes de digitar (faça no papel ou num comentário)

Antes de abrir o terminal do MySQL, responda:

1. Quantas tabelas você acha que vai precisar? Quais nomes elas teriam?
2. Para cada tabela, quais colunas ela precisa ter?
3. Para cada coluna, que tipo de dado ela guarda? (texto curto, texto longo,
   número inteiro, número com casas decimais, data...)
4. Qual coluna vai ser a **chave primária** (o identificador único) de cada
   tabela?
5. Onde existe uma **relação entre tabelas** (uma linha de uma tabela
   "aponta" para uma linha de outra)? Essas relações viram **chaves
   estrangeiras**.
6. Repare no último ponto do cenário (produtos dentro de um pedido, com
   quantidade e preço próprios) — isso não cabe dentro da tabela de pedidos
   nem na de produtos sozinha. Por quê? Que tabela nova isso te obriga a
   criar?

Não tem problema errar aqui — o objetivo é pensar antes de programar. Depois
de responder, siga para a Parte 2 e compare o que você imaginou com o que a
prática vai te exigir.

---

## Parte 2 — Criando as tabelas (`CREATE TABLE`)

Agora, no MySQL (Workbench, phpMyAdmin ou o terminal), rode:

```sql
CREATE DATABASE loja;
USE loja;
```

Escreva você mesmo o `CREATE TABLE` de cada tabela que você definiu na Parte
1. Use esta checklist de requisitos — mas a sintaxe exata é por sua conta:

**clientes**
- `id`: identificador único, numérico, deve se auto-preencher sozinho a cada
  novo cliente.
- `nome`: texto, obrigatório (não pode ficar em branco).
- `cidade`: texto, opcional.
- `estado`: texto bem curto (2 letras, tipo "SP"), opcional.
- `data_nascimento`: data, opcional (nem todo cliente vai informar).

**produtos**
- `id`: identificador único, auto-incremento.
- `nome`: texto, obrigatório.
- `categoria`: texto, opcional.
- `preco`: número com casas decimais (é dinheiro — pesquise por que `FLOAT`
  não é uma boa escolha aqui, e o que usar no lugar), obrigatório.
- `estoque`: número inteiro, obrigatório.

**pedidos**
- `id`: identificador único, auto-incremento.
- `cliente_id`: número inteiro, obrigatório, **referenciando** a tabela de
  clientes.
- `data_pedido`: data, obrigatória.
- `status`: texto curto, obrigatório.

**itens_pedido** (a tabela que você identificou na pergunta 6 da Parte 1)
- `id`: identificador único, auto-incremento.
- `pedido_id`: inteiro, obrigatório, referenciando pedidos.
- `produto_id`: inteiro, obrigatório, referenciando produtos.
- `quantidade`: inteiro, obrigatório.
- `preco_unitario`: número com casas decimais, obrigatório.

**Dica importante:** uma tabela com chave estrangeira só pode ser criada
**depois** que a tabela referenciada já existir. Pense na ordem antes de
rodar os comandos.

Depois de criar tudo, confira com:

```sql
SHOW TABLES;
DESCRIBE clientes;
DESCRIBE produtos;
DESCRIBE pedidos;
DESCRIBE itens_pedido;
```

Compare o resultado do `DESCRIBE` com a checklist acima. Faltou alguma coisa?
Use `ALTER TABLE` para corrigir em vez de apagar tudo e começar de novo.

---

## Parte 3 — Inserindo os dados (`INSERT INTO`)

Agora digite os `INSERT INTO` para colocar estas linhas nas suas tabelas.
Preste atenção na **ordem**: uma linha de `pedidos` só pode existir depois do
`cliente_id` que ela usa já existir em `clientes` (mesma lógica de antes).

### Tabela `clientes`

| nome | cidade | estado | data_nascimento |
|---|---|---|---|
| Ana Souza | São Paulo | SP | 1990-04-12 |
| Bruno Lima | Rio de Janeiro | RJ | 1985-11-02 |
| Carla Mendes | Belo Horizonte | MG | 1998-01-30 |
| Diego Alves | São Paulo | SP | 1979-07-19 |
| Elisa Torres | Curitiba | PR | 2001-09-05 |
| Fabio Nunes | Porto Alegre | RS | 1992-12-24 |
| Gabriela Rocha | Recife | PE | 1988-03-15 |
| Hugo Martins | São Paulo | SP | *(deixe em branco / não informado)* |

### Tabela `produtos`

| nome | categoria | preco | estoque |
|---|---|---|---|
| Notebook Pro 15" | Eletrônicos | 4500.00 | 8 |
| Mouse sem fio | Eletrônicos | 79.90 | 50 |
| Teclado mecânico | Eletrônicos | 320.00 | 25 |
| Monitor 24" | Eletrônicos | 899.00 | 15 |
| Cadeira gamer | Móveis | 1200.00 | 6 |
| Mesa para escritório | Móveis | 750.00 | 10 |
| Livro: SQL na prática | Livros | 59.90 | 40 |
| Livro: Python básico | Livros | 49.90 | 0 |
| Fone de ouvido | Eletrônicos | 199.90 | 30 |
| Luminária de mesa | Móveis | 89.90 | 20 |
| Mochila para notebook | Acessórios | 159.00 | 12 |
| Suporte para notebook | Acessórios | 99.00 | 0 |

### Tabela `pedidos`

Repare que `cliente` aqui é o **nome** só para você identificar — na sua
tabela, você vai precisar usar o `id` numérico do cliente correspondente
(confira com `SELECT * FROM clientes;` antes de montar os INSERTs).

| cliente | data_pedido | status |
|---|---|---|
| Ana Souza | 2026-01-05 | entregue |
| Bruno Lima | 2026-01-10 | entregue |
| Ana Souza | 2026-02-02 | enviado |
| Carla Mendes | 2026-02-14 | entregue |
| Diego Alves | 2026-03-01 | cancelado |
| Elisa Torres | 2026-03-20 | pendente |
| Bruno Lima | 2026-04-11 | entregue |
| Fabio Nunes | 2026-04-18 | enviado |
| Gabriela Rocha | 2026-05-02 | entregue |
| Ana Souza | 2026-05-25 | pendente |

### Tabela `itens_pedido`

Mesma ideia: `pedido` (posição na lista acima, 1 a 10) e `produto` (nome) são
só referência — você precisa descobrir os `id`s reais nas suas tabelas antes
de montar o INSERT.

| pedido (nº da lista acima) | produto | quantidade | preco_unitario |
|---|---|---|---|
| 1 | Notebook Pro 15" | 1 | 4500.00 |
| 1 | Mouse sem fio | 2 | 79.90 |
| 2 | Livro: SQL na prática | 3 | 59.90 |
| 3 | Monitor 24" | 1 | 899.00 |
| 3 | Fone de ouvido | 1 | 199.90 |
| 4 | Cadeira gamer | 1 | 1200.00 |
| 4 | Mesa para escritório | 1 | 750.00 |
| 5 | Notebook Pro 15" | 1 | 4500.00 |
| 6 | Teclado mecânico | 2 | 320.00 |
| 7 | Mouse sem fio | 1 | 79.90 |
| 7 | Fone de ouvido | 2 | 199.90 |
| 8 | Livro: SQL na prática | 5 | 59.90 |
| 9 | Mochila para notebook | 1 | 159.00 |
| 9 | Monitor 24" | 2 | 899.00 |
| 10 | Teclado mecânico | 1 | 320.00 |

---

## Parte 4 — Conferindo o que você fez

Depois de terminar os INSERTs, rode:

```sql
SELECT COUNT(*) FROM clientes;      -- deve dar 8
SELECT COUNT(*) FROM produtos;      -- deve dar 12
SELECT COUNT(*) FROM pedidos;       -- deve dar 10
SELECT COUNT(*) FROM itens_pedido;  -- deve dar 15
```

Se algum número não bater, use `SELECT * FROM <tabela>;` para achar o que
faltou ou duplicou, corrija com `INSERT`, `UPDATE` ou `DELETE` conforme o
caso — não apague tudo e recomece do zero por um erro pequeno.

Quando os 4 números baterem, seu banco está pronto para os exercícios de
consulta em **[03_exercicios_consultas.md](03_exercicios_consultas.md)**.
