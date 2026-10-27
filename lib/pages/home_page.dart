import 'package:flutter/material.dart';

const _ink = Color(0xFF20211D);
// const _paper = Color(0xFFF5F1E8);
const _yellow = Color(0xFFFFD447);
const _coral = Color(0xFFFF6D52);
const _blue = Color(0xFF536CF4);
const _muted = Color(0xFF77766F);

const _levels = <LevelData>[
  LevelData(
    'Arroz, por favor',
    'Digite a palavra arroz e envie.',
    'Teclado alfabético',
    'Um teclado fora do padrão transforma uma tarefa automática em caça às letras. Padrões familiares deixam a digitação mais rápida e previsível.',
  ),
  LevelData(
    'Agora você vê, agora não',
    'Toque no botão ENVIAR. Ele adora passear.',
    'Ação que muda de lugar',
    'Um alvo que se move pune a precisão e torna a interface imprevisível. Ações importantes devem ficar estáveis e ter uma área de toque confortável.',
  ),
  LevelData(
    'Adivinhe o formato',
    'Preencha o campo com 8 números, sem espaços.',
    'Rótulo ambíguo',
    'Quando o formato esperado fica escondido, o erro parece culpa da pessoa. Mostre exemplos e requisitos antes do preenchimento.',
  ),
  LevelData(
    'Errou? Comece do zero',
    'Digite ARROZ no campo. Um erro apaga tudo.',
    'Validação destrutiva',
    'Apagar todos os dados por causa de um campo inválido aumenta o custo do erro. Preserve o que já foi preenchido e indique exatamente o que corrigir.',
  ),
  LevelData(
    'Mira de precisão',
    'Acerte o pontinho para concluir.',
    'Alvo minúsculo',
    'Alvos pequenos são difíceis de tocar, especialmente em telas menores ou para pessoas com limitações motoras. A área clicável deve ser generosa.',
  ),
  LevelData(
    'Cadê a instrução?',
    'Leia o texto quase invisível e escolha a resposta.',
    'Baixo contraste',
    'Contraste insuficiente exclui pessoas e cansa a leitura. Texto e controles precisam continuar legíveis em diferentes condições de visão.',
  ),
  LevelData(
    'Duas opções iguais',
    'Escolha “Concordo” para seguir.',
    'Opções indistinguíveis',
    'Opções visualmente iguais escondem consequências. Rótulos claros e estados selecionados reduzem erros.',
  ),
  LevelData(
    'Só mais uma confirmação',
    'Confirme até o sistema acreditar em você.',
    'Confirmações em cascata',
    'Confirmações repetidas interrompem o fluxo e ensinam as pessoas a clicar sem ler. Reserve alertas para decisões realmente importantes.',
  ),
  LevelData(
    'O botão no fim do mundo',
    'Role até encontrar o botão para continuar.',
    'Ação fora de contexto',
    'Esconder a ação principal longe do conteúdo aumenta esforço e desorienta. Mantenha o próximo passo fácil de localizar.',
  ),
  LevelData(
    'Senha surpresa',
    'Crie uma senha. Os requisitos aparecem depois.',
    'Requisitos tardios',
    'Regras escondidas provocam tentativas desnecessárias. Apresente os requisitos antes e explique erros junto ao campo.',
  ),
  LevelData(
    'Noventa e nove por cento',
    'Aguarde… ou talvez faça alguma coisa?',
    'Progresso enganoso',
    'Uma barra parada em 99% não informa o que está acontecendo. Mostre o estado real, o tempo esperado e uma saída quando houver espera.',
  ),
  LevelData(
    'O grande formulário final',
    'Digite arroz, toque no alvo pequeno e confirme duas vezes.',
    'Combo de anti padrões',
    'Combinar barreiras transforma pequenas fricções em uma experiência excludente. Cada decisão ruim se acumula; uma boa interface reduz esforço em cada etapa.',
  ),
];

class LevelData {
  const LevelData(this.title, this.objective, this.pattern, this.reflection);
  final String title, objective, pattern, reflection;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _level = 0;
  int _unlocked = 0;
  bool _complete = false;
  String _notice = '';
  String _text = '';
  String _digits = '';
  String _password = '';
  String? _choice;
  bool _requirements = false;
  int _buttonSlot = 0;
  int _confirmations = 0;
  bool _sent = false;
  final _fieldController = TextEditingController();

  LevelData get data => _levels[_level];

  void _resetChallenge() {
    _complete = false;
    _notice = '';
    _text = '';
    _digits = '';
    _password = '';
    _choice = null;
    _requirements = false;
    _buttonSlot = 0;
    _confirmations = 0;
    _sent = false;
    _fieldController.clear();
  }

  void _success() {
    if (_complete) return;
    setState(() {
      _complete = true;
      _notice = '';
      _unlocked = _level + 1 > _unlocked ? _level + 1 : _unlocked;
    });
  }

  void _error(String message) => setState(() => _notice = message);

  void _advance() {
    setState(() {
      _level = _level < _levels.length - 1 ? _level + 1 : 0;
      _resetChallenge();
    });
  }

  void _openLevel(int index) {
    if (index > _unlocked) return;
    setState(() {
      _level = index;
      _resetChallenge();
    });
  }

  @override
  void dispose() {
    _fieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _paper,
      drawer: _navigationDrawer(),
      appBar: AppBar(
        backgroundColor: _paper,
        foregroundColor: _ink,
        elevation: 0,
        titleSpacing: 4,
        title: Text(
          'FASE ${(_level + 1).toString().padLeft(2, '0')}',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu_rounded),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Center(
              child: Text(
                '${_level + 1} / ${_levels.length}',
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, bounds) {
            final wide = bounds.maxWidth >= 720;
            final content = _gameContent();
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1040),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    wide ? 32 : 20,
                    8,
                    wide ? 32 : 20,
                    22,
                  ),
                  child: wide
                      ? SingleChildScrollView(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 3, child: content),
                              const SizedBox(width: 36),
                              SizedBox(width: 240, child: _levelMap()),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(child: content),
                            ),
                            const SizedBox(height: 16),
                            _compactProgress(),
                          ],
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _gameContent() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: _yellow,
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(Icons.bolt_rounded, color: _ink),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ANTI-UX QUEST',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                  color: _muted,
                ),
              ),
              const Text(
                'Uma tarefa. Uma péssima interface.',
                style: TextStyle(fontSize: 12, color: _muted),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 26),
      _progressBar(),
      const SizedBox(height: 30),
      Text(
        'DESAFIO ${(_level + 1).toString().padLeft(2, '0')}',
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w900,
          letterSpacing: 2,
          color: _blue,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        data.title,
        style: const TextStyle(
          fontSize: 31,
          height: 1.08,
          fontWeight: FontWeight.w900,
          color: _ink,
          letterSpacing: -1,
        ),
      ),
      const SizedBox(height: 12),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFE9E4D9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.flag_rounded, size: 19, color: _coral),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                data.objective,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                  color: _ink,
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 24),
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 240),
        child: _complete ? _reflectionPanel() : _challenge(),
      ),
      if (_notice.isNotEmpty) ...[
        const SizedBox(height: 12),
        Text(
          _notice,
          style: const TextStyle(color: _coral, fontWeight: FontWeight.w700),
        ),
      ],
      const SizedBox(height: 18),
      Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: _coral, size: 16),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              'Prática ruim em jogo. A dificuldade deve ser irritante, nunca impossível.',
              style: TextStyle(fontSize: 11, color: _muted, height: 1.3),
            ),
          ),
        ],
      ),
    ],
  );

  Widget _progressBar() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${((_level + 1) / _levels.length * 100).round()}% DA JORNADA',
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.4,
              color: _muted,
            ),
          ),
          Text(
            '$_unlocked concluídas',
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: _muted,
            ),
          ),
        ],
      ),
      const SizedBox(height: 9),
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: LinearProgressIndicator(
          value: (_level + 1) / _levels.length,
          minHeight: 7,
          backgroundColor: const Color(0xFFE0DBD0),
          color: _blue,
        ),
      ),
    ],
  );

  Widget _compactProgress() => Row(
    children: List.generate(_levels.length, (i) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: GestureDetector(
            onTap: () => _openLevel(i),
            child: Container(
              height: 6,
              decoration: BoxDecoration(
                color: i <= _unlocked
                    ? (i == _level ? _coral : _blue)
                    : const Color(0xFFDDD8CD),
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          ),
        ),
      );
    }),
  );

  Widget _levelMap() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'MAPA DA FRUSTRAÇÃO',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 11,
          letterSpacing: 1.4,
        ),
      ),
      const SizedBox(height: 14),
      ...List.generate(_levels.length, (i) {
        final active = i == _level;
        final unlocked = i <= _unlocked;
        return InkWell(
          onTap: () => _openLevel(i),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Row(
              children: [
                Container(
                  width: 27,
                  height: 27,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: active
                        ? _yellow
                        : (unlocked
                              ? const Color(0xFFE3DFD5)
                              : Colors.transparent),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: active ? _ink : const Color(0xFFD3CEC3),
                    ),
                  ),
                  child: Text(
                    '${i + 1}',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    _levels[i].title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: unlocked ? _ink : _muted,
                      fontWeight: active ? FontWeight.w900 : FontWeight.w500,
                    ),
                  ),
                ),
                if (i < _unlocked)
                  const Icon(Icons.check_rounded, size: 15, color: _blue),
              ],
            ),
          ),
        );
      }),
    ],
  );

  Widget _navigationDrawer() => Drawer(
    backgroundColor: _paper,
    child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: _yellow,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(Icons.bolt_rounded),
                ),
                const SizedBox(height: 12),
                const Text(
                  'ANTI-UX QUEST',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.6,
                  ),
                ),
                const Text(
                  'Sobreviva ao design ruim.',
                  style: TextStyle(color: _muted),
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.sports_esports_rounded),
            title: const Text('Jogar'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.map_rounded),
            title: const Text('Mapa de fases'),
            onTap: () {
              Navigator.pop(context);
              _showLevelList();
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded),
            title: const Text('Sobre o projeto'),
            onTap: () {
              Navigator.pop(context);
              _showAbout();
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Text(
              'Feito para aprender por contraste.\n12 fases • 12 decisões questionáveis',
              style: TextStyle(color: _muted, fontSize: 12, height: 1.5),
            ),
          ),
        ],
      ),
    ),
  );

  void _showLevelList() => showModalBottomSheet<void>(
    context: context,
    backgroundColor: _paper,
    isScrollControlled: true,
    builder: (context) => SafeArea(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * .75,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                'MAPA DA FRUSTRAÇÃO',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _levels.length,
                itemBuilder: (context, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: i == _level
                        ? _yellow
                        : const Color(0xFFE4DFD4),
                    child: Text(
                      '${i + 1}',
                      style: const TextStyle(color: _ink),
                    ),
                  ),
                  title: Text(_levels[i].title),
                  subtitle: Text(_levels[i].pattern),
                  trailing: i <= _unlocked
                      ? const Icon(Icons.chevron_right_rounded)
                      : const Icon(Icons.lock_outline_rounded),
                  onTap: i <= _unlocked
                      ? () {
                          Navigator.pop(context);
                          _openLevel(i);
                        }
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  void _showAbout() => showAboutDialog(
    context: context,
    applicationName: 'Anti-UX Quest',
    applicationVersion: '12 fases',
    applicationIcon: const Icon(Icons.bolt_rounded, color: _coral, size: 36),
    children: const [
      Text(
        'Um jogo sobre interfaces que testam sua paciência. Complete tarefas simples, enfrente decisões de UI/UX feitas da pior maneira possível e descubra como cada barreira poderia ser evitada.',
      ),
    ],
  );

  Widget _reflectionPanel() => Container(
    key: const ValueKey('reflection'),
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: const Color(0xFFE8F0E3),
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: const Color(0xFFB9CDB5)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: Color(0xFF3E8051)),
            const SizedBox(width: 8),
            const Text(
              'FASE CONCLUÍDA',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                letterSpacing: 1.4,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Text(
          data.pattern.toUpperCase(),
          style: const TextStyle(
            color: _blue,
            fontWeight: FontWeight.w900,
            fontSize: 11,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 9),
        Text(
          data.reflection,
          style: const TextStyle(fontSize: 14, height: 1.5),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: _advance,
            icon: Icon(
              _level == _levels.length - 1
                  ? Icons.replay_rounded
                  : Icons.arrow_forward_rounded,
            ),
            label: Text(
              _level == _levels.length - 1 ? 'JOGAR DE NOVO' : 'PRÓXIMA FASE',
            ),
            style: FilledButton.styleFrom(
              backgroundColor: _ink,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ),
      ],
    ),
  );

  Widget _challenge() => Container(
    key: ValueKey('challenge-$_level'),
    width: double.infinity,
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: const Color(0xFFFFFCF6),
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: const Color(0xFFE0DBD0)),
      boxShadow: const [
        BoxShadow(
          color: Color(0x10000000),
          blurRadius: 15,
          offset: Offset(0, 6),
        ),
      ],
    ),
    child: _challengeBody(),
  );

  Widget _challengeBody() {
    switch (_level) {
      case 0:
        return _alphabetKeyboard();
      case 1:
        return _movingButton();
      case 2:
        return _ambiguousInput();
      case 3:
        return _destructiveValidation();
      case 4:
        return _tinyTarget();
      case 5:
        return _lowContrast();
      case 6:
        return _duplicateOptions();
      case 7:
        return _confirmationChain();
      case 8:
        return _scrollTrap();
      case 9:
        return _passwordChallenge();
      case 10:
        return _fakeLoading();
      default:
        return _finalCombo();
    }
  }

  Widget _alphabetKeyboard() {
    final keys = 'abcdefghijklmnopqrstuvwxyz'.split('').map((character) {
      return SizedBox(
        width: 34,
        height: 36,
        child: FilledButton(
          onPressed: () => setState(() => _text += character),
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFFECE7DC),
            foregroundColor: _ink,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            character,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      );
    }).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'CAMPO DE TEXTO',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.4,
            color: _muted,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: _paper,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            _text.isEmpty ? 'Toque nas letras abaixo…' : _text,
            style: TextStyle(
              color: _text.isEmpty ? _muted : _ink,
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(spacing: 5, runSpacing: 6, children: keys),
        const SizedBox(height: 12),
        Row(
          children: [
            TextButton(
              onPressed: () => setState(
                () => _text = _text.isEmpty
                    ? ''
                    : _text.substring(0, _text.length - 1),
              ),
              child: const Text('APAGAR'),
            ),
            const Spacer(),
            _actionButton(
              'ENVIAR',
              () => _text.toLowerCase() == 'arroz'
                  ? _success()
                  : _error('Ops, ainda não é “arroz”.'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _movingButton() {
    final labels = ['ENVIAR', 'CONFIRMAR', 'PRONTO', 'CONTINUAR'];
    return Column(
      children: [
        SizedBox(
          height: 120,
          width: double.infinity,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 180),
                left: (_buttonSlot % 3) * 100.0,
                top: (_buttonSlot ~/ 3) * 55.0,
                child: FilledButton(
                  onPressed: () {
                    if (_buttonSlot >= 5)
                      _success();
                    else
                      setState(() {
                        _buttonSlot++;
                        _notice = 'Quase! O botão mudou de lugar.';
                      });
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: _coral,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(labels[_buttonSlot % labels.length]),
                ),
              ),
            ],
          ),
        ),
        const Text(
          'Dica: a persistência também é uma estratégia.',
          style: TextStyle(fontSize: 12, color: _muted),
        ),
      ],
    );
  }

  Widget _ambiguousInput() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextField(
        keyboardType: TextInputType.number,
        onChanged: (v) => _digits = v,
        decoration: InputDecoration(
          labelText: 'Identificador',
          hintText: '________',
          helperText: 'Não vamos dizer o formato. Boa sorte.',
          filled: true,
          fillColor: _paper,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      const SizedBox(height: 12),
      Align(
        alignment: Alignment.centerRight,
        child: _actionButton(
          'VALIDAR',
          () => _digits.replaceAll(RegExp(r'\D'), '').length == 8
              ? _success()
              : _error('Formato inválido. Tente 8 números.'),
        ),
      ),
    ],
  );

  Widget _destructiveValidation() => Column(
    children: [
      TextField(
        controller: _fieldController,
        onChanged: (v) => _text = v,
        decoration: InputDecoration(
          labelText: 'Palavra secreta',
          filled: true,
          fillColor: _paper,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      const SizedBox(height: 12),
      Align(
        alignment: Alignment.centerRight,
        child: _actionButton('ENVIAR', () {
          if (_text.toUpperCase() == 'ARROZ') {
            _success();
          } else {
            setState(() {
              _text = '';
              _fieldController.clear();
              _notice = 'Incorreto! Apagamos tudo para você começar de novo.';
            });
          }
        }),
      ),
    ],
  );

  Widget _tinyTarget() => SizedBox(
    height: 112,
    width: double.infinity,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          right: 12,
          top: 8,
          child: Text(
            'ENVIAR',
            style: const TextStyle(fontSize: 9, color: Color(0x6677766F)),
          ),
        ),
        GestureDetector(
          onTap: _success,
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: _coral,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    ),
  );

  Widget _lowContrast() => Column(
    children: [
      Text(
        'A instrução está aqui, mas quase não dá para ler.',
        style: TextStyle(color: const Color(0xFFDAD6CD), fontSize: 12),
      ),
      const SizedBox(height: 18),
      const Text(
        'Qual é a cor do céu em um dia sem nuvens?',
        style: TextStyle(color: Color(0xFFEBE7DE), fontSize: 13),
      ),
      const SizedBox(height: 12),
      Wrap(
        spacing: 8,
        children: ['Verde', 'Azul', 'Roxo']
            .map(
              (v) => OutlinedButton(
                onPressed: () => v == 'Azul'
                    ? _success()
                    : _error('Resposta incorreta. Tente de novo.'),
                child: Text(v),
              ),
            )
            .toList(),
      ),
    ],
  );

  Widget _duplicateOptions() => Column(
    children:
        ['Concordo', 'Concordo']
            .asMap()
            .entries
            .map<Widget>(
              (entry) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Radio<String>(
                  value: 'op${entry.key}',
                  groupValue: _choice,
                  onChanged: (v) => setState(() => _choice = v),
                ),
                title: Text(entry.value),
                onTap: () => setState(() => _choice = 'op${entry.key}'),
              ),
            )
            .toList()
          ..add(
            ListTile(
              leading: Radio<String>(
                value: 'nao',
                groupValue: _choice,
                onChanged: (v) => setState(() => _choice = v),
              ),
              title: const Text('Não concordo'),
              onTap: () => setState(() => _choice = 'nao'),
            ),
          )
          ..add(
            Align(
              alignment: Alignment.centerRight,
              child: _actionButton(
                'SEGUIR',
                () => _choice == 'op1'
                    ? _success()
                    : _error('Escolha a segunda opção “Concordo”.'),
              ),
            ),
          ),
  );

  Widget _confirmationChain() => Column(
    children: [
      Text(
        'Você tem certeza? ${_confirmations > 0 ? 'Tem certeza mesmo?' : ''}',
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      const SizedBox(height: 14),
      _actionButton(
        _confirmations == 0 ? 'SIM, CONTINUAR' : 'SIM, TENHO CERTEZA',
        () => setState(() {
          _confirmations++;
          if (_confirmations >= 3)
            _success();
          else
            _notice = 'Confirmação $_confirmations de 3. Ufa.';
        }),
      ),
    ],
  );

  Widget _scrollTrap() => SizedBox(
    height: 285,
    child: ListView(
      children: [
        const Text(
          'Preferências da conta',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
        ),
        const SizedBox(height: 10),
        ...List.generate(
          7,
          (i) => ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.tune_rounded, size: 19),
            title: Text(
              [
                'Avisos por e-mail',
                'Atualizações do produto',
                'Lembretes semanais',
                'Novidades e ofertas',
                'Resumo mensal',
                'Relatórios de uso',
                'Preferências extras',
              ][i],
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
        ),
        const SizedBox(height: 6),
        _actionButton('FINALMENTE, CONTINUAR', _success),
      ],
    ),
  );

  Widget _passwordChallenge() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextField(
        obscureText: true,
        onChanged: (v) => _password = v,
        decoration: InputDecoration(
          labelText: 'Nova senha',
          filled: true,
          fillColor: _paper,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      if (_requirements)
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'Surpresa! A senha precisa ter ao menos 8 caracteres e incluir “ux”.',
            style: TextStyle(fontSize: 12, color: _coral, height: 1.4),
          ),
        ),
      const SizedBox(height: 12),
      Align(
        alignment: Alignment.centerRight,
        child: _actionButton('CRIAR CONTA', () {
          if (!_requirements)
            setState(() {
              _requirements = true;
              _notice = 'A senha não atende aos requisitos.';
            });
          else if (_password.length >= 8 &&
              _password.toLowerCase().contains('ux'))
            _success();
          else
            _error('Tente de novo. Não apagamos sua senha desta vez.');
        }),
      ),
    ],
  );

  Widget _fakeLoading() => Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: LinearProgressIndicator(
          value: _sent ? 1 : .99,
          minHeight: 12,
          color: _coral,
          backgroundColor: const Color(0xFFE6E0D5),
        ),
      ),
      const SizedBox(height: 12),
      Text(
        _sent ? 'Pronto! Levou só um instante (mentira).' : 'Enviando… 99%',
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      const SizedBox(height: 14),
      if (!_sent)
        TextButton(
          onPressed: () => setState(() => _sent = true),
          child: const Text('AINDA ESTÁ AÍ? TOQUE AQUI'),
        )
      else
        _actionButton('CONCLUIR', _success),
    ],
  );

  Widget _finalCombo() {
    final keys = 'abcdefghijklmnopqrstuvwxyz'.split('').map((character) {
      return SizedBox(
        width: 27,
        height: 32,
        child: FilledButton(
          onPressed: () => setState(() => _text += character),
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFFECE7DC),
            foregroundColor: _ink,
            padding: EdgeInsets.zero,
          ),
          child: Text(character),
        ),
      );
    }).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '1. Escreva “arroz” no teclado em ordem alfabética.',
          style: TextStyle(fontSize: 12, height: 1.4),
        ),
        const SizedBox(height: 8),
        Wrap(spacing: 4, runSpacing: 5, children: keys),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            _text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
        ),
        const Divider(),
        const Text(
          '2. Acerte o alvo minúsculo.',
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(
          height: 43,
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                if (_text.toLowerCase() == 'arroz') {
                  setState(() => _sent = true);
                } else {
                  _error('Primeiro escreva arroz.');
                }
              },
              child: Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  color: _coral,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
        const Divider(),
        if (_sent)
          _actionButton(
            _confirmations == 0 ? 'CONFIRMAR' : 'CONFIRMAR DE NOVO',
            () {
              setState(() => _confirmations++);
              if (_confirmations >= 2) _success();
            },
          )
        else
          Text(
            'Envie as duas etapas para liberar o botão.',
            style: TextStyle(color: _muted, fontSize: 11),
          ),
      ],
    );
  }

  Widget _actionButton(String label, VoidCallback action) => FilledButton(
    onPressed: action,
    style: FilledButton.styleFrom(
      backgroundColor: _ink,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    child: Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.w900,
        letterSpacing: .7,
        fontSize: 11,
      ),
    ),
  );
}
