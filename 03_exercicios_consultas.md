# Exercícios de SQL para Iniciantes — Consultas

Estes exercícios pressupõem que você **já construiu o banco `loja` com as
próprias mãos** seguindo **[01_desafio_criar_banco.md](01_desafio_criar_banco.md)**
(criou as 4 tabelas e digitou os INSERTs você mesmo). Se ainda não fez isso,
comece por lá — é onde está a parte de criar e entender o banco; aqui é a
parte de consultar o que você já montou.

As respostas estão em [04_gabarito_consultas.sql](04_gabarito_consultas.sql) —
é material do professor, então tente resolver sozinho antes de olhar!

---

## Nível 1 — SELECT básico

1. Liste todos os clientes (todas as colunas).
2. Liste apenas o nome e a cidade de todos os clientes.
3. Liste o nome de todos os produtos e seu preço, renomeando a coluna `preco` para `valor`.
4. Quantas colunas tem a tabela `pedidos`? E quantas linhas (use `SELECT *` e conte, ou pesquise a função `COUNT`)?

## Nível 2 — Filtros com WHERE

5. Liste os produtos da categoria `'Eletrônicos'`.
6. Liste os produtos com preço maior que 500.
7. Liste os produtos com estoque igual a 0 (fora de estoque).
8. Liste os clientes que moram em `'São Paulo'` **e** no estado `'SP'`.
9. Liste os clientes que moram em `'São Paulo'` **ou** em `'Curitiba'` (use `OR` ou `IN`).
10. Liste os produtos com preço entre 50 e 200 (use `BETWEEN`).
11. Liste os clientes cujo nome começa com a letra `'A'` (use `LIKE`).
12. Liste os clientes que não têm data de nascimento cadastrada (use `IS NULL`).
13. Liste os pedidos que **não** estão com status `'cancelado'` (use `<>` ou `NOT IN`).

## Nível 3 — Ordenação e limite

14. Liste todos os produtos ordenados do mais caro para o mais barato.
15. Liste os 3 produtos com maior estoque (use `ORDER BY` + `LIMIT`).
16. Liste os clientes ordenados por nome em ordem alfabética.
17. Liste os pedidos ordenados por data, do mais recente para o mais antigo.

## Nível 4 — Funções de agregação e GROUP BY

18. Quantos produtos existem no total? (`COUNT`)
19. Qual é o preço médio dos produtos?
20. Qual é o preço do produto mais caro e do mais barato?
21. Quantos produtos existem em cada categoria? (agrupe por `categoria`)
22. Qual é a soma do estoque de produtos, por categoria?
23. Quantos pedidos cada cliente fez? Mostre `cliente_id` e a quantidade de pedidos.
24. Liste apenas as categorias que têm mais de 3 produtos (use `GROUP BY` + `HAVING`).

## Nível 5 — JOIN (juntando tabelas)

25. Liste cada pedido junto com o nome do cliente que fez o pedido (`pedidos` + `clientes`).
26. Liste cada item de pedido junto com o nome do produto correspondente (`itens_pedido` + `produtos`).
27. Liste o nome do cliente, a data do pedido e o status, para todos os pedidos.
28. Para cada pedido, calcule o valor total do pedido (soma de `quantidade * preco_unitario` dos itens), mostrando o `pedido_id` e o total.
29. Liste os clientes que **nunca** fizeram nenhum pedido (dica: use `LEFT JOIN` e filtre onde o pedido é `NULL`).
30. Liste o nome do cliente e o total gasto por ele em pedidos com status `'entregue'`.

## Nível 6 — Subconsultas

31. Liste os produtos com preço acima da média de todos os produtos (use uma subconsulta com `AVG`).
32. Liste os clientes que já fizeram pelo menos um pedido (use uma subconsulta com `IN`).
33. Liste o nome do produto mais vendido em quantidade (soma de `quantidade` em `itens_pedido`).

## Nível 7 — Inserindo, atualizando e apagando dados

34. Insira um novo cliente com os seus próprios dados (nome, cidade, estado).
35. Aumente em 10% o preço de todos os produtos da categoria `'Livros'` (use `UPDATE`).
36. Corrija o estoque do produto `'Livro: Python básico'` para 15 unidades.
37. Apague (com `DELETE`) os pedidos com status `'cancelado'`.
   ⚠️ Antes de rodar um `DELETE` ou `UPDATE`, sempre rode o `SELECT` equivalente primeiro para
   conferir quais linhas serão afetadas!

## Nível 8 — Bônus (criando sua própria tabela)

38. Crie uma tabela chamada `fornecedores` com colunas: `id` (chave primária), `nome`, `telefone` e `cidade`.
39. Insira 3 fornecedores fictícios nessa tabela.
40. Adicione uma coluna `fornecedor_id` na tabela `produtos` (use `ALTER TABLE`).

---

### Como praticar melhor
- Resolva um exercício por vez e rode a query para ver o resultado antes de seguir.
- Tente prever o resultado antes de rodar — isso ajuda a fixar a lógica.
- Se travar, tente escrever em português o que você quer, depois traduza pedaço por pedaço para SQL.
