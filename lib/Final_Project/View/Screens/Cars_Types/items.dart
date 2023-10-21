class Item {
  final String imgPath;
  final String name;
  final double price;
  final String location;
  final String Car_Type_id;
  final String pageName;
  int selectedDays;



  Item(
      {
        required this.pageName,
        required this.Car_Type_id,
        required this.imgPath,
        required this.name,
        required this.price,
        this.location = "Amman",
        this.selectedDays = 1,
      });
}

List<Item> items = [

  //electric

  Item(name: "HiPhi", imgPath: "assets/Electric/HiPhi.jpg", price: 80, Car_Type_id: '1', pageName: 'Electric Cars'),
  Item(name: "Hyundai Kona", imgPath: "assets/Electric/HyundaiKona.jpg", price: 70, Car_Type_id: '1', pageName: 'Electric Cars'),
  Item(name: "ARCFOX S", imgPath: "assets/Electric/ARCFOXS.jpg", price: 65, Car_Type_id: '1', pageName: 'Electric Cars'),
  Item(name: "Atto 3SUv", imgPath: "assets/Electric/Atto3SUv.jpg", price: 50, Car_Type_id: '1', pageName: 'Electric Cars'),
  Item(name: "EV6", imgPath: "assets/Electric/EV6.jpg", price: 60, Car_Type_id: '1', pageName: 'Electric Cars'),
  Item(name: "Aiways U5", imgPath: "assets/Electric/AiwaysU5.jpg", price: 70, Car_Type_id: '1', pageName: 'Electric Cars'),
  Item(name: "I-PACE", imgPath: "assets/Electric/I-PACE.jpg", price: 45, Car_Type_id: '1', pageName: 'Electric Cars'),
  Item(name: "ID.3", imgPath: "assets/Electric/ID.3.jpg", price: 80, Car_Type_id: '1', pageName: 'Electric Cars'),
  Item(name: "ID.4", imgPath: "assets/Electric/ID.4.jpg", price: 90, Car_Type_id: '1', pageName: 'Electric Cars'),
  Item(name: "IX M60", imgPath: "assets/Electric/IXM60.jpg", price: 60, Car_Type_id: '1', pageName: 'Electric Cars'),
  Item(name: "NIO ES8", imgPath: "assets/Electric/NIOES8.jpg", price: 75, Car_Type_id: '1', pageName: 'Electric Cars'),
  Item(name: "SUVs", imgPath: "assets/Electric/SUVs.jpg", price: 55, Car_Type_id: '1', pageName: 'Electric Cars'),
  Item(name: "Toyota bZ4X", imgPath: "assets/Electric/ToyotabZ4X.jpg", price: 75, Car_Type_id: '1', pageName: 'Electric Cars'),
  Item(name: "UNI-T", imgPath: "assets/Electric/UNI-T.jpg", price: 60, Car_Type_id: '1', pageName: 'Electric Cars'),

  //gasoline

  Item(name: "Audi A6", imgPath: "assets/Gasoline/AudiA6.jpg", price: 50, Car_Type_id: '3', pageName: 'Gasoline Cars'),
  Item(name: "Audi Q8", imgPath: "assets/Gasoline/AudiQ8.jpg", price: 90, Car_Type_id: '3', pageName: 'Gasoline Cars'),
  Item(name: "Captiva", imgPath: "assets/Gasoline/Captiva.jpg", price: 50, Car_Type_id: '3', pageName: 'Gasoline Cars'),
  Item(name: "Civic", imgPath: "assets/Gasoline/Civic.jpg", price: 50, Car_Type_id: '3', pageName: 'Gasoline Cars'),
  Item(name: "CLA_Class", imgPath: "assets/Gasoline/CLA_Class.jpg", price: 50, Car_Type_id: '3', pageName: 'Gasoline Cars'),
  Item(name: "Dodge", imgPath: "assets/Gasoline/Dodge.jpg", price: 70, Car_Type_id: '3', pageName: 'Gasoline Cars'),
  Item(name: "Gains", imgPath: "assets/Gasoline/Gains.jpg", price: 60, Car_Type_id: '3', pageName: 'Gasoline Cars'),
  Item(name: "Hybrid4", imgPath: "assets/Gasoline/Hybrid4.jpg", price: 50, Car_Type_id: '3', pageName: 'Gasoline Cars'),
  Item(name: "Kia Stonic", imgPath: "assets/Gasoline/KiaStonic.jpg", price: 75, Car_Type_id: '3', pageName: 'Gasoline Cars'),
  Item(name: "Mazda CX-5", imgPath: "assets/Gasoline/MazdaCX-5.jpg", price: 80, Car_Type_id: '3', pageName: 'Gasoline Cars'),
  Item(name: "Pilot", imgPath: "assets/Gasoline/Pilot.jpg", price: 50, Car_Type_id: '3', pageName: 'Gasoline Cars'),
  Item(name: "Titan", imgPath: "assets/Gasoline/Titan.jpg", price: 40, Car_Type_id: '3', pageName: 'Gasoline Cars'),
  Item(name: "VinFast A2.0", imgPath: "assets/Gasoline/VinFastA2.0.jpg", price: 55, Car_Type_id: '3', pageName: 'Gasoline Cars'),
  Item(name: "Volvo XC40", imgPath: "assets/Gasoline/VolvoXC40.jpg", price: 70, Car_Type_id: '3', pageName: 'Gasoline Cars'),

  //Hybrid

  Item(name: "Bentayga", imgPath: "assets/Hybrid/Bentayga.jpg", price: 50, Car_Type_id: '2', pageName: 'Hybrid Cars'),
  Item(name: "Ford Fusion", imgPath: "assets/Hybrid/FordFusion.jpg", price: 90, Car_Type_id: '2', pageName: 'Hybrid Cars'),
  Item(name: "GLC63S", imgPath: "assets/Hybrid/GLC63S.jpg", price: 50, Car_Type_id: '2', pageName: 'Hybrid Cars'),
  Item(name: "Highlander", imgPath: "assets/Hybrid/Highlander.jpg", price: 50, Car_Type_id: '2', pageName: 'Hybrid Cars'),
  Item(name: "Ioniq", imgPath: "assets/Hybrid/Ioniq.jpg", price: 50, Car_Type_id: '2', pageName: 'Hybrid Cars'),
  Item(name: "Lexus UX", imgPath: "assets/Hybrid/LexusUX.jpg", price: 70, Car_Type_id: '2', pageName: 'Hybrid Cars'),
  Item(name: "Nissan Altima", imgPath: "assets/Hybrid/NissanAltima.jpg", price: 60, Car_Type_id: '2', pageName: 'Hybrid Cars'),
  Item(name: "Novo", imgPath: "assets/Hybrid/Novo.jpg", price: 50, Car_Type_id: '2', pageName: 'Hybrid Cars'),
  Item(name: "Peugeot", imgPath: "assets/Hybrid/Peugeot.jpg", price: 75, Car_Type_id: '2', pageName: 'Hybrid Cars'),
  Item(name: "Sonata", imgPath: "assets/Hybrid/Sonata.jpg", price: 80, Car_Type_id: '2', pageName: 'Hybrid Cars'),
  Item(name: "SUVs", imgPath: "assets/Hybrid/SUVs.jpg", price: 50, Car_Type_id: '2', pageName: 'Hybrid Cars'),
  Item(name: "Tucson", imgPath: "assets/Hybrid/Tucson.jpg", price: 40, Car_Type_id: '2', pageName: 'Hybrid Cars'),
  Item(name: "Unveils", imgPath: "assets/Hybrid/Unveils.jpg", price: 55, Car_Type_id: '2', pageName: 'Hybrid Cars'),
  Item(name: "Venza", imgPath: "assets/Hybrid/Venza.jpg", price: 70, Car_Type_id: '2', pageName: 'Hybrid Cars'),
];