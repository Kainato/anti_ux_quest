# Anti-UX Quest

Um jogo em Flutter que transforma tarefas triviais em desafios de sobrevivência digital.

A proposta é simples: cada fase traz um objetivo claro (por exemplo, digitar uma palavra), mas a interface foi desenhada com as piores práticas possíveis de UI/UX. A pessoa jogadora precisa descobrir como vencer a fricção, completar o objetivo e avançar.

Depois de cada fase, o jogo mostra uma explicação curta sobre o problema de usabilidade usado no desafio e qual seria uma alternativa melhor.

## Conceito do projeto

- Campanha com número de fases aberto (crescimento contínuo por novas atualizações)
- Bloco inicial com 12 fases jogáveis
- Cada fase foca em uma anti-prática de UI/UX
- Objetivo sempre explícito, interface sempre hostil
- Mistura de humor, frustração controlada e aprendizado por contraste

Premissa:

Um jogo sobre interfaces que parecem testar sua paciência. Complete tarefas simples enquanto enfrenta decisões de UI/UX feitas da pior maneira possível.

## Loop de jogo

1. Jogador abre uma fase no mapa.
2. Vê o objetivo da vez.
3. Tenta concluir a tarefa apesar da interface ruim.
4. Ao concluir, recebe confirmação e um resumo educativo.
5. Próxima fase é desbloqueada.

## Estrutura da experiência

- AppBar com título dinâmico no formato Fase X
- Contador de progresso no topo, exibindo fase atual e total da campanha
- Área central com objetivo, interação principal e ação para concluir
- Mapa de fases com desbloqueio progressivo
- Menu lateral opcional com seções auxiliares (como Sobre)
- Tela de explicação pós-fase (modo reflexão)

## Fases iniciais da campanha (1 a 12)

1. Teclado em ordem alfabética
2. Botão que muda de lugar
3. Formato de campo escondido
4. Validação que apaga os dados
5. Alvo minúsculo
6. Texto com baixo contraste
7. Opções visualmente iguais
8. Confirmações repetidas
9. Ação escondida no fim da tela
10. Requisitos de senha revelados tarde
11. Progresso parado em 99%
12. Desafio final combinando obstáculos

## Objetivos de design

- Frustrar com intenção, sem bloquear de forma impossível
- Garantir que cada fase tenha solução aprendível
- Evitar aleatoriedade injusta
- Transformar dor de uso em material educativo
- Manter duração curta por fase para ritmo ágil

## Estado atual

- Campanha base de 12 fases implementada
- Progresso e desbloqueio de fases funcionando
- Fluxo de conclusão por fase com feedback
- Conteúdo de apoio disponível no menu (exemplo: Sobre)

## Próximas evoluções

- Novas fases temáticas (acessibilidade, navegação, feedback visual, etc.)
- Métricas com humor (tempo, cliques, tentativas, índice de sofrimento)
- Balanceamento de dificuldade por etapa
- Possível modo alternativo sem spoilers e modo estudo com explicação expandida

## Executar

Requisitos: Flutter instalado.

```bash
flutter pub get
flutter run
```

O app também pode ser executado nos alvos Flutter configurados neste repositório, como Web e desktop.

## Estrutura de pastas (resumo)

O projeto segue Clean Architecture, organizado por feature:

- lib/main.dart: ponto de entrada
- lib/app: MaterialApp, tema e raiz de composição (injeção de dependências)
- lib/features/quest/domain: entidades, regras de vitória, contratos de repositório e casos de uso (sem dependência de Flutter)
- lib/features/quest/data: fontes de dados e implementações dos repositórios (fases e progresso)
- lib/features/quest/presentation: controller, página, widgets e um widget por desafio

Para criar uma nova fase:

1. Adicione um valor em `ChallengeType`.
2. Cadastre o `Level` em `levels_local_data_source.dart`.
3. Crie o widget do desafio em `presentation/challenges` e registre-o em `challenge_factory.dart`.
4. Se houver validação, coloque a regra em `ChallengeRules`.
