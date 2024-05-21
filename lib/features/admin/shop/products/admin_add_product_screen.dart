import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_dinery/common/widgets/images/rounded_image.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class AdminAddProduct extends StatelessWidget {
  const AdminAddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue.shade700,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          "Add New Product",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white, fontSize: 20),
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
                    "dashboard/products/add_new_product",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),

              const SizedBox(height: CcSizes.spaceBtnItems_1),

              // basic information
              Material(
                elevation: 5,
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Basic Information",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 20,
                                ),
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

                      // product title
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Product Title",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),

                      const SizedBox(height: CcSizes.spaceBtnInputFields),

                      // product description
                      TextField(
                        minLines: 3,
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: "Product Description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: CcSizes.spaceBtnItems_1),

              // quantity and pricing
              Material(
                elevation: 5,
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Quantity & Price",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 20,
                                ),
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

                      // quantity and price
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Quantity",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),

                      const SizedBox(height: CcSizes.spaceBtnInputFields),

                      // price
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Price",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: CcSizes.spaceBtnItems_1),

              // thumbnail
              Material(
                elevation: 5,
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // heading
                      Row(
                        children: [
                          Text(
                            "Product Thumbnail",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 20),
                          ),
                        ],
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

                      // image
                      Center(
                        child: CcRoundedImage(
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            imageUrl:
                                "assets/images/success_screen/thumbnail.png"),
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_2),

                      Center(
                        child: SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade200,
                              side: const BorderSide(color: Colors.grey),
                            ),
                            child: const Text(
                              "Add Thumbnail",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: CcSizes.spaceBtnItems_1),

              // thumbnail
              Material(
                elevation: 5,
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // heading
                      Row(
                        children: [
                          Text(
                            "All Product Images",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 20),
                          ),
                        ],
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

                      // all other images
                      const Row(
                        children: [
                          Icon(
                            Icons.image_rounded,
                            color: Colors.grey,
                            size: 70,
                          ),
                          SizedBox(width: 10),
                          Text("Add Additional Products Image")
                        ],
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 60,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics:
                                    // const AlwaysScrollableScrollPhysics(),
                                    const NeverScrollableScrollPhysics(),
                                separatorBuilder: (_, __) => const SizedBox(
                                    width: CcSizes.spaceBtnItems_2),
                                itemCount: 4,
                                itemBuilder: (_, index) => Container(
                                  width: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey.withOpacity(0.6)),
                                  // add a child which is the image to be added in the container
                                  // wrap the container woth the gesture detector to enable addition of image whenever it is placed
                                ),
                              ),
                            ),

                            const SizedBox(width: 10),

                            // elevated button
                            SizedBox(
                              width: 50,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade100,
                                  side: const BorderSide(color: Colors.grey),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                child: const Text(
                                  "+",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: CcSizes.spaceBtnItems_1),

              // categories
              Material(
                elevation: 5,
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // heading
                      Row(
                        children: [
                          Text(
                            "Product Categories",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 20),
                          ),
                        ],
                      ),

                      const SizedBox(height: CcSizes.spaceBtnItems_1),

                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Center(
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(10),
                            dropdownColor: Colors.grey.shade200,
                            hint: const Text(
                              "Product Categories ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: "Breakfast",
                                child: Text(
                                  "Breakfast",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Fruits",
                                child: Text(
                                  "Fruits",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Meal",
                                child: Text(
                                  "Meal",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Chips",
                                child: Text(
                                  "Chips",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Milk",
                                child: Text(
                                  "Milk",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Juice",
                                child: Text(
                                  "Juice",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Beverage",
                                child: Text(
                                  "Beverage",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: CcSizes.spaceBtnSections),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        side: const BorderSide(color: Colors.grey),
                      ),
                      child: const Text(
                        "Discard",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Save Changes",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
