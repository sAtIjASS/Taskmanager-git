import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms and Conditions",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
        centerTitle: true,

      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            "**Terms and Conditions for UrbanCart Mobile Application**\n"
                "Welcome to UrbanCart. By using our mobile application and services, you agree to comply with and be bound by the following terms and conditions. Please review them carefully.\n\n"
                "**1. Acceptance of Terms**\n"
                "By accessing or using UrbanCart’s app and services, you acknowledge that you have read, understood, and agree to be bound by these terms and conditions. If you do not agree to these terms, you must not use our services.\n\n"
                "**2. Use of Services**\n"
                "UrbanCart provides an online platform for purchasing a wide range of products through our mobile application. You agree to use our services only for lawful purposes and in a manner that does not infringe the rights of others or restrict or inhibit their use and enjoyment of the platform. Prohibited behavior includes harassing or causing distress or inconvenience to any person, transmitting obscene or offensive content, or disrupting the normal flow of dialogue within our services.\n\n"
                "**3. Account Registration**\n"
                "To access certain features of our services, you may be required to register for an account. You agree to provide accurate, current, and complete information during the registration process and to update such information to keep it accurate, current, and complete. You are responsible for safeguarding your password and agree not to disclose it to any third party. You are solely responsible for any activities or actions under your account, whether or not you have authorized such activities or actions.\n\n"
                "**4. Product Information and Availability**\n"
                "We strive to display as accurately as possible the colors, features, specifications, and details of the products available on UrbanCart. However, we do not guarantee that the colors, features, specifications, and details of the products will be accurate, complete, reliable, current, or free of other errors, and your electronic display may not accurately reflect the actual colors and details of the products. All products are subject to availability, and we cannot guarantee that items will be in stock. We reserve the right to discontinue any products at any time for any reason. Prices for all products are subject to change.\n\n"
                "**5. Orders and Payment**\n"
                "You agree to provide current, complete, and accurate purchase and account information for all purchases made via UrbanCart. You further agree to promptly update account and payment information, including email address, payment method, and payment card expiration date, so that we can complete your transactions and contact you as needed. Sales tax will be added to the price of purchases as deemed required by us. We may change prices at any time. All payments shall be in the currency specified by UrbanCart at the time of purchase.\n\n"
                "**6. Shipping and Delivery**\n"
                "UrbanCart will deliver purchased items to the address specified in your order. Delivery times are estimates and are not guaranteed. We are not liable for any delays in shipments. Risk of loss and title for products purchased from us pass to you upon delivery of the products to the carrier.\n\n"
                "**7. Returns and Refunds**\n"
                "Our Return and Refund Policy applies to all purchases made through UrbanCart. Please review our Return and Refund Policy to understand your rights and responsibilities.\n\n"
                "**8. Intellectual Property Rights**\n"
                "All content, features, and functionality on UrbanCart, including but not limited to text, graphics, logos, icons, images, and software, are the exclusive property of UrbanCart and are protected by copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws. You agree not to reproduce, distribute, modify, create derivative works of, publicly display, publicly perform, republish, download, store, or transmit any of the material on our app, except as permitted under these terms.\n\n"
                "**9. Limitation of Liability**\n"
                "To the fullest extent permitted by law, UrbanCart shall not be liable for any indirect, incidental, special, consequential, or punitive damages, including but not limited to loss of profits, data, use, goodwill, or other intangible losses, resulting from (i) your access to or use of or inability to access or use the services; (ii) any conduct or content of any third party on the services; (iii) any content obtained from the services; and (iv) unauthorized access, use, or alteration of your transmissions or content.\n\n"
                "**10. Governing Law**\n"
                "These terms and conditions are governed by and construed in accordance with the laws of the jurisdiction in which UrbanCart operates, without regard to its conflict of law principles. You agree to submit to the exclusive jurisdiction of the courts located in that jurisdiction for the resolution of any disputes.\n\n"
                "**11. Changes to Terms**\n"
                "UrbanCart reserves the right, in its sole discretion, to modify or replace these terms and conditions at any time. We will notify you of any changes by posting the new terms on the app. Your continued use of the services following the posting of any changes to the terms constitutes acceptance of those changes.\n\n"
                "**Contact Us**\n"
                "If you have any questions about these terms and conditions, please contact us at support@urbancart.com.",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
