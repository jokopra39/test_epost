import 'package:flutter/material.dart';

final popupButtonKey = GlobalKey<State>();

enum SampleItem { itemOne, itemTwo, itemThree }

final List<PopupMenuEntry<SampleItem>> menuEntries = [
  const PopupMenuItem(
    value: SampleItem.itemOne,
    child: Text('Item 1'),
  ),
  const PopupMenuItem(
    value: SampleItem.itemTwo,
    child: Text('Two'),
  ),
  const PopupMenuItem(
    value: SampleItem.itemThree,
    child: Text('3 b'),
  ),
];

enum MainMenu { settings, masterData, goodReceipt }

final List<PopupMenuEntry<MainMenu>> mainMenu = [
  const PopupMenuItem(
    value: MainMenu.settings,
    child: Text('Settings'),
  ),
  const PopupMenuItem(
    value: MainMenu.masterData,
    child: Text('Master Data'),
  ),
  const PopupMenuItem(
    value: MainMenu.goodReceipt,
    child: Text('Good Receipt'),
  ),
];

enum MasterData { manageCategory, manageProduct, manageCustomer }

final List<PopupMenuEntry<MasterData>> masterData = [
  const PopupMenuItem(
    value: MasterData.manageCategory,
    child: Text('Manage Category'),
  ),
  const PopupMenuItem(
    value: MasterData.manageProduct,
    child: Text('Manage Product'),
  ),
  const PopupMenuItem(
    value: MasterData.manageCustomer,
    child: Text('Manage Customer'),
  ),
];
