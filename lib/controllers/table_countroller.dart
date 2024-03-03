import 'package:collage_bus_nufa/controllers/models/user.dart';
import 'package:collage_bus_nufa/controllers/usercontrol.dart';
import 'package:get/get.dart';

class TableController extends GetxController {
  UserController _userContoller = Get.put(UserController());
  Set setColumData = {};
  List listColumnData = [];
  List listRowData = [];
  bool loadData = false;

  @override
  void onInit() {
    super.onInit();

    addColumnData();
    convertTOList();
    loadData = true;
    print(listColumnData);
  }

  addColumnData() {
    _userContoller.users.forEach((user) {
      user.journeys!.forEach((journey) {
        setColumData.add(journey.date);
      });
    });
  }

  convertTOList() {
    setColumData.forEach((element) {
      listColumnData.add(element);
    });
  }

  List<Journey> addRowsData(user) {
    List<Journey> journeyUser = [];
    user.journeys!.forEach((journey) {
      journeyUser.add(journey);
    });

    for (int i = 0; i < listColumnData.length; i++) {
      print(listColumnData[i]);

      bool present = false;
      journeyUser.forEach((element) {
        if (element.date == listColumnData[i]) {
          print(element.date);
         
          present = true;
        }
      });
      if (present == false) {
        journeyUser
            .add(Journey(date: listColumnData[i], entry: false, exit: false));
      }
    }

    return journeyUser;
  }
}
