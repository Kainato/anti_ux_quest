# 😈 Anti-UX Playground

O **Anti-UX Playground** é uma aplicação interativa criada com um único propósito: reunir as **piores decisões de experiência do usuário** possíveis em um único formulário. A ideia é criar um ambiente absurdamente caótico e frustrante para que desenvolvedores, designers e entusiastas possam refletir sobre acessibilidade e usability... enquanto tentam (e falham) preencher um simples cadastro.

---

## 🎯 Objetivo do Projeto

Transformar conceitos abstratos de **Design System**, **Acessibilidade (WCAG)** e **Heurísticas de Nielsen** em um contraexemplo prático e divertido. Em vez de apenas ler o que *não* fazer, você vivencia a dor do usuário em sua forma mais pura.

## 💣 Obstáculos (Futuramente) Implementados

Cada campo deste playground é munido de um pesadelo de UX:

* 👤 **Nome Completo:** O campo altera a ordem do texto aleatoriamente conforme você digita.
* 🎂 **Data de Nascimento:** Selecionável apenas por um *slider* contínuo de 0 a 30.000 dias de vida.
* 📞 **Telefone:** Um seletor numérico (`<input type="number">`) com botões de incremento `+` e `-`.
* 🔒 **Senha:** Exige requisitos contraditórios em tempo real (ex: *"deve conter o dia da semana em aramaico"* e *"múltiplo de 7"*).
* 👁️ **Captcha Passivo-Agressivo:** Identifique as imagens com objetos... enquanto o container muda de lugar e tamanho a cada clique.
* 🔘 **Botão de Envio:** Foge do cursor (hover dodge) e desativa sozinho se você hesitar por mais de 2 segundos.
* 🌗 **Dark Mode / Light Mode:** Alterna sozinho a cada 5 segundos com um efeito de *flashbang* na tela.

## 🛠️ Tecnologias Utilizadas

<p>
  <img src="https://skillicons.dev/icons?i=flutter,dart" />
</p>
Flutter · Dart · Provider


## 🚀 Como Rodar o Projeto

1. **Clone o repositório:**

```bash
git clone https://github.com/Kainato/anti-ux-playground.git
```

2. **Acesse a pasta do projeto:**

```bash
cd anti-ux-playground
```

3. **Instale as dependências:**

```bash
flutter pub get
```

5. **Boa sorte**

😉🤣

## 🤝 Como Contribuir

Tem uma ideia de campo ainda pior? Sinta-se à vontade para enviar uma Pull Request!

1. Faça um **Fork** do projeto
2. Crie sua Feature Branch (`git checkout -b feature/pior-input-do-mundo`)
3. Faça o **Commit** das suas alterações (`git commit -m 'Add: Input de CEP que exige código Morse'`)
4. Faça o **Push** para a Branch (`git push origin feature/pior-input-do-mundo`)
5. Abra uma **Pull Request**

---

## 📜 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](https://www.google.com/search?q=LICENSE) para mais detalhes.
