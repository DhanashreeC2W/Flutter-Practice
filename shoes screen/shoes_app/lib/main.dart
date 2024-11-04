import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,

          ///TITLE OF THE APPBAR
          title: const Text(
            "Shoes",
            style: TextStyle(
              color: Colors.deepPurpleAccent,
            ),
          ),
          actions: const [
            ///CART ICON
            Icon(
              Icons.shopping_cart,
              color: Colors.deepPurpleAccent,
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ///IMAGE AT TOP
            Image.network(
              "https://5.imimg.com/data5/SELLER/Default/2020/9/LD/SD/LF/113537169/m-5b6dfafc5a9d218efeeee027-500x500.jpg",
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Container(
              height: 350,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///SHOES NAME
                  const Text(
                    "Nike Air Force 1''07",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      ///SHOES BUTTON
                      Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "SHOES",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),

                      ///FOOTWEAR BUTTON
                      Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "FOOTWEAR",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),

                  ///SHOES DESCRIPTION
                  const Text(
                    "Custom Air Force 1 Low Air Force 1 Custom Shoes (Light purple with Dark Purple Swoosh)LCQL is a brand enterprise dedicated to creating fashionable and comfortable shoes. We insist on doing the best in quality and style to provide you with comfortable and fashionable shoes",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Row(
                    children: [
                      ///QUANTITY TEXT
                      const Text(
                        "Quantity",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),

                      ///DEACREASE COUNT BUTTON
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              if (count > 0) {
                                count--;
                              }
                            });
                          },
                          child: const Icon(
                            Icons.remove,
                          )),
                      const SizedBox(
                        width: 8,
                      ),

                      ///QUANTITY COUNT BUTTON

                      Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Text("$count"),
                      ),
                      const SizedBox(
                        width: 5,
                      ),

                      ///INCREASE COUNT BUTTON
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              count++;
                            });
                          },
                          child: const Icon(Icons.add))
                    ],
                  ),
                  ///PURCHASE BUTTON
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll(
                              Colors.deepPurpleAccent),
                          fixedSize: WidgetStatePropertyAll(
                              Size(MediaQuery.sizeOf(context).width, 50))),
                      onPressed: () {},
                      child: const Text(
                        "PURCHASE",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
