import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

typedef DropdownChangeHandler<T> = void Function(T? value, int index);

class DropDownWidegtProdcutdetails extends StatelessWidget {
  final List<String> countries;
  final String hintText;
  // final String labelText;
  final DropdownChangeHandler<String> onChanged;
  final PopupProps<String>? popupProps;
  final String? Function(String?)? validator;
  const DropDownWidegtProdcutdetails({
    Key? key,
    this.popupProps,
    required this.countries,
    required this.hintText,
    // required this.labelText,
    this.validator,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      validator: validator,
      items: countries,
      onChanged: (value) {
        final index = countries.indexOf(value!);
        onChanged(value, index);
      },
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Theme.of(context).brightness == Brightness.dark
                ? const Color.fromARGB(1, 255, 255, 255)
                : const Color.fromARGB(25, 0, 0, 0),
            prefixIcon: Icon(Icons.calendar_month),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                // borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
