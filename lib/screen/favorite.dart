import 'package:flutter/material.dart';

final List<int> _items = List<int>.generate(5, (int index) => index);
TextEditingController txtQuery = new TextEditingController();

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoriteState();
}

class _FavoriteState extends State<FavoritePage> {
  double? scrolledUnderElevation;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    // void search(String query) {
    //   if (query.isEmpty) {
    //     persons = original;
    //     setState(() {});
    //     return;
    //   }

    //   query = query.toLowerCase();
    //   print(query);
    //   List result = [];
    //   persons.forEach((p) {
    //     var name = p["name"].toString().toLowerCase();
    //     if (name.contains(query)) {
    //       result.add(p);
    //     }
    //   });

    //   persons = result;
    //   setState(() {});
    // }

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('AppBar Demo'),
      //   scrolledUnderElevation: scrolledUnderElevation,
      //   shadowColor: shadowColor ? Theme.of(context).colorScheme.shadow : null,
      // ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: txtQuery,
              // onChanged: search,
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 26, 26, 63))),
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    txtQuery.text = '';
                    // search(txtQuery.text);
                    print("search click");
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: _items.length,
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  // if (index == 0) {
                  //   return Center(
                  //     child: Text(
                  //       'Scroll to see the Appbar in effect.',
                  //       style: Theme.of(context).textTheme.labelLarge,
                  //       textAlign: TextAlign.center,
                  //     ),
                  //   );
                  // }
                  return Container(
                    alignment: Alignment.center,
                    // tileColor: _items[index].isOdd ? oddItemColor : evenItemColor,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: _items[index].isOdd ? oddItemColor : evenItemColor,
                    ),
                    child: Text('Item $index'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Padding(
      //     padding: const EdgeInsets.all(8),
      //     child: OverflowBar(
      //       overflowAlignment: OverflowBarAlignment.center,
      //       alignment: MainAxisAlignment.center,
      //       overflowSpacing: 5.0,
      //       children: <Widget>[
      //         ElevatedButton.icon(
      //           onPressed: () {
      //             setState(() {
      //               shadowColor = !shadowColor;
      //             });
      //           },
      //           icon: Icon(
      //             shadowColor ? Icons.visibility_off : Icons.visibility,
      //           ),
      //           label: const Text('shadow color'),
      //         ),
      //         const SizedBox(width: 5),
      //         ElevatedButton.icon(
      //           onPressed: () {
      //             if (scrolledUnderElevation == null) {
      //               setState(() {
      //                 // Default elevation is 3.0, increment by 1.0.
      //                 scrolledUnderElevation = 4.0;
      //               });
      //             } else {
      //               setState(() {
      //                 scrolledUnderElevation = scrolledUnderElevation! + 1.0;
      //               });
      //             }
      //           },
      //           icon: const Icon(Icons.add),
      //           label: Text(
      //             'scrolledUnderElevation: ${scrolledUnderElevation ?? 'default'}',
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
