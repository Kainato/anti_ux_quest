import '../../domain/entities/challenge_type.dart';
import '../../domain/entities/level.dart';

class LevelsLocalDataSource {
  const LevelsLocalDataSource();

  List<Level> fetchLevels() => _levels;
}

const _levels = <Level>[
  Level(
    title: 'Arroz, por favor',
    objective: 'Digite a palavra arroz e envie.',
    pattern: 'Teclado alfabético',
    reflection:
        'Um teclado fora do padrão transforma uma tarefa automática em caça às letras. Padrões familiares deixam a digitação mais rápida e previsível.',
    challenge: ChallengeType.alphabeticKeyboard,
  ),
  Level(
    title: 'Agora você vê, agora não',
    objective: 'Toque no botão ENVIAR. Ele adora passear.',
    pattern: 'Ação que muda de lugar',
    reflection:
        'Um alvo que se move pune a precisão e torna a interface imprevisível. Ações importantes devem ficar estáveis e ter uma área de toque confortável.',
    challenge: ChallengeType.movingButton,
  ),
  Level(
    title: 'Adivinhe o formato',
    objective: 'Preencha o campo com 8 números, sem espaços.',
    pattern: 'Rótulo ambíguo',
    reflection:
        'Quando o formato esperado fica escondido, o erro parece culpa da pessoa. Mostre exemplos e requisitos antes do preenchimento.',
    challenge: ChallengeType.ambiguousInput,
  ),
  Level(
    title: 'Errou? Comece do zero',
    objective: 'Digite ARROZ no campo. Um erro apaga tudo.',
    pattern: 'Validação destrutiva',
    reflection:
        'Apagar todos os dados por causa de um campo inválido aumenta o custo do erro. Preserve o que já foi preenchido e indique exatamente o que corrigir.',
    challenge: ChallengeType.destructiveValidation,
  ),
  Level(
    title: 'Mira de precisão',
    objective: 'Acerte o pontinho para concluir.',
    pattern: 'Alvo minúsculo',
    reflection:
        'Alvos pequenos são difíceis de tocar, especialmente em telas menores ou para pessoas com limitações motoras. A área clicável deve ser generosa.',
    challenge: ChallengeType.tinyTarget,
  ),
  Level(
    title: 'Cadê a instrução?',
    objective: 'Leia o texto quase invisível e escolha a resposta.',
    pattern: 'Baixo contraste',
    reflection:
        'Contraste insuficiente exclui pessoas e cansa a leitura. Texto e controles precisam continuar legíveis em diferentes condições de visão.',
    challenge: ChallengeType.lowContrast,
  ),
  Level(
    title: 'Duas opções iguais',
    objective: 'Escolha “Concordo” para seguir.',
    pattern: 'Opções indistinguíveis',
    reflection:
        'Opções visualmente iguais escondem consequências. Rótulos claros e estados selecionados reduzem erros.',
    challenge: ChallengeType.duplicateOptions,
  ),
  Level(
    title: 'Só mais uma confirmação',
    objective: 'Confirme até o sistema acreditar em você.',
    pattern: 'Confirmações em cascata',
    reflection:
        'Confirmações repetidas interrompem o fluxo e ensinam as pessoas a clicar sem ler. Reserve alertas para decisões realmente importantes.',
    challenge: ChallengeType.confirmationChain,
  ),
  Level(
    title: 'O botão no fim do mundo',
    objective: 'Role até encontrar o botão para continuar.',
    pattern: 'Ação fora de contexto',
    reflection:
        'Esconder a ação principal longe do conteúdo aumenta esforço e desorienta. Mantenha o próximo passo fácil de localizar.',
    challenge: ChallengeType.scrollTrap,
  ),
  Level(
    title: 'Senha surpresa',
    objective: 'Crie uma senha. Os requisitos aparecem depois.',
    pattern: 'Requisitos tardios',
    reflection:
        'Regras escondidas provocam tentativas desnecessárias. Apresente os requisitos antes e explique erros junto ao campo.',
    challenge: ChallengeType.passwordChallenge,
  ),
  Level(
    title: 'Noventa e nove por cento',
    objective: 'Aguarde… ou talvez faça alguma coisa?',
    pattern: 'Progresso enganoso',
    reflection:
        'Uma barra parada em 99% não informa o que está acontecendo. Mostre o estado real, o tempo esperado e uma saída quando houver espera.',
    challenge: ChallengeType.fakeLoading,
  ),
  Level(
    title: 'O grande formulário final',
    objective: 'Digite arroz, toque no alvo pequeno e confirme duas vezes.',
    pattern: 'Combo de anti padrões',
    reflection:
        'Combinar barreiras transforma pequenas fricções em uma experiência excludente. Cada decisão ruim se acumula; uma boa interface reduz esforço em cada etapa.',
    challenge: ChallengeType.finalCombo,
  ),
];
