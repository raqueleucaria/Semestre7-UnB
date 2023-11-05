## NOVO - Exercício 5 da Aula 4 (Evolução 5)

Continuando a aprendizagem inicial na Linguagem SQL, está sendo solicitada a evolução da solução disponível na Área de Compartilhamento (pasta solucoes e arquivo CORRIGIR_aula4exer5Evolucao4_WesleyCarvalho_200044559.zip), em que TODOS os estudantes da TURMA deverão fazer uma revisão somente nesta solução disponível e com problemas abordados em aulas anteriores que precisam ser corrigidos e integrado dois novos scripts com as expressões iniciais Popula e Apaga, além do outro script já solicitado anteriormente (Fisico) que também deve ser revisado e ajustado ao novo projeto proposto como uma solução mais completa.

Dessa forma, todos os estudantes da turma deverão evoluir/corrigir a solução e integrar ao projeto de banco de dados com três scripts (no padrão .sql) que possuirão a documentação mínima exigida pela disciplina a partir do arquivo modelo de cabeçalho coerente ao seu conteúdo em cada script, estando este modelo na Área de Compartilhamento (pasta aulas).

## ENUNCIADO (original)

Uma clínica médica está preocupada com o receituário que seus médicos estão passando para cada paciente e lhe contratou para elaborar uma base de dados que permita ao coordenador da clínica acompanhar estas receitas médicas fornecidas aos pacientes, evitando possíveis enganos. Cada médico precisa ser cadastrado com seu CRM (número de inscrição do médico no Conselho Regional de Medicina, que é estadual), nome completo e especialidade clínica, enquanto os pacientes serão registrados no banco de dados com nome completo, idade, sexo, telefone(s) e o endereço residencial (só um endereço). A possível prescrição média, contida na receita fornecida pelo médico após uma consulta na clínica, deverá conter a data de emissão e o(s) medicamento(s) receitado(s).

Faça o ME-R, DE-R e o Diagrama Lógico de Dados (DLD), NÃO sendo mais solicitado o Diagrama de Esquemas de Dados (DE). Esses artefatos para os diferentes níveis de um projeto de banco de dados deverão atender as necessidades dessa clínica para resolver o problema proposto no nível de banco de dados, em que um único arquivo no formato ZIP (único aceito) deverá ser entregue contendo os 6 (seis) arquivos indicados abaixo:

1) arquivo do brModelo com Diagrama Conceitual e a expressão inicial aula4exer5Evolucao5_Conceitual_JairBolsonaro_20543123.brM3, seguida do primeiro e último nome do estudante, além da matrícula;

2) arquivo do brModelo com Diagrama Lógico de Dados e a expressão inicial aula4exer5Evolucao5_Logico_JairBolsonaro_20543123.brM3, seguida do primeiro e último nome do estudante, além da matrícula;

3) arquivo de documentação contendo ME-R (dividido em 3 partes descritivas - Entidades, Atributos e Relacionamentos), DE-R (diagrama gerado pelo brModelo) e DLD (diagrama gerado pelo brModelo) com a expressão inicial aula4exer5Evolucao5_DOC_JairBolsonaro_20543123.pdf, seguida do primeiro e último nome do estudante, além da matrícula;

4) arquivo de script no padrão de caracteres simples (ASCII do editor de texto) e extensão sql contendo como documentação o cabeçalho exigido na disciplina que está disponível na Área de Compartilhamento (pasta aulas) e uma instrução que verifica se a base de dados já existe (instrução procedural que só testa se a base de dados já existe antes de criá-la ou não), além da palavra Fisico, sendo incluída na expressão inicial deste documento, ficando então aula4exer5Evolucao5_Fisico_JairBolsonaro_20543123.sql, seguida do primeiro e último nome do estudante, além da matrícula antes da extensão do arquivo. Este script já existia na evolução anterior, então deverá ter na sua documentação a indicação do que foi corrigido para esta nova versão/evolução (veja como fazer no modelo). Este script NÃO pode possuir nenhuma instrução ALTER da SQL (DDL);

5) arquivo de script no padrão de caracteres simples (ASCII do editor de texto) e extensão sql contendo como documentação o cabeçalho exigido na disciplina que está disponível na Área de Compartilhamento (pasta aulas), além da palavra Apaga, sendo incluída na expressão inicial deste documento, ficando então aula4exer5Evolucao5_Apaga_JairBolsonaro_20543123.sql, seguida do primeiro e último nome do estudante, além da matrícula. Este novo arquivo terá todas as instruções SQL que removem todos os objetos da base de dados (por enquanto só tabelas) um por vez e respeitando a regra de implementação, SEM usar instruções como ALTER e qualquer comando procedural como IF do MySQL;

6) novo arquivo de script no padrão de caracteres simples (ASCII do editor de texto) e extensão sql contendo como documentação o cabeçalho exigido na disciplina que está disponível na Área de Compartilhamento (pasta aulas), além da palavra Popula, sendo incluída na expressão inicial deste documento, ficando então aula4exer5Evolucao5_Popula_JairBolsonaro_20543123.sql, seguida do primeiro e último nome do estudante, além da matrícula antes da extensão do arquivo. Este novo arquivo terá todas as instruções SQL que inserem no mínimo 3 tuplas por tabelas existentes no projeto, SEM usar instruções procedurais do MySQL (só instruções SQL são aceitas) e com todos os dados simulando informações reais, a fim de efetuar também os testes iniciais na base de dados proposta como solução deste problema.

## Envio de arquivo

Respeite o padrão de nome do arquivo que será entregue no MOODLE, contendo a expressão inicial aula4exer5Evolucao5, seguida de seu primeiro e último nome SOMENTE, sem acento ou 'ç', e sua matrícula na UnB. Esta expressão inicial também será o nome da base de dados. Por exemplo, suponha que o aluno Jair Messias Bolsonaro, com matrícula 20-543123, fosse entregar a solução desse exercício o arquivo compactado seria:

> aula4exer5Evolucao5_JairBolsonaro_20543123.zip

> Nome da Base de Dados

> aula4exer5Evolucao5



## ATENÇÃO

Note que cada solução de problemas solicitadas envolve vários arquivos, então crie cada uma de suas soluções em UMA PASTA ESPECÍFICA com o nome padrão que corresponde exatamente ao nome do arquivo compactado, sem a extensão por ser uma pasta e não um arquivo, e depois de terminar a sua solução compacte a pasta e entregue na atividade MOODLE. Esta organização facilita você com seus arquivos e todos os colegas que poderão baixar para correção cooperativa entre todos durante a aula, além de corresponder a uma atividade de organização prática também avaliada na disciplina. Em atividades avaliativas essa organização no armazenamento e compartilhamento dos arquivos, que são responsáveis por um projeto de banco de dados, também é avaliada.

Os dados no script Popula deverão sempre representar DADOS REAIS do ambiente em que o projeto será utilizado, correspondendo também a um teste (verificação das possibilidades de armazenamento) na base de dados, suas tabelas, atributos, regras de negócio envolvidas e outros recursos que serão estudados mais a frente ainda neste período letivo. Caso existam dados incoerentes como nome de pessoa XXXX XXX, idade -1 ou qualquer dado incoerente ao problema que não deveria estar na base de dados a entrega será considerada NÃO realizada a contento na disciplina, independente dos outros arquivos/dados, sendo mensurados na avaliação denominada E no Plano de Ensino como não entregue (zero na atividade solicitada).

Caso não seja possível abrir os arquivos entregues em seus ambientes indicados neste enunciado para correção a atividade será considerada não realizada pelo estudante, comprometendo também a atividade avaliativa denominada E no Plano de Ensino da disciplina.

