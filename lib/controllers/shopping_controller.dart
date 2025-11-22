import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ShoppingController extends GetxController {
  final box = GetStorage();

  RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    List? saved = box.read("items");
    if (saved != null) {
      items.assignAll(List<Map<String, dynamic>>.from(saved));
    }
  }

  void addItem(String name, int qty, String category) {
    items.add({
      "name": name,
      "qty": qty,
      "category": category,
      "bought": false
    });
    saveData();
  }

  void toggleStatus(int index) {
    items[index]["bought"] = !items[index]["bought"];
    items.refresh();
    saveData();
  }

  void deleteItem(int index) {
    items.removeAt(index);
    saveData();
  }

  void saveData() {
    box.write("items", items);
  }

  int get boughtCount => items.where((e) => e["bought"] == true).length;
  int get notBoughtCount => items.where((e) => e["bought"] == false).length;
}
