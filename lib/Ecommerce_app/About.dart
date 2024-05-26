import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Urban Cart',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                """Welcome to Urban Cart, your number one source for all things you need daily. We're dedicated to giving you the very best of products, with a focus on three characteristics: dependability, customer service, and uniqueness.

Founded in 2023, Urban Cart has come a long way from its beginnings. When we first started out, our passion for providing the best shopping experience drove us to do intense research and gave us the impetus to turn hard work and inspiration into a booming online store. We now serve customers all over the country and are thrilled to be a part of the eco-friendly, fair trade wing of the ecommerce industry.

Our mission at Urban Cart is to provide high-quality products that cater to your everyday needs. We aim to offer our customers a variety of the latest products. We’ve come a long way, so we know exactly which direction to take when supplying you with high quality yet budget-friendly products. We offer all of this while providing excellent customer service and friendly support.

We always keep an eye on the latest trends in various categories such as electronics, fashion, home appliances, and health & beauty, and put our customers’ wishes first. That is why we have satisfied customers all over the country, and are thrilled to be a part of the ecommerce industry.

The interests of our customers are always top priority for us, so we hope you will enjoy our products as much as we enjoy making them available to you. Shopping with Urban Cart is more than just purchasing products; it’s about joining a community that values trust, integrity, and high-quality service.

Our team is passionate about making it easier for you to shop online. We care about your time so we try our best to make your shopping experience pleasant, seamless, and hassle-free. We hope to build relationships with our customers so we'll continue to provide excellent products and top-notch services for many years to come.

Thank you for visiting our site. We hope you enjoy your shopping experience. If you have any questions or comments, please don't hesitate to contact us.

**Our Vision**

To be the leading ecommerce platform known for providing high-quality, affordable products with exceptional customer service.

**Our Mission**

To consistently deliver superior products that exceed our customers’ expectations and to ensure a pleasant, trustworthy shopping experience.

**Core Values**

- Customer Satisfaction: Our customers are our top priority.
- Quality: We provide products that meet high standards.
- Integrity: We operate with honesty and uphold strong moral principles.
- Innovation: We continually seek to improve our services and product offerings.
- Community: We foster a sense of belonging among our customers and staff.

Thank you for being a part of Urban Cart’s journey. We look forward to serving you.

For any inquiries or feedback, feel free to reach out to us at support@urbancart.com or call us at +1 (800) 123-4567.

Urban Cart - Your Everyday Shopping Partner.""",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

