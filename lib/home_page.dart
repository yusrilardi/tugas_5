import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/shopping_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(ShoppingController());

  final nameC = TextEditingController();
  final qtyC = TextEditingController();

  final categories = ["Makanan", "Minuman", "Elektronik", "Lainnya"];
  final selectedCategory = "Makanan".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping List App"),
        actions: [
          Obx(() => Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                    child: Text(
                        "Sudah: ${controller.boughtCount} | Belum: ${controller.notBoughtCount}")),
              ))
        ],
      ),
      body: Column(
        children: [
          // INPUT
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextField(
                  controller: nameC,
                  decoration: const InputDecoration(
                    labelText: "Nama Item",
                  ),
                ),
                TextField(
                  controller: qtyC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Jumlah",
                  ),
                ),
                const SizedBox(height: 10),
                Obx(() => DropdownButton<String>(
                      value: selectedCategory.value,
                      items: categories
                          .map((e) =>
                              DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (v) {
                        selectedCategory.value = v!;
                      },
                    )),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    controller.addItem(
                      nameC.text,
                      int.tryParse(qtyC.text) ?? 1,
                      selectedCategory.value,
                    );

                    nameC.clear();
                    qtyC.clear();
                  },
                  child: const Text("Tambah"),
                )
              ],
            ),
          ),

          // LIST
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) {
                    final item = controller.items[index];
                    return ListTile(
                      leading: Checkbox(
                        value: item["bought"],
                        onChanged: (_) => controller.toggleStatus(index),
                      ),
                      title: Text("${item['name']} (${item['qty']})"),
                      subtitle: Text(item["category"]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => controller.deleteItem(index),
                      ),
                    );
                  },
                )),
          )
        ],
      ),
    );
  }
}
