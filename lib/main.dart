import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import './components/transaction_form.dart';
import 'components/transactions_list.dart';
import '../models/transaction.dart';
import './components/chart.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Expenses(),
      theme: ThemeData(
        useMaterial3: false,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          titleTextStyle:
              ThemeData.light().textTheme.titleLarge?.copyWith(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                  )
                  as TextStyle,
        ),
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
      ),
    ),
  );
}

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  bool _showChart = false;

  final List<Transaction> _transactions = [
    Transaction(id: '0', title: 'Konekta', value: 2000, date: DateTime.now()),
    Transaction(
      id: '1',
      title: 'Conta de luz',
      value: 6000,
      date: DateTime.now(),
    ),
    Transaction(id: '2', title: 'Almoço', value: 3000, date: DateTime.now()),
    Transaction(id: '3', title: 'Lanche', value: 2000, date: DateTime.now()),
    Transaction(
      id: '4',
      title: 'Game',
      value: 3500,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
  ];

  List<Transaction> get _recentTransaction {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  void _removeTransations(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  void _openTransactionFormModal() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  Widget _getIconButton({required IconData icon, required Function() fn}) {
    return Platform.isIOS
        ? GestureDetector(
            onTap: fn,
            child: Icon(icon, color: Colors.white),
          )
        : IconButton(
            onPressed: fn,
            icon: Icon(icon, color: Colors.white),
          );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final iconList = Platform.isIOS ? CupertinoIcons.refresh : Icons.list;
    final iconChart = Platform.isIOS
        ? CupertinoIcons.refresh
        : Icons.show_chart;

    final actions = [
      if (isLandscape)
        _getIconButton(
          icon: _showChart ? iconList : iconChart,

          fn: () {
            setState(() {
              _showChart = !_showChart;
            });
          },
        ),
      _getIconButton(
        fn: _openTransactionFormModal,

        icon: Platform.isIOS ? CupertinoIcons.add : Icons.add,
      ),
    ];

    final PreferredSizeWidget appBar = AppBar(
      title: Text('Despesas Pessoais', style: TextStyle(color: Colors.white)),
      actions: actions,
    );

    final availabelHeight =
        mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    final bodyPage = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            /*  if (isLandscape)
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text('Exibir Gráfico', textAlign: TextAlign.center),
                    Switch.adaptive(
                      activeTrackColor: Theme.of(context).colorScheme.primary,
      
                      value: _showChart,
                      onChanged: (value) {
                        setState(() {
                          _showChart = value;
                        });
                      },
                    ),
                  ],
                ),*/
            if (_showChart || !isLandscape)
              SizedBox(
                height: availabelHeight * (isLandscape ? 0.8 : 0.25),
                child: Chart(_recentTransaction),
              ),
            if (!_showChart || !isLandscape)
              SizedBox(
                height: availabelHeight * (isLandscape ? 1 : 0.25),
                child: TransactionsList(_transactions, _removeTransations),
              ),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(
                'Despesas Pessoais',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Row(mainAxisSize: .min, children: actions),
            ),
            child: bodyPage,
          )
        : Scaffold(
            appBar: appBar,
            body: bodyPage,
            floatingActionButton: Platform.isIOS
                ? Container(color: Colors.black, width: 10, height: 10)
                : FloatingActionButton(
                    onPressed: _openTransactionFormModal,
                    child: Icon(Icons.add, color: Colors.black),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
