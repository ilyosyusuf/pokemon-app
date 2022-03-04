import 'package:flutter/material.dart';
import 'package:lesson28/core/constants/colors.dart';
import 'package:lesson28/models/pocemon_model.dart';

class SearchField extends StatelessWidget {
  bool? isTrue;
  // PocemonModel? model;
  List<Pokemon>? model;
  SearchField({
    Key? key,
    required TextEditingController controller,this.isTrue, this.model,
  }) : _controller = controller, super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        controller: _controller,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          fillColor: MyColor.kGrey,
          filled: true,
          hintText: "Search...", 
          border: OutlineInputBorder( borderRadius: BorderRadius.circular(25.0), borderSide: BorderSide.none),
        ),onTap: isTrue == false? (){
          Navigator.pushNamed(context, '/search', arguments: model as List<Pokemon>);
        }:(){},
        // onChanged: isTrue == true? (v){
        //   print(model!.pokemon![0].id);
          
        // }:(v){},
      ),
    );
  }
}
