import 'package:flutter/material.dart';
import 'package:tasty_dinery/utils/constants/sizes.dart';

class AdminTableFilter extends StatelessWidget {
  const AdminTableFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Rows per page",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.grey,
                fontSize: 12,
              ),
        ),

        const SizedBox(width: CcSizes.spaceBtnItems_2),

        // filter box
        DropdownButton(
          borderRadius: BorderRadius.circular(10),
          dropdownColor: Colors.grey.shade200,
          hint: const Text(
            "4",
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          items: const [
            DropdownMenuItem(
              value: "4",
              child: Text(
                "4",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            DropdownMenuItem(
              value: "5",
              child: Text(
                "5",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            DropdownMenuItem(
              value: "10",
              child: Text(
                "10",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            DropdownMenuItem(
              value: "20",
              child: Text(
                "20",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
          ],
          onChanged: (value) {},
        ),

        // const SizedBox(width: CcSizes.spaceBtnItems_2),

        // icons
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_circle_left_rounded,
            size: 20,
          ),
        ),

        const Text(
          "1-20 of 40",
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey),
        ),

        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_circle_right_rounded,
            size: 20,
          ),
        ),
      ],
    );
  }
}
