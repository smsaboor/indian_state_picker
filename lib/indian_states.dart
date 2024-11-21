import 'indian_state_picker.dart';
/// A predefined list of Indian states with their details.
///
/// This list contains instances of [IndianState] representing Indian states.
/// Each state includes information such as its code, name, population,
/// capital, and an image. The list can be used to display Indian states
/// in pickers, dropdowns, or similar UI components.
final List<IndianState> indianStateList = [
  /// Represents the state of Andhra Pradesh.
  ///
  /// - code: The two-letter code for the state, "AP".
  /// - population: Population of the state as a string, "52221000".
  /// - name: The name of the state, "Andhra Pradesh".
  /// - capital: The capital city, "Amaravati".
  /// - image: Path to the image representing the state.
  /// - cities: An empty list of cities, as this example does not include
  IndianState(
    code: "AP",
    population: "52221000",
    name: "Andhra Pradesh",
    capital: "Amaravati",
    image: "packages/indian_state_picker/assets/ap.jpg",
    cities: [
      City(
          name: "Adoni",
          population: '166537',
          area: '37.31',
          tehsils: ['Adoni']),
      City(
          name: "Amaravati",
          population: '103000',
          area: '217.23',
          tehsils: ['Thullur', 'Amaravati', 'Mangalagiri']),
      City(
          name: "Anantapur",
          population: '267161',
          area: '163.9',
          tehsils: ['Anantapur']),
      City(
          name: "Chandragiri",
          population: '19986',
          area: '14.4',
          tehsils: ['Chandragiri']),
      City(
          name: "Chittoor",
          population: '153756',
          area: '95.97',
          tehsils: ['Chittoor']),
      City(
          name: "Dowlaiswaram",
          population: '44000',
          area: '6.57',
          tehsils: ['Dowlaiswaram']),
      City(
          name: "Eluru",
          population: '283648',
          area: '14.52',
          tehsils: ['Eluru']),
      City(
          name: "Guntur",
          population: '670073',
          area: '168.4',
          tehsils: ['Guntur', 'Tenali']),
      City(
          name: "Kadapa",
          population: '344078',
          area: '164.08',
          tehsils: ['Kadapa']),
      City(
          name: "Kakinada",
          population: '443028',
          area: '30.51',
          tehsils: ['Kakinada']),
      City(
          name: "Kurnool",
          population: '484327',
          area: '69.51',
          tehsils: ['Kurnool']),
      City(
          name: "Machilipatnam",
          population: '169892',
          area: '27.69',
          tehsils: ['Machilipatnam']),
      City(
          name: "Nagarjunakoṇḍa",
          population: 'N/A',
          area: 'N/A',
          tehsils: ['Nagarjunakoṇḍa']),
      City(
          name: "Rajahmundry",
          population: '478199',
          area: '44.5',
          tehsils: ['Rajahmundry']),
      City(
          name: "Srikakulam",
          population: '146988',
          area: '23.8',
          tehsils: ['Srikakulam']),
      City(
          name: "Tirupati",
          population: '374260',
          area: '27.44',
          tehsils: ['Tirupati']),
      City(
          name: "Vijayawada",
          population: '1799871',
          area: '61.88',
          tehsils: ['Vijayawada']),
      City(
          name: "Visakhapatnam",
          population: '1728128',
          area: '681.96',
          tehsils: ['Visakhapatnam']),
      City(
          name: "Vizianagaram",
          population: '228720',
          area: '29.27',
          tehsils: ['Vizianagaram']),
      City(
          name: "Yemmiganur",
          population: '95539',
          area: '15.5',
          tehsils: ['Yemmiganur'])
    ],
    area: "162,970", // Area in sq km
  ),
  IndianState(
    code: "AR",
    population: "1,382,611",
    name: "Arunachal Pradesh",
    capital: "Itanagar",
    image: "packages/indian_state_picker/assets/ar.jpg",
    cities: [],
    area: "83,743",
  ),
  IndianState(
    code: "AS",
    population: "35,607,000",
    name: "Assam",
    capital: "Dispur",
    image: "packages/indian_state_picker/assets/as.jpg",
    cities: [
      City(
          name: "Dhuburi",
          population: '63544',
          area: '8.5',
          tehsils: ['Dhuburi']),
      City(
          name: "Dibrugarh",
          population: '154019',
          area: '15.8',
          tehsils: ['Dibrugarh']),
      City(name: "Dispur", population: 'N/A', area: 'N/A', tehsils: ['Dispur']),
      City(
          name: "Guwahati",
          population: '957352',
          area: '216',
          tehsils: ['Guwahati']),
      City(
          name: "Jorhat",
          population: '153889',
          area: '9.2',
          tehsils: ['Jorhat']),
      City(
          name: "Nagaon",
          population: '147231',
          area: '20.39',
          tehsils: ['Nagaon']),
      City(
          name: "Sivasagar",
          population: '50895',
          area: '4.0',
          tehsils: ['Sivasagar']),
      City(
          name: "Silchar",
          population: '172830',
          area: '15.75',
          tehsils: ['Silchar']),
      City(
          name: "Tezpur",
          population: '102505',
          area: '10.05',
          tehsils: ['Tezpur']),
      City(
          name: "Tinsukia",
          population: '126389',
          area: '12.8',
          tehsils: ['Tinsukia']),
    ],
    area: "78,438",
  ),
  IndianState(
    code: "BR",
    population: "124,800,000",
    name: "Bihar",
    capital: "Patna",
    image: "packages/indian_state_picker/assets/br.jpg",
    cities: [
      City(name: "Ara", population: '261430', area: '19.8', tehsils: ['Ara']),
      City(
          name: "Barauni",
          population: '71725',
          area: '17.6',
          tehsils: ['Barauni']),
      City(
          name: "Begusarai",
          population: '251136',
          area: '19.72',
          tehsils: ['Begusarai']),
      City(
          name: "Bettiah",
          population: '132209',
          area: '16.5',
          tehsils: ['Bettiah']),
      City(
          name: "Bhagalpur",
          population: '410210',
          area: '30.4',
          tehsils: ['Bhagalpur']),
      City(
          name: "Bihar Sharif",
          population: '297268',
          area: '23.53',
          tehsils: ['Bihar Sharif']),
      City(
          name: "Bodh Gaya",
          population: '38731',
          area: '4.0',
          tehsils: ['Bodh Gaya']),
      City(
          name: "Buxar",
          population: '102861',
          area: '16.74',
          tehsils: ['Buxar']),
      City(
          name: "Chapra",
          population: '212955',
          area: '30.5',
          tehsils: ['Chapra']),
      City(
          name: "Darbhanga",
          population: '307840',
          area: '37.54',
          tehsils: ['Darbhanga']),
      City(
          name: "Dehri",
          population: '137231',
          area: '15.2',
          tehsils: ['Dehri']),
      City(
          name: "Dinapur Nizamat",
          population: '182429',
          area: '10.2',
          tehsils: ['Dinapur']),
      City(name: "Gaya", population: '470839', area: '43.2', tehsils: ['Gaya']),
      City(
          name: "Hajipur",
          population: '147688',
          area: '19.64',
          tehsils: ['Hajipur']),
      City(
          name: "Jamalpur",
          population: '105434',
          area: '16.5',
          tehsils: ['Jamalpur']),
      City(
          name: "Katihar",
          population: '240565',
          area: '30.27',
          tehsils: ['Katihar']),
      City(
          name: "Madhubani",
          population: '75863',
          area: '6.2',
          tehsils: ['Madhubani']),
      City(
          name: "Motihari",
          population: '126158',
          area: '16.7',
          tehsils: ['Motihari']),
      City(
          name: "Munger",
          population: '213101',
          area: '22.5',
          tehsils: ['Munger']),
      City(
          name: "Muzaffarpur",
          population: '393724',
          area: '34.0',
          tehsils: ['Muzaffarpur']),
      City(
          name: "Patna",
          population: '1684222',
          area: '135.8',
          tehsils: ['Patna']),
      City(
          name: "Purnia",
          population: '310817',
          area: '32.5',
          tehsils: ['Purnia']),
      City(name: "Pusa", population: 'N/A', area: 'N/A', tehsils: ['Pusa']),
      City(
          name: "Saharsa",
          population: '156540',
          area: '17.6',
          tehsils: ['Saharsa']),
      City(
          name: "Samastipur",
          population: '629663',
          area: '29.98',
          tehsils: ['Samastipur']),
      City(
          name: "Sasaram",
          population: '147408',
          area: '16.1',
          tehsils: ['Sasaram']),
      City(
          name: "Sitamarhi",
          population: '84554',
          area: '10.0',
          tehsils: ['Sitamarhi']),
      City(
          name: "Siwan",
          population: '135066',
          area: '7.36',
          tehsils: ['Siwan']),
    ],
    area: "94,163",
  ),
  IndianState(
    code: "CT",
    population: "29,436,000",
    name: "Chhattisgarh",
    capital: "Raipur",
    image: "packages/indian_state_picker/assets/ct.jpg",
    cities: [
      City(
          name: "Ambikapur",
          population: '114575',
          area: '18.12',
          tehsils: ['Ambikapur']),
      City(
          name: "Bhilai",
          population: '625700',
          area: '133.5',
          tehsils: ['Bhilai']),
      City(
          name: "Bilaspur",
          population: '331030',
          area: '19.3',
          tehsils: ['Bilaspur']),
      City(
          name: "Dhamtari",
          population: '89684',
          area: '7.0',
          tehsils: ['Dhamtari']),
      City(name: "Durg", population: '268679', area: '90.0', tehsils: ['Durg']),
      City(
          name: "Jagdalpur",
          population: '125345',
          area: '26.0',
          tehsils: ['Jagdalpur']),
      City(
          name: "Raipur",
          population: '1010440',
          area: '226.0',
          tehsils: ['Raipur']),
      City(
          name: "Rajnandgaon",
          population: '163122',
          area: '80.4',
          tehsils: ['Rajnandgaon']),
    ],
    area: "135,192",
  ),
  IndianState(
    code: "GA",
    population: "1,586,250",
    name: "Goa",
    capital: "Panaji",
    image: "packages/indian_state_picker/assets/ga.jpg",
    cities: [
      City(
          name: "Madgaon",
          population: "87650",
          area: "–",
          tehsils: ["Salcete"]),
      City(
          name: "Panaji",
          population: "40017",
          area: "36",
          tehsils: ["Tiswadi"]),
    ],
    area: "3,702",
  ),
  IndianState(
    code: "GJ",
    population: "63,872,399",
    name: "Gujarat",
    capital: "Gandhinagar",
    image: "packages/indian_state_picker/assets/gj.jpg",
    cities: [
      City(
          name: "Ahmadabad",
          population: "5570585",
          area: "464",
          tehsils: ["Ahmadabad", "Dholka", "Dhandhuka"]),
      City(
          name: "Rajkot",
          population: "1390000",
          area: "104",
          tehsils: ["Rajkot", "Gondal"]),
      City(
          name: "Surat",
          population: "4500000",
          area: "326.5",
          tehsils: ["Surat", "Bardoli"]),
      City(
          name: "Vadodara",
          population: "2070000",
          area: "220",
          tehsils: ["Vadodara", "Dabhoi", "Padra"]),
      City(
          name: "Bhavnagar",
          population: "605882",
          area: "108",
          tehsils: ["Bhavnagar", "Talaja", "Palitana"]),
      City(
          name: "Dwarka",
          population: "38873",
          area: "–",
          tehsils: ["Dwarka", "Okha"]),
      City(
          name: "Gandhinagar",
          population: "292167",
          area: "177",
          tehsils: ["Gandhinagar"]),
    ],
    area: "196,024",
  ),
  IndianState(
    code: "HR",
    population: "28,672,000",
    name: "Haryana",
    capital: "Chandigarh",
    image: "packages/indian_state_picker/assets/hr.jpg",
    cities: [
      City(
          name: "Chandigarh",
          population: '1055450',
          area: '114',
          tehsils: ['Chandigarh'])
    ],
    area: "44,212",
  ),
  IndianState(
    code: "HP",
    population: "7,300,000",
    name: "Himachal Pradesh",
    capital: "Shimla",
    image: "packages/indian_state_picker/assets/hp.jpg",
    cities: [
      City(
          name: "Bilaspur",
          population: "151187",
          area: "1167",
          tehsils: ["Bilaspur", "Ghumarwin"]),
      City(
          name: "Chamba",
          population: "199231",
          area: "6528",
          tehsils: ["Chamba", "Bharmour"]),
      City(
          name: "Dalhousie",
          population: "7053",
          area: "–",
          tehsils: ["Dalhousie"]),
      City(
          name: "Dharmshala",
          population: "53043",
          area: "5739",
          tehsils: ["Dharmshala", "Palampur"]),
      City(
          name: "Hamirpur",
          population: "454293",
          area: "1118",
          tehsils: ["Hamirpur", "Nadaun"]),
      City(
          name: "Kangra",
          population: "1510075",
          area: "5739",
          tehsils: ["Kangra", "Nurpur"]),
      City(
          name: "Kullu",
          population: "437903",
          area: "5503",
          tehsils: ["Kullu", "Manali"]),
      City(
          name: "Mandi",
          population: "999518",
          area: "3950",
          tehsils: ["Mandi", "Sundernagar"]),
      City(name: "Nahan", population: "28353", area: "–", tehsils: ["Nahan"]),
      City(
          name: "Shimla",
          population: "169578",
          area: "5131",
          tehsils: ["Shimla", "Theog"]),
      City(
          name: "Una",
          population: "521173",
          area: "1540",
          tehsils: ["Una", "Amb"]),
    ],
    area: "55,673",
  ),
  IndianState(
    code: "JK",
    population: "13,606,320",
    name: "Jammu and Kashmir",
    capital: "Srinagar (Summer), Jammu (Winter)",
    image: "packages/indian_state_picker/assets/jk.jpg",
    cities: [
      City(
          name: "Anantnag",
          population: "108505",
          area: "3674",
          tehsils: ["Anantnag", "Bijbehara"]),
      City(
          name: "Baramula",
          population: "167986",
          area: "4588",
          tehsils: ["Baramula", "Sopore"]),
      City(
          name: "Doda",
          population: "213782",
          area: "8912",
          tehsils: ["Doda", "Bhaderwah"]),
      City(
          name: "Gulmarg", population: "1890", area: "–", tehsils: ["Gulmarg"]),
      City(
          name: "Jammu",
          population: "502197",
          area: "2400",
          tehsils: ["Jammu", "Akhnoor"]),
      City(
          name: "Kathua",
          population: "61571",
          area: "2651",
          tehsils: ["Kathua"]),
      City(
          name: "Punch",
          population: "37312",
          area: "1674",
          tehsils: ["Poonch"]),
      City(
          name: "Rajouri",
          population: "41259",
          area: "2630",
          tehsils: ["Rajouri"]),
      City(
          name: "Srinagar",
          population: "1180570",
          area: "2228",
          tehsils: ["Srinagar"]),
      City(
          name: "Udhampur",
          population: "35500",
          area: "2380",
          tehsils: ["Udhampur"]),
    ],
    area: "55,673", // Jammu & Kashmir (Union Territory) post-2019
  ),
  // Continue adding the area for remaining states...
  IndianState(
      code: "JH",
      population: "32988134",
      name: "Jharkhand",
      capital: "Ranchi",
      image: "packages/indian_state_picker/assets/jh.jpg",
      area: '79,716',
      cities: [
        City(
            name: "Bokaro",
            population: "563417",
            area: "2861",
            tehsils: ["Bokaro", "Chas"]),
        City(
            name: "Chaibasa",
            population: "71264",
            area: "1306",
            tehsils: ["Chaibasa"]),
        City(
            name: "Deoghar",
            population: "203116",
            area: "2474",
            tehsils: ["Deoghar"]),
        City(
            name: "Dhanbad",
            population: "1165000",
            area: "2041",
            tehsils: ["Dhanbad"]),
        City(
            name: "Dumka",
            population: "47399",
            area: "3716",
            tehsils: ["Dumka"]),
        City(
            name: "Giridih",
            population: "112535",
            area: "4855",
            tehsils: ["Giridih"]),
        City(
            name: "Hazaribag",
            population: "142489",
            area: "3555",
            tehsils: ["Hazaribagh"]),
        City(
            name: "Jamshedpur",
            population: "629659",
            area: "1496",
            tehsils: ["Jamshedpur"]),
        City(
            name: "Jharia",
            population: "817742",
            area: "–",
            tehsils: ["Jharia"]),
        City(
            name: "Rajmahal",
            population: "22344",
            area: "882",
            tehsils: ["Rajmahal"]),
        City(
            name: "Ranchi",
            population: "1120700",
            area: "1751",
            tehsils: ["Ranchi"]),
        City(
            name: "Saraikela",
            population: "119258",
            area: "1395",
            tehsils: ["Saraikela"]),
      ]),
  IndianState(
      code: "KA",
      population: "67562686",
      name: "Karnataka",
      capital: "Bengaluru",
      image: "packages/indian_state_picker/assets/ka.jpg",
      area: '191,791',
      cities: [
        City(
            name: "Badami",
            population: "30000",
            area: "10",
            tehsils: ["Badami"]),
        City(
            name: "Ballari",
            population: "410445",
            area: "8451",
            tehsils: ["Ballari"]),
        City(
            name: "Bengaluru",
            population: "12000000",
            area: "741",
            tehsils: ["Bengaluru Urban"]),
        City(
            name: "Belagavi",
            population: "610189",
            area: "13415",
            tehsils: ["Belagavi", "Gokak"]),
        City(
            name: "Bhadravati",
            population: "151102",
            area: "67",
            tehsils: ["Bhadravati"]),
        City(
            name: "Bidar",
            population: "216020",
            area: "5448",
            tehsils: ["Bidar"]),
        City(
            name: "Chikkamagaluru",
            population: "118401",
            area: "7201",
            tehsils: ["Chikkamagaluru"]),
        City(
            name: "Chitradurga",
            population: "145853",
            area: "8440",
            tehsils: ["Chitradurga"]),
        City(
            name: "Davangere",
            population: "434971",
            area: "5975",
            tehsils: ["Davangere"]),
        City(
            name: "Halebid",
            population: "15000",
            area: "–",
            tehsils: ["Halebid"]),
        City(
            name: "Hassan",
            population: "133436",
            area: "6826",
            tehsils: ["Hassan"]),
        City(
            name: "Hubballi-Dharwad",
            population: "943857",
            area: "202.3",
            tehsils: ["Hubballi", "Dharwad"]),
        City(
            name: "Kalaburagi",
            population: "532031",
            area: "10952",
            tehsils: ["Kalaburagi"]),
        City(
            name: "Kolar",
            population: "138553",
            area: "8223",
            tehsils: ["Kolar"]),
        City(
            name: "Madikeri",
            population: "33381",
            area: "4101",
            tehsils: ["Madikeri"]),
        City(
            name: "Mandya",
            population: "131211",
            area: "4962",
            tehsils: ["Mandya"]),
        City(
            name: "Mangaluru",
            population: "623841",
            area: "132.45",
            tehsils: ["Mangaluru"]),
        City(
            name: "Mysuru",
            population: "920550",
            area: "128.42",
            tehsils: ["Mysuru"]),
        City(
            name: "Raichur",
            population: "234073",
            area: "6822",
            tehsils: ["Raichur"]),
        City(
            name: "Shivamogga",
            population: "322428",
            area: "8495",
            tehsils: ["Shivamogga"]),
        City(
            name: "Shravanabelagola",
            population: "4500",
            area: "–",
            tehsils: ["Shravanabelagola"]),
        City(
            name: "Shrirangapattana",
            population: "25806",
            area: "–",
            tehsils: ["Shrirangapattana"]),
        City(
            name: "Tumakuru",
            population: "305821",
            area: "10597",
            tehsils: ["Tumakuru"]),
        City(
            name: "Vijayapura",
            population: "327427",
            area: "10541",
            tehsils: ["Vijayapura"]),
      ]),
  IndianState(
      code: "KL",
      population: "35699443",
      name: "Kerala",
      capital: "Thiruvananthapuram",
      image: "packages/indian_state_picker/assets/kl.jpg",
      area: '38,863',
      cities: [
        City(
            name: "Alappuzha",
            population: "174176",
            area: "46",
            tehsils: ["Alappuzha"]),
        City(
            name: "Vatakara",
            population: "75831",
            area: "–",
            tehsils: ["Vatakara"]),
        City(
            name: "Idukki",
            population: "110745",
            area: "4356",
            tehsils: ["Idukki"]),
        City(
            name: "Kannur",
            population: "232486",
            area: "2966",
            tehsils: ["Kannur"]),
        City(
            name: "Kochi",
            population: "677381",
            area: "94.88",
            tehsils: ["Kochi"]),
        City(
            name: "Kollam",
            population: "395000",
            area: "73.03",
            tehsils: ["Kollam"]),
        City(
            name: "Kottayam",
            population: "136812",
            area: "2208",
            tehsils: ["Kottayam"]),
        City(
            name: "Kozhikode",
            population: "432097",
            area: "2345",
            tehsils: ["Kozhikode"]),
        City(
            name: "Mattancheri",
            population: "36474",
            area: "–",
            tehsils: ["Mattancheri"]),
        City(
            name: "Palakkad",
            population: "130955",
            area: "4480",
            tehsils: ["Palakkad"]),
        City(
            name: "Thalassery",
            population: "93265",
            area: "–",
            tehsils: ["Thalassery"]),
        City(
            name: "Thiruvananthapuram",
            population: "957730",
            area: "214.86",
            tehsils: ["Thiruvananthapuram"]),
        City(
            name: "Thrissur",
            population: "315596",
            area: "101",
            tehsils: ["Thrissur"]),
      ]),

  IndianState(
      code: "MP",
      population: "85358965",
      name: "Madhya Pradesh",
      capital: "Bhopal",
      image: "packages/indian_state_picker/assets/mp.jpg",
      area: '308,245',
      cities: [
        City(
            name: "Balaghat",
            population: "846656",
            area: "9245",
            tehsils: ["Balaghat"]),
        City(
            name: "Barwani",
            population: "104403",
            area: "3663",
            tehsils: ["Barwani"]),
        City(
            name: "Betul",
            population: "221113",
            area: "10043",
            tehsils: ["Betul"]),
        City(name: "Bharhut", population: "–", area: "–", tehsils: ["Bharhut"]),
        City(
            name: "Bhind",
            population: "197585",
            area: "4459",
            tehsils: ["Bhind"]),
        City(name: "Bhojpur", population: "–", area: "–", tehsils: ["Bhojpur"]),
        City(
            name: "Bhopal",
            population: "1795648",
            area: "286",
            tehsils: ["Bhopal"]),
        City(
            name: "Burhanpur",
            population: "210891",
            area: "457",
            tehsils: ["Burhanpur"]),
        City(
            name: "Chhatarpur",
            population: "143982",
            area: "8648",
            tehsils: ["Chhatarpur"]),
        City(
            name: "Chhindwara",
            population: "175000",
            area: "11815",
            tehsils: ["Chhindwara"]),
        City(
            name: "Damoh",
            population: "126219",
            area: "7306",
            tehsils: ["Damoh"]),
        City(
            name: "Datia",
            population: "78664",
            area: "2720",
            tehsils: ["Datia"]),
        City(
            name: "Dewas",
            population: "289550",
            area: "7020",
            tehsils: ["Dewas"]),
        City(
            name: "Dhar",
            population: "108093",
            area: "8153",
            tehsils: ["Dhar"]),
        City(
            name: "Dr. Ambedkar Nagar (Mhow)",
            population: "56864",
            area: "–",
            tehsils: ["Mhow"]),
        City(
            name: "Guna",
            population: "180261",
            area: "6485",
            tehsils: ["Guna"]),
        City(
            name: "Gwalior",
            population: "2032036",
            area: "5126",
            tehsils: ["Gwalior"]),
        City(
            name: "Hoshangabad",
            population: "117988",
            area: "5408",
            tehsils: ["Hoshangabad"]),
        City(
            name: "Indore",
            population: "3282250",
            area: "530",
            tehsils: ["Indore"]),
        City(
            name: "Itarsi",
            population: "100574",
            area: "–",
            tehsils: ["Itarsi"]),
        City(
            name: "Jabalpur",
            population: "1444839",
            area: "823",
            tehsils: ["Jabalpur"]),
        City(
            name: "Jhabua",
            population: "352743",
            area: "6793",
            tehsils: ["Jhabua"]),
        City(
            name: "Khajuraho",
            population: "24581",
            area: "–",
            tehsils: ["Khajuraho"]),
        City(
            name: "Khandwa",
            population: "200738",
            area: "6207",
            tehsils: ["Khandwa"]),
        City(
            name: "Khargone",
            population: "133368",
            area: "8030",
            tehsils: ["Khargone"]),
        City(
            name: "Maheshwar",
            population: "27146",
            area: "–",
            tehsils: ["Maheshwar"]),
        City(
            name: "Mandla",
            population: "488068",
            area: "8771",
            tehsils: ["Mandla"]),
        City(
            name: "Mandsaur",
            population: "141667",
            area: "5535",
            tehsils: ["Mandsaur"]),
        City(
            name: "Morena",
            population: "1,965,970",
            area: "4998",
            tehsils: ["Morena", "Ambah", "Porsa"]),
        City(
            name: "Murwara (Katni)",
            population: "221,875",
            area: "50.17",
            tehsils: ["Katni"]),
        City(
            name: "Narsimhapur",
            population: "1,091,854",
            area: "5125",
            tehsils: ["Gadarwara", "Narsimhapur"]),
        City(
            name: "Narsinghgarh",
            population: "58,590",
            area: "NA",
            tehsils: ["Narsinghgarh"]),
        City(
            name: "Neemuch",
            population: "826,067",
            area: "3875",
            tehsils: ["Neemuch", "Manasa", "Jawad"]),
        City(
            name: "Nowgong",
            population: "35,223",
            area: "NA",
            tehsils: ["Nowgong"]),
        City(
            name: "Orchha",
            population: "19,738",
            area: "NA",
            tehsils: ["Orchha"]),
        City(
            name: "Panna",
            population: "1,016,028",
            area: "7135",
            tehsils: ["Panna", "Ajaygarh", "Amanganj"]),
        City(
            name: "Raisen",
            population: "1,331,597",
            area: "8466",
            tehsils: ["Raisen", "Gairatganj", "Bareli"]),
        City(
            name: "Rajgarh",
            population: "1,545,814",
            area: "6154",
            tehsils: ["Rajgarh", "Biaora"]),
        City(
            name: "Ratlam",
            population: "1,455,069",
            area: "4861",
            tehsils: ["Ratlam", "Jaora", "Alot"]),
        City(
            name: "Rewa",
            population: "2,354,220",
            area: "6306",
            tehsils: ["Rewa", "Mauganj", "Teonthar"]),
        City(
            name: "Sagar",
            population: "2,378,458",
            area: "10252",
            tehsils: ["Sagar", "Rahatgarh", "Khurai"]),
        City(
            name: "Satna",
            population: "2,228,619",
            area: "7502",
            tehsils: ["Satna", "Maihar"]),
        City(
            name: "Sehore",
            population: "1,311,008",
            area: "6578",
            tehsils: ["Sehore", "Ashta"]),
        City(
            name: "Seoni",
            population: "1,379,131",
            area: "8758",
            tehsils: ["Seoni", "Lakhnadon"]),
        City(
            name: "Shahdol",
            population: "1,064,989",
            area: "6205",
            tehsils: ["Shahdol", "Burhar"]),
        City(
            name: "Shajapur",
            population: "1,512,681",
            area: "6196",
            tehsils: ["Shajapur", "Kalapipal"]),
        City(
            name: "Sheopur",
            population: "687,952",
            area: "6606",
            tehsils: ["Sheopur", "Vijaypur"]),
        City(
            name: "Shivpuri",
            population: "1,727,733",
            area: "10277",
            tehsils: ["Shivpuri", "Pohri"]),
        City(
            name: "Ujjain",
            population: "1,986,864",
            area: "6091",
            tehsils: ["Ujjain", "Mahidpur"]),
        City(
            name: "Vidisha",
            population: "1,458,212",
            area: "7371",
            tehsils: ["Vidisha", "Sironj"]),
      ]),
  IndianState(
    code: "MH",
    population: "123,144,223",
    name: "Maharashtra",
    capital: "Mumbai",
    image: "packages/indian_state_picker/assets/mh.jpg",
    cities: [
      City(
          name: "Ahmadnagar",
          population: "4,088,077",
          area: "17,413",
          tehsils: ["Ahmadnagar", "Pathardi", "Shevgaon"]),
      City(
          name: "Akola",
          population: "1,813,906",
          area: "5,431",
          tehsils: ["Akola", "Balapur", "Murtijapur"]),
      City(
          name: "Amravati",
          population: "2,888,445",
          area: "12,210",
          tehsils: ["Amravati", "Chandur", "Morshi"]),
      City(
          name: "Aurangabad",
          population: "3,701,282",
          area: "10,100",
          tehsils: ["Aurangabad", "Paithan", "Sillod"]),
      City(
          name: "Bhandara",
          population: "1,200,334",
          area: "3,717",
          tehsils: ["Bhandara", "Tumsar"]),
      City(
          name: "Bhusawal",
          population: "204,016",
          area: "69.72",
          tehsils: ["Bhusawal"]),
      City(
          name: "Bid",
          population: "2,585,049",
          area: "10,693",
          tehsils: ["Bid", "Ambejogai", "Gevrai"]),
      City(
          name: "Buldhana",
          population: "2,586,258",
          area: "9,661",
          tehsils: ["Buldhana", "Malkapur"]),
      City(
          name: "Chandrapur",
          population: "2,204,307",
          area: "11,443",
          tehsils: ["Chandrapur", "Ballarpur"]),
      City(
          name: "Daulatabad",
          population: "NA",
          area: "NA",
          tehsils: ["Daulatabad"]),
      City(
          name: "Dhule",
          population: "2,050,862",
          area: "8,061",
          tehsils: ["Dhule", "Sakri"]),
      City(
          name: "Jalgaon",
          population: "4,224,442",
          area: "11,765",
          tehsils: ["Jalgaon", "Chopda"]),
      City(
          name: "Kalyan",
          population: "1,247,327",
          area: "27",
          tehsils: ["Kalyan"]),
      City(name: "Karli", population: "NA", area: "NA", tehsils: ["Karli"]),
      City(
          name: "Kolhapur",
          population: "3,874,015",
          area: "7,685",
          tehsils: ["Kolhapur", "Ichalkaranji"]),
      City(
          name: "Mahabaleshwar",
          population: "12,737",
          area: "NA",
          tehsils: ["Mahabaleshwar"]),
      City(
          name: "Malegaon",
          population: "720,000",
          area: "12,345",
          tehsils: ["Malegaon"]),
      City(
          name: "Matheran",
          population: "5,000",
          area: "NA",
          tehsils: ["Matheran"]),
      City(
          name: "Mumbai",
          population: "20,961,472",
          area: "603",
          tehsils: ["Mumbai City", "Mumbai Suburban"]),
      City(
          name: "Nagpur",
          population: "2,405,421",
          area: "227.4",
          tehsils: ["Nagpur"]),
      City(
          name: "Nanded",
          population: "3,361,292",
          area: "10,502",
          tehsils: ["Nanded", "Mukhed"]),
      City(
          name: "Nashik",
          population: "6,107,187",
          area: "15,582",
          tehsils: ["Nashik", "Igatpuri"]),
      City(
          name: "Osmanabad",
          population: "1,657,576",
          area: "7,569",
          tehsils: ["Osmanabad", "Tuljapur"]),
      City(
          name: "Pandharpur",
          population: "98,000",
          area: "NA",
          tehsils: ["Pandharpur"]),
      City(
          name: "Parbhani",
          population: "1,835,982",
          area: "6,251",
          tehsils: ["Parbhani", "Gangakhed"]),
      City(
          name: "Pune",
          population: "7,123,802",
          area: "15,643",
          tehsils: ["Pune City", "Baramati"]),
      City(
          name: "Ratnagiri",
          population: "1,615,069",
          area: "8,208",
          tehsils: ["Ratnagiri", "Chiplun"]),
      City(
          name: "Sangli",
          population: "2,822,143",
          area: "8,579",
          tehsils: ["Sangli", "Miraj"]),
      City(
          name: "Satara",
          population: "3,003,741",
          area: "10,480",
          tehsils: ["Satara", "Wai"]),
      City(
          name: "Sevagram",
          population: "NA",
          area: "NA",
          tehsils: ["Sevagram"]),
      City(
          name: "Solapur",
          population: "4,317,756",
          area: "14,895",
          tehsils: ["Solapur", "Akkalkot"]),
      City(
          name: "Thane",
          population: "1,841,488",
          area: "147.96",
          tehsils: ["Thane"]),
      City(
          name: "Ulhasnagar",
          population: "506,098",
          area: "28",
          tehsils: ["Ulhasnagar"]),
      City(
          name: "Vasai-Virar",
          population: "1,221,233",
          area: "380",
          tehsils: ["Vasai"]),
      City(
          name: "Wardha",
          population: "1,300,774",
          area: "6,309",
          tehsils: ["Wardha", "Hinganghat"]),
      City(
          name: "Yavatmal",
          population: "2,772,348",
          area: "13,584",
          tehsils: ["Yavatmal", "Pusad"]),
    ],
    area: "307,713",
  ),
  IndianState(
      code: "MN",
      population: "3091545",
      name: "Manipur",
      capital: "Imphal",
      image: "packages/indian_state_picker/assets/mn.jpg",
      area: '22,327',
      cities: [
        City(
            name: "Imphal",
            population: "514,683",
            area: "NA",
            tehsils: ["Imphal East", "Imphal West"]),
      ]),

  IndianState(
      code: "ML",
      population: "3366710",
      name: "Meghalaya",
      capital: "Shillong",
      image: "packages/indian_state_picker/assets/ml.jpg",
      area: '22,429',
      cities: [
        City(
            name: "Cherrapunji",
            population: "11,000",
            area: "NA",
            tehsils: ["Cherrapunji"]),
        City(
            name: "Shillong",
            population: "354,325",
            area: "64.36",
            tehsils: ["Shillong"]),
      ]),
  IndianState(
      code: "MZ",
      population: "1228000",
      name: "Mizoram",
      capital: "Aizawl",
      image: "packages/indian_state_picker/assets/mz.jpg",
      area: '21,081',
      cities: [
        City(
            name: "Aizawl",
            population: "293,416",
            area: "457",
            tehsils: ["Aizawl"]),
        City(
            name: "Lunglei",
            population: "57,011",
            area: "NA",
            tehsils: ["Lunglei"]),
      ]),
  IndianState(
      code: "NL",
      population: "2249695",
      name: "Nagaland",
      capital: "Kohima",
      image: "packages/indian_state_picker/assets/nl.jpg",
      area: '16,579',
      cities: [
        City(
            name: "Kohima",
            population: "267,988",
            area: "NA",
            tehsils: ["Kohima"]),
        City(name: "Mon", population: "250,260", area: "NA", tehsils: ["Mon"]),
        City(
            name: "Phek", population: "163,294", area: "NA", tehsils: ["Phek"]),
        City(
            name: "Wokha",
            population: "166,239",
            area: "NA",
            tehsils: ["Wokha"]),
        City(
            name: "Zunheboto",
            population: "140,757",
            area: "NA",
            tehsils: ["Zunheboto"]),
      ]),
  IndianState(
      code: "OR",
      population: "46356334",
      name: "Odisha",
      capital: "Bhubaneswar",
      image: "packages/indian_state_picker/assets/or.jpg",
      area: '155,707',
      cities: [
        City(
            name: "Balangir",
            population: "164,857",
            area: "6,575",
            tehsils: ["Balangir", "Patnagarh"]),
        City(
            name: "Baleshwar",
            population: "2,317,419",
            area: "3,634",
            tehsils: ["Baleshwar", "Nilagiri"]),
        City(
            name: "Baripada",
            population: "116,874",
            area: "NA",
            tehsils: ["Baripada"]),
        City(
            name: "Bhubaneshwar",
            population: "885,363",
            area: "135",
            tehsils: ["Bhubaneshwar"]),
        City(
            name: "Brahmapur",
            population: "355,823",
            area: "NA",
            tehsils: ["Brahmapur"]),
        City(
            name: "Cuttack",
            population: "606,007",
            area: "192",
            tehsils: ["Cuttack"]),
        City(
            name: "Dhenkanal",
            population: "1,192,811",
            area: "4,452",
            tehsils: ["Dhenkanal", "Kamakhyanagar"]),
        City(
            name: "Kendujhar",
            population: "1,802,777",
            area: "8,336",
            tehsils: ["Kendujhar", "Barbil"]),
        City(
            name: "Konark",
            population: "15,000",
            area: "NA",
            tehsils: ["Konark"]),
        City(
            name: "Koraput",
            population: "1,379,647",
            area: "8,807",
            tehsils: ["Koraput", "Jeypore"]),
        City(
            name: "Paradip",
            population: "68,585",
            area: "NA",
            tehsils: ["Paradip"]),
        City(
            name: "Phulabani",
            population: "36,000",
            area: "NA",
            tehsils: ["Phulabani"]),
        City(
            name: "Puri",
            population: "201,026",
            area: "3,479",
            tehsils: ["Puri"]),
        City(
            name: "Sambalpur",
            population: "335,761",
            area: "6,702",
            tehsils: ["Sambalpur"]),
        City(
            name: "Udayagiri",
            population: "NA",
            area: "NA",
            tehsils: ["Udayagiri"]),
      ]),
  IndianState(
      code: "PB",
      population: "30141373",
      name: "Punjab",
      capital: "Chandigarh",
      image: "packages/indian_state_picker/assets/pb.jpg",
      area: '50,362',
      cities: [
        City(
            name: "Amritsar",
            population: "1,132,761",
            area: "2,683",
            tehsils: ["Amritsar"]),
        City(
            name: "Batala",
            population: "156,400",
            area: "NA",
            tehsils: ["Batala"]),
        City(
            name: "Chandigarh",
            population: "1,055,450",
            area: "114",
            tehsils: ["Chandigarh"]),
        City(
            name: "Faridkot",
            population: "618,008",
            area: "1,472",
            tehsils: ["Faridkot"]),
        City(
            name: "Firozpur",
            population: "1,003,895",
            area: "2,190",
            tehsils: ["Firozpur"]),
        City(
            name: "Gurdaspur",
            population: "1,623,725",
            area: "3,564",
            tehsils: ["Gurdaspur"]),
        City(
            name: "Hoshiarpur",
            population: "1,586,625",
            area: "3,365",
            tehsils: ["Hoshiarpur"]),
        City(
            name: "Jalandhar",
            population: "2,193,590",
            area: "3,401",
            tehsils: ["Jalandhar"]),
        City(
            name: "Kapurthala",
            population: "881,717",
            area: "1,634",
            tehsils: ["Kapurthala"]),
        City(
            name: "Ludhiana",
            population: "3,498,739",
            area: "3,767",
            tehsils: ["Ludhiana"]),
        City(
            name: "Nabha",
            population: "67,972",
            area: "NA",
            tehsils: ["Nabha"]),
        City(
            name: "Patiala",
            population: "2,989,000",
            area: "3,212",
            tehsils: ["Patiala"]),
        City(
            name: "Rupnagar",
            population: "684,627",
            area: "1,400",
            tehsils: ["Rupnagar"]),
        City(
            name: "Sangrur",
            population: "1,655,169",
            area: "3,685",
            tehsils: ["Sangrur"]),
      ]),
  IndianState(
      code: "RJ",
      population: "81032689",
      name: "Rajasthan",
      capital: "Jaipur",
      image: "packages/indian_state_picker/assets/rj.jpg",
      area: '342,239',
      cities: [
        City(name: "Abu", population: "NA", area: "NA", tehsils: ["Abu"]),
        City(
            name: "Ajmer",
            population: "1,255,000",
            area: "8,341",
            tehsils: ["Ajmer", "Kishangarh"]),
        City(
            name: "Alwar",
            population: "1,474,000",
            area: "8,380",
            tehsils: ["Alwar"]),
        City(name: "Amer", population: "39,000", area: "NA", tehsils: ["Amer"]),
        City(
            name: "Barmer",
            population: "2,451,000",
            area: "28,388",
            tehsils: ["Barmer"]),
        City(
            name: "Beawar",
            population: "137,000",
            area: "NA",
            tehsils: ["Beawar"]),
        City(
            name: "Bharatpur",
            population: "2,446,000",
            area: "5,139",
            tehsils: ["Bharatpur"]),
        City(
            name: "Bhilwara",
            population: "1,554,000",
            area: "5,527",
            tehsils: ["Bhilwara"]),
        City(
            name: "Bikaner",
            population: "650,000",
            area: "27,244",
            tehsils: ["Bikaner"]),
        City(
            name: "Bundi",
            population: "94,000",
            area: "NA",
            tehsils: ["Bundi"]),
        City(
            name: "Chittaurgarh",
            population: "3,003,000",
            area: "12,869",
            tehsils: ["Chittaurgarh"]),
        City(
            name: "Churu",
            population: "2,375,000",
            area: "6,781",
            tehsils: ["Churu"]),
        City(
            name: "Dhaulpur",
            population: "1,120,000",
            area: "3,199",
            tehsils: ["Dhaulpur"]),
        City(
            name: "Dungarpur",
            population: "1,058,000",
            area: "3,712",
            tehsils: ["Dungarpur"]),
        City(
            name: "Ganganagar",
            population: "1,460,000",
            area: "10,063",
            tehsils: ["Ganganagar"]),
        City(
            name: "Hanumangarh",
            population: "1,000,000",
            area: "5,621",
            tehsils: ["Hanumangarh"]),
        City(
            name: "Jaipur",
            population: "3,073,000",
            area: "467",
            tehsils: ["Jaipur"]),
        City(
            name: "Jaisalmer",
            population: "78,000",
            area: "38,401",
            tehsils: ["Jaisalmer"]),
        City(
            name: "Jalor",
            population: "1,130,000",
            area: "8,686",
            tehsils: ["Jalor"]),
        City(
            name: "Jhalawar",
            population: "1,393,000",
            area: "6,337",
            tehsils: ["Jhalawar"]),
        City(
            name: "Jhunjhunu",
            population: "1,372,000",
            area: "5,607",
            tehsils: ["Jhunjhunu"]),
        City(
            name: "Jodhpur",
            population: "1,581,000",
            area: "22,850",
            tehsils: ["Jodhpur"]),
        City(
            name: "Kishangarh",
            population: "221,000",
            area: "NA",
            tehsils: ["Kishangarh"]),
        City(
            name: "Kota",
            population: "1,401,000",
            area: "5,801",
            tehsils: ["Kota"]),
        City(
            name: "Merta",
            population: "74,000",
            area: "NA",
            tehsils: ["Merta"]),
        City(
            name: "Nagaur",
            population: "3,110,000",
            area: "17,748",
            tehsils: ["Nagaur"]),
        City(
            name: "Nathdwara",
            population: "53,000",
            area: "NA",
            tehsils: ["Nathdwara"]),
        City(
            name: "Pali",
            population: "877,000",
            area: "12,485",
            tehsils: ["Pali"]),
        City(
            name: "Phalodi",
            population: "78,000",
            area: "NA",
            tehsils: ["Phalodi"]),
        City(
            name: "Pushkar",
            population: "15,000",
            area: "NA",
            tehsils: ["Pushkar"]),
        City(
            name: "Sawai Madhopur",
            population: "287,000",
            area: "NA",
            tehsils: ["Sawai Madhopur"]),
        City(
            name: "Shahpura",
            population: "NA",
            area: "NA",
            tehsils: ["Shahpura"]),
        City(
            name: "Sikar",
            population: "2,515,000",
            area: "10,440",
            tehsils: ["Sikar"]),
        City(
            name: "Sirohi",
            population: "1,020,000",
            area: "5,500",
            tehsils: ["Sirohi"]),
        City(
            name: "Tonk",
            population: "1,210,000",
            area: "7,854",
            tehsils: ["Tonk"]),
        City(
            name: "Udaipur",
            population: "451,000",
            area: "64",
            tehsils: ["Udaipur"]),
      ]),
  IndianState(
      code: "SK",
      population: "610577",
      name: "Sikkim",
      capital: "Gangtok",
      image: "packages/indian_state_picker/assets/sk.jpg",
      area: '7,096',
      cities: [
        City(
            name: "Gangtok",
            population: "100,000",
            area: "NA",
            tehsils: ["Gangtok"]),
        City(
            name: "Gyalshing",
            population: "NA",
            area: "NA",
            tehsils: ["Gyalshing"]),
        City(
            name: "Lachung",
            population: "NA",
            area: "NA",
            tehsils: ["Lachung"]),
        City(name: "Mangan", population: "NA", area: "NA", tehsils: ["Mangan"]),
      ]),
  IndianState(
      code: "TN",
      population: "77841267",
      name: "Tamil Nadu",
      capital: "Chennai",
      image: "packages/indian_state_picker/assets/tn.jpg",
      area: '130,058',
      cities: [
        City(name: "Arcot", population: "NA", area: "NA", tehsils: ["Arcot"]),
        City(
            name: "Chengalpattu",
            population: "NA",
            area: "NA",
            tehsils: ["Chengalpattu"]),
        City(
            name: "Chennai",
            population: "7,088,000",
            area: "426",
            tehsils: ["Chennai"]),
        City(
            name: "Chidambaram",
            population: "87,000",
            area: "NA",
            tehsils: ["Chidambaram"]),
        City(
            name: "Coimbatore",
            population: "1,057,000",
            area: "1,100",
            tehsils: ["Coimbatore"]),
        City(
            name: "Cuddalore",
            population: "447,000",
            area: "NA",
            tehsils: ["Cuddalore"]),
        City(
            name: "Dharmapuri",
            population: "420,000",
            area: "5,247",
            tehsils: ["Dharmapuri"]),
        City(
            name: "Dindigul",
            population: "2,00,000",
            area: "NA",
            tehsils: ["Dindigul"]),
        City(
            name: "Erode",
            population: "1,391,000",
            area: "8,232",
            tehsils: ["Erode"]),
        City(
            name: "Kanchipuram",
            population: "1,68,000",
            area: "4,304",
            tehsils: ["Kanchipuram"]),
        City(
            name: "Kanniyakumari",
            population: "1,90,000",
            area: "NA",
            tehsils: ["Kanniyakumari"]),
        City(
            name: "Kodaikanal",
            population: "NA",
            area: "NA",
            tehsils: ["Kodaikanal"]),
        City(
            name: "Kumbakonam",
            population: "150,000",
            area: "NA",
            tehsils: ["Kumbakonam"]),
        City(
            name: "Madurai",
            population: "1,502,000",
            area: "3,598",
            tehsils: ["Madurai"]),
        City(
            name: "Mamallapuram",
            population: "NA",
            area: "NA",
            tehsils: ["Mamallapuram"]),
        City(
            name: "Nagappattinam",
            population: "NA",
            area: "NA",
            tehsils: ["Nagappattinam"]),
        City(
            name: "Nagercoil",
            population: "1,04,000",
            area: "NA",
            tehsils: ["Nagercoil"]),
        City(
            name: "Palayamkottai",
            population: "100,000",
            area: "NA",
            tehsils: ["Palayamkottai"]),
        City(
            name: "Pudukkottai",
            population: "1,59,000",
            area: "NA",
            tehsils: ["Pudukkottai"]),
        City(
            name: "Rajapalayam",
            population: "64,000",
            area: "NA",
            tehsils: ["Rajapalayam"]),
        City(
            name: "Ramanathapuram",
            population: "8,60,000",
            area: "2,275",
            tehsils: ["Ramanathapuram"]),
        City(
            name: "Salem",
            population: "8,47,000",
            area: "5,125",
            tehsils: ["Salem"]),
        City(
            name: "Thanjavur",
            population: "8,00,000",
            area: "2,895",
            tehsils: ["Thanjavur"]),
        City(
            name: "Tiruchchirappalli",
            population: "847,000",
            area: "146",
            tehsils: ["Tiruchchirappalli"]),
        City(
            name: "Tirunelveli",
            population: "474,000",
            area: "68",
            tehsils: ["Tirunelveli"]),
        City(
            name: "Tiruppur",
            population: "444,000",
            area: "163",
            tehsils: ["Tiruppur"]),
        City(
            name: "Thoothukudi",
            population: "477,000",
            area: "137",
            tehsils: ["Thoothukudi"]),
        City(
            name: "Udhagamandalam",
            population: "120,000",
            area: "44",
            tehsils: ["Udhagamandalam"]),
        City(
            name: "Vellore",
            population: "530,000",
            area: "87",
            tehsils: ["Vellore"]),
      ]),
  IndianState(
      code: "TG",
      population: "35003674",
      name: "Telangana",
      capital: "Hyderabad",
      image: "packages/indian_state_picker/assets/tg.jpg",
      area: '112,077',
      cities: [
        City(
            name: "Hyderabad",
            population: "6,809,000",
            area: "650",
            tehsils: ["Hyderabad", "Secunderabad"]),
        City(
            name: "Karimnagar",
            population: "400,000",
            area: "78",
            tehsils: ["Karimnagar"]),
        City(
            name: "Khammam",
            population: "314,000",
            area: "100",
            tehsils: ["Khammam"]),
        City(
            name: "Mahbubnagar",
            population: "500,000",
            area: "129",
            tehsils: ["Mahbubnagar"]),
        City(
            name: "Nizamabad",
            population: "377,000",
            area: "53",
            tehsils: ["Nizamabad"]),
        City(
            name: "Sangareddi",
            population: "220,000",
            area: "48",
            tehsils: ["Sangareddi"]),
        City(
            name: "Warangal",
            population: "590,000",
            area: "122",
            tehsils: ["Warangal"]),
      ]),
  IndianState(
      code: "TR",
      population: "4169794",
      name: "Tripura",
      capital: "Agartala",
      image: "packages/indian_state_picker/assets/tr.jpg",
      area: '10,486',
      cities: [
        City(
            name: "Agartala",
            population: "400,000",
            area: "78",
            tehsils: ["Agartala"]),
      ]),
  IndianState(
    code: "UP",
    population: "240,000,000",
    name: "Uttar Pradesh",
    capital: "Lucknow",
    image: "packages/indian_state_picker/assets/up.jpg",
    cities: [
      City(name: "Lucknow", population: '2817105', area: '2528', tehsils: [
        'Lucknow',
        'Mohanlalganj',
        'Malihabad',
        'Sarojini Nagar',
        'Bakshi Ka Talab'
      ]),
      City(
          name: "Kanpur",
          population: '2765348',
          area: '3155',
          tehsils: ['Kanpur Sadar', 'Bilhaur', 'Ghatampur']),
      City(
          name: "Agra",
          population: '1585704',
          area: '10863',
          tehsils: ['Agra Sadar', 'Fatehabad', 'Etmadpur', 'Kheragarh']),
      City(
          name: "Meerut",
          population: '1305429',
          area: '2590',
          tehsils: ['Meerut Sadar', 'Mawana', 'Sardhana']),
      City(
          name: "Varanasi",
          population: '1198491',
          area: '1535',
          tehsils: ['Varanasi Sadar', 'Pindra', 'Raja Talab']),
      City(
          name: "Allahabad",
          population: '1112544',
          area: '5482',
          tehsils: ['Allahabad Sadar', 'Karchhana', 'Phulpur', 'Soraon']),
      City(name: "Bareilly", population: '903668', area: '4120', tehsils: [
        'Bareilly Sadar',
        'Meerganj',
        'Nawabganj',
        'Aonla',
        'Faridpur'
      ]),
      City(
          name: "Saharanpur",
          population: '705478',
          area: '3689',
          tehsils: ['Saharanpur Sadar', 'Behat', 'Nakur']),
      City(name: "Gorakhpur", population: '673446', area: '3483.8', tehsils: [
        'Gorakhpur Sadar',
        'Bansgaon',
        'Chauri Chaura',
        'Sahjanwa'
      ]),
      City(
          name: "Firozabad",
          population: '604214',
          area: '2407',
          tehsils: ['Firozabad', 'Shikohabad', 'Jasrana', 'Tundla']),
      City(
          name: "Jhansi",
          population: '505693',
          area: '5024',
          tehsils: ['Jhansi', 'Mauranipur', 'Moth', 'Garautha'])
    ],
    area: "243,286",
  ),
  IndianState(
      code: "UT",
      population: "11250877",
      name: "Uttarakhand",
      capital: "Dehradun (Winter), Gairsain (Summer)",
      image: "packages/indian_state_picker/assets/ut.jpg",
      area: '53,483',
      cities: [
        City(
            name: "Almora",
            population: "100,000",
            area: "52",
            tehsils: ["Almora"]),
        City(
            name: "Dehra Dun",
            population: "500,000",
            area: "250",
            tehsils: ["Dehra Dun"]),
        City(
            name: "Haridwar",
            population: "300,000",
            area: "64",
            tehsils: ["Haridwar"]),
        City(
            name: "Mussoorie",
            population: "30,000",
            area: "64",
            tehsils: ["Mussoorie"]),
        City(
            name: "Nainital",
            population: "40,000",
            area: "12",
            tehsils: ["Nainital"]),
        City(
            name: "Pithoragarh",
            population: "65,000",
            area: "55",
            tehsils: ["Pithoragarh"]),
      ]),
  IndianState(
      code: "WB",
      population: "99609303",
      name: "West Bengal",
      capital: "Kolkata",
      image: "packages/indian_state_picker/assets/wb.jpg",
      area: '88,752',
      cities: [
        City(
            name: "Alipore",
            population: "120,000",
            area: "33",
            tehsils: ["Alipore"]),
        City(
            name: "Alipur Duar",
            population: "140,000",
            area: "57",
            tehsils: ["Alipur Duar"]),
        City(
            name: "Asansol",
            population: "1,200,000",
            area: "118",
            tehsils: ["Asansol"]),
        City(
            name: "Baharampur",
            population: "220,000",
            area: "62",
            tehsils: ["Baharampur"]),
        City(
            name: "Bally",
            population: "80,000",
            area: "29",
            tehsils: ["Bally"]),
        City(
            name: "Balurghat",
            population: "120,000",
            area: "62",
            tehsils: ["Balurghat"]),
        City(
            name: "Bankura",
            population: "350,000",
            area: "86",
            tehsils: ["Bankura"]),
        City(
            name: "Baranagar",
            population: "300,000",
            area: "20",
            tehsils: ["Baranagar"]),
        City(
            name: "Barasat",
            population: "200,000",
            area: "34",
            tehsils: ["Barasat"]),
        City(
            name: "Barrackpore",
            population: "300,000",
            area: "73",
            tehsils: ["Barrackpore"]),
        City(
            name: "Basirhat",
            population: "160,000",
            area: "40",
            tehsils: ["Basirhat"]),
        City(
            name: "Bhatpara",
            population: "300,000",
            area: "15",
            tehsils: ["Bhatpara"]),
        City(
            name: "Bishnupur",
            population: "100,000",
            area: "23",
            tehsils: ["Bishnupur"]),
        City(
            name: "Budge Budge",
            population: "150,000",
            area: "55",
            tehsils: ["Budge Budge"]),
        City(
            name: "Burdwan",
            population: "400,000",
            area: "132",
            tehsils: ["Burdwan"]),
        City(
            name: "Chandernagore",
            population: "180,000",
            area: "34",
            tehsils: ["Chandernagore"]),
        City(
            name: "Darjeeling",
            population: "130,000",
            area: "10",
            tehsils: ["Darjeeling"]),
        City(
            name: "Diamond Harbour",
            population: "90,000",
            area: "60",
            tehsils: ["Diamond Harbour"]),
        City(
            name: "Dum Dum",
            population: "500,000",
            area: "42",
            tehsils: ["Dum Dum"]),
        City(
            name: "Durgapur",
            population: "600,000",
            area: "153",
            tehsils: ["Durgapur"]),
        City(
            name: "Halisahar",
            population: "75,000",
            area: "17",
            tehsils: ["Halisahar"]),
        City(
            name: "Haora",
            population: "1,000,000",
            area: "60",
            tehsils: ["Haora"]),
        City(
            name: "Hugli",
            population: "350,000",
            area: "55",
            tehsils: ["Hugli"]),
        City(
            name: "Ingraj Bazar",
            population: "10,000",
            area: "5",
            tehsils: ["Ingraj Bazar"]),
        City(
            name: "Jalpaiguri",
            population: "100,000",
            area: "60",
            tehsils: ["Jalpaiguri"]),
        City(
            name: "Kalimpong",
            population: "55,000",
            area: "40",
            tehsils: ["Kalimpong"]),
        City(
            name: "Kamarhati",
            population: "200,000",
            area: "12",
            tehsils: ["Kamarhati"]),
        City(
            name: "Kanchrapara",
            population: "90,000",
            area: "25",
            tehsils: ["Kanchrapara"]),
        City(
            name: "Kharagpur",
            population: "200,000",
            area: "56",
            tehsils: ["Kharagpur"]),
        City(
            name: "Cooch Behar",
            population: "150,000",
            area: "61",
            tehsils: ["Cooch Behar"]),
        City(
            name: "Kolkata",
            population: "4,500,000",
            area: "185",
            tehsils: ["Kolkata"]),
        City(
            name: "Krishnanagar",
            population: "150,000",
            area: "34",
            tehsils: ["Krishnanagar"]),
        City(
            name: "Malda",
            population: "300,000",
            area: "122",
            tehsils: ["Malda"]),
        City(
            name: "Midnapore",
            population: "120,000",
            area: "43",
            tehsils: ["Midnapore"]),
        City(
            name: "Murshidabad",
            population: "150,000",
            area: "104",
            tehsils: ["Murshidabad"]),
        City(
            name: "Nabadwip",
            population: "60,000",
            area: "21",
            tehsils: ["Nabadwip"]),
        City(
            name: "Palashi",
            population: "20,000",
            area: "9",
            tehsils: ["Palashi"]),
        City(
            name: "Panihati",
            population: "90,000",
            area: "18",
            tehsils: ["Panihati"]),
        City(
            name: "Purulia",
            population: "300,000",
            area: "67",
            tehsils: ["Purulia"]),
        City(
            name: "Raiganj",
            population: "120,000",
            area: "54",
            tehsils: ["Raiganj"]),
        City(
            name: "Santipur",
            population: "100,000",
            area: "39",
            tehsils: ["Santipur"]),
        City(
            name: "Shantiniketan",
            population: "30,000",
            area: "10",
            tehsils: ["Shantiniketan"]),
        City(
            name: "Shrirampur",
            population: "200,000",
            area: "75",
            tehsils: ["Shrirampur"]),
        City(
            name: "Siliguri",
            population: "700,000",
            area: "151",
            tehsils: ["Siliguri"]),
        City(
            name: "Siuri",
            population: "50,000",
            area: "16",
            tehsils: ["Siuri"]),
        City(
            name: "Tamluk",
            population: "100,000",
            area: "41",
            tehsils: ["Tamluk"]),
        City(
            name: "Titagarh",
            population: "150,000",
            area: "22",
            tehsils: ["Titagarh"]),
      ]),
  // Add other states...
];
