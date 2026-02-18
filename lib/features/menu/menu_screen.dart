import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List menuItems = [];
  bool isLoading = true;
  String selectedCategory = "All";

  final String baseUrl = "http://10.0.2.2:5005";

  @override
  void initState() {
    super.initState();
    fetchMenu();
  }

  Future<void> fetchMenu() async {
    final url = Uri.parse("$baseUrl/api/menu");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          menuItems = jsonDecode(response.body);
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
      }
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = selectedCategory == "All"
        ? menuItems
        : menuItems
              .where((item) => item["category"] == selectedCategory)
              .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Menu")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // 🔹 CATEGORY FILTER
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildCategoryButton("All"),
                      buildCategoryButton("Mains"),
                      buildCategoryButton("Snacks"),
                      buildCategoryButton("Beverages"),
                      buildCategoryButton("Desserts"),
                    ],
                  ),
                ),

                // 🔹 MENU LIST
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];

                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          leading:
                              item["image"] != null &&
                                  item["image"].toString().isNotEmpty
                              ? Image.network(
                                  "$baseUrl${item["image"]}",
                                  width: 70,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(Icons.fastfood, size: 40),

                          title: Text(item["name"]),
                          subtitle: Text(
                            "${item["description"]}\nRs. ${item["price"]}",
                          ),

                          trailing: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("${item["name"]} added"),
                                ),
                              );
                            },
                            child: const Text("Add"),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget buildCategoryButton(String category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ChoiceChip(
        label: Text(category),
        selected: selectedCategory == category,
        onSelected: (_) {
          setState(() {
            selectedCategory = category;
          });
        },
      ),
    );
  }
}
