class IndianState {
  final String name;
  final String code;
  final String capital;
  final String population;
  final List<City> cities;

  IndianState({
    required this.code,
    required this.capital,
    required this.population,
    required this.name,
    required this.cities,
  });

  factory IndianState.fromMap(Map<String, dynamic> map) {
    return IndianState(
      name: map['name'] as String,
      code: map['code'] as String,
      capital: map['capital'] as String,
      population: map['population'] as String,
      cities: (map['cities'] as List)
          .map((cityMap) => City.fromMap(cityMap as Map<String, String>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
      'capital': capital,
      'population': population,
      'cities': cities.map((city) => city.toMap()).toList(),
    };
  }
}


class City {
  final String name;
  final String population;
  final String area;


  City({required this.name, required this.population, required this.area});

  factory City.fromMap(Map<String, String> map) {
    return City(
      name: map['name']!,
      population: map['population']!,
      area: map['area']!,
    );
  }

  Map<String, String> toMap() {
    return {
      'name': name,
      'population': population,
      'area': area,
    };
  }
}
