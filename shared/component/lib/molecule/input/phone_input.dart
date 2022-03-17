// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:l10n/generated/l10n.dart';
// import 'package:preferences/preferences.dart';
// import 'package:settings/settings.dart';

// import '../../component.dart';

// class PhoneInput extends StatefulWidget {
//   final TextStyle style;
//   final ValueChanged<String> onChange;
//   final FocusNode focusNode;
//   final TextInputAction inputAction;
//   final ValueChanged<String> onSubmit;
//   final bool readOnly;
//   final String hintText;
//   final String errorText;
//   final Widget suffix;
//   final String label;
//   final String initialValue;
//   final bool isRequired;

//   const PhoneInput({
//     Key key,
//     this.style,
//     this.onChange,
//     this.focusNode,
//     this.inputAction,
//     this.onSubmit,
//     this.readOnly,
//     this.hintText,
//     this.errorText,
//     this.suffix,
//     this.label,
//     this.initialValue,
//     this.isRequired,
//   }) : super(key: key);

//   @override
//   _PhoneInputState createState() => _PhoneInputState();
// }

// class _PhoneInputState extends State<PhoneInput> {
//   Country _currentCountry = CountryData.supportedCountry.first;
//   final TextEditingController _phoneController = TextEditingController();

//   @override
//   void initState() {
//     _initializeFormatPhone();
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(covariant PhoneInput oldWidget) {
//     if (oldWidget.initialValue != widget.initialValue) {
//       if (widget.initialValue.isEmpty) {
//         _phoneController.text = '';
//       }
//       _initializeFormatPhone();
//     }
//     super.didUpdateWidget(oldWidget);
//   }

//   void _initializeFormatPhone() {
//     var _isFoundCountry = false;
//     if (widget.initialValue != null && widget.initialValue.isNotEmpty) {
//       for (var item in CountryData.supportedCountry) {
//         var _currentCountryCode = item.dialCode;
//         var _initialValue =
//             '+${(widget.initialValue ?? '').replaceAll('+', '')}';
//         if (_initialValue.contains(_currentCountryCode)) {
//           var _phoneValue = _initialValue.replaceFirst(item.dialCode, '');
//           if (mounted) _phoneController.text
// = _phoneValue.replaceAll('+', '');
//           _currentCountry = item;
//           if (((_currentCountry?.dialCode ?? '') +
//                   (_phoneController.text ?? '')) !=
//               widget.initialValue) {
//             _onChange();
//             _isFoundCountry = true;
//           }
//           break;
//         }
//       }
//       if (!_isFoundCountry) {
//         _phoneController.text = int.tryParse(widget.initialValue).toString();
//         _onChange();
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RegularInput(
//       label: widget.label,
//       isRequired: widget.isRequired,
//       style: widget.style,
//       onChange: (_) => _onChange(),
//       prefix: _buildPrefix(),
//       focusNode: widget.focusNode,
//       inputAction: widget.inputAction ?? TextInputAction.done,
//       inputType: TextInputType.phone,
//       onSubmit: widget.onSubmit,
//       inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//       readOnly: widget.readOnly ?? false,
//       controller: _phoneController,
//       hintText: widget.hintText,
//       suffix: widget.suffix,
//       errorText: widget.errorText,
//     );
//   }

//   Widget _buildPrefix() {
//     return Container(
//       height: Dimens.dp28,
//       padding: EdgeInsets.only(left: Dimens.dp16),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           InkWell(
//               onTap: (widget?.readOnly ?? false) ? null : _showBottomSheet,
//               child: _buildItemCountry(_currentCountry)),
//           (widget.readOnly ?? false) ? SizedBox() : Icon(Icons.expand_more),
//           SizedBox(
//             height: Dimens.dp24,
//             child: VerticalDivider(
//               thickness: 1.5,
//               width: Dimens.dp12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildItemCountry(Country phone) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Image.asset(
//           phone?.flag,
//           width: Dimens.dp20,
//         ),
//         SizedBox(width: Dimens.dp8),
//         Text(
//           phone?.dialCode ?? '',
//           style: TextStyle(fontSize: Dimens.dp14),
//         ),
//       ],
//     );
//   }

//   void _onChange() {
//     if (widget.onChange != null) {
//       var _tempChange = int.tryParse(_phoneController.text);
//       widget.onChange((_currentCountry?.dialCode ?? '')
// .replaceFirst('+', '') +
//           (_tempChange ?? '').toString());
//     }
//   }

//   void _showBottomSheet() {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.white,
//       isScrollControlled: true,
//       builder: (context) {
//         return ContentSheet(
//           content: _CountryList(
//             onChange: (value) {
//               setState(() {
//                 _currentCountry = value;
//               });
//               _onChange();
//             },
//           ),
//           height: MediaQuery.of(context).size.height * 0.95,
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _phoneController.dispose();
//     super.dispose();
//   }
// }

// class _CountryList extends StatefulWidget {
//   final ValueChanged<Country> onChange;

//   const _CountryList({Key key, this.onChange}) : super(key: key);

//   @override
//   __CountryListState createState() => __CountryListState();
// }

// class __CountryListState extends State<_CountryList> {
//   final TextEditingController _controller = TextEditingController();
//   final List<Country> _searchData = [];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: Dimens.dp16),
//           child: SearchTextInput(
//             controller: _controller,
//             hint: S.current.hint_search_phone_country,
//             onChanged: (value) => _onSearch(),
//           ),
//         ),
//         SizedBox(height: Dimens.dp16),
//         (_controller.text.isEmpty)
//             ? _buildListCountry(CountryData.supportedCountry)
//             : _buildListCountry(_searchData),
//       ],
//     );
//   }

//   Widget _buildListCountry(List<Country> data) {
//     return Expanded(
//         child: ListView.separated(
//             itemBuilder: (_, i) {
//               return ListTile(
//                 onTap: () {
//                   if (widget.onChange != null) {
//                     widget.onChange(data[i]);
//                     Navigator.of(context).pop();
//                   }
//                 },
//                 leading: Image.asset(
//                   data[i].flag,
//                   width: Dimens.dp24,
//                   height: Dimens.dp24,
//                 ),
//                 title: Text(data[i].name),
//                 trailing: Text(data[i].dialCode),
//               );
//             },
//             separatorBuilder: (_, __) {
//               return Divider(height: 1);
//             },
//             itemCount: data.length));
//   }

//   void _onSearch() {
//     _searchData.clear();
//     for (var item in CountryData.supportedCountry) {
//       if (item.name.toLowerCase()
// .contains(_controller.text?.toLowerCase()) ||
//           item.dialCode.contains(_controller.text)) {
//         _searchData.add(item);
//       }
//     }
//     setState(() {});
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
