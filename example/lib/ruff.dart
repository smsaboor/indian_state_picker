//
//
// Widget _buildDropdownItem(IndianState indianState, double dropdownItemWidth) =>
//     SizedBox(
//       width: dropdownItemWidth,
//       child: Row(
//         children: <Widget>[
//           IndianStatePickerUtils.getStateImage(indianState, 50, 50),
//           const SizedBox(
//             width: 8.0,
//           ),
//           Expanded(child: Text("+${indianState.population}(${indianState.code})")),
//         ],
//       ),
//     );
//
// Widget _buildDropdownItemWithLongText(
//     IndianState indianState, double dropdownItemWidth) =>
//     SizedBox(
//       width: dropdownItemWidth,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: <Widget>[
//             IndianStatePickerUtils.getStateImage(indianState, 50,50),
//             const SizedBox(
//               width: 8.0,
//             ),
//             Expanded(child: Text(indianState.name)),
//           ],
//         ),
//       ),
//     );
//
// Widget _buildDropdownSelectedItemBuilder(
//     IndianState indianState, double dropdownItemWidth) =>
//     SizedBox(
//         width: dropdownItemWidth,
//         child: Padding(
//             padding: const EdgeInsets.all(8),
//             child: Row(
//               children: <Widget>[
//                 IndianStatePickerUtils.getStateImage(indianState,50,50),
//                 const SizedBox(
//                   width: 8.0,
//                 ),
//                 Expanded(
//                     child: Text(
//                       indianState.name,
//                       style: const TextStyle(
//                           color: Colors.red, fontWeight: FontWeight.bold),
//                     )),
//               ],
//             )));


// IndianState _selectedCupertinoCountry =
// IndianStatePickerUtils.getStateByCode('UP');
//
// IndianState _selectedFilteredCupertinoCountry =
// IndianStatePickerUtils.getStateByCode('MH');
