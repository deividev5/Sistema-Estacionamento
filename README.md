# 🅿️ Sistema de Estacionamento

Sistema completo para gerenciamento de estacionamento desenvolvido em **Delphi** com banco de dados **SQLite** via FireDAC.

## Funcionalidades

- **Registro de Entrada** — Cadastro de veículos com placa (formatos antigo ABC-1234 e Mercosul ABC1D23), modelo, cor, tipo e número da vaga
- **Registro de Saída** — Cálculo automático do valor baseado no tempo de permanência, com detalhamento completo (placa, horários, permanência, valor)
- **Cobrança Inteligente** — Valor por hora cheia + frações de 15 minutos, com período de tolerância configurável
- **Controle de Vagas** — Painel em tempo real com quantidade de vagas ocupadas e livres
- **Busca Rápida** — Filtro por placa, modelo ou vaga diretamente na tela principal
- **Relatório de Movimentações** — Filtragem por período e status, com totalizadores (total de veículos, valor arrecadado e ticket médio)
- **Configurações** — Personalização de nome do estacionamento, total de vagas, valor/hora, valor da fração e tolerância

## Tecnologias

| Tecnologia | Uso |
|---|---|
| Delphi (VCL) | Interface e lógica de negócio |
| FireDAC | Acesso a dados |
| SQLite | Banco de dados local |

## Estrutura do Projeto

```
EstacionamentoApp.dpr    → Projeto principal
uDM.pas / .dfm           → Data Module (conexão e queries)
uPrincipal.pas / .dfm    → Tela principal (grid + controle de vagas)
uEntrada.pas / .dfm      → Formulário de entrada de veículos
uSaida.pas / .dfm        → Formulário de saída com cálculo de valor
uRelatorio.pas / .dfm    → Relatório com filtros e totalizadores
uConfig.pas / .dfm       → Configurações de preços e vagas
```

## Configurações Padrão

| Parâmetro | Valor |
|---|---|
| Valor por hora | R$ 10,00 |
| Fração de 15 min | R$ 3,00 |
| Tolerância | 10 minutos |
| Total de vagas | 50 |

## Como Executar

1. Abra o arquivo `EstacionamentoApp.dpr` no Delphi (XE7 ou superior)
2. Compile e execute (F9)
3. O banco de dados `estacionamento.db` será criado automaticamente na pasta do executável

> Não é necessário instalar nenhum servidor de banco de dados. O SQLite funciona de forma embarcada.

## Regras de Cobrança

- Dentro do período de **tolerância** → sem cobrança
- Horas completas → valor cheio por hora
- Minutos excedentes (após hora cheia):
  - Até 15 min → 1 fração
  - Até 30 min → 2 frações
  - Até 45 min → 3 frações
  - Acima de 45 min → cobra hora cheia

