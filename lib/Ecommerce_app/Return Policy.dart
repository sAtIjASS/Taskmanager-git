import 'package:flutter/material.dart';

class Return extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Return Policy",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            """**Return Policy for UrbanCart Mobile App**

Thank you for shopping with UrbanCart. We strive to provide the best shopping experience for our customers. If you are not entirely satisfied with your purchase, we are here to help. Please read our Return Policy carefully to understand your rights and responsibilities.

**1. Eligibility for Returns**

To be eligible for a return, the following conditions must be met:
- The item must be unused and in the same condition that you received it.
- The item must be in its original packaging.
- You must have the receipt or proof of purchase.
- Certain types of items cannot be returned, including perishable goods (such as food, flowers, or plants), custom products (such as special orders or personalized items), and digital products (such as software downloads or e-books).

**2. Return Period**

You have 30 calendar days to return an item from the date you received it. If 30 days have gone by since your purchase, unfortunately, we cannot offer you a refund or exchange.

**3. How to Initiate a Return**

To initiate a return, please follow these steps:
- Contact our customer support team at support@urbancart.com to request a return authorization.
- Provide your order number, details of the product you wish to return, and the reason for the return.
- Our customer support team will provide you with instructions on how to return your item.

**4. Shipping Returns**

You will be responsible for paying for your own shipping costs for returning your item. Shipping costs are non-refundable. If you receive a refund, the cost of return shipping will be deducted from your refund. We recommend using a trackable shipping service or purchasing shipping insurance. We do not guarantee that we will receive your returned item.

**5. Inspection and Refunds**

Once we receive your item, we will inspect it and notify you that we have received your returned item. We will immediately notify you of the status of your refund after inspecting the item. If your return is approved, we will initiate a refund to your original method of payment. The time it takes for the refund to reflect in your account may vary depending on your payment method and financial institution.

**6. Exchanges**

We only replace items if they are defective or damaged. If you need to exchange an item for the same item, contact us at support@urbancart.com. We will provide instructions on how to proceed with the exchange.

**7. Non-returnable Items**

Certain items are non-returnable, including:
- Gift cards
- Downloadable software products
- Health and personal care items
- Items purchased during a clearance sale

**8. Damaged or Incorrect Items**

If you received a damaged or incorrect item, please contact us immediately at support@urbancart.com with details of the product and the defect. We will arrange for a replacement or refund as quickly as possible.

**9. Late or Missing Refunds**

If you haven’t received a refund yet, first check your bank account again. Then contact your credit card company, as it may take some time before your refund is officially posted. Next, contact your bank. There is often some processing time before a refund is posted. If you’ve done all of this and you still have not received your refund, please contact us at support@urbancart.com.

**10. Contact Us**

If you have any questions about our Return Policy, please contact us at:
- Email: support@urbancart.com
- Phone: +1 (800) 123-4567

We are committed to ensuring that you have a positive shopping experience with UrbanCart. Thank you for your understanding and cooperation.""",
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
