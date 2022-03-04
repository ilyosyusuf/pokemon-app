import 'package:flutter/material.dart';
import 'package:lesson28/core/components/decoration.dart';
import 'package:lesson28/core/components/mytext.dart';
import 'package:lesson28/core/constants/colors.dart';
import 'package:lesson28/models/pocemon_model.dart';
import 'package:lesson28/widgets/app_bar_widget.dart';

class SearchPage extends StatefulWidget {
  // PocemonModel pModel;
  List<Pokemon> pModel;
  SearchPage({Key? key, required this.pModel}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Set<Pokemon> searchItem = {};
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Image.asset(
                      'assets/images/image1.png',
                      width: MediaQuery.of(context).size.width * 0.7,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      controller: _controller,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        fillColor: MyColor.kGrey,
                        filled: true,
                        hintText: "Search...",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide.none),
                      ),
                      onChanged: (v) {
                        searchItem.clear();
                        for (Pokemon item in widget.pModel) {
                          if (v.length == 0) {
                            searchItem.clear();
                            setState(() {});
                          } else if (item.name
                              .toString()
                              .toLowerCase()
                              .contains(v.toString().toLowerCase())) {
                            searchItem.add(item);
                            setState(() {});
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: ListView.builder(
                itemBuilder: (ctx, i) {
                  return InkWell(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(20.0),
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyText(
                                      text:
                                          "#${searchItem.toList()[i].num.toString()}",
                                      color: MyColor.kPrimaryColor,
                                      weight: FontWeight.bold,
                                    ),
                                    MyText(
                                      text:
                                          "${searchItem.toList()[i].name.toString()}",
                                      color: MyColor.kBlack,
                                      weight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 150,
                                decoration: MyBoxDecoration.boxDecoration(
                                  color: MyColor.kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 80,
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  searchItem.toList()[i].img.toString(),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                decoration: BoxDecoration(
                                  color: MyColor.kPrimaryColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  ),
                                ),
                                padding: const EdgeInsets.only(
                                    right: 20.0, left: 20.0, top: 20.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        _showbottom(
                                            i,
                                            "Altura",
                                            searchItem
                                                .toList()[i]
                                                .height
                                                .toString()),
                                        _showbottom(
                                            i,
                                            "Name",
                                            searchItem
                                                .toList()[i]
                                                .name
                                                .toString()),
                                        _showbottom(
                                            i,
                                            "Disabilidad",
                                            searchItem
                                                .toList()[i]
                                                .weaknesses![0]
                                                .toString()),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        _showbottom(
                                            i,
                                            "Peso",
                                            searchItem
                                                .toList()[i]
                                                .weight
                                                .toString()),
                                        Container(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: _showbottom(
                                              i,
                                              "Type",
                                              searchItem
                                                  .toList()[i]
                                                  .type![0]
                                                  .toString()),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        _showbottom(
                                            i,
                                            "Candy",
                                            searchItem
                                                .toList()[i]
                                                .candy
                                                .toString(),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                width: 260,
                                height: 120,
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/image2.png'),
                                        fit: BoxFit.contain),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        backgroundColor: Colors.green,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                      );
                    },
                  );
                },
                itemCount: searchItem.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _showbottom(int i, String text1, String text2) {
    return Container(
      width: 110,
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: text1,
            color: MyColor.kWhite,
            weight: FontWeight.bold,
            size: 20,
          ),
          MyText(
            text: text2,
            color: MyColor.kWhite,
            size: 15,
          ),
        ],
      ),
    );
  }
}
