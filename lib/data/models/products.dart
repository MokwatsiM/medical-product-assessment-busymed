class ProductModel {
  ProductModel({
    this.products,
  });

  List<Product> products;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class ProductOption {
  ProductOption({
    this.id,
    this.productId,
    this.sku,
    this.barcode,
    this.code,
    this.size,
    this.oldid,
    this.product,
  });

  int id;

  int productId;
  String sku;
  String barcode;
  String code;
  String size;
  String oldid;
  Product product;

  factory ProductOption.fromJson(Map<String, dynamic> json) => ProductOption(
        id: json["id"],
        productId: json["product_id"],
        sku: json["sku"] == null ? null : json["sku"],
        barcode: json["barcode"],
        code: json["code"] == null ? null : json["code"],
        size: json["size"],
        oldid: json["oldid"] == null ? null : json["oldid"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "sku": sku == null ? null : sku,
        "barcode": barcode,
        "code": code == null ? null : code,
        "size": size,
        "oldid": oldid == null ? null : oldid,
        "product": product.toJson(),
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.description,
    this.productType,
    this.dosage,
    this.quantity,
    this.gender,
    this.image,
    this.scheduleReq,
    this.active,
    this.categoryId,
    this.subcategoryId,
    this.subsubcategoryId,
    this.oldid,
    this.brandId,
    this.unitId,
    this.typeId,
    this.schedule,
    this.productOptions,
    this.unit,
    this.type,
    this.category,
    this.subcategory,
    this.subsubcategory,
    this.brand,
  });

  int id;

  String name;
  String description;
  String productType;
  String dosage;
  Quantity quantity;
  Gender gender;
  String image;
  ScheduleReq scheduleReq;
  Active active;
  int categoryId;
  int subcategoryId;
  int subsubcategoryId;
  String oldid;
  int brandId;
  int unitId;
  int typeId;
  Schedule schedule;
  List<ProductOption> productOptions;
  Type unit;
  Type type;
  Brand category;
  Brand subcategory;
  Brand subsubcategory;
  Brand brand;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        productType: json["product_type"],
        dosage: json["dosage"],
        quantity: quantityValues.map[json["quantity"]],
        gender: genderValues.map[json["gender"]],
        image: json["image"],
        scheduleReq: scheduleReqValues.map[json["schedule_req"]],
        active: activeValues.map[json["active"]],
        // categoryId: json["category_id"],
        // subcategoryId:
        //     json["subcategory_id"] == null ? null : json["subcategory_id"],
        // subsubcategoryId: json["subsubcategory_id"] == null
        //     ? null
        //     : json["subsubcategory_id"],
        // oldid: json["oldid"],
        // brandId: json["brand_id"],
        // unitId: json["unit_id"] == null ? null : json["unit_id"],
        // typeId: json["type_id"] == null ? null : json["type_id"],
        schedule: scheduleValues.map[json["schedule"]],
        productOptions: json["product_options"] == null
            ? null
            : List<ProductOption>.from(
                json["product_options"].map((x) => ProductOption.fromJson(x))),
        unit: json["unit"] == null ? null : Type.fromJson(json["unit"]),
        type: json["type"] == null ? null : Type.fromJson(json["type"]),
        category:
            json["category"] == null ? null : Brand.fromJson(json["category"]),
        subcategory: json["subcategory"] == null
            ? null
            : Brand.fromJson(json["subcategory"]),
        subsubcategory: json["subsubcategory"] == null
            ? null
            : Brand.fromJson(json["subsubcategory"]),

        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
      );

  Map<String, dynamic> toJson() {
    return {
      // "id": id,
      "name": name,
      "description": description,
      "product_type": productTypeValues.reverse[productType],
      "dosage": dosage,
      "quantity": quantityValues.reverse[quantity],
      "gender": genderValues.reverse[gender],
      "image": image,
      "schedule_req": scheduleReqValues.reverse[scheduleReq],
      "active": activeValues.reverse[active],
      // "category_id": categoryId,
      // "subcategory_id": subcategoryId == null ? null : subcategoryId,
      // "subsubcategory_id": subsubcategoryId == null ? null : subsubcategoryId,
      // "oldid": oldid,
      // "brand_id": brandId,
      // "unit_id": unitId == null ? null : unitId,
      // "type_id": typeId == null ? null : typeId,

      "schedule": scheduleValues.reverse[schedule],
      // "product_options": productOptions == null
      //     ? null
      //     : List<dynamic>.from(productOptions.map((x) => x.toJson())),
      "unit": unit == null ? null : unit.toJson(),
      "type": type == null ? null : type.toJson(),
      "category": category == null ? null : category.toJson(),
      "subcategory": subcategory == null ? null : subcategory.toJson(),
      "subsubcategory": subsubcategory == null ? null : subsubcategory.toJson(),
      "brand": brand == null ? null : brand.toJson()
    };
  }
}

enum Active { Y, N }

final activeValues = EnumValues({"N": Active.N, "Y": Active.Y});

class Brand {
  Brand({
    this.id,
    this.name,
    this.updatedAt,
    this.oldid,
    this.image,
    this.parentId,
    this.main,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  String oldid;
  String image;
  int parentId;
  Active main;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        oldid: json["oldid"],
        image: json["image"] == null ? null : json["image"],
        parentId: json["parent_id"] == null ? null : json["parent_id"],
        main: json["main"] == null ? null : activeValues.map[json["main"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "oldid": oldid,
        "image": image == null ? null : image,
        "parent_id": parentId == null ? null : parentId,
        "main": main == null ? null : activeValues.reverse[main],
      };
}

enum Gender { M, F }

final genderValues = EnumValues({"F": Gender.F, "M": Gender.M});

enum ProductType { MEDICINE, GENERAL }

final productTypeValues = EnumValues(
    {"General": ProductType.GENERAL, "Medicine": ProductType.MEDICINE});

enum Quantity { ML, EMPTY, MG, G }

final quantityValues = EnumValues({
  "": Quantity.EMPTY,
  "g": Quantity.G,
  "mg": Quantity.MG,
  "ml": Quantity.ML
});

enum Schedule { S2, EMPTY, S0, S1 }

final scheduleValues = EnumValues({
  "": Schedule.EMPTY,
  "S0": Schedule.S0,
  "S1": Schedule.S1,
  "S2": Schedule.S2
});

enum ScheduleReq { N, EMPTY }

final scheduleReqValues =
    EnumValues({"": ScheduleReq.EMPTY, "N": ScheduleReq.N});

class Type {
  Type({
    this.id,
    this.name,
    this.show,
  });

  int id;
  String name;

  Active show;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: json["name"],
        show: json["show"] == null ? null : activeValues.map[json["show"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "show": show == null ? null : activeValues.reverse[show],
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
