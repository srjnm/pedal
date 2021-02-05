class Cycle {
  Cycle({
    this.name,
    this.image,
    this.smallDesc,
    this.desc,
    this.material,
    this.price,
    this.height,
    this.width,
    this.weight,
  });

  String name;
  String image;
  String smallDesc;
  String desc;
  String material;
  double price;
  double height;
  double width;
  double weight;
}

List<Cycle> cycles = [
  Cycle(
    name: 'Santa Cruz',
    image: 'santacruz.png',
    smallDesc: 'The true downhiller\'s trail bike that’s magnificently capable across vast swathes of terrain types.',
    desc: 'Santa Cruz is touted as a versatile quiver killer; that is to say it’s supposed to be one bike to rule them all, adept at taking on all-day epics and flowing trails while tackling hardcore descents without missing a beat.',
    material: 'Carbon Fibre',
    price: 21999.0,
    height: 0.92,
    width: 1.8,
    weight: 11.46,
  ),
  Cycle(
    name: 'Focus',
    image: 'focus.png',
    smallDesc: 'A beautifully built, fun to ride trail bike with a few quirks.',
    desc: 'Focus is certainly a clean-looking machine. It has combined a frame with aggressive, fixed-gear, street-bike like angles and a short wheelbase with a simple 1x drivetrain and efficient all-weather Shimano disc brakes, fast-rolling tyres and a design that is all about fast handling to give you the best level of confidence for commuting and urban riding.',
    material: 'Steel',
    price: 17999.0,
    height: 0.85,
    width: 1.77,
    weight: 15.68,
  ),
  Cycle(
    name: 'Boxx',
    image: 'box.png',
    smallDesc: 'Super tough, great riding and highly versatile.',
    desc: 'Boxx is quite simply a gravel bike. While it takes commuting in its stride, it’s much happier on back lanes, bouncing through potholes on the way to bridleways. ',
    material: 'Steel',
    price: 8999.0,
    height: 0.88,
    width: 1.64,
    weight: 15.48,
  ),
];