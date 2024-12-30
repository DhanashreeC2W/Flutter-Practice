import 'dart:convert';
import 'dart:developer';

import 'package:api_binding/show_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as dd;

class ApiBinding extends StatefulWidget {
  const ApiBinding({super.key});

  @override
  State<ApiBinding> createState() => _ApiBindingState();
}

class _ApiBindingState extends State<ApiBinding> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: getData, child: const Text("Get  data")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: getAllData, child: const Text("Get all devices data")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: getSingleData,
              child: const Text("Get single devices data by id")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: postData, child: const Text("Post data")), //ADD
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: putData, child: const Text("Put data")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: patchData, child: const Text("Patch data")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: deleteData, child: const Text("Delete data")),
        ],
      ),
    );
  }

  void getData() async {
    Uri url = Uri.parse("https://api.restful-api.dev/objects");
    dd.Response response = await dd.get(url);
    log("${response.headers}");

    ///TYPE OF FILE
    log(response.body);
    log("${response.persistentConnection}");
    log("${response.statusCode}");
    log("${response.request}");

    // log()
  }

  void getAllData() async {
    Uri url = Uri.parse("https://api.restful-api.dev/objects");
    dd.Response response = await dd.get(url);

    ///JO DATA AALA AAHE TO STRING FORMAT ADHE AAHE TYALA ACCESS KARNYASATHI JSON
    ///FILE MADHE CONVERT
    ///json IS THE OBJECT OF JsonCodec CLASS
    var reasponseData = json.decode(response.body);

    dynamic dataList = reasponseData;
    log("List of devices : $dataList");

    ///SWIGLY ON CONTEXT BEACAUSE OF ASYN AWAIT , (ARTITECTURE LEVEL) IT SAYS THAT JAR ASYNC AWAIT MULE
    ///JAR WAITING TIME MADHE  CONTEXT DELETE ZALA TAR TYALA PATH BHETNAR NAHI
    ///JEVHA JEVHA ASYNC AWAIT ANI CONTEXT ASEL THEVA MOUTING SCENARIO CHECK KELA PAHIJE
    /// if(context.mounted) {
    //   Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) => ShowData(
    //           data: dataList,
    //         )));
    // }
    navigateToShowData(dataList);
  }

  ///TO GET SINGLE DATA BY ID
  void getSingleData() async {
    Uri url = Uri.parse("https://api.restful-api.dev/objects/7");
    dd.Response reasponse = await dd.get(url);
    log(reasponse.body);

    ///HEADERS MEANS TYPE OF FILE
    log("${reasponse.headers}");

    var data = json.decode(reasponse.body);
    navigateToShowData(data);
  }

  ///TO POST DATA
  void postData() async {
    Uri url = Uri.parse("https://api.restful-api.dev/objects");
    Map postMap = {
      "name": "SAMSUNG A51",
      "data": {
        "color": "sky blue",
        "price": 25.000,
      },
    };

    ///encode = json to object
    ///decode =  object to json
    dd.Response response = await dd.post(url,
        body: json.encode(postMap),
        headers: {"content-type": "application/json"});
    log(response.body);
    log("${response.statusCode}");
  }

  ///TO PUT DATA
  void putData() async {
    Uri url = Uri.parse(
        "https://api.restful-api.dev/objects/ff808181932badb6019417067c294552");
    Map postMap = {
      "name": "SAMSUNG A51",
      "data": {
        "color": "black blue", //CHNAGED HERE
        "price": 25.000,
      },
    };
    dd.Response response = await dd.put(url,
        body: json.encode(postMap),
        headers: {"content-type": "application/json"});
    log(response.body);
    log("${response.statusCode}");
  }

  ///TO PATCH DATA
  void patchData() async {
    Uri url = Uri.parse(
        "https://api.restful-api.dev/objects/ff808181932badb6019417067c294552");
    Map postMap = {
      "name": "SAMSUNG A52",
    };
    dd.Response response = await dd.patch(url,
        body: json.encode(postMap),
        headers: {"content-type": "application/json"});
    log(response.body);
    log("${response.statusCode}");
  }

  ///TO DELETE DATA
  void deleteData() async {
    Uri url = Uri.parse(
        "https://api.restful-api.dev/objects/ff808181932badb6019417067c294552");
    dd.Response response = await dd.delete(url);
    log(response.body);
  }

  ///METHOD FOR NAVIGATION
  void navigateToShowData(dynamic data) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ShowData(data: data);
    }));
  }
}
