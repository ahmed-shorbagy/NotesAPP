import 'package:flutter/material.dart';
import 'constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.isLoading});
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: kPrimaryColor),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : const Text(
                    'Add',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
          ),
        ),
      ),
    );
  }
}
