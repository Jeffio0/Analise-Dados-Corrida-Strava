Aqui está o conteúdo totalmente estruturado e padronizado em Markdown para o seu arquivo `docs/dicionario_calculos.md`. O texto foi refinado para manter um padrão técnico rigoroso, sem o uso de ícones e perfeitamente formatado para renderização no GitHub.

As equações matemáticas foram estruturadas em blocos formais para facilitar a leitura.

---

```markdown
# Documentação Técnica: Dicionário de Cálculos e Métricas

Este documento descreve detalhadamente as regras de negócio, a fundamentação matemática aplicada na camada de banco de dados e as expressões DAX desenvolvidas no Power BI para o Dashboard de Performance.

---

## 1. Regras de Negócio e Cálculos no Banco de Dados (SQL/ETL)

Abaixo estão descritas as lógicas matemáticas implementadas para a padronização das métricas de ritmo (pace) e velocidade antes da agregação final.

### Cálculo de Ritmo Médio (Pace) — Corrida

O ritmo médio expressa o tempo necessário para percorrer a distância de um quilômetro. Para evitar distorções no arredondamento de minutos e segundos na base sexagesimal (base 60), o cálculo realiza a conversão em duas etapas.

**Fórmula Utilizada:**
$$\text{Pace Decimal} = \frac{\text{Tempo em Segundos} \times 16,6667}{\text{Distância em Metros}}$$

**Exemplo Prático de Aplicação:**
* **Dados de Entrada:**
  * Tempo original: 23min 59s (1.439 segundos)
  * Distância: 4.190 metros (4,19 km)

* **Etapa 1: Obtenção do Pace Decimal**
$$(1439 \times 16,6667) \div 4190 = 5,7239 \text{ min/km}$$

* **Etapa 2: Conversão da Sobra Decimal para Segundos Reais**
  * Parte inteira isolada: 5 minutos.
  * Sobra decimal: 0,7239.
  * Conversão da base 100 para a base 60: $0,72 \times 0,6 = 43,2 \text{ segundos}$ (Arredondado para 43s).

* **Resultado Formatado:** `05:43 /km`

### Cálculo de Velocidade Média — Ciclismo

Calcula a velocidade de deslocamento baseada na relação entre a distância em quilômetros e o tempo total convertido em horas.

**Fórmula Utilizada:**
$$\text{Velocidade Média (km/h)} = \frac{\text{Distância em km} \times 3600}{\text{Tempo em Segundos}}$$

**Exemplo Prático de Aplicação:**
* **Dados de Entrada:**
  * Tempo original: 3.600 segundos (1 hora)
  * Distância: 25.800 metros (25,8 km)

* **Execução do Cálculo:**
$$(25,8 \times 3600) \div 3600 = 25,80 \text{ km/h}$$

* **Resultado Formatado:** `25,80 km/h`

---

## 2. Repositório de Fórmulas DAX (Power BI)

Abaixo estão listadas as medidas calculadas desenvolvidas no Power BI, organizadas por contexto analítico.

### Volumetria e Distâncias

```dax
Distancia Corrida = 
CALCULATE(
    SUM(Atividades_Gerais_Tratados[distancia_percorrida]),
    Atividades_Gerais_Tratados[tipo_atividade] = "Corrida"
)

```

```dax
Elevação Corrida = 
CALCULATE(
    SUM(Atividades_Gerais_Tratados[ganho_elevacao]),
    Atividades_Gerais_Tratados[tipo_atividade] = "Corrida"
)

```

```dax
Marcos (km) = VALUES(Distancias[Distancias (km)])

```

### Gestão e Conversão de Tempo

```dax
Horas = 
DIVIDE(
    SELECTEDVALUE('Datas e Horas'[Tempo_total]),
    24,
    0
)

```

```dax
Horas Corrida = 
CALCULATE(
    SUM(Atividades_Gerais_Tratados[Tempo_total]),
    Atividades_Gerais_Tratados[tipo_atividade] = "Corrida"
)

```

```dax
Horas Totais = SUM(Atividades_Gerais_Tratados[Tempo_total])

```

```dax
Horas por Mês = 
DIVIDE(
    SUM('Datas e Horas'[Segundos]),
    3600.00
)

```

```dax
Tempo (min) = SUM(Atividades_Gerais_Tratados[Tempo_total]) * 3600

```

### Séries Temporais e Acúmulos

```dax
Horas Acumuladas = 
CALCULATE(
    Atividades_Gerais_Tratados[Horas Corrida],
    FILTER(
        ALL(Atividades_Gerais_Tratados[data_atividade_DMA].[Ano]),
        Atividades_Gerais_Tratados[data_atividade_DMA].[Ano] <= MAX(Atividades_Gerais_Tratados[data_atividade_DMA].[Ano])
    )
)

```

### Contagens e Recordes Pessoais (RP)

```dax
Qtd Corridas = 
CALCULATE(
    COUNTROWS(Atividades_Gerais_Tratados),
    Atividades_Gerais_Tratados[tipo_atividade] = "Corrida"
)

```

```dax
Qtd Manhã = 
CALCULATE(
    COUNTROWS(Atividades_Gerais_Tratados),
    Atividades_Gerais_Tratados[horario] = "Manhã"
)

```

```dax
RP 10km = 
CALCULATE(
    MIN(Atividades_Gerais_Tratados[pace]),
    Atividades_Gerais_Tratados[distancia_percorrida] = 10
)

```

### Índice de Eficiência Financeira do Equipamento (IEFE)

Métrica que estabelece a relação de custo-benefício de cada ativo com base na quilometragem acumulada exclusivamente na modalidade de corrida.

```dax
IEFE (R$/km) = 
ROUND(
    DIVIDE(
        SELECTEDVALUE(Equipamento[valor_equipamento]),
        CALCULATE(
            SUM(Atividades_Gerais_Tratados[distancia_percorrida]),
            Atividades_Gerais_Tratados[tipo_atividade] = "Corrida"
        )
    ),
    2
)