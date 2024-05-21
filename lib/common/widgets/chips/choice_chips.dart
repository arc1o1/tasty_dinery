import 'package:flutter/material.dart';

class CcChoiceChip extends StatelessWidget {
  const CcChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data:
          Theme.of(context).copyWith(canvasColor: Colors.grey.withOpacity(0.2)),
      child: ChoiceChip(
        label: Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? Colors.white : null),
        selectedColor: Colors.green,
      ),
    );
  }
}
