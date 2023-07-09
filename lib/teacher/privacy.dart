import 'package:flutter/material.dart';
import 'package:qurantutorapp/appconstaint.dart';

class privacy extends StatelessWidget {
  const privacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final availableWidth = mediaQuery.size.width -
        mediaQuery.padding.left -
        mediaQuery.padding.right;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          iconSize: 15,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffFFFFFF),
        iconTheme: IconThemeData(
          color: Color(0xff000000), // set your arrow color here
        ),
        elevation: 1,
        title: Text(
          "Privacy Policy",
          style: appbarcentertextstyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: availableWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Last Update on 24 Sept, 2021",
                style: TextStyle(
                  color: Color(0xff767676),
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  fontFamily: 'Open Sans',
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.02),
              Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xffECECEC),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: availableWidth,
                  height: mediaQuery.size.height * 0.7,
                  child: SingleChildScrollView(
                    child: Text(
                      "Help protect your website and its"
                      " users with clear and fair website terms and conditions."
                      " These terms and conditions for a website set out key issues"
                      " such as acceptable use, privacy, cookies, registration and passwords,"
                      " intellectual property, links to other sites, termination and disclaimers of"
                      " responsibility. Terms and conditions are used and necessary to protect a website"
                      " owner from liability of a user relying on the information or the goods provided from the"
                      " site then suffering a loss.Help protect your website and its users with clear and fair website terms"
                      " and conditions. These terms and conditions for a website set out key issues such as acceptable use, privacy,"
                      " cookies, registration and passwords, intellectual property, links to other sites, termination and disclaimers of responsibility."
                      " Terms and conditions are used and necessary to protect a website owner from liability of a user relying on the information or the goods"
                      " provided from the site then suffering a loss.Help protect your website and its users with clear and fair website terms and conditions. These "
                      "terms and conditions for a website set out key issues such as acceptable use, privacy, cookies, registration and passwords, intellectual property, links "
                      "to other sites, termination and disclaimers of responsibility. Terms and conditions are used and necessary to protect a website owner from liability of a user"
                      " relying on the information or the goods provided from the site then suffering a loss.Help protect your website and its users with clear and fair website terms and conditions. "
                      "These terms and conditions for a website set out key issues such as acceptable use, privacy, cookies, registration and passwords, intellectual property, links to other sites, "
                      "termination and disclaimers of responsibility. Terms and conditions are used and necessary to protect a website owner from liability of a user relying on the information or the goods provided from the site then suffering a loss.",
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontSize: 12,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
