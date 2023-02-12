import 'package:ecommerce_template/widget/picker_item.dart';
import 'package:flutter/material.dart';

class HorizontalListSinglePicker extends StatefulWidget {
  final List<PickerItem> items;
  final void Function(String value) itemTappedCallback;

  const HorizontalListSinglePicker(
      {required this.items, required this.itemTappedCallback, Key? key})
      : super(key: key);

  @override
  State<HorizontalListSinglePicker> createState() =>
      _HorizontalListSinglePickerState();
}

class _HorizontalListSinglePickerState
    extends State<HorizontalListSinglePicker> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final bodyMedium = themeData.textTheme.bodyMedium;

    return SizedBox(
      height: 56.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];

          TextStyle? textStyle = bodyMedium;

          if (!item.isAvailable) {
            textStyle =
                textStyle?.copyWith(decoration: TextDecoration.lineThrough);
          } else if (item.selected) {
            textStyle =
                textStyle?.copyWith(color: themeData.colorScheme.onPrimary);
          }

          return GestureDetector(
            onTap: () {
              if (!item.isAvailable) return;

              widget.itemTappedCallback(item.value);

              setState(() {
                for (var i in widget.items) {
                  i.selected = false;
                }
                item.selected = true;
              });
            },
            child: Container(
              constraints: const BoxConstraints(minWidth: 50.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
                color: item.selected
                    ? themeData.colorScheme.primary
                    : themeData.cardColor,
              ),
              margin: const EdgeInsets.only(top: 8.0, right: 16.0, bottom: 8.0),
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(item.name, style: textStyle),
              ),
            ),
          );
        },
      ),
    );
  }
}
