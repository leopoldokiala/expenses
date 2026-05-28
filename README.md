# Expenses
Aplicativo de controle de despesas pessoais desenvolvido em Flutter com interface adaptativa (Material Design no Android, Cupertino no iOS).

# Funcionalidades
- Adicionar despesas - regista o título, valor e data de cada transação
- Listar transações - exibe todas as despesas registadas com opção de eliminar
- Gráfico semanal - mostra o total gasto por dia nos últimos 7 dias
- Adaptativo por plataforma - componentes nativos para Android (Material) e iOS (Cupertino)
- Estado reativo - a UI atualiza-se automaticamente com "setState"

# Tecnologias
- Flutter e Dart
- Pacotes: intl (formatação de datas/moeda), cupertino_icons
- Fontes personalizadas: OpenSans e Quicksand
- Estrutura: models/, components/, main.dart


# Como executar
bash
flutter pub get
flutter run


# Aprendizados

Este projeto foi desenvolvido no curso *Aprenda Flutter e Desenvolva Apps Para Android e IOS 2020* e aborda conceitos como:
- Widgets Stateless vs Stateful
- Comunicação entre widgets via callbacks
- Modal Bottom Sheet
- Layout responsivo (Adaptive Layout)
- Formulários, validação e controllers
- DatePicker nativo (Material e Cupertino)
- ListView, Card, e gestão de estado com "setState"
