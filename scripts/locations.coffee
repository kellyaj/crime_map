class Locations

  getCategoryFor: (location) ->
    locationCategory = _.find @category(), (category) =>
      _.contains(category.members, location)
    if locationCategory then locationCategory.name else "OTHER"

  category: ->
    "BANK": {
      name: "BANK",
      members: [
        "COIN OPERATED MACHINE",
        "ATM (AUTOMATIC TELLER MACHINE)",
        "BANK",
        "CREDIT UNION",
        "CURRENCY EXCHANGE",
        "SAVINGS AND LOAN"
        ]
      },
    "BAR": {
      name: "BAR",
      members: [
        "BAR OR TAVERN",
        "TAVERN/LIQUOR STORE"
        ]
      },
    "BUS": {
      name: "BUS",
      members: [
        "CTA BUS",
        "CTA BUS STOP"
        ]
      },
    "BUSINESS": {
      name: "BUSINESS",
      members: [
        "APPLIANCE STORE",
        "ANIMAL HOSPITAL",
        "ATHLETIC CLUB",
        "BARBERSHOP",
        "BOWLING ALLEY",
        "CAR WASH",
        "CLEANING STORE",
        "COMMERCIAL / BUSINESS OFFICE",
        "CONVENIENCE STORE",
        "DEPARTMENT STORE",
        "DRUG STORE",
        "GAS STATION",
        "GROCERY FOOD STORE",
        "PAWN SHOP",
        "SMALL RETAIL STORE"
        ]
      },
    "HOME": {
      name: "HOME",
      members: [
        "APARTMENT",
        "CHA APARTMENT",
        "RESIDENCE-GARAGE",
        "RESIDENCE PORCH/HALLWAY",
        "RESIDENTIAL YARD (FRONT/BACK)",
        "HOUSE",
        "RESIDENCE"
        ]
      },
    "HOSPITAL": {
      name: "HOSPITAL",
      members: [
        "HOSPITAL BUILDING/GROUNDS",
        "MEDICAL/DENTAL OFFICE"
        ]
      },
    "HOTEL": {
      name: "HOTEL",
      members: [
        "HOTEL/MOTEL"
        ]
      },
    "PARK": {
      name: "PARK",
      members: [
        "PARK PROPERTY",
        "FOREST PRESERVE",
        "LAKEFRONT/WATERFRONT/RIVERBANK"
        ]
      },
    "RESTAURANT": {
      name: "RESTAURANT",
      members: [
         "RESTAURANT"
        ]
      },
    "SCHOOL": {
      name: "SCHOOL",
      members: [
        "COLLEGE/UNIVERSITY GROUNDS",
        "COLLEGE/UNIVERSITY RESIDENCE HALL",
        "SCHOOL, PRIVATE, BUILDING",
        "SCHOOL, PRIVATE, GROUNDS",
        "SCHOOL, PUBLIC, BUILDING",
        "SCHOOL, PUBLIC, GROUNDS"
        ]
      },
    "STREET": {
      name: "STREET",
      members: [
        "ALLEY",
        "BRIDGE",
        "SIDEWALK",
        "STREET",
        "HIGHWAY/EXPRESSWAY"
        ]
      },
    "TAXI": {
      name: "TAXI",
      members: [
        "TAXICAB"
        ]
      },
    "TRAIN": {
      name: "TRAIN",
      members: [
        "CTA PLATFORM",
        "CTA TRAIN",
        "OTHER RAILROAD PROP / TRAIN DEPOT"
        ]
      },
    "OTHER": {
      name: "OTHER",
      members: [
        "AIRCRAFT",
        "AIRPORT/AIRCRAFT",
        "AIRPORT BUILDING NON-TERMINAL - NON-SECURE AREA",
        "AIRPORT BUILDING NON-TERMINAL - SECURE AREA",
        "AIRPORT EXTERIOR - NON-SECURE AREA",
        "AIRPORT EXTERIOR - SECURE AREA",
        "AIRPORT PARKING LOT",
        "AIRPORT TERMINAL LOWER LEVEL - NON-SECURE AREA",
        "AIRPORT TERMINAL MEZZANINE - NON-SECURE AREA",
        "AIRPORT TERMINAL UPPER LEVEL - NON-SECURE AREA",
        "AIRPORT TERMINAL UPPER LEVEL - SECURE AREA",
        "AIRPORT VENDING ESTABLISHMENT",
        "ABANDONED BUILDING",
        "CEMETARY",
        "VACANT LOT/LAND",
        "CONSTRUCTION SITE",
        "CHURCH/SYNAGOGUE/PLACE OF WORSHIP",
        "FACTORY/MANUFACTURING BUILDING",
        "SPORTS ARENA/STADIUM",
        "FEDERAL BUILDING",
        "GOVERNMENT BUILDING/PROPERTY",
        "DAY CARE CENTER",
        "NURSING HOME/RETIREMENT HOME",
        "NURSING HOME",
        "FIRE STATION",
        "PORCH",
        "POOL ROOM",
        "OTHER COMMERCIAL TRANSPORTATION",
        "AUTO",
        "DELIVERY TRUCK",
        "DRIVEWAY - RESIDENTIAL",
        "MOVIE HOUSE/THEATER",
        "OTHER",
        "JAIL / LOCK-UP FACILITY",
        "LIBRARY",
        "PARKING LOT/GARAGE(NON.RESID.)",
        "POLICE FACILITY/VEH PARKING LOT",
        "RESIDENCE-GARAGE"
        ]
      }

  iconSpans: ->
    "BANK"       : '<span class="location-icon icon-bank"></span>'
    "BAR"        : '<span class="location-icon icon-bar"></span>'
    "BUS"        : '<span class="location-icon icon-bus"></span>'
    "BUSINESS"   : '<span class="location-icon icon-business"></span>'
    "HOME"       : '<span class="location-icon icon-home"></span>'
    "HOSPITAL"   : '<span class="location-icon icon-hospital"></span>'
    "HOTEL"      : '<span class="location-icon icon-hotel"></span>'
    "PARK"       : '<span class="location-icon icon-park"></span>'
    "RESTAURANT" : '<span class="location-icon icon-restaurant"></span>'
    "SCHOOL"     : '<span class="location-icon icon-school"></span>'
    "STREET"     : '<span class="location-icon icon-street"></span>'
    "TAXI"       : '<span class="location-icon icon-taxi"></span>'
    "TRAIN"      : '<span class="location-icon icon-train"></span>'
    "OTHER"      : '<span class="location-icon icon-other"></span>'

window.Locations = Locations

"AIRCRAFT"
"AIRPORT/AIRCRAFT"
"AIRPORT BUILDING NON-TERMINAL - NON-SECURE AREA"
"AIRPORT BUILDING NON-TERMINAL - SECURE AREA"
"AIRPORT EXTERIOR - NON-SECURE AREA"
"AIRPORT EXTERIOR - SECURE AREA"
"AIRPORT PARKING LOT"
"AIRPORT TERMINAL LOWER LEVEL - NON-SECURE AREA"
"AIRPORT TERMINAL MEZZANINE - NON-SECURE AREA"
"AIRPORT TERMINAL UPPER LEVEL - NON-SECURE AREA"
"AIRPORT TERMINAL UPPER LEVEL - SECURE AREA"
"AIRPORT VENDING ESTABLISHMENT"
"ABANDONED BUILDING"
"CEMETARY"
"VACANT LOT/LAND"
"CONSTRUCTION SITE"
"CHURCH/SYNAGOGUE/PLACE OF WORSHIP"
"FACTORY/MANUFACTURING BUILDING"
"SPORTS ARENA/STADIUM"
"FEDERAL BUILDING"
"GOVERNMENT BUILDING/PROPERTY"
"DAY CARE CENTER"
"NURSING HOME/RETIREMENT HOME"
"NURSING HOME"
"FIRE STATION"
"PORCH"
"POOL ROOM"
"OTHER COMMERCIAL TRANSPORTATION"
"AUTO"
"DELIVERY TRUCK"
"DRIVEWAY - RESIDENTIAL"
"MOVIE HOUSE/THEATER"
"OTHER"
"JAIL / LOCK-UP FACILITY"
"LIBRARY"
"PARKING LOT/GARAGE(NON.RESID.)"
"POLICE FACILITY/VEH PARKING LOT"
"RESIDENCE-GARAGE"

"BRIDGE"
"ALLEY"
"SIDEWALK"
"STREET"

"APARTMENT"
"CHA APARTMENT"
"CHA HALLWAY/STAIRWELL/ELEVATOR"
"CHA PARKING LOT/GROUNDS"
"HOUSE"
"RESIDENCE"

"RESIDENCE PORCH/HALLWAY"
"RESIDENTIAL YARD (FRONT/BACK)"

"RESTAURANT"

"APPLIANCE STORE"
"ANIMAL HOSPITAL"
"ATHLETIC CLUB"
"BARBERSHOP"
"BOWLING ALLEY"
"CAR WASH"
"CLEANING STORE"
"COMMERCIAL / BUSINESS OFFICE"
"CONVENIENCE STORE"
"DEPARTMENT STORE"
"DRUG STORE"
"GAS STATION"
"GROCERY FOOD STORE"
"PAWN SHOP"
"SMALL RETAIL STORE"

"COLLEGE/UNIVERSITY GROUNDS"
"COLLEGE/UNIVERSITY RESIDENCE HALL"
"SCHOOL, PRIVATE, BUILDING"
"SCHOOL, PRIVATE, GROUNDS"
"SCHOOL, PUBLIC, BUILDING"
"SCHOOL, PUBLIC, GROUNDS"

"BAR OR TAVERN"
"TAVERN/LIQUOR STORE"

"COIN OPERATED MACHINE"
"ATM (AUTOMATIC TELLER MACHINE)"
"BANK"
"CREDIT UNION"
"CURRENCY EXCHANGE"
"SAVINGS AND LOAN"

"CTA BUS"
"CTA BUS STOP"
"CTA GARAGE/OTHER PROPERTY"

"TAXICAB"

"CTA PLATFORM"
"CTA TRAIN"
"OTHER RAILROAD PROP / TRAIN DEPOT"

"HIGHWAY/EXPRESSWAY"

"HOSPITAL BUILDING/GROUNDS"
"MEDICAL/DENTAL OFFICE"

"PARK PROPERTY"
"FOREST PRESERVE"
"LAKEFRONT/WATERFRONT/RIVERBANK"

"HOTEL/MOTEL"
