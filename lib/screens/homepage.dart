import 'package:flutter/material.dart';
import 'package:lesson28/core/components/decoration.dart';
import 'package:lesson28/core/components/mytext.dart';
import 'package:lesson28/core/constants/colors.dart';
import 'package:lesson28/models/pocemon_model.dart';
import 'package:lesson28/service/pokemon_service.dart';
import 'package:lesson28/widgets/app_bar_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: FutureBuilder(
          future: PokemonService.getPocemon(),
          builder: (context, AsyncSnapshot<PocemonModel> snap) {
            if (!snap.hasData) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (snap.hasError) {
              return const Center(
                child: Text("Error"),
              );
            } else {
              var data = snap.data!;
              return Column(
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
                          SearchField(
                              controller: _controller,
                              isTrue: false,
                              model: data.pokemon as List<Pokemon>),
                        ],
                      )),
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 10, left: 10.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 180,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemBuilder: (ctx, i) {
                          return Stack(children: [
                            Container(
                              height: 180,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      height: 130,
                                      width: MediaQuery.of(context).size.width,
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.all(6),
                                        child: Container(
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              MyText(
                                                  text:
                                                      "#${data.pokemon![i].num}",
                                                  color: MyColor.kPrimaryColor,
                                                  weight: FontWeight.bold),
                                              Text(
                                                "${data.pokemon![i].name}",
                                                overflow: TextOverflow.clip,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                          decoration:
                                              MyBoxDecoration.boxDecoration(
                                                  color: MyColor.kPrimaryGrey),
                                        ),
                                      ),
                                      decoration: MyBoxDecoration.boxDecoration(
                                          color: MyColor.kPrimaryColor)),
                                ],
                              ),
                              // child: MyText(text: data.pokemon![i].name.toString())
                            ),
                            Positioned(
                              child: Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      data.pokemon![i].img.toString(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]);
                        },
                        itemCount: data.pokemon!.length,
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
