** Readme**

** Dashboard de Performance Corrida -  Análise essencial.**

Este projeto tem como objetivo consolidar, limpar e analisar o histórico de atividades de corrida exportadas do Strava. Utilizou-se o SQLite para o processo de ETL (Extração, Transformação e Carga), o Gemini como mentor de apoio na interpretação e aplicação dos meus conhecimentos de SQL, e o Power BI para a criação de um dashboard interativo focado na análise de evolução, consistência esportiva e principais pontos de performance da atividade.

---

Objetivos e Organização do Projeto

Para garantir uma análise estruturada e de valor incremental, o projeto foi dividido em dois níveis de complexidade. O foco inicial estará na exploração isolada e aprofundada de cada modalidade.

**Nível 1: Análises Isoladas por Modalidade (Escopo Atual)**

O objetivo principal nesta fase é responder às perguntas fundamentais de comportamento de forma separada para a Corrida e para o Ciclismo:

- Volume e Consistência: Qual é a frequência de treinos em cada modalidade? Como o volume (quilometragens e minutos investidos) varia ao longo dos meses e anos?
- Padrão de Rotina (Turnos): Em qual período do dia (manhã, tarde ou noite) costuma haver maior volume e frequência para cada esporte de forma isolada?
- Impacto do Relevo (Altimetria): Qual é o impacto real do ganho de elevação acumulado no ritmo médio (*pace*) da corrida? E como ele afeta a velocidade média do ciclismo?
- Performance em Corrida (Evolução Histórica): Como o *pace* nas corridas evoluiu ao longo do tempo, cruzando a distância percorrida com a eficiência cardíaca (BPM)?
- Velocidade Crítica - CS (Bônus de Performance): Como estimar a Velocidade Crítica do atleta na corrida utilizando o modelo linear matemático (Distância vs. Tempo) a partir dos seus recordes históricos?

---

**Objetivos e Organização do Projeto**

Para garantir uma análise estruturada e de valor incremental, o projeto foi dividido em dois níveis de complexidade. O foco inicial estará na exploração e no impacto de fatores ambientais e de relevo em cada modalidade de forma isolada.

**Nível 1: Análises Isoladas por Modalidade e Fatores Ambientais (Escopo Atual)**

O objetivo principal nesta fase é responder às perguntas fundamentais de comportamento, clima e evolução de forma separada para a Corrida e para o Ciclismo:

**- Volume e Consistência:** Qual é a frequência de treinos em cada modalidade? Como o volume (quilometragens e minutos investidos) varia ao longo dos meses e anos?
**- Padrão de Rotina (Turnos):** Em qual período do dia (manhã, tarde ou noite) costuma haver maior volume e frequência para cada esporte?
**- Impacto do Relevo (Altimetria):** Qual é o impacto real do ganho de elevação acumulado no ritmo médio (*pace*) da corrida? E como ele afeta a velocidade média do ciclismo?
**- Clima vs. Fisiologia:** Como a variação da temperatura média impacta a intensidade (frequência cardíaca) e o rendimento em cada uma das modalidades isoladamente?
**- Performance em Corrida (Evolução Histórica):** Como o *pace* nas corridas evoluiu ao longo do tempo, cruzando a distância percorrida com a eficiência cardíaca (BPM)?
**- Velocidade Crítica - CS (Bônus de Performance):** Como estimar a Velocidade Crítica do atleta na corrida utilizando o modelo linear matemático (Distância vs. Tempo) a partir dos seus recordes históricos?

**Nível 2: Relações Multimodais e Cruzamento de Performance (Backlog / Futuro)**

Estas análises ficarão mapeadas como próximos passos e serão executadas apenas se for identificado um ganho intelectual e prático no cruzamento das bases:

**- Cruzamento Multimodal de Performance:** Avaliar a relação de ganho de performance mútua (ex: entender se o aumento do volume de ciclismo em determinados períodos gerou ganho de eficiência cardiovascular ou poupança muscular que impactou positivamente a performance da corrida).

---
**Tecnologias Utilizadas**

**- Banco de Dados:** SQLite (para estruturação, limpeza e transformações via SQL).
**- Visualização de Dados:** Power BI (para modelagem em estrela e criação do relatório visual).
**- Controle de Versão:** Git e GitHub (para versionamento de scripts e documentação).
**- Inteligência Artificial:** Gemini (atuando como mentor para orientação teórica, resolução de dúvidas e definição de diretrizes estratégicas do projeto, sem atuação direta na criação dos scripts).

**Dicionário de Dados Selecionados (Campos da Tabela)**

O banco de dados SQLite (`Minhas_atividades_strava`) utilizará estritamente as seguintes 11 colunas para a análise de Corrida e Ciclismo:

1. `ID da atividade`
2. `Data da atividade`
3. `Hora de início`
4. `Nome da atividade`
5. `Tipo de atividade`
6. `Tempo de movimentação`
7. `Distância`
8. `Ganho de elevação`
9. `Temperatura média`
10. `Frequência cardíaca média`
11. `Calorias`

---
