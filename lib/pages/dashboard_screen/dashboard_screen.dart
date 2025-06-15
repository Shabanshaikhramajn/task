import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task/pages/country_picker_screen/country_picker_screen.dart';
import 'package:task/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('MMM dd, yyyy HH:mm:ss').format(DateTime.now());
    return Scaffold(
      // backgroundColor: Color(0xFFF6F6F6),
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          // backgroundImage: AssetImage(''),
                          child: Text('P'),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Parth Mahajan',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16)),
                            Text(formattedDate,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.account_balance_outlined),
                        Container(
                          height: 24,
                          child: VerticalDivider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 8),
                        ),
                        // SizedBox(width: 12),
                        Stack(
                          children: [
                            Icon(Icons.notifications_none),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.red,
                                child: Text('3',
                                    style: TextStyle(
                                        fontSize: 8, color: Colors.white)),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text("Your sent Amount",
                        style: TextStyle(color: Colors.grey, fontSize: 14)),
                    SizedBox(height: 6),
                    Text("GBP 0",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                    SizedBox(height: 4),
                    Text("in last 90 days",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Transfer History",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16)),
                    Text("View All", style: TextStyle(color: Colors.blue))
                  ],
                ),
              ),
              historyItem("Xyz Pqr", "22 May 2025", "Pending", "TX45884404",
                  "1.00 GBP", "1,041.00 NGN"),
              historyItem("Xyz Pqr", "20 May 2025", "Pending", "TX45134780",
                  "1.00 GBP", "1,041.00 NGN"),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text("View Rates",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
              ),
              SizedBox(height: 10),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        "https://flagcdn.com/w40/ng.png",
                        width: 40,
                        height: 40,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.flag),
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: Text(
                        "Nigeria",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    SizedBox(width: 15),
                    IconButton(
                      icon: Icon(Icons.search, size: 30),
                      onPressed: () => showCountryPickerBottomSheet(context),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        "https://flagcdn.com/w40/gb.png",
                        width: 40,
                        height: 40,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.flag),
                      ),
                    ),
                    SizedBox(width: 12),
                    Text("1.00 GBP"),
                    Spacer(),
                    Icon(Icons.compare_arrows, size: 35),
                    Spacer(),
                    Text("100.00 INR"),
                    SizedBox(width: 12),
                    ClipOval(
                      child: Image.network(
                        "https://flagcdn.com/w40/ng.png",
                        width: 40,
                        height: 40,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.flag),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 3),
                    Text(
                      "Refer a Friend",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Refer & Earn",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "You Can Earn €10",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    const SizedBox(height: 5)
                  ],
                ),
              )

              //           Container(
              //   margin: const EdgeInsets.only(top: 10),
              //   padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              //   decoration: BoxDecoration(
              //       color: Colors.white, borderRadius: BorderRadius.circular(12)),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Text(
              //           title,
              //           style:
              //               GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //       Spacer(),
              //       Text("", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              //       SizedBox(width: 15),
              //       ClipOval(
              //         child: Image.network(
              //           flagUrl,
              //           width: 40,
              //           height: 40,
              //           fit: BoxFit.fill,
              //           errorBuilder: (context, error, stackTrace) =>
              //               const Icon(Icons.flag),
              //         ),
              //       ),
              //       const SizedBox(width: 5),
              //       if (trailing != null) trailing,
              //     ],
              //   ),
              // );
            ],
          ),
        ),
      ),
    );
  }

  Widget historyItem(String name, String date, String status, String txId,
      String gbp, String ngn) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("$date | $status",
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  Text(txId,
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(gbp, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(ngn, style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(gbp, style: TextStyle(fontWeight: FontWeight.bold)),
          //     Text(ngn, style: TextStyle(fontWeight: FontWeight.bold)),
          //   ],
          // )
        ],
      ),
    );
  }
}
