import 'package:flutter/material.dart';

class ClientPage extends StatefulWidget {
  final List books;
  const ClientPage({required this.books, super.key});

  @override
  ClientPageState createState() {
    return ClientPageState();
  }
}

class ClientPageState extends State<ClientPage> {
  List books = [];
  @override
  void initState() {
    books = widget.books;
    super.initState();
  }

  void removeBook(book) {
    setState(() {
      List newBooks = [];
      for (int i = 0; i < books.length; i++) {
        if (books[i]['id'] == book['id']) {
          continue;
        }
        newBooks.add(books[i]);
      }
      books = newBooks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: books.isEmpty
              ? [const Text('Nada por aqui ainda')]
              : books
                  .map((book) => Column(children: [
                        Text("Nome do cliente: ${book['client']}"),
                        Text("Número do quarto: ${book['number']}"),
                        const SizedBox(height: 10),
                        FilledButton(
                          onPressed: () {
                            removeBook(book);
                          },
                          child: const Text('Excluir'),
                        ),
                        const SizedBox(height: 20),
                      ]))
                  .toList(),
        ),
      ),
    );
  }
}
