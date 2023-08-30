

import 'package:flutter/material.dart';

class Quotes {

  String text;
  String author;

  Quotes({
    required this.text,
    required this.author
  });
}

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key,required this.quote});

  final Quotes quote;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quote.text,
              style:
              TextStyle(fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600]
              ),
            ),
            const SizedBox(height: 6.0,),
            Center(
              child: Text(
                quote.author,
                style:
                TextStyle(fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

