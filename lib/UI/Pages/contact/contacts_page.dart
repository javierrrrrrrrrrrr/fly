import 'package:fly_cliente/Business_logic/Provaiders/search_provider.dart';
import 'package:fly_cliente/Constants/contants.dart';
import 'package:fly_cliente/UI/Widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../../DataLayer/Models/user_model.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final seacrhProvider = Provider.of<SearchProvider>(context);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const _AppBarRow(),
            _SearchContactField(contacts: seacrhProvider.foundedContacts),
            SizedBox(
              height: size.height * 0.005,
            ),
            _ContactsList(
              contacts: seacrhProvider.foundedContacts,
            )
          ],
        ),
      ),
    );
  }
}

class _ContactsList extends StatelessWidget {
  const _ContactsList({
    Key? key,
    required this.contacts,
  }) : super(key: key);
  final List<User> contacts;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return _ListViewBody(size: size, user: contacts[index]);
          },
          separatorBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                height: size.height * 0.001,
                color: const Color.fromRGBO(155, 155, 155, 1));
          },
          itemCount: contacts.length),
    );
  }
}

class _ListViewBody extends StatelessWidget {
  const _ListViewBody({
    Key? key,
    required this.size,
    required this.user,
  }) : super(key: key);

  final Size size;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: size.width * 0.1,
          right: size.width * 0.1,
          top: size.height * 0.02,
          bottom: size.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.6,
                  child: Text(
                    '${user.firstName} ${user.lastName}',
                    style: const TextStyle(fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.emoji_people_outlined,
                      color: kprimarycolor,
                    ),
                    Text(
                      user.passengerType,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(
                color: kprimarycolor,
                Icons.edit_note_outlined,
                size: 35,
              ),
              GestureDetector(
                onTap: () {
                  confirmDialog(
                      context: context,
                      messageBody:
                          'Are you sure you want to delete this contact');
                },
                child: const Icon(
                  color: Colors.red,
                  Icons.delete_forever_outlined,
                  size: 35,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SearchContactField extends StatelessWidget {
  const _SearchContactField({
    Key? key,
    required this.contacts,
  }) : super(key: key);
  final List<User> contacts;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final seacrhProvider = Provider.of<SearchProvider>(context);

// poner el metodo aqui

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.07,
      ),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child: TextField(
          onChanged: (value) => seacrhProvider.udateListContacts(value),
          cursorColor: kprimarycolor,
          decoration: InputDecoration(
              hintText: 'Type name or number',
              hintStyle: const TextStyle(fontSize: 15),
              suffixIcon: Icon(Icons.search, color: kprimarycolor, size: 38),
              contentPadding: EdgeInsets.symmetric(
                vertical: size.width * 0.03,
                horizontal: size.width * 0.03,
              ),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
        ),
      ),
    );
  }
}

class _AppBarRow extends StatelessWidget {
  const _AppBarRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.navigate_before, size: 40)),
          const Text(
            'Contacts List',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            child: Icon(
              Icons.group_add_outlined,
              size: 40,
              color: kprimarycolor,
            ),
          )
        ],
      ),
    );
  }
}
