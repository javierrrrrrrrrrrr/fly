import 'package:fly_cliente/UI/Widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalInfoProvider extends ChangeNotifier {
  String? fistName;
  String? lastName;
  String? passengerType;
  String? birthDate;
  String? gender;
  String? email;
  String? phone;
  String? address;
  String? city;
  String? state;
  String? zip;
  String? country;
  String? nationality;
  String? ofacCode;
  String? motherMaiden;
  String? foreingAddress;
  String? foreingCity;
  String? foreingProvince;
  String? foreingZip;
  String? emergencyNumber;
  String? emergencyphone;
  String? cubanFirstName;
  String? cubanLastName;
  String? arrivalDoc;
  String? countryIssue;
  String? primaryArrivalDocNo;
  String? primaryExpDate;
  String? passport;
  String? countryOfIssue;
  String? secundaryArrivalDocNo;
  String? secundaryExpDate;

  Future<void> storeInfoInSharedPref() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('firsname', fistName ?? '');
    await prefs.setString('lastName', lastName ?? '');
    await prefs.setString('passengerType', passengerType ?? '');
    await prefs.setString('birthDate', birthDate ?? '');
    await prefs.setString('gender', gender ?? '');
    await prefs.setString('email', email ?? '');
    await prefs.setString('phone', phone ?? '');
    await prefs.setString('address', address ?? '');
    await prefs.setString('city', city ?? '');
    await prefs.setString('state', state ?? '');
    await prefs.setString('zip', zip ?? '');
    await prefs.setString('country', country ?? '');
    await prefs.setString('nationality', nationality ?? '');
    await prefs.setString('ofacCode', ofacCode ?? '');
    await prefs.setString('motherMaiden', motherMaiden ?? '');
    await prefs.setString('foreingAddress', foreingAddress ?? '');
    await prefs.setString('foreingCity', foreingCity ?? '');
    await prefs.setString('foreingProvince', foreingProvince ?? '');
    await prefs.setString('foreingZip', foreingZip ?? '');
    await prefs.setString('emergencyNumber', emergencyNumber ?? '');
    await prefs.setString('emergencyphone', emergencyphone ?? '');
    await prefs.setString('cubanFirstName', cubanFirstName ?? '');
    await prefs.setString('cubanLastName', cubanLastName ?? '');
    await prefs.setString('arrivalDoc', arrivalDoc ?? '');
    await prefs.setString('primaryArrivalDocNo', primaryArrivalDocNo ?? '');
    await prefs.setString('primaryExpDate', primaryExpDate ?? '');
    await prefs.setString('passport', passport ?? '');
    await prefs.setString('countryOfIssue', countryOfIssue ?? '');
    await prefs.setString('secundaryArrivalDocNo', secundaryArrivalDocNo ?? '');
    await prefs.setString('secundaryExpDate', secundaryExpDate ?? '');
  }
}
