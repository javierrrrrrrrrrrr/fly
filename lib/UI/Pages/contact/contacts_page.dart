import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:fly_cliente/Business_logic/Provaiders/flip_provider.dart';
import '../../../Business_logic/Provaiders/login_provider.dart';
import '../../../Constants/contants.dart';
import '../../Widgets/CustomWidget/custom_navbar.dart';
import '../../Widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../../Business_logic/Provaiders/contact_provider.dart';
import '../../../DataLayer/Models/contact_model.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final seacrhProvider = Provider.of<SearchProvider>(context);
    final contactprovider = Provider.of<ContactProvider>(context);
    final flipProvider = Provider.of<FlipProvider>(context);
    // final loginProvider = Provider.of<LoginProvider>(context);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const _AppBarRow(),
            _SearchContactField(contacts: contactprovider.foundedContacts),
            SizedBox(
              height: size.height * 0.005,
            ),
            contactprovider.foundedContacts.isEmpty
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.27),
                    child: GestureDetector(
                      onTap: () async {
                        loadingSpinner(context);
                        flipProvider.flip = 0;
                        bool respuesta = await contactprovider.getCountryName();
                        if (respuesta == true) {
                          Navigator.pop(context);
                          Navigator.of(context)
                              .pushReplacementNamed('/create_contat_page');
                        }
                      },
                      child: Column(
                        children: [
                          Icon(
                            //addd contacto
                            Icons.group_add_outlined,
                            size: 100,
                            color: kprimarycolor,
                          ),
                          Center(
                              child: Text("Adicionar Contactos",
                                  style: TextStyle(
                                      color: kprimarycolor, fontSize: 25))),
                        ],
                      ),
                    ),
                  )
                : _ContactsList(
                    contacts: contactprovider.foundedContacts,
                  ),
            CustomNavbar(index: 2),
            SizedBox(
              height: size.height * 0.02,
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
  final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final contactProvider = Provider.of<ContactProvider>(context);
    final loginProvider = Provider.of<LoginProvider>(context);
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () =>
            contactProvider.getsContacts(loginProvider.loggedUser!.jwt),
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return _ListViewBody(size: size, contact: contacts[index]);
            },
            separatorBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  height: size.height * 0.001,
                  color: const Color.fromRGBO(155, 155, 155, 1));
            },
            itemCount: contacts.length),
      ),
    );
  }
}

class _ListViewBody extends StatelessWidget {
  const _ListViewBody({
    Key? key,
    required this.size,
    required this.contact,
  }) : super(key: key);

  final Size size;
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    final loginprovider = Provider.of<LoginProvider>(context);
    final userprovider = Provider.of<ContactProvider>(context);

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
                    '${contact.firstName} ${contact.lastName}',
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
                      contact.passengerType,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  userprovider.selectedContact = contact.copyWith();
                  //print(userprovider.selectedContact);

                  Navigator.of(context).pushNamed('/contacts_show_info');
                },
                child: Icon(
                  color: kprimarycolor,
                  Icons.edit_note_outlined,
                  size: 35,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  confirmDialog(
                      messageBody: "Esta seguro que desea eliminar el contacto",
                      context: context,
                      function: () async {
                        loadingSpinner(context);
                        userprovider.selectedContact = contact;
                        bool respuesta = await userprovider.deleteContact(
                            loginprovider.loggedUser!.jwt, context);
                        if (respuesta == true) {
                          Navigator.pop(context);
                        } else {
                          var snackBar = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'Error!',
                              message: userprovider.error,
                              contentType: ContentType.failure,
                            ),
                          );

                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      });

                  // confirmDialog(

                  //     context: context,
                  //     messageBody:
                  //         'Are you sure you want to delete this contact');
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
  final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userprovider = Provider.of<ContactProvider>(context);
    // final seacrhProvider = Provider.of<SearchProvider>(context);

// poner el metodo aqui

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.07,
      ),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child: TextField(
          onChanged: (value) =>
              userprovider.udateListContacts(value.toLowerCase()),
          cursorColor: kprimarycolor,
          decoration: InputDecoration(
              hintText: 'Escribe nombre o número',
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
    final contactProvider = Provider.of<ContactProvider>(context);
    final flipProvider = Provider.of<FlipProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () => Navigator.of(context).pushNamed('/airlines'),
              child: const Icon(Icons.navigate_before, size: 40)),
          const Text(
            'Lista de Contactos',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () async {
              loadingSpinner(context);
              flipProvider.flip = 0;
              bool respuesta = await contactProvider.getCountryName();
              if (respuesta == true) {
                Navigator.pop(context);
                Navigator.of(context)
                    .pushReplacementNamed('/create_contat_page');
              }
            },
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
