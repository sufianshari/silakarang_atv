import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get dropdownItemStatus {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text("Aktif"), value: "Aktif"),
    const DropdownMenuItem(child: Text("Tidak Aktif"), value: "Tidak Aktif"),
  ];
  return menuItems;
}
