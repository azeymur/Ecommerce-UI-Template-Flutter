import 'package:ecommerce_template/widget/picker_item.dart';
import 'package:flutter/material.dart';

class HorizontalListMultiPicker extends StatefulWidget {
  final List<PickerItem> items;
  final void Function(String value) addedCallback;
  final void Function(String value) removedCallback;

  const HorizontalListMultiPicker(
      {required this.items,
      required this.addedCallback,
      required this.removedCallback,
      Key? key})
      : super(key: key);

  @override
  State<HorizontalListMultiPicker> createState() =>
      _HorizontalListMultiPickerState();
}

class _HorizontalListMultiPickerState extends State<HorizontalListMultiPicker> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final bodyMedium = themeData.textTheme.bodyMedium;
    final onPrimaryBodyMedium =
        bodyMedium?.copyWith(color: themeData.colorScheme.onPrimary);

    return SizedBox(
      height: 56.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];

          return GestureDetector(
            onTap: () {
              if (item.selected) {
                widget.removedCallback(item.value);
              } else {
                widget.addedCallback(item.value);
              }

              setState(() {
                item.selected = !item.selected;
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
                child: Text(item.name,
                    style: item.selected ? onPrimaryBodyMedium : bodyMedium),
              ),
            ),
          );
        },
      ),
    );
  }
}
