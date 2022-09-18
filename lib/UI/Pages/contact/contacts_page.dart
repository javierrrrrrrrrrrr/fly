import 'package:fly_cliente/Constants/contants.dart';
import 'package:fly_cliente/UI/Widgets/widgets.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const _AppBarRow(),
            const _SearchContactField(),
            SizedBox(
              height: size.height * 0.005,
            ),
            const _ContactsList()
          ],
        ),
      ),
    );
  }
}

class _ContactsList extends StatelessWidget {
  const _ContactsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.1,
                  top: size.height * 0.02,
                  bottom: size.height * 0.02),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        //TODO: Hacer el overflow de los textos.
                        'Javier Dias Serrano',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'phone number',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.13,
                  ),
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
            );
          },
          separatorBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                height: size.height * 0.001,
                color: const Color.fromRGBO(155, 155, 155, 1));
          },
          itemCount: 18),
    );
  }
}

class _SearchContactField extends StatelessWidget {
  const _SearchContactField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.07,
      ),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child: TextField(
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
