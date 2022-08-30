import '../../Constants/contants.dart';
import 'widgets.dart';

class AppBarRow extends StatelessWidget {
  const AppBarRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const CustomCircleAvatar(
            avatarRadius: 25,
          ),
          const Spacer(),
          Icon(
            Icons.mark_email_unread_outlined,
            color: kprimarycolor,
            size: 30,
          ),
          SizedBox(width: size.width * 0.02),
          Icon(
            Icons.notifications_active_outlined,
            color: kprimarycolor,
            size: 30,
          )
        ],
      ),
    );
  }
}
