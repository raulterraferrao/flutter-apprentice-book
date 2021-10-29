import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/models.dart';

class GroceryTile extends StatelessWidget {
  final GroceryItem item;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;

  GroceryTile({
    Key? key,
    required this.item,
    this.onComplete,
  })  : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO change this widget
    return Container(height: 100.0, color: Colors.red);
  }
  //TODO add buildimportance
  //TODO add builddate()
}
