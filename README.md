# Dashboard de Performance em Corrida e Gestão de Ativos

Este projeto tem como objetivo consolidar, limpar e analisar o histórico de atividades de corrida exportadas de plataformas de monitoramento (Strava). A arquitetura do projeto utiliza SQLite para o processo de ETL (Extração, Transformação e Carga), garantindo a integridade e modelagem dos dados brutos linha a linha, e o Power BI para a criação de um dashboard executivo focado em evolução de performance, consistência e engenharia financeira aplicada aos equipamentos de treino.

---

## O Dashboard

O painel foi desenhado seguindo as melhores práticas de Data Storytelling e UI/UX, dividindo-se em três pilares analíticos:
1. **Recordes Pessoais (RP) e Distribuição Temporal:** Análise de ritmo crítico (pace) por distâncias padrão e volumetria de treinos segmentada por turnos (Manhã, Tarde, Noite).
2. **Evolução Histórica:** Linha de tendência de volume de rodagem anual e mensal expressa em distância (km) e tempo acumulado de treino convertidos via DAX.
3. **IEFE (Índice de Eficiência Financeira do Equipamento):** Cruzamento inédito entre o valor investido nos tênis e os quilômetros rodados, identificando visualmente o ponto de equilíbrio econômico do calçado.

---

## Inteligência de Dados e Regras de Negócio

Para extrair insights reais que vão além de um simples rastreador de treinos, foram implementadas regras de negócio complexas no modelo. O desenvolvimento contou com o apoio de Inteligência Artificial (Gemini), que atuou estritamente como mentora de apoio técnico na validação lógica, estruturação da sintaxe das cláusulas SQL e na construção das fórmulas DAX:

### 1. Cálculo de Horas Acumuladas Mensais
O tempo bruto extraído do banco em formato de frações de dia foi tratado via DAX para permitir o acúmulo infinito de horas (superando a barreira nativa de 24h do Power BI). O visual utiliza a técnica de Rótulo Personalizado, mantendo a escala matemática decimal perfeita no Eixo Y, mas exibindo a informação ao usuário no formato de relógio tradicional (HH:MM).

### 2. Viabilidade Econômica do Tênis (Ponto de Equilíbrio)
Considerando que o custo por quilômetro nunca chega a zero absoluto matematicamente, foi estabelecida uma linha de corte de eficiência de R$ 0,50 por KM. A partir do valor investido em cada equipamento, o modelo calcula dinamicamente a quilometragem mínima necessária para que o calçado "se pague" financeiramente, confrontando esse dado com o limite de desgaste mecânico estrutural (700 km).

---

## Tecnologias Utilizadas

* **SQLite / SQL:** Engenharia de dados, limpeza, padronização de tipos e estruturação da View analítica de atividades, com suporte de IA para refinamento da sintaxe das cláusulas.
* **Power BI / Power Query:** Modelagem de dados (Esquema Estrela / Star Schema), relacionamento com dimensão calendário (dCalendario) e desenvolvimento de medidas avançadas em DAX, utilizando mentoria de IA para otimização das fórmulas de tempo.
* **AI Mentorship (Gemini):** Copiloto estratégico na tomada de decisão arquitetural (definição de granularidade banco vs. DAX) e orientação didática para aplicação prática de conceitos analíticos.

---

## Próxima Atualização e Backlog de Engenharia (Aprimoramento de Ativos)

Os próximos passos do projeto consistem em enriquecer a granularidade da tabela de dimensão de calçados (dEquipamentos) para habilitar visuais de KPI dedicados a cada par de tênis selecionado. Os itens mapeados para desenvolvimento são:

* **Métricas de Volume e Tempo de Uso:**
    * Quilometragem total acumulada por tênis (Card).
    * Cálculo de dias decorridos desde o primeiro uso em treino (Card).
* **Métricas de Desgaste Estrutural:**
    * Percentual de Vida Útil Restante baseado no teto mecânico individual (Visual de Gauge ou KPI de Alerta).
* **Métricas de Performance por Equipamento:**
    * Pace médio e velocidade média segregados por calçado para identificar quais modelos entregam maior eficiência biomecânica.
* **Métricas de Retorno sobre Investimento (ROI):**
    * Custo real por corrida realizada (Valor dividido pela Quantidade de Treinos).
    * Custo por hora de treino efetiva (Valor dividido pelas Horas Totais Rodadas).

## Dicionário de Dados Selecionados (Campos da Tabela)

O banco de dados SQLite (Minhas_atividades_strava) utilizará estritamente as seguintes 7 colunas para a análise de Corrida e Ciclismo:

- `ID da atividade`
- `Data da atividade`
- `Tipo de atividade`
- `Tempo de movimentação`
- `Distância`
- `Ganho de elevação`
- `Equipamento da atividade`
Colunas Adicionais
- `Nome da Atividade`
- `Horário`
- `Pace`
- `Rítmo médio`


## Estrutura do Projeto
│
├── datasets/        # Arquivos CSV, Excel, etc.
├── sql/             # Scripts SQL
├── powerbi/         # Arquivos .pbix
├── docs/            # Documentação e imagens
├── README.md        # Descrição do projeto
└── .gitignore


