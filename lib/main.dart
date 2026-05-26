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

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Despesas Pessoais', style: TextStyle(color: Colors.white)),
      actions: [
        IconButton(
          onPressed: _openTransactionFormModal,
          icon: Icon(Icons.add, color: Colors.white),
        ),
      ],
    );
    final availabelHeight =
        MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            SizedBox(
              height: availabelHeight * 0.25,
              child: Chart(_recentTransaction),
            ),
            SizedBox(
              height: availabelHeight * 0.75,
              child: TransactionsList(_transactions, _removeTransations),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openTransactionFormModal,
        child: Icon(Icons.add, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
