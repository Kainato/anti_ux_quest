# Documentação Técnica

Este arquivo é uma documentação técnica complementar ao README. Ele foi pensado para explicar a estrutura do código, a arquitetura aplicada e os principais pontos de cada pasta e arquivo do projeto, sem repetir a apresentação conceitual principal do README.

O README deve responder: "o que é o projeto e por que ele existe?".
Este documento responde: "como o projeto está organizado e como cada parte funciona?"

---

## 1. Visão geral do projeto

O Anti-UX Quest é uma aplicação em Flutter que transforma tarefas simples em desafios de usabilidade. A ideia central é criar uma experiência frustrante de propósito, em que o usuário precisa concluir objetivos básicos, mas enfrenta interfaces intencionalmente mal projetadas.

Além do aspecto lúdico, o projeto tem um objetivo pedagógico: demonstrar, por contraste, como decisões ruins de interface impactam a experiência do usuário.

A aplicação foi estruturada para separar bem as responsabilidades:

- regras de negócio e lógica do jogo;
- persistência de dados e preferências do usuário;
- UI e widgets de apresentação;
- tema e paleta de cores;
- composição das dependências da aplicação.

---

## 2. Estrutura geral do repositório

```text
anti_ux_quest/
├── android/
├── ios/
├── lib/
│   ├── app/
│   ├── core/
│   ├── enum/
│   ├── extension/
│   ├── features/
│   ├── main.dart
│   └── pages/
├── linux/
├── macos/
├── test/
├── web/
├── windows/
├── analysis_options.yaml
├── pubspec.yaml
├── README.md
├── DOCUMENTACAO_GITHUB.md
└── todo.md
```

### O que cada pasta representa

#### `android/`, `ios/`, `linux/`, `macos/`, `windows/`, `web/`

Essas pastas são geradas e configuradas pelo Flutter para rodar a aplicação em diferentes plataformas. Elas não contêm a lógica principal do app; somente o suporte nativo necessário para cada target.

- `android/`: configuração do projeto Android;
- `ios/`: configuração do projeto iOS;
- `linux/`, `macos/`, `windows/`: suporte nativo para desktop;
- `web/`: estrutura do app em navegador.

Essas pastas normalmente não são alteradas durante o desenvolvimento da aplicação, salvo ajustes específicos de plataforma ou publicação.

#### `test/`

Contém os testes automatizados do projeto. É o local ideal para validar:

- fluxo de gameplay;
- persistência de tema;
- navegação entre fases;
- comportamento dos widgets principais.

Arquivos importantes:

- `test/quest_controller_test.dart`: valida a lógica do controller da quest;
- `test/quest_page_test.dart`: garante que a interface respeita os comportamentos esperados.

#### `lib/`

Esta é a pasta principal da aplicação. Aqui fica quase toda a lógica do produto, incluindo arquitetura, tema, regras, UI e apresentação.

---

## 3. Explicação da pasta `lib/`

A estrutura da pasta `lib` segue uma organização por responsabilidade, com foco em manutenção e evolução da aplicação.

### `lib/main.dart`

Arquivo de entrada da aplicação.

Responsabilidade:

- inicializar o Flutter;
- preparar as dependências da aplicação;
- iniciar o `AntiUxQuestApp` com seus controllers.

Fluxo simples:

1. `WidgetsFlutterBinding.ensureInitialized()` inicializa os bindings do Flutter;
2. `buildDependencies()` monta a composição da app;
3. `runApp(...)` executa a aplicação.

Esse arquivo é o ponto de entrada do projeto e não deveria conter regra de negócio.

---

## 4. Pasta `lib/app/`

A pasta `app` funciona como a camada de composição da aplicação. É aqui que o app é montado e que a estrutura global é configurada.

### `lib/app/app.dart`

Arquivo central da aplicação.

Responsabilidade:

- criar o `MaterialApp`;
- fornecer o tema atual (`light` ou `dark`);
- receber os controllers de estado;
- renderizar a página principal do jogo.

Esse arquivo atua como a "raiz visual" do app. Ele conecta:

- o tema do app;
- a tela principal (`QuestPage`);
- os controllers de estado;
- os eventos globais da aplicação.

### `lib/app/composition_root.dart`

Arquivo responsável por montar o grafo de dependências.

Responsabilidade:

- preparar `QuestController` com suas dependências;
- preparar `ThemeController` com a persistência do tema;
- resolver a criação dos repositórios e serviços;
- centralizar o bootstrapping da aplicação.

Esse arquivo é importante porque ajuda a manter o código desacoplado e mais fácil de testar.

---

## 5. Pasta `lib/app/theme/`

A lógica de tema está separada em dois arquivos principais:

### `lib/app/theme/app_palette.dart`

Define as cores semânticas do app.

Responsabilidades:

- centralizar a paleta visual do projeto;
- permitir acesso via `context.palette`;
- manter o app consistente em claro e escuro;
- facilitar futuras alterações visuais sem espalhar cores no código.

O projeto usa uma abordagem muito útil: em vez de codificar `Colors.blue` ou `Colors.black` diretamente em widgets, o app usa uma paleta semanticamente orientada. Isso reduz acoplamento visual e melhora manutenção.

Exemplo prático:

- `primary`: cor principal da marca;
- `background`: fundo geral;
- `surfaceAlt`: superfícies secundárias;
- `textPrimary`: texto principal;
- `textMuted`: texto secundário;
- `border`: bordas visuais.

Essa abordagem é mais organizada do que usar cores dispersas no app inteiro.

### `lib/app/theme/app_theme.dart`

Responsável por transformar a paleta em `ThemeData` do Flutter.

Responsabilidades:

- criar o tema light;
- criar o tema dark;
- configurar `ColorScheme`;
- definir estruturas visuais como `AppBar`, `DialogTheme`, `DrawerTheme`, `ButtonTheme`, etc.

Este arquivo é o ponto central de identidade visual da aplicação.

A ideia do projeto é: todo widget que precisa de cor deve buscar a paleta por contexto, em vez de assumir um padrão concreto.

---

## 6. Pasta `lib/features/`

A feature principal do projeto está dentro de `lib/features`. Essa organização ajuda a separar cada domínio do app por contexto.

### `lib/features/quest/`

Essa é a feature central do jogo. Aqui está praticamente toda a lógica funcional. Ela está organizada em camadas internas para manter a separação de responsabilidades.

#### `lib/features/quest/domain/`

Esta camada concentra as regras de negócio e os contratos fundamentais do domínio do jogo.

Arquivos e responsabilidades:

- `challenge_type.dart`: enumeração das fases ou formatos de desafio;
- `challenge_rules.dart`: regras de validação para cada etapa, como "qual palavra é alvo" ou "qual ação é correta";
- `level.dart`: modelo de uma fase do jogo;
- `game_progress.dart`: estado do progresso e das fases concluídas;
- `repositories/`: interfaces de repositorios que definem como os dados serão acessados.

A camada de domínio não deve depender de Flutter. Ela deve conter apenas regra e modelagem do jogo, sem UI.

#### `lib/features/quest/data/`

É a camada de dados da aplicação. Aqui ficam as implementações concretas dos repositórios e fontes dos dados.

Responsabilidades:

- carregar as fases disponíveis;
- guardar o progresso do jogador;
- fornecer os dados do jogo para a camada de apresentação;
- isolar o carregamento de dados do restante da aplicação.

Arquivos comuns nesta área:

- `levels_local_data_source.dart`: dados locais das fases;
- `quest_repository_impl.dart`: implementação concreta do repositório de progresso ou de fases;
- `theme_repository_impl.dart` (quando houver) ou similar: persistência do tema, se for necessário.

Essa camada permite que a lógica de negócio não dependa diretamente de uma fonte específica de dados.

#### `lib/features/quest/presentation/`

É a camada visual. Tem o maior volume do projeto e concentra a UI do jogo.

##### `lib/features/quest/presentation/controllers/`

Aqui ficam os controllers responsáveis por atualizar o estado do jogo.

- `quest_controller.dart`: controla a fase atual, o progresso, o desbloqueio de fases e as transições de estado.

Esse controller é o coração da tela principal. Ele conecta:

- o mapa de fases;
- a tela atual da fase;
- o progresso;
- a lógica de avanço para a próxima fase.

##### `lib/features/quest/presentation/pages/`

Pastas que contém telas do app.

- `quest_page.dart`: página principal do jogo. A interface central onde o desafio é exibido, appbar, progresso e mapa das fases.

Essa página geralmente monta o layout do app e delega o conteúdo do desafio para widgets menores.

##### `lib/features/quest/presentation/widgets/`

Pastas com pequenos blocos de componente reutilizáveis.

Arquivos principais:

- `action_button.dart`: botão principal reutilizável da aplicação;
- `letter_keyboard.dart`: teclado de letras utilizado em desafios de digitação;
- `tiny_target_dot.dart`: alvo pequeno e difícil de clicar;
- `level_map.dart`: mapa visual das fases e desbloqueio;
- `compact_progress.dart`: indicador compacto de progresso;
- `quest_content.dart`: conteúdo principal da fase;
- `quest_drawer.dart`: menu lateral ou drawer;
- `about_quest_dialog.dart`: diálogo informativo sobre o projeto;
- `level_list_sheet.dart`: lista/folha de níveis disponíveis;

Esses widgets tornam a UI mais modular e mais fácil de manter.

##### `lib/features/quest/presentation/challenges/`

Aqui fica o conjunto de desafios interativos que representam cada fase do jogo.

Exemplos:

- `alphabetic_keyboard_challenge.dart`: desafio de digitar letras em ordem ou com uma lógica específica;
- `moving_button_challenge.dart`: botão que muda de posição;
- `fake_loading_challenge.dart`: simulação de progresso artificial;
- `low_contrast_challenge.dart`: texto pouco legível para testar leitura e contraste;
- `ambiguous_input_challenge.dart`: entrada ambígua ou confusa;
- `challenge_factory.dart`: responsável por instanciar o widget correto para cada fase;
- `challenge_actions.dart`: ações que cada desafio pode emitir.

Cada arquivo desta pasta representa um mini-problema de UX, e a fábrica combina esse conteúdo com a lógica de progressão do app.

---

## 7. Pasta `lib/features/theme/`

Essa pasta trata da persistência e manipulação da preferência de tema.

Responsabilidades:

- ler a última escolha do usuário;
- salvar a escolha em disco;
- alternar o app entre claro e escuro;
- exibir o estado atual do tema no app.

Estrutura comum:

- `theme_controller.dart`: expõe a API para alternar o tema;
- `theme_repository.dart`: contrato para persistência do tema;
- `shared_preferences_theme_repository.dart`: implementação concreta com `SharedPreferences`.

Esse é um ótimo exemplo de separação entre regra e infraestrutura: o controller não precisa conhecer como os dados são salvos, apenas usa a abstração do repositório.

---

## 8. Pasta `lib/core/`

A pasta `core` normalmente guarda utilitários compartilhados, sem se inserir no contexto de uma feature específica.

Arquivos que costumam aparecer aqui:

- `core_material.dart`: abstrações ou utilitários visuais gerais;
- `core_utils.dart`: funções auxiliares reutilizáveis.

Se a aplicação crescer, essa pasta pode armazenar:

- formatadores;
- validações;
- helpers para data, strings e UI;
- extensões compartilhadas.

O objetivo aqui é centralizar utilidades que não pertencem a uma feature específica.

---

## 9. Pastas `lib/enum/`, `lib/extension/`, `lib/pages/`

### `lib/enum/`

Contém enums do projeto.

Exemplos:

- `keyboard_enum.dart`: enumeração de tipos de teclado ou estados do teclado;
- outros enums usados para representar opções do jogo ou fluxo da interface.

Enums são úteis para substituir valores mágicos por representações semânticas.

### `lib/extension/`

Aqui ficam extensões de tipos nativos do Dart ou do Flutter.

Arquivos comuns:

- `double_extension.dart`: extensão para valores numéricos;
- `int_extension.dart`: extensão para inteiros;
- `list_extension.dart`: extensão para listas.

Essa área ajuda a reduzir boilerplate e deixa o código mais expressivo.

### `lib/pages/`

Contém telas ou páginas do app quando elas não estão organizadas dentro da feature.

No projeto, a principal página foi movida para `features/quest/presentation/pages`, então essa pasta pode servir como lugar para páginas complementares ou futuras telas de conveniência.

---

## 10. Arquivos de configuração e dependências

### `pubspec.yaml`

Arquivo principal de dependências do Flutter.

Responsabilidades:

- definir as dependências do projeto;
- configurar assets e fontes;
- declarar SDK mínimo e versões necessárias;
- indicar pacote de suporte, como `shared_preferences`.

Esse arquivo é central para a evolução do app, porque configura tudo que o projeto usa em termos de bibliotecas e recursos.

### `analysis_options.yaml`

Define as regras de lint e análise estática do Dart.

Ele garante que o código mantenha um padrão consistente e ajuda a evitar:

- warnings desnecessários;
- práticas frágeis;
- inconsistências de estilo.

---

## 11. Fluxo de execução da aplicação

O fluxo principal pode ser entendido da seguinte forma:

1. `main.dart` inicia a aplicação.
2. `buildDependencies()` monta os controllers e repositórios.
3. `AntiUxQuestApp` recebe esses valores e constrói o `MaterialApp`.
4. `QuestPage` renderiza a UI da fase atual.
5. `QuestController` atualiza o estado do jogo conforme o usuário interage.
6. O widget de desafio correspondente é selecionado pela fábrica de desafios.
7. Quando a fase termina, o fluxo verifica as regras e libera a próxima etapa.

Ou seja, a UI depende de estados, e os estados são controlados por classes específicas. Isso reduz acoplamento e facilita a evolução do projeto.

---

## 12. Padrões arquiteturais usados no projeto

### Clean Architecture

O projeto separa a lógica em camadas com o objetivo de reduzir dependências entre UI, regras do domínio e infraestrutura.

### SOLID

A aplicação tenta seguir princípios como:

- responsabilidade única;
- princípio de inversão de dependência;
- extensibilidade de componentes;
- encapsulamento de detalhes de implementação.

### Separação de camadas

A lógica do app não fica toda misturada na tela. Isso ajuda a manter o código mais compreensível e escalável.

---

## 13. Por que essa organização importa

A estrutura atual foi pensada para facilitar:

- manutenção;
- crescimento do projeto;
- criação de novas fases;
- testes automatizados;
- atualização de sistemas e regras.

Sem essa separação, uma funcionalidade como "mostrar um novo desafio" exigiria alterar múltiplos pontos do código ao mesmo tempo. Com a arquitetura atual, normalmente basta:

1. criar ou ajustar a regra no domínio;
2. adicionar o data source ou repositório relacionado;
3. registrar o desafio na fábrica;
4. renderizar o widget na UI.

---

## 14. Conclusão

Este documento foi criado para funcionar como uma visão técnica do projeto e como apoio para leitura do código. Ele não substitui a proposta básica do README, mas complementa a documentação principal com detalhes sobre organização, camadas, arquivos e responsabilidades.

Em resumo:

- o README explica a proposta e a experiência do usuário;
- esta documentação explica como a aplicação está montada e por que cada parte existe.

Essa combinação permite que o repositório seja entendível tanto para quem quer conhecer o produto quanto para quem quer evoluir a arquitetura do código.

- crescimento do projeto;
- criação de novas fases;
- testes automatizados;
- atualização de sistemas e regras.

Sem essa separação, uma funcionalidade como "mostrar um novo desafio" exigiria alterar múltiplos pontos do código ao mesmo tempo. Com a arquitetura atual, normalmente basta:

1. criar ou ajustar a regra no domínio;
2. adicionar o data source ou repositório relacionado;
3. registrar o desafio na fábrica;
4. renderizar o widget na UI.

---

## 15. Por Fim

Este documento foi criado para funcionar como uma visão técnica do projeto e como apoio para leitura do código. Ele não substitui a proposta básica do README, mas complementa a documentação principal com detalhes sobre organização, camadas, arquivos e responsabilidades.

Em resumo:

- o README explica a proposta e a experiência do usuário;
- esta documentação explica como a aplicação está montada e por que cada parte existe.

Essa combinação permite que o repositório seja entendível tanto para quem quer conhecer o produto quanto para quem quer evoluir a arquitetura do código.
