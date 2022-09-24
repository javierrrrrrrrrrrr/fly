import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:fly_cliente/Business_logic/Provaiders/login_provider.dart';
import 'package:provider/provider.dart';

class DropDownListExample extends StatefulWidget {
  const DropDownListExample({
    Key? key,
  }) : super(key: key);

  @override
  _DropDownListExampleState createState() => _DropDownListExampleState();
}

class _DropDownListExampleState extends State<DropDownListExample> {
  @override
  void initState() {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    for (int i = 0; i < loginProvider.contactList.length; i++) {
      _contactList.add(SelectedListItem(
          isSelected: false,
          name: loginProvider.contactList[i].firstName,
          value: loginProvider.contactList[i].id.toString()));
    }
    // TODO: implement initState

    super.initState();
  }

  /// This is list of city which will pass to the drop down.
  final List<SelectedListItem> _contactList = [];

  /// This is register text field controllers.

  final TextEditingController _cityTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _cityTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.15,
      width: size.width * 0.8,
      child: _mainBody(),
    );
  }

  /// This is Main Body widget.
  Widget _mainBody() {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30.0,
        ),
        AppTextField(
          textEditingController: _cityTextEditingController,
          hint: loginProvider.selectedcontactIDList.isNotEmpty
              ? loginProvider
                  .findNameByid(loginProvider.selectedcontactIDList[0])
              : 'Choose Your contact',
          isCitySelected: true,
          cities: _contactList,
        ),
      ],
    );
  }
}

/// This is Common App textfiled class.
class AppTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String? title;
  final String hint;
  final bool isCitySelected;
  final List<SelectedListItem>? cities;

  const AppTextField({
    required this.textEditingController,
    this.title,
    required this.hint,
    required this.isCitySelected,
    this.cities,
    Key? key,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final TextEditingController _searchTextEditingController =
      TextEditingController();

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          'Contacts',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.cities ?? [],
        selectedItems: (List<dynamic> selectedList) {
          loginProvider.selectedcontactIDList.clear();
          //    List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              loginProvider.addselectedcontactlist(item.value);
              print(loginProvider.selectedcontactIDList.length);
              // loginProvider.selectedcontactNamesList.add(item.name);

            } else {
              loginProvider.deleteselectedcontactlist(item.value);
            }
          }
          // showSnackBar(list.toString());
        },
        enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title ?? ""),
        const SizedBox(
          height: 5.0,
        ),
        TextFormField(
          controller: widget.textEditingController,
          cursorColor: Colors.black,
          onTap: widget.isCitySelected
              ? () {
                  FocusScope.of(context).unfocus();
                  onTextFieldTap();
                }
              : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black12,
            contentPadding:
                const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
            hintText: widget.hint,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}

/// This is common class for 'REGISTER' elevated button.
