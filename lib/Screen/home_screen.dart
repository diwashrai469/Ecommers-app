import 'package:demo_app/Provider/dio_state/ecommerce_items_provider.dart';
import 'package:demo_app/Screen/cart_screen.dart';
import 'package:demo_app/Screen/heroAnimation_screen.dart';
import 'package:demo_app/theme/theme_provider.dart';
import 'package:demo_app/constant/constants.dart';
import 'package:demo_app/widgets/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  //icons for dark and light theme
  Icon iconlight = const Icon(Icons.wb_sunny);
  Icon iconDark = const Icon(Icons.nights_stay);
  @override
  Widget build(BuildContext context) {
    final apiProviderObj = Provider.of<EcommerceItemsProvider>(context,
        listen: false); // data got from api provider
    final themeProvider = Provider.of<ThemeChangerBool>(context, listen: false)
        .iconBool; // data got from theme provider
    print("rebuilt");
    

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "My app",
            ),
            centerTitle: true,
            actions: [
              Consumer<ThemeChangerBool>(
                builder: (context, value, child) => IconButton(
                    onPressed: () {
                      value.setBoolVal();
                    },
                    icon: value.iconBool ? iconDark : iconlight),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const CartScreen();
                      }));
                    },
                    child: const Icon(
                      Icons.shopping_cart,
                    )),
              ),
              Consumer<EcommerceItemsProvider>(
                  builder: (context, value, child) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomeText(
                        text: value.count.toString(),
                      )))
            ],
          ),
          body: FutureBuilder(
            future: apiProviderObj.fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("ERROR: ${snapshot.error}"),
                );
              }
              return Consumer<EcommerceItemsProvider>(
                  builder: (context, datalists, child) => ListView.builder(
                      itemCount: datalists.apiDataList.length,
                      itemBuilder: (context, index) {
                        final apidata = datalists
                            .apiDataList[index]; // gets all api data index

                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return HeroAnimationScreen(heroTag: apidata);
                            }));
                          },
                          child: Hero(
                            tag: apidata.id.toString(),
                            child: Padding(
                              padding: mainPadding,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  elevation: 5,
                                  child: ListTile(
                                      title: Text(
                                        "${apidata.id.toString()}.",
                                        style: TextStyle(
                                            color: themeProvider
                                                ? Colors.black
                                                : Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: mainPadding,
                                              child: CustomeText(
                                                text: apidata.title.toString(),
                                                size: 20,
                                              ),
                                            ),
                                            Padding(
                                                padding: mainPadding,
                                                child: Image.network(
                                                  apidata.image.toString(),
                                                  loadingBuilder: (context,
                                                      child, loadingProgress) {
                                                    if (loadingProgress ==
                                                        null) {
                                                      return child;
                                                    }
                                                    return const CircularProgressIndicator();
                                                  },
                                                )),
                                            CustomeText(
                                              text:
                                                  "Rs. ${apidata.price.toString()}",
                                              size: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                      trailing: InkWell(
                                          onTap: () {
                                            if (datalists.myCartLists
                                                .contains(apidata)) {
                                              datalists.removeItems(apidata);
                                            } else {
                                              datalists.addItem(apidata);
                                            }
                                          },
                                          child: datalists.myCartLists
                                                  .contains(apidata)
                                              ? const Icon(
                                                  Icons.favorite,
                                                )
                                              : const Icon(
                                                  Icons.favorite_border,
                                                )))),
                            ),
                          ),
                        );
                      }));
            },
          )),
    );
  }
}
