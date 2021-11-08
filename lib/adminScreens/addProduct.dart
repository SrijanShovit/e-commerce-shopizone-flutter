import 'package:ecommerce/models/categories.dart';
import 'package:ecommerce/utils/custom_colors.dart';
import 'package:ecommerce/widgets/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  static const id = 'addproduct';

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  var categoryC = TextEditingController();
  var productNameC = TextEditingController();
  var serialCodeC = TextEditingController();
  var priceC = TextEditingController();
  var weightC = TextEditingController();
  var quantityC = TextEditingController();
  var onSaleC = TextEditingController();
  var popularC = TextEditingController();
  var discountC = TextEditingController();
  final _key = GlobalKey<FormState>();

  save() {
    bool isValidate = _key.currentState.validate();
    if (isValidate) {}
  }

  bool isSale = false;
  bool isPopular = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("Add Product"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _key,
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonFormField(
                      validator: (v) {
                        if (v.isEmpty()) {
                          return "Should not be empty";
                        }
                        return null;
                      },
                      hint: Text('Select Category'),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),

                      //onChanged is added to make tap working
                      onChanged: (value) {
                        categoryC.text = value;
                        print(categoryC.text);
                      },
                      // value: category_item.first.title,
                      items: category_item
                          .map((e) => DropdownMenuItem(
                              value: e.title,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(e.title),
                              )))
                          .toList()),
                ),
                EditField(
                  validator: (v) {
                    if (v.isEmpty()) {
                      return "Should not be empty";
                    }
                    return null;
                  },
                  controller: productNameC,
                  hint: 'Enter product name',
                  onsubmit: (value) {
                    setState(() {
                      productNameC.text = value;
                    });
                  },
                ),
                EditField(
                  validator: (v) {
                    if (v.isEmpty()) {
                      return "Should not be empty";
                    }
                    return null;
                  },
                  controller: serialCodeC,
                  hint: 'Enter serial code',
                  onsubmit: (value) {
                    setState(() {
                      serialCodeC.text = value;
                    });
                  },
                ),
                EditField(
                  validator: (v) {
                    if (v.isEmpty()) {
                      return "Should not be empty";
                    }
                    return null;
                  },
                  controller: priceC,
                  hint: 'Enter price',
                  onsubmit: (value) {
                    setState(() {
                      priceC.text = value;
                    });
                  },
                ),
                EditField(
                  validator: (v) {
                    if (v.isEmpty()) {
                      return "Should not be empty";
                    }
                    return null;
                  },
                  controller: weightC,
                  hint: 'Enter weight',
                  onsubmit: (value) {
                    setState(() {
                      weightC.text = value;
                    });
                  },
                ),
                EditField(
                  validator: (v) {
                    if (v.isEmpty()) {
                      return "Should not be empty";
                    }
                    return null;
                  },
                  controller: quantityC,
                  hint: 'Enter quantity',
                  onsubmit: (value) {
                    setState(() {
                      quantityC.text = value;
                    });
                  },
                ),
                Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10)),
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          crossAxisCount: 4),
                    )),
                SwitchListTile(
                    title: Text("Is On Sale : "),
                    value: isSale,
                    onChanged: (v) {
                      isSale = v;
                    }),
                SwitchListTile(
                    title: Text("Is Popular : "),
                    value: isPopular,
                    onChanged: (v) {
                      isSale = v;
                    }),
                MaterialButton(
                  shape: StadiumBorder(),
                  onPressed: () {
                    save();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Upload Product"),
                  ),
                  color: primaryColor,
                )
              ],
            ),
          ),
        ));
  }
}

class EditField extends StatelessWidget {
  String hint;
  Function onsubmit;
  TextEditingController controller;
  Function validator;
//called like a constructor to avoid required arguments...so if given it will take otherwise not
  EditField({this.hint, this.onsubmit, this.controller, this.validator});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              validator: validator,
              controller: controller,
              onFieldSubmitted: onsubmit,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
              ),
            ),
          ),
        ));
  }
}
