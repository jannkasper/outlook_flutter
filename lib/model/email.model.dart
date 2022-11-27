
import 'dart:ui';

class EmailModel {
  final String image, name, email, subject, body;
  final DateTime time;
  bool isChecked;
  final List<String> attachments;
  final Color? tagColor;

  EmailModel({
    required this.image,
    required this.name,
    required this.email,
    required this.subject,
    required this.body,
    required this.time,
    required this.attachments,
    required this.isChecked,
    this.tagColor
  });
}

List<EmailModel> emailList = List.generate(demo_data.length, (index) =>
    EmailModel(
      image: demo_data[index]['image'],
      name: demo_data[index]['name'],
      email: demo_data[index]['email'],
      subject: demo_data[index]['subject'],
      body: demo_data[index]['body'],
      time: DateTime.parse(demo_data[index]['time'] as String),
      attachments: (demo_data[index]['attachments'] as List).map((e) => e as String).toList(),
      isChecked: demo_data[index]['isChecked'],
      tagColor: demo_data[index]['tagColor']
    )
);

List demo_data = [
  {
    "name": "Apple",
    "email" : "support@apple.com",
    "image": "https://picsum.photos/195",
    "subject": "Thanks for reaching out to us, Jan!",
    "body": "Hi John,\n\nJust a friendly reminder that the next payment for your account ending in 5383 is scheduled for automatic withdrawal from your bank account on November 10, 2020."
              "\nAmount to be withdrawn: \$149.99\n\nNo action is needed on your part, we are just keeping you in the loop! Thanks for choosing ABC Business!"
              "\n\nSincerely,\nJane Doe\nABC Business\n555-234-3345\nabcbusiness.com",
    "attachments": [
      "https://picsum.photos/id/237/800/600",
      "https://picsum.photos/id/321/1200",
      "https://picsum.photos/id/195/600/800",
      "https://picsum.photos/id/185/800",
      "https://picsum.photos/id/79/1200/800",
    ],
    "isChecked": false,
    "tagColor": null,
    "time": DateTime.now().toString()
  },
  {
    "name": "Elvia Atkins",
    "email" : "elvia.atkins@outlook.com",
    "image": "https://picsum.photos/196",
    "subject": "Your automatic payment is approaching",
    "body": "Welcome,\n\nOver 40 former Weeknight Chef members took advantage of our special rejoin offer last week and we hope you’ll be next!"
        "\nSign back up today and get your first month plus three dessert kits FREE! Don’t delay — the offer is only valid for the first 100 returning members or until March 31 — whichever comes first."
        "\nClick below to reunite with your inner chef today!\nMay your dinnertime dread be gone,"
        "\n\nThe Weeknight Chef Team\nWeeknight Chef\n555-345-6789\ninfo@weeknightchef.com\nWeeknightchef com",
    "attachments": [
      "https://picsum.photos/id/98/600/800",
      "https://picsum.photos/id/65/800",
      "https://picsum.photos/id/33/1200",
      "https://picsum.photos/id/203/800/600",
    ],
    "isChecked": false,
    "tagColor": null,
    "time": DateTime.now().subtract(const Duration(hours: 5)).toString()
  },
  {
    "name": "Marvin Kiehn",
    "email" : "marvin.kiehn@mail.com",
    "image": "https://picsum.photos/197",
    "subject": "Business-focused empowering the world",
    "body": "Hi Jane,\n\nThanks for visiting Beckers Bicycle today! We are so glad we were able to meet your biking needs."
        "\nIf you have any questions about the item you purchased, or should any issues arise in the future, you can reach us at 555-283-1234 or email help@beckersbicycle.com."
        "\n\nCycle on!\n\nBeckers Bicycle\n931 Lamont Ave.\nBrigham NJ 33455\n555-283-1234\nbeckersbicycle.com\n\nEnjoyed your experience? Leave us a review!",
    "attachments": [],
    "isChecked": false,
    "tagColor": Color(0xFF23CF91),
    "time": DateTime.now().subtract(const Duration(days: 2)).toString(),
  },
  {
    "name": "Domenic Bosco",
    "email" : "domenic.bosco@gmail.com",
    "image": "https://picsum.photos/198",
    "subject": "The fastest way to Design",
    "body": "Dear client,\n\nJust a friendly reminder that the next payment for your account ending in 5383 is scheduled for automatic withdrawal from your bank account on November 10, 2020."
        "\nAmount to be withdrawn: \$149.99\n\nNo action is needed on your part, we are just keeping you in the loop! Thanks for choosing ABC Business!"
        "\n\nSincerely,\nJane Doe\nABC Business\n555-234-3345\nabcbusiness.com",
    "attachments": [
      "https://picsum.photos/id/88/800/1200",
      "https://picsum.photos/id/12/1200",
    ],
    "isChecked": true,
    "tagColor": null,
    "time": DateTime.now().subtract(const Duration(days: 7)).toString(),
  },
  {
    "name": "Elenor Bauch",
    "email" : "elenor.bauch@outlook.com",
    "image": "https://picsum.photos/199",
    "subject": "New job opportunities",
    "body": "Welcome you,\n\nThanks for visiting Beckers Bicycle today! We are so glad we were able to meet your biking needs."
        "\nIf you have any questions about the item you purchased, or should any issues arise in the future, you can reach us at 555-283-1234 or email help@beckersbicycle.com."
        "\n\nCycle on!\n\nBeckers Bicycle\n931 Lamont Ave.\nBrigham NJ 33455\n555-283-1234\nbeckersbicycle.com\n\nEnjoyed your experience? Leave us a review!",
    "attachments": [],
    "isChecked": true,
    "tagColor": Color(0xFF3A6FF7),
    "time": DateTime.now().subtract(const Duration(days: 14)).toString(),
  },
];