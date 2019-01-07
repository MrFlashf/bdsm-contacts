import 'package:contacts_service/contacts_service.dart';
import 'package:simple_permissions/simple_permissions.dart';

class Contacts {

  static Future<bool> getContactsPermission() async {
    bool isPermitted = await checkPermissions();

    if (!isPermitted) {
      await askForPermission();
      return true;
    } else {
      return true;
    }
  }

  static Future<bool> checkPermissions() async {
    Permission permission = Permission.ReadContacts;

    bool lala = await SimplePermissions.checkPermission(permission);

    return lala;
  }


  static Future<void> askForPermission() async {
    SimplePermissions.requestPermission(Permission.ReadContacts);
  }

  static Future<Iterable<Contact>> getContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();

    print(contacts);

    return contacts;
  }
}