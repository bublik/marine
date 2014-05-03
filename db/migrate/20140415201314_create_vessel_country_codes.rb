class CreateVesselCountryCodes < ActiveRecord::Migration
  def change
    create_table :vessel_country_codes do |t|
      t.string :code
      t.string :name

      t.timestamps
    end

    {"AFG" => 'AFGHANISTAN',
     "ALB" => 'ALBANIA',
     "DZA" => 'ALGERIA',
     "ASM" => 'AMERICAN SAMOA',
     "AND" => 'ANDORRA',
     "AGO" => 'ANGOLA',
     "AIA" => 'ANGUILLA',
     "ATA" => 'ANTARCTICA',
     "ATG" => 'ANTIGUA AND BARBUDA',
     "ARG" => 'ARGENTINA',
     "ARM" => 'ARMENIA',
     "ABW" => 'ARUBA',
     "AUS" => 'AUSTRALIA',
     "AUT" => 'AUSTRIA',
     "AZE" => 'AZERBAIJAN',
     "BHS" => 'BAHAMAS',
     "BHR" => 'BAHRAIN',
     "BGD" => 'BANGLADESH',
     "BRB" => 'BARBADOS',
     "BLR" => 'BELARUS',
     "BEL" => 'BELGIUM',
     "BLZ" => 'BELIZE',
     "BEN" => 'BENIN',
     "BMU" => 'BERMUDA',
     "BTN" => 'BHUTAN',
     "BOL" => 'BOLIVIA',
     "BIH" => 'BOSNIA AND HERZEGOWINA',
     "BWA" => 'BOTSWANA',
     "BVT" => 'BOUVET ISLAND',
     "BRA" => 'BRAZIL',
     "IOT" => 'BRITISH INDIAN OCEAN TERRITORY',
     "BRN" => 'BRUNEI DARUSSALAM',
     "BGR" => 'BULGARIA',
     "BFA" => 'BURKINA FASO',
     "BDI" => 'BURUNDI',
     "KHM" => 'CAMBODIA',
     "CMR" => 'CAMEROON',
     "CAN" => 'CANADA',
     "CPV" => 'CAPE VERDE',
     "CYM" => 'CAYMAN ISLANDS',
     "CAF" => 'CENTRAL AFRICAN REPUBLIC',
     "TCD" => 'CHAD',
     "CHL" => 'CHILE',
     "CHN" => 'CHINA',
     "CXR" => 'CHRISTMAS ISLAND',
     "CCK" => 'COCOS (KEELING) ISLANDS',
     "COL" => 'COLOMBIA',
     "COM" => 'COMOROS',
     "COD" => 'CONGO, Democratic Republic of (was Zaire)',
     "COG" => 'CONGO, People s Republic of',
     "COK" => 'COOK ISLANDS',
     "CRI" => 'COSTA RICA',
     "CIV" => 'COTE D IVOIRE',
     "HRV" => 'CROATIA (local name: Hrvatska)',
     "CUB" => 'CUBA',
     "CYP" => 'CYPRUS',
     "CZE" => 'CZECH REPUBLIC',
     "DNK" => 'DENMARK',
     "DJI" => 'DJIBOUTI',
     "DMA" => 'DOMINICA',
     "DOM" => 'DOMINICAN REPUBLIC',
     "TLS" => 'EAST TIMOR',
     "ECU" => 'ECUADOR',
     "EGY" => 'EGYPT',
     "SLV" => 'EL SALVADOR',
     "GNQ" => 'EQUATORIAL GUINEA',
     "ERI" => 'ERITREA',
     "EST" => 'ESTONIA',
     "ETH" => 'ETHIOPIA',
     "FLK" => 'FALKLAND ISLANDS (MALVINAS)',
     "FRO" => 'FAROE ISLANDS',
     "FJI" => 'FIJI',
     "FIN" => 'FINLAND',
     "FRA" => 'FRANCE',
     "FXX" => 'FRANCE, METROPOLITAN',
     "GUF" => 'FRENCH GUIANA',
     "PYF" => 'FRENCH POLYNESIA',
     "ATF" => 'FRENCH SOUTHERN TERRITORIES',
     "GAB" => 'GABON',
     "GMB" => 'GAMBIA',
     "GEO" => 'GEORGIA',
     "DEU" => 'GERMANY',
     "GHA" => 'GHANA',
     "GIB" => 'GIBRALTAR',
     "GRC" => 'GREECE',
     "GRL" => 'GREENLAND',
     "GRD" => 'GRENADA',
     "GLP" => 'GUADELOUPE',
     "GUM" => 'GUAM',
     "GTM" => 'GUATEMALA',
     "GIN" => 'GUINEA',
     "GNB" => 'GUINEA-BISSAU',
     "GUY" => 'GUYANA',
     "HTI" => 'HAITI',
     "HMD" => 'HEARD AND MC DONALD ISLANDS',
     "HND" => 'HONDURAS',
     "HKG" => 'HONG KONG',
     "HUN" => 'HUNGARY',
     "ISL" => 'ICELAND',
     "IND" => 'INDIA',
     "IDN" => 'INDONESIA',
     "IRN" => 'IRAN (ISLAMIC REPUBLIC OF)',
     "IRQ" => 'IRAQ',
     "IRL" => 'IRELAND',
     "ISR" => 'ISRAEL',
     "ITA" => 'ITALY',
     "JAM" => 'JAMAICA',
     "JPN" => 'JAPAN',
     "JOR" => 'JORDAN',
     "KAZ" => 'KAZAKHSTAN',
     "KEN" => 'KENYA',
     "KIR" => 'KIRIBATI',
     "PRK" => 'KOREA, DEMOCRATIC PEOPLE S REPUBLIC OF',
     "KOR" => 'KOREA, REPUBLIC OF',
     "KWT" => 'KUWAIT',
     "KGZ" => 'KYRGYZSTAN',
     "LAO" => 'LAO PEOPLE S DEMOCRATIC REPUBLIC',
     "LVA" => 'LATVIA',
     "LBN" => 'LEBANON',
     "LSO" => 'LESOTHO',
     "LBR" => 'LIBERIA',
     "LBY" => 'LIBYAN ARAB JAMAHIRIYA',
     "LIE" => 'LIECHTENSTEIN',
     "LTU" => 'LITHUANIA',
     "LUX" => 'LUXEMBOURG',
     "MAC" => 'MACAU',
     "MKD" => 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF',
     "MDG" => 'MADAGASCAR',
     "MWI" => 'MALAWI',
     "MYS" => 'MALAYSIA',
     "MDV" => 'MALDIVES',
     "MLI" => 'MALI',
     "MLT" => 'MALTA',
     "MHL" => 'MARSHALL ISLANDS',
     "MTQ" => 'MARTINIQUE',
     "MRT" => 'MAURITANIA',
     "MUS" => 'MAURITIUS',
     "MYT" => 'MAYOTTE',
     "MEX" => 'MEXICO',
     "FSM" => 'MICRONESIA, FEDERATED STATES OF',
     "MDA" => 'MOLDOVA',
     "MCO" => 'MONACO',
     "MNG" => 'MONGOLIA',
     "MSR" => 'MONTSERRAT',
     "MAR" => 'MOROCCO',
     "MOZ" => 'MOZAMBIQUE',
     "MMR" => 'MYANMAR',
     "NAM" => 'NAMIBIA',
     "NRU" => 'NAURU',
     "NPL" => 'NEPAL',
     "NLD" => 'NETHERLANDS',
     "ANT" => 'NETHERLANDS ANTILLES',
     "NCL" => 'NEW CALEDONIA',
     "NZL" => 'NEW ZEALAND',
     "NIC" => 'NICARAGUA',
     "NER" => 'NIGER',
     "NGA" => 'NIGERIA',
     "NIU" => 'NIUE',
     "NFK" => 'NORFOLK ISLAND',
     "MNP" => 'NORTHERN MARIANA ISLANDS',
     "NOR" => 'NORWAY',
     "OMN" => 'OMAN',
     "PAK" => 'PAKISTAN',
     "PLW" => 'PALAU',
     "PSE" => 'PALESTINIAN TERRITORY, Occupied',
     "PAN" => 'PANAMA',
     "PNG" => 'PAPUA NEW GUINEA',
     "PRY" => 'PARAGUAY',
     "PER" => 'PERU',
     "PHL" => 'PHILIPPINES',
     "PCN" => 'PITCAIRN',
     "POL" => 'POLAND',
     "PRT" => 'PORTUGAL',
     "PRI" => 'PUERTO RICO',
     "QAT" => 'QATAR',
     "REU" => 'REUNION',
     "ROU" => 'ROMANIA',
     "RUS" => 'RUSSIA',
     "RWA" => 'RWANDA',
     "KNA" => 'SAINT KITTS AND NEVIS',
     "LCA" => 'SAINT LUCIA',
     "VCT" => 'SAINT VINCENT AND THE GRENADINES',
     "WSM" => 'SAMOA',
     "SMR" => 'SAN MARINO',
     "STP" => 'SAO TOME AND PRINCIPE',
     "SAU" => 'SAUDI ARABIA',
     "SEN" => 'SENEGAL',
     "SYC" => 'SEYCHELLES',
     "SLE" => 'SIERRA LEONE',
     "SGP" => 'SINGAPORE',
     "SVK" => 'SLOVAKIA (Slovak Republic)',
     "SVN" => 'SLOVENIA',
     "SLB" => 'SOLOMON ISLANDS',
     "SOM" => 'SOMALIA',
     "ZAF" => 'SOUTH AFRICA',
     "SGS" => 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS',
     "ESP" => 'SPAIN',
     "LKA" => 'SRI LANKA',
     "SHN" => 'ST. HELENA',
     "SPM" => 'ST. PIERRE AND MIQUELON',
     "SDN" => 'SUDAN',
     "SUR" => 'SURINAME',
     "SJM" => 'SVALBARD AND JAN MAYEN ISLANDS',
     "SWZ" => 'SWAZILAND',
     "SWE" => 'SWEDEN',
     "CHE" => 'SWITZERLAND',
     "SYR" => 'SYRIAN ARAB REPUBLIC',
     "TWN" => 'TAIWAN',
     "TJK" => 'TAJIKISTAN',
     "TZA" => 'TANZANIA, UNITED REPUBLIC OF',
     "THA" => 'THAILAND',
     "TGO" => 'TOGO',
     "TKL" => 'TOKELAU',
     "TON" => 'TONGA',
     "TTO" => 'TRINIDAD AND TOBAGO',
     "TUN" => 'TUNISIA',
     "TUR" => 'TURKEY',
     "TKM" => 'TURKMENISTAN',
     "TCA" => 'TURKS AND CAICOS ISLANDS',
     "TUV" => 'TUVALU',
     "UGA" => 'UGANDA',
     "UKR" => 'UKRAINE',
     "ARE" => 'UNITED ARAB EMIRATES',
     "GBR" => 'UNITED KINGDOM',
     "USA" => 'UNITED STATES',
     "UMI" => 'UNITED STATES MINOR OUTLYING ISLANDS',
     "URY" => 'URUGUAY',
     "UZB" => 'UZBEKISTAN',
     "VUT" => 'VANUATU',
     "VAT" => 'VATICAN CITY STATE (HOLY SEE)',
     "VEN" => 'VENEZUELA',
     "VNM" => 'VIET NAM',
     "VGB" => 'VIRGIN ISLANDS (BRITISH)',
     "VIR" => 'VIRGIN ISLANDS (U.S.)',
     "WLF" => 'WALLIS AND FUTUNA ISLANDS',
     "ESH" => 'WESTERN SAHARA',
     "YEM" => 'YEMEN',
     "YUG" => 'YUGOSLAVIA',
     "ZMB" => 'ZAMBIA',
     "ZWE" => 'ZIMBABWE',
     "XXX" => 'UNKNOWN',
     "SRB" => 'SERBIA',
     "MNE" => 'MONTENEGRO',
     "IMN" => 'ISLE OF MAN',
     "JEY" => 'JERSEY',
     "GGY" => 'Guernsey',
     "CUW" => 'Curacao'}.each_pair do |code, name|
      VesselCountryCode.create!(code: code, name: name)
    end

  end
end