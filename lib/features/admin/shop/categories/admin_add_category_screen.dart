import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/images/rounded_image.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';
import 'package:tasty_dinery/utils/helpers/helper_functions.dart';

class AdminAddCategory extends StatelessWidget {
  const AdminAddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    // variable
    var categories = [
      "Breakfast",
      "Fruits",
      "Meal",
      "Chips",
      "Milk",
      "Juice",
      "Beverage",
    ];

    // scaffold
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue.shade700,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: Text(
          "Add New Category",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "dashboard/categories/add_new_category",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: CcSizes.spaceBtnItems_1),
              Material(
                elevation: 5,
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // category name
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Category Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),

                      const SizedBox(height: CcSizes.spaceBtnInputFields),

                      // parent category
                      DropdownButtonFormField(
                        items: categories.map((category) {
                          return DropdownMenuItem(
                              value: category, child: Text(category));
                        }).toList(),
                        onChanged: (value) {},
                        // onChanged: (newValue) {
                        //   setState(() => category = newValue!);
                        // },
                        // value: category,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 20, 10, 20),
                            filled: true,
                            fillColor: Colors.transparent,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "Select Category"),
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

                      InkWell(
                        // splashColor: Colors.amber,
                        highlightColor: Colors.blue,
                        onTap: () {},
                        child: const CcRoundedImage(
                            width: 150,
                            height: 150,
                            imageUrl:
                                "assets/images/success_screen/thumbnail.png"),
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

                      Row(
                        children: [
                          // with on tap functionality
                          GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                  Icons.check_box_outline_blank_outlined)),

                          const SizedBox(width: 10),

                          // text
                          Text(
                            "Featured",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                          ),
                        ],
                      ),

                      const SizedBox(height: CcSizes.spaceBtnSections),

                      SizedBox(
                          width: CcHelperFunctions.screenWidth() / 3,
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text("Create")))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
