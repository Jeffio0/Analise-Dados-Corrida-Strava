# Dashboard de Performance Corrida - Análise essencial.

Este projeto tem como objetivo consolidar, limpar e analisar o histórico de atividades de corrida exportadas do Strava. Utilizou-se o SQLite para o processo de ETL (Extração, Transformação e Carga), o Gemini como mentor de apoio na interpretação e aplicação dos meus conhecimentos de SQL, e o Power BI para a criação de um dashboard interativo focado na análise de evolução, consistência esportiva e principais pontos de performance da atividade.

## Objetivos e Organização do Projeto

Para garantir uma análise estruturada e de valor incremental, o projeto foi dividido em dois níveis de complexidade. O foco inicial estará na exploração isolada e aprofundada de cada modalidade.

### Nível 1: Análises Isoladas por Modalidade (Escopo Atual)

O objetivo principal nesta fase é responder às perguntas fundamentais de comportamento de forma separada para a Corrida e para o Ciclismo:
- Volume e Consistência: Qual é a frequência de treinos em cada modalidade? Como o volume (quilometragens e minutos investidos) varia ao longo dos meses e anos?
- Padrão de Rotina (Turnos): Em qual período do dia (manhã, tarde ou noite) costuma haver maior volume e frequência para cada esporte de forma isolada?
- Impacto do Relevo (Altimetria): Qual é o impacto real do ganho de elevação acumulado no ritmo médio (pace) da corrida? E como ele afeta a velocidade média do ciclismo?
- Performance em Corrida (Evolução Histórica): Como o pace nas corridas evoluiu ao longo do tempo, cruzando a distância percorrida com o ganho de elevação acumulado para identificar ganho de eficiência mecânica?
- Velocidade Crítica - CS (Bônus de Performance): Como estimar a Velocidade Crítica do atleta na corrida utilizando o modelo linear matemático (Distância vs. Tempo) a partir dos seus recordes históricos?
- Volume por Equipamento (Ciclo de Vida): Análise da quilometragem acumulada por equipamento utilizado nas atividades, considerando bicicletas e calçados de corrida. A visualização apresenta o volume total registrado por equipamento, sua representatividade em relação à vida útil estimada e a distribuição desse volume nas metas de treinamento do atleta (5 km, 8 km, 10 km, 12 km, 15 km, 20 km e 21,1 km).

### Nível 2: Relações Multimodais e Cruzamento de Performance (Backlog / Futuro)

Estas análises ficarão mapeadas como próximos passos e serão executadas apenas se for identificado um ganho intelectual e prático no cruzamento das bases:
- Cruzamento Multimodal de Performance: Avaliar a relação de ganho de performance mútua (ex: entender se o aumento do volume de ciclismo em determinados períodos gerou ganho de poupança muscular ou resistência que impactou positivamente o rendimento ou a evolução do pace na corrida).

## Tecnologias Utilizadas

- Banco de Dados: SQLite (para estruturação, limpeza e transformações via SQL).
- Visualização de Dados: Power BI (para modelagem em estrela e criação do relatório visual).
- Controle de Versão: Git e GitHub (para versionamento de scripts e documentação).
- Inteligência Artificial: Gemini (atuando como mentor para orientação teórica, resolução de dúvidas e definição de diretrizes estratégicas do projeto, sem atuação direta na criação dos scripts).

## Dicionário de Dados Selecionados (Campos da Tabela)

O banco de dados SQLite (Minhas_atividades_strava) utilizará estritamente as seguintes 7 colunas para a análise de Corrida e Ciclismo:

- `ID da atividade`
- `Data da atividade`
- `Tipo de atividade`
- `Tempo de movimentação`
- `Distância`
- `Ganho de elevação`
- `Equipamento da atividade`

## Estrutura do Projeto
│
├── datasets/        # Arquivos CSV, Excel, etc.
├── sql/             # Scripts SQL
├── powerbi/         # Arquivos .pbix
├── docs/            # Documentação e imagens
├── README.md        # Descrição do projeto
└── .gitignore

Cálculo de Ritmo
## Exemplo de Cálculo de Pace (Corrida)

**Dados**
- Tempo Original: 23min59s (1.439 segundos)
- Distância: 4.190 m (4,19 km)

**Fórmula**
Pace Decimal = (Tempo em segundos × 16.6667) ÷ Distância em metros

**Cálculo**
**Encontrando o Pace Decimal:**
   (1.439 × 16.6667) ÷ 4.190 = 5,7239 min/km (Aproximadamente 5,72)

**Convertendo a Sobra Decimal para Segundos Reais:**
   - Parte inteira: 5 minutos
   - Sobra decimal: 0,72
   - Conversão (Base 100 para Base 60): 72 × 0.6 = 43,2 segundos (Arredondado para 43s)

**Resultado**
Pace = 05:43/km

## Exemplo de Cálculo de Velocidade Média (Ciclismo)

**Dados**
- Tempo: 3.600 segundos (1 hora)
- Distância: 25.800 m (25,8 km)

**Fórmula**
Velocidade Média (km/h) = (Distância em km × 3600) ÷ Tempo em segundos

**Cálculo**
(25,8 × 3600) ÷ 3600 = 25,80 km/h

**Resultado**
Velocidade Média = 25,80 km/h
