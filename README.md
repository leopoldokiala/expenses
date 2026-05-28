# Expenses

Aplicativo de controle de despesas pessoais desenvolvido em Flutter com interface adaptativa (Material Design no Android, Cupertino no iOS).

## Funcionalidades

- **Adicionar despesas** — regista o título, valor e data de cada transação
- **Listar transações** — exibe todas as despesas registadas com opção de eliminar
- **Gráfico semanal** — mostra o total gasto por dia nos últimos 7 dias
- **Adaptativo por plataforma** — componentes nativos para Android (Material) e iOS (Cupertino)
- **Estado reativo** — a UI atualiza-se automaticamente com `setState`

## Tecnologias

- **Flutter** + **Dart**
- Pacotes: `intl` (formatação de datas/moeda), `cupertino_icons`
- Fontes personalizadas: OpenSans e Quicksand
- Estrutura: `models/`, `components/`, `main.dart`

## Estrutura do projeto

```
lib/
├── main.dart                          # Entry point, tema, estado global
├── models/
│   └── transaction.dart               # Modelo Transaction (id, title, value, date)
└── components/
    ├── transaction_form.dart          # Formulário para nova transação
    ├── transactions_list.dart         # Lista de transações com delete
    ├── chart.dart                     # Gráfico semanal de despesas
    ├── chart_bar.dart                 # Barra individual do gráfico
    ├── adaptative_button.dart         # Botão adaptativo (Cupertino / Material)
    ├── adaptative_text_field.dart     # Campo de texto adaptativo
    └── adaptative_date_picker.dart    # Seletor de data adaptativo
```

## Como executar

```bash
flutter pub get
flutter run
```

## Aprendizados

Este projeto foi desenvolvido no curso **Aprenda Flutter** e aborda conceitos como:

- Widgets Stateless vs Stateful
- Comunicação entre widgets via callbacks
- Modal Bottom Sheet
- Layout responsivo (Adaptive Layout)
- Platform-specific UI com `dart:io` (`Platform.isIOS`)
- Formulários, validação e controllers
- DatePicker nativo (Material e Cupertino)
- ListView, Card, e gestão de estado com `setState`
