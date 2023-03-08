import 'package:demo_app/theme/theme_provider.dart';
import 'package:demo_app/constant/constants.dart';
import 'package:demo_app/Provider/dio_state/ecommerce_items_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_widgets/custom_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final myData = Provider.of<EcommerceItemsProvider>(context,
        listen: false); // get api data from provider
    final themeProvider = Provider.of<ThemeChangerBool>(context, listen: false)
        .iconBool; // get bool data form provider

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.shopping_bag,
              color: themeProvider ? Colors.white : Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<EcommerceItemsProvider>(
                builder: (context, datalists, child) => CustomeText(
                  text: "Your total price is: ${datalists.totalprice}",
                  size: 20,
                ),
              ),
            )
          ],
        ),
        appBar: AppBar(
          title: const CustomeText(text: "My cart"),
        ),
        body: myData.count == 0
            ? const Center(
                child: CustomeText(
                  text: "Nothing is added to cart",
                ),
              )
            : Consumer<EcommerceItemsProvider>(
                builder: (context, datalists, child) => ListView.builder(
                    itemCount: datalists.count,
                    itemBuilder: (context, index) {
                      final data = datalists.myCartLists[
                          index]; // gets the data that is stored in datalists
                      return Padding(
                        padding: mainPadding,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 5,
                          child: ListTile(
                            title: Text(
                              "${data.id.toString()} .",
                              style: TextStyle(
                                  color: themeProvider
                                      ? Colors.black
                                      : Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              children: [
                                Padding(
                                  padding: mainPadding,
                                  child: CustomeText(
                                    text: data.title.toString(),
                                    size: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(data.image.toString()),
                                ),
                                CustomeText(
                                  text: "Rs.${data.price.toString()}",
                                  size: 30,
                                ),
                              ],
                            ),
                            trailing: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal),
                              onPressed: () {
                                datalists.removeItems(data);
                              },
                              child: const CustomeText(
                                text: "Remove",
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
      ),
    );
  }
}
