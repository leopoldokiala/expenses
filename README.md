# Expenses
Aplicativo de controle de despesas pessoais desenvolvido em Flutter com interface adaptativa (Material Design no Android, Cupertino no iOS).

# Funcionalidades
<<<<<<< HEAD

- Adicionar despesas - regista o título, valor e data de cada transação
- Listar transações - exibe todas as despesas registadas com opção de eliminar
- Gráfico semanal - mostra o total gasto por dia nos últimos 7 dias
- Adaptativo por plataforma - componentes nativos para Android (Material) e iOS (Cupertino)
- Estado reativo - a UI atualiza-se automaticamente com "setState"

# Tecnologias

=======
- Adicionar despesas - regista o título, valor e data de cada transação
- Listar transações - exibe todas as despesas registadas com opção de eliminar
- Gráfico semanal - mostra o total gasto por dia nos últimos 7 dias
- Adaptativo por plataforma - componentes nativos para Android (Material) e iOS (Cupertino)
- Estado reativo - a UI atualiza-se automaticamente com "setState"

# Tecnologias
>>>>>>> 21d5066bcb390f190009fca79bc185d32e04d884
- Flutter e Dart
- Pacotes: intl (formatação de datas/moeda), cupertino_icons
- Fontes personalizadas: OpenSans e Quicksand
- Estrutura: models/, components/, main.dart

<<<<<<< HEAD
# Estrutura do projeto

lib/
 main.dart                          # Entry point, tema, estado global

 models/
 transaction.dart               # Modelo Transaction (id, title, value, date)
 
 components/
 transaction_form.dart          # Formulário para nova transação

 transactions_list.dart         # Lista de transações com delete

 chart.dart                     # Gráfico semanal de despesas

 chart_bar.dart                 # Barra individual do gráfico

 adaptative_button.dart         # Botão adaptativo (Cupertino / Material)

 adaptative_text_field.dart     # Campo de texto adaptativo
 adaptative_date_picker.dart    # Seletor de data adaptativo

# Como executar

bash
1- flutter pub get
2- flutter run


# Aprendizados

Este projeto foi desenvolvido no curso *Aprenda Flutter e Desenvolva Apps Para Android e IOS 2020* e aborda conceitos como:
=======
# Plataformas Suportadas
- Android
- IOS
  
# Como executar
bash
flutter pub get
flutter run

# Capturas da App funcional
<img width="420" height="680" alt="3" src="https://github.com/user-attachments/assets/abd7f470-a56f-43db-aa50-b2e9eb506c83" />
<img width="435" height="663" alt="4" src="https://github.com/user-attachments/assets/bae3b1dd-6cf9-460d-8df7-ef24abffd871" />
<img width="422" height="672" alt="5" src="https://github.com/user-attachments/assets/926a20a7-41f3-4626-b845-976bf15b565c" />
<img width="791" height="652" alt="6" src="https://github.com/user-attachments/assets/ccea98d2-9cc0-4972-8c68-e8fcd4620aea" />
<img width="496" height="851" alt="1" src="https://github.com/user-attachments/assets/31b90a4e-5aa3-4f68-a7bb-7adc277056cd" />

>>>>>>> 21d5066bcb390f190009fca79bc185d32e04d884

# Aprendizados

Este projeto foi desenvolvido no curso *Aprenda Flutter e Desenvolva Apps Para Android e IOS 2020* e aborda conceitos como:
- Widgets Stateless vs Stateful
- Comunicação entre widgets via callbacks
- Modal Bottom Sheet
- Layout responsivo (Adaptive Layout)
- Formulários, validação e controllers
- DatePicker nativo (Material e Cupertino)
- ListView, Card, e gestão de estado com "setState"
<<<<<<< HEAD
=======



>>>>>>> 21d5066bcb390f190009fca79bc185d32e04d884
