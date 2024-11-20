/// Represents an Indian state with associated details.
class IndianState {
  /// Name of the state.
  final String name;

  /// Code representing the state (e.g., state abbreviation).
  final String code;

  /// Capital city of the state.
  final String capital;

  /// Population of the state as a string.
  final String population;

  /// Image URL or path representing the state.
  final String image;

  /// List of cities within the state.
  final List<City> cities;

  /// Constructs an [IndianState] object.
  ///
  /// All fields are required and must be provided during object creation.
  IndianState({
    required this.name,
    required this.code,
    required this.capital,
    required this.population,
    required this.image,
    required this.cities,
  });

  /// Factory method to create an [IndianState] object from a [Map].
  ///
  /// The [map] must contain the keys: 'name', 'code', 'capital', 'population',
  /// 'image', and 'cities'. The 'cities' key should be a list of city maps.
  factory IndianState.fromMap(Map<String, dynamic> map) {
    return IndianState(
      name: map['name'] as String,
      code: map['code'] as String,
      image: map['image'] as String,
      capital: map['capital'] as String,
      population: map['population'] as String,
      cities: (map['cities'] as List)
          .map((cityMap) => City.fromMap(cityMap as Map<String, String>))
          .toList(),
    );
  }

  /// Converts the [IndianState] object into a [Map].
  ///
  /// The 'cities' field is converted into a list of maps.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
      'capital': capital,
      'population': population,
      'image': image,
      'cities': cities.map((city) => city.toMap()).toList(),
    };
  }
}

/// Represents a city with its details.
class City {
  /// Name of the city.
  final String name;

  /// Population of the city as a string.
  final String population;

  /// Area of the city as a string.
  final String area;

  /// Constructs a [City] object.
  ///
  /// All fields are required and must be provided during object creation.
  City({
    required this.name,
    required this.population,
    required this.area,
  });

  /// Factory method to create a [City] object from a [Map].
  ///
  /// The [map] must contain the keys: 'name', 'population', and 'area'.
  factory City.fromMap(Map<String, String> map) {
    return City(
      name: map['name']!,
      population: map['population']!,
      area: map['area']!,
    );
  }

  /// Converts the [City] object into a [Map].
  Map<String, String> toMap() {
    return {
      'name': name,
      'population': population,
      'area': area,
    };
  }
}
