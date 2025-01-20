import 'package:fluent_ui/fluent_ui.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Unique hover colors for each button
  Color _buttonColor1 = const Color(0xFFfafafa);
  Color _buttonColor2 = const Color(0xFFfafafa);
  Color _buttonColor3 = const Color(0xFFAD6FE0);

  // Change the color when mouse enters the region for button 1
  void _onEnter1(PointerEvent details) {
    setState(() {
      _buttonColor1 = const Color(0xFFC0C0C0); // Light gray color when hovered
    });
  }

  // Revert to the original color when mouse exits for button 1
  void _onExit1(PointerEvent details) {
    setState(() {
      _buttonColor1 = const Color(0xFFfafafa); // Revert to original background
    });
  }

  // Change the color when mouse enters the region for button 2
  void _onEnter2(PointerEvent details) {
    setState(() {
      _buttonColor2 = const Color(0xFFC0C0C0);
    });
  }

  // Revert to the original color when mouse exits for button 2
  void _onExit2(PointerEvent details) {
    setState(() {
      _buttonColor2 = const Color(0xFFfafafa);
    });
  }

  // Change the color when mouse enters the region for button 3
  void _onEnter3(PointerEvent details) {
    setState(() {
      _buttonColor3 = const Color(0xFFC092EF);
    });
  }

  // Revert to the original color when mouse exits for button 3
  void _onExit3(PointerEvent details) {
    setState(() {
      _buttonColor3 = const Color(0xFFAD6FE0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Container(
      padding: const EdgeInsets.only(left: 97, top: 32, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Counter Name",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Amrita Shrestha (Counter Person)",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "Opening Time:",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff818181),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "10:04 | 23-08-2024",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff333333),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    child: MouseRegion(
                      onEnter: _onEnter1,
                      onExit: _onExit1,
                      child: Button(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(_buttonColor1),
                          foregroundColor: WidgetStateProperty.all(Colors.black),
                          padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 12, horizontal: 10)),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: Color(0xFF292929),
                              width: 1,
                            ),
                          )),
                          textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                        ),
                        onPressed: () {
                          // Button press functionality
                        },
                        child: const Text("Close Movement"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    child: MouseRegion(
                      onEnter: _onEnter2,
                      onExit: _onExit2,
                      child: Button(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(_buttonColor2),
                          foregroundColor: WidgetStateProperty.all(Colors.black),
                          padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 12, horizontal: 10)),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: Color(0xFF292929),
                              width: 1,
                            ),
                          )),
                          textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                        ),
                        onPressed: () {
                          // Button press functionality
                        },
                        child: const Text("Register History"),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
          const SizedBox(height: 21),
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF969696), width: 1),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      topLeft: Radius.circular(6),
                    ),
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFc0c0c0), width: 1),
                    ),
                    color: Color(0xffe3e3e3),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Expected Cash in the Register",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Text(
                        "\$ 32,000",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            "Opening float",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff585858)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Cash Sales",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff585858)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Cash Refunds",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff585858)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Cash Out",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff585858)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Cash In",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff585858)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Cash Sales",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff585858)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            "\$ 12,000",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff585858)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "\$ 22,000",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff585858)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "-",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff585858)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "-",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff585858)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "-",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff585858)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF969696), width: 0.6),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Counted Cash in the Register",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Text(
                  "\$ 29,000",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333)),
                    ),
                    Text(
                      "Difference",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff585858)),
                    ),
                  ],
                ),
                SizedBox(height: 3,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$ 32,000",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    Text(
                      "\$ 1,000",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff585858)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Stack(
              clipBehavior: Clip.none, // Prevent clipping of child widgets
              children: [
                Container(
                  height: 107,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFF969696), width: 0.6),
                  ),
                  child: TextBox(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 0.3),
                    maxLines: 5,
                    style: const TextStyle(
                      fontSize: 12.0, // Input text size
                      color: Colors.black, // Input text color
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent, // Transparent TextBox background
                      border: Border.all(
                        color: Colors.transparent, // No border
                      ),
                    ),
                    foregroundDecoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.transparent, // Removes focus border
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -10, // Moves the text 10 pixels above the container's top
                  left: 10, // Moves the text 10 pixels from the left
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.white, // "Sticky note" effect color
                    child: const Text(
                      "Notes",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF818181),
                      ),
                    ),
                  ),
                ),
              ]
          ),
          const SizedBox(height: 32),
          Center(
            child: SizedBox(
              height: 45,
              width: 259,
              child: MouseRegion(
                onEnter: _onEnter3,
                onExit: _onExit3,
                child: Button(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(_buttonColor3),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 12, horizontal: 10)),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                    textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  ),
                  onPressed: () {
                    // Button press functionality
                  },
                  child: const Text("Cash Register"),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),

        ],
      ),
    ),);
  }
}
