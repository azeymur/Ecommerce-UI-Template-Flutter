// Represents list item for HorizontalListMultiPicker, HorizontalListSinglePicker
class PickerItem {
  final String name;
  final String value;
  bool selected;
  bool isAvailable;

  PickerItem(this.name, this.value, this.selected, {this.isAvailable = true});
}
