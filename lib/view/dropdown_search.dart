import 'package:example_flutter_app/services/my_service.dart';
import 'package:flutter/material.dart';
import 'package:example_flutter_app/setup_locator.dart';

class DropdownSearch extends StatefulWidget {
  const DropdownSearch({super.key});

  @override
  State<DropdownSearch> createState() => _DropdownSearchState();
}

class _DropdownSearchState extends State<DropdownSearch> {
  final myService = getIt<MyService>();

  late List<String> items;
  late List<String> filteredItems;
  // bool _isLoading = false;
  bool _dataFetched = false;

  Future<void> fetchFruitsData() async {
    if (_dataFetched)
      return; // Only fetch data if it hasn't been fetched before

    // setState(() {
    //   _isLoading = true;
    // });
    await Future.delayed(const Duration(seconds: 1));

    try {
      final responseData = await myService.fetchFruitData();
      print(responseData);
      setState(() {
        items = responseData;
        filteredItems = List.from(items);
        _dataFetched = true;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching fruits: ${e.toString()}')),
      );
    }
    // finally {
    //   setState(() {
    //     _isLoading = false;
    //   });
    // }
  }

  // [
  //   "Apple",
  //   "Banana",
  //   "Cherry",
  //   "Date",
  //   "Elderberry",
  //   "Fig",
  //   "Grapes"
  // ];
  String selectedItem = "Select Favorite Fruit";
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    items = []; // Initialize items as an empty list
    filteredItems = []; // Call fetchFruitsData in initState
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown Search"),
      ),
      body: Center(
        child: Container(
          width: size.width * .8,
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            // color: Colors.grey[500],
            border: Border.all(color: Colors.black54.withOpacity(.6)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            onTap: () {
              showSelectDialog(selectedItem);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_outline,
                  color: Colors.black54.withOpacity(.6),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    selectedItem,
                    style: TextStyle(
                      color: Colors.black54.withOpacity(.6),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black54.withOpacity(.6),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSelectDialog(String currentSelectedItem) {
    String tempSelectedItem = currentSelectedItem;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            if (!_dataFetched) {
              fetchFruitsData().then((_) {
                setModalState(() {});
              });
            }

            Size size = MediaQuery.of(context).size;

            return Container(
              height: size.height * 0.9,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: size.width * 0.8,
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54.withOpacity(.6)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.search),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Search Fruit",
                            ),
                            onChanged: (value) {
                              setModalState(() {
                                filteredItems = items
                                    .where((i) => i
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                    .toList();
                              });
                            },
                          ),
                        ),
                        if (searchController.text.isNotEmpty)
                          IconButton(
                            onPressed: () {
                              setState(() {
                                searchController.clear();
                                filteredItems = items;
                              });
                              setModalState(() {});
                            },
                            icon: const Icon(Icons.cancel),
                          )
                      ],
                    ),
                  ),
                  Expanded(
                    child: !_dataFetched
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: filteredItems.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: tempSelectedItem ==
                                              filteredItems[index]
                                          ? Colors.black54.withOpacity(.6)
                                          : Colors.transparent,
                                      border: Border.all(
                                        color: tempSelectedItem ==
                                                filteredItems[index]
                                            ? Colors.black54.withOpacity(.6)
                                            : Colors.transparent,
                                      )),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Text(
                                    filteredItems[index],
                                    style: TextStyle(
                                      color: tempSelectedItem ==
                                              filteredItems[index]
                                          ? Colors.white
                                          : Colors.black54.withOpacity(.6),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setModalState(() {
                                    tempSelectedItem = filteredItems[index];
                                  });
                                },
                              );
                            },
                          ),
                  ),
                  const SizedBox(height: 20),
                  Positioned(
                    bottom: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.red[400],
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          flex: 2,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.green[400],
                            ),
                            onPressed: () {
                              setState(() {
                                selectedItem = tempSelectedItem;
                              });
                              Navigator.pop(context);
                            },
                            child: const Text("Select",
                                style: TextStyle(color: Colors.white)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
