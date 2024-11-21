import 'package:example/custom_state_picker.dart';
import 'package:example/state_dialog.dart';
import 'package:example/state_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:indian_state_picker/indian_state_picker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Pickers Demo',
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  StatePickerUtils<IndianState> statePickerUtils =
      StatePickerUtils<IndianState>(
    states: indianStateList,
    getCode: (state) => state.code,
    getName: (state) => state.name,
    getCapital: (state) => state.capital,
    getImagePath: (state) => state.image,
  );

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Indian State Pickers Demo'),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Dropdown'),
              Tab(text: 'Dialog'),
              Tab(text: 'Custom'),
            ],
          ),
        ),
        body: TabBarView(controller: _tabController, children: [
          StateDropDown(statePickerUtils: statePickerUtils),
          StateDialog(statePickerUtils: statePickerUtils),
          const CustomStatePicker()
        ]));
  }
}
