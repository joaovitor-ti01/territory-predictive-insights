# Territory Predictive Insights

**Central de Inteligência Operacional para monitoramento territorial e identificação de riscos urbanos.**

O Territory Predictive Insights é uma aplicação desenvolvida em Flutter para apoiar o monitoramento de condições urbanas, a visualização de indicadores territoriais e a identificação de situações que podem exigir atenção do poder público.

A solução reúne dashboards, mapa interativo, alertas operacionais e participação cidadã em uma única interface.

## Integrantes

- **João Vitor Lima Caldeira** — RM 566541
- **Miguel Vanucci Delgado** — RM 563491

## Objetivos do projeto

- Facilitar a visualização de indicadores territoriais.
- Organizar alertas por prioridade e região.
- Apresentar informações de apoio à tomada de decisão.
- Permitir o registro de ocorrências urbanas pela população.
- Incentivar a participação cidadã e contribuir para cidades mais inclusivas e sustentáveis.

## Funcionalidades

### 1. Painel operacional
- Visão geral do território.
- Indicador de monitoramento.
- Contador de ocorrências registradas.
- Acompanhamento de informações operacionais.

### 2. Dashboards territoriais
- Dashboard principal de dados.
- Dashboard ambiental.
- Dashboard de serviços urbanos.
- Gráficos e indicadores visuais para facilitar a interpretação das informações.

### 3. Mapa interativo
- Visualização territorial de São Paulo.
- Marcadores de regiões monitoradas.
- Consulta de informações e níveis de risco por região.
- Utilização de mapas do OpenStreetMap.

### 4. Sistema de alertas
- Lista de alertas operacionais.
- Classificação por nível de prioridade.
- Detalhamento de evidências e recomendações.
- Indicadores ilustrativos de confiança.
- Validação humana dos alertas.

### 5. Registro de ocorrências
- Formulário para participação cidadã.
- Categorias de problemas urbanos.
- Validação dos campos obrigatórios.
- Consentimento antes do envio.
- Armazenamento local das ocorrências.
- Atualização do contador compartilhado no painel.

## Tecnologias utilizadas

- **Flutter:** desenvolvimento da aplicação multiplataforma.
- **Dart:** linguagem de programação.
- **fl_chart:** construção de gráficos.
- **flutter_map:** visualização de mapas.
- **latlong2:** coordenadas geográficas.
- **shared_preferences:** persistência local de informações.
- **OpenStreetMap:** serviço externo de mapas.

## Arquitetura e organização

A aplicação utiliza componentes e telas separados para organizar suas funcionalidades.

Principais arquivos:

- `lib/main.dart` — estrutura principal, navegação, painel, mapa e alertas.
- `lib/occurrence_page.dart` — formulário de registro de ocorrências.
- `lib/occurrence_store.dart` — estado compartilhado do contador de ocorrências.
- `lib/environmental_dashboard_page.dart` — dashboard ambiental.
- `lib/urban_services_dashboard_page.dart` — dashboard de serviços urbanos.

## Persistência e funcionamento offline

As ocorrências registradas e as validações humanas dos alertas são armazenadas localmente utilizando SharedPreferences.

Isso permite preservar essas informações entre reinicializações do aplicativo no mesmo ambiente.

**Limitação:** os mapas dependem de conexão com a internet para carregar os mapas do OpenStreetMap. Os dados locais continuam disponíveis, mas a aplicação não possui sincronização com um servidor remoto.

## Dados e limitações

Os indicadores, gráficos, níveis de confiança e exemplos de alertas apresentados possuem caráter demonstrativo e utilizam dados ilustrativos.

Os valores não representam medições oficiais, previsões estatísticas validadas ou informações em tempo real.

Os indicadores devem ser interpretados como apoio visual à análise, e qualquer decisão operacional exige avaliação humana e validação das informações.

O projeto não coleta dados pessoais no formulário de ocorrências. Os registros são armazenados localmente no dispositivo.

## Como executar

### Pré-requisitos

- Flutter instalado.
- Dart instalado.
- Git instalado.

### Instalação

Clone o repositório:

```bash
git clone https://github.com/joaovitor-ti01/territory-predictive-insights.git
```

Entre na pasta:

```bash
cd territory-predictive-insights
```

Instale as dependências:

```bash
flutter pub get
```

Execute a aplicação:

```bash
flutter run -d linux
```

Para executar em outro dispositivo compatível:

```bash
flutter run
```

### Verificação do projeto

```bash
flutter analyze
flutter test
```

## Capturas de tela

As capturas de tela da aplicação devem ser armazenadas em `assets/screenshots/`.

| Tela | Captura |
|---|---|
| Painel operacional | `assets/screenshots/painel.png` |
| Dashboard de dados | `assets/screenshots/dados.png` |
| Mapa territorial | `assets/screenshots/mapa.png` |
| Alertas | `assets/screenshots/alertas.png` |
| Registro de ocorrências | `assets/screenshots/registro.png` |
| Dashboard ambiental | `assets/screenshots/ambiental.png` |
| Dashboard de serviços urbanos | `assets/screenshots/servicos_urbanos.png` |
| Detalhes do alerta | `assets/screenshots/detalhes_alerta.png` |

## Vídeo de demonstração

**Link:** A inserir após a publicação do vídeo.

O vídeo apresenta a navegação pelas telas, os dashboards, o mapa, o sistema de alertas, a validação humana e o registro de ocorrências.

## Repositório

https://github.com/joaovitor-ti01/territory-predictive-insights

## Considerações finais

O Territory Predictive Insights busca demonstrar como a tecnologia pode contribuir para o monitoramento territorial, a organização de informações urbanas e a participação cidadã.

A proposta está alinhada ao Objetivo de Desenvolvimento Sustentável 11 (Cidades e Comunidades Sustentáveis), incentivando o uso de soluções digitais para apoiar a construção de ambientes urbanos mais seguros, inclusivos e sustentáveis.
