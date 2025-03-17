class Restaurant {
  String? nameRestaurant;
  String? descriptionRestaurant;
  String? address;
  String? image;
  String? id;

  Restaurant(
      {this.id,this.nameRestaurant,
        this.descriptionRestaurant,
        this.address,
        this.image});
}

final mockRestaurant = Restaurant(
  address: 'Vincom Center, No. 70 Le Thanh Ton, Ben Nghe Ward, District 1, HCMC',
  nameRestaurant: 'An BBQ Dong Khoi'
);