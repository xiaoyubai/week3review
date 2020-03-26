class Category {
  String name;
  String image;
  String imagePath;

  Category(this.name, this.image) {
    this.name = name;
    this.image = image;
    getImagePath();
  }

  void getImagePath() {
    imagePath = 'assets/images/categories/$image';
  }

  String toString() {
      return "name: $name\nimage: $image\nimage path: $image";
  }
}