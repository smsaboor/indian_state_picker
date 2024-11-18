//
// import 'package:flutter/material.dart';
// import 'package:indian_state_picker/indian_state_picker.dart';
//
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Country Pickers Demo',
//       routes: {
//         '/': (context) => const HomePage(),
//       },
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   final helper = StatePickerHelper<IndianState>(
//     states: indianStateList,
//     getCode: (state) => state.code,
//     getName: (state) => state.name,
//     getCapital: (state) => state.capital,
//     getImagePath: (state) => state.image,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('IndianState Pickers Demo'),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(8.0),
//         children: <Widget>[
//           SizedBox(
//             width: MediaQuery.of(context).size.width * 0.9,
//             child: StatePickerDropdown<IndianState>(
//               states: indianStateList,
//               initialValue: indianStateList[3],
//               // priorityList: [
//               //   indianStateList[7],
//               //   indianStateList[11],
//               // ],
//               // isEqual: (item, priorityItem) => item.code == priorityItem.code,
//               //
//               onValuePicked: (state) {
//                 print('Picked: ${state.name}');
//               },
//               itemBuilder: (state) {
//                 return SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.8,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Row(
//                       children: [
//                         helper.getImage(state.image, 50, 50, BoxFit.fill), // State flag
//                         const SizedBox(width: 8.0),
//                         Expanded(
//                           child: Text(
//                             state.name,
//                             style: const TextStyle(
//                                 color: Colors.red, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//               sortComparator: (a, b) =>
//                   a.name.compareTo(b.name), // Sort by name
//             ),
//           ),
//           const SizedBox(height: 40),
//           SizedBox(
//             width: MediaQuery.of(context).size.width * .8,
//             child: StatePickerDropdown<IndianState>(
//               states: indianStateList,
//               topStates: [ helper.findStateByCapital('lucknow'), indianStateList[11]],
//               initialValue: indianStateList[0],
//               isEqual: (IndianState item, IndianState priorityItem) => item.code == priorityItem.code,
//               onValuePicked: (state) => print('Picked: ${state.name}'),
//               // itemFilter: (state) => state.population > 1000000,
//               // itemBuilder: (state) => _buildDropdownItem(state, 300),
//               itemBuilder: (indianState) {
//                 return SizedBox(
//                     width: 300,
//                     child: Padding(
//                         padding: const EdgeInsets.all(8),
//                         child: Row(
//                           children: <Widget>[
//                             helper.getImage(indianState.image, 50, 50, BoxFit.fill),
//                             const SizedBox(
//                               width: 8.0,
//                             ),
//                             Expanded(
//                                 child: Text(
//                                   indianState.name,
//                                   style: const TextStyle(
//                                       color: Colors.red,
//                                       fontWeight: FontWeight.bold),
//                                 )),
//                           ],
//                         )));
//               },
//               sortComparator: (a, b) => a.name.compareTo(b.name),
//             ),
//           ),
//           Card(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 const Text("CountryPickerDialog (has priorityList['TR,'US'])"),
//                 ListTile(
//                   onTap: _openCountryPickerDialog,
//                   title: _buildDialogItem(indianStateList[0]),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _openCountryPickerDialog() => showDialog(
//     context: context,
//     builder: (context) => Theme(
//       data: Theme.of(context).copyWith(primaryColor: Colors.pink),
//       child: StatePickerDialog<IndianState>(
//         // priorityList: [indianStateList[7], indianStateList[11]],
//         states: indianStateList,
//         titlePadding: const EdgeInsets.all(8.0),
//         searchCursorColor: Colors.pinkAccent,
//         searchInputDecoration: const InputDecoration(hintText: 'Search...'),
//         isSearchable: true,
//         title: const Text('Select your phone code'),
//         searchFilter: (item, query) {
//           // Filter logic based on state name
//           return item.name.toLowerCase().contains(query.toLowerCase());
//         },
//         onValuePicked: (IndianState indianState) {
//           // setState(() => _selectedDialogCountry = indianState),
//         },
//         itemBuilder: _buildDialogItem,
//         topStates: [
//           // IndianStatePickerUtils.getStateByCode('UP'),
//           // IndianStatePickerUtils.getStateByCode('MH'),
//         ],
//       ),
//     ),
//   );
//
//   Widget _buildDialogItem(IndianState state) => Row(
//     children: <Widget>[
//       helper.getImage(state.image, 50, 50, BoxFit.fill),
//       // const SizedBox(width: 8.0),
//       // Text("+${indianState.population}"),
//       const SizedBox(width: 8.0),
//       Flexible(child: Text(state.name))
//     ],
//   );
// }
//
//
