class IncidentCategories

  primary: ->
    "OTHER": [
        "ARSON",
        "GAMBLING",
        "INTERFERENCE WITH PUBLIC OFFICE",
        "LIQUOR LAW VIOLATION",
        "NARCOTICS",
        "NON-CRIMINAL",
        "OFFENSE INVOLVING CHILDREN",
        "OTHER NARCOTIC VIOLATION",
        "OTHER OFFENSE",
        "PROSTITUTION",
        "PUBLIC PEACE VIOLATION",
        "WEAPONS VIOLATION"
      ],
    "PERSONAL": [
      "DECEPTIVE PRACTICE",
      "INTIMIDATION",
      "OBSCENITY",
      "STALKING"
    ],
    "PROPERTY": [
      "BURGLARY",
      "CRIMINAL DAMAGE",
      "CRIMINAL TRESPASS",
      "MOTOR VEHICLE THEFT",
      "ROBBERY",
      "THEFT"
    ],
    "VIOLENT": [
      "ASSAULT",
      "BATTERY",
      "CRIM SEXUAL ASSAULT",
      "HOMICIDE",
      "KIDNAPPING",
      "SEX OFFENSE"
    ]

  isViolent: (selectedType) ->
    _.contains @primary()["VIOLENT"], selectedType

  isProperty: (selectedType) ->
    _.contains @primary()["PROPERTY"], selectedType

  isPersonal: (selectedType) ->
    _.contains @primary()["PERSONAL"], selectedType

  isOther: (selectedType) ->
    _.contains @primary()["OTHER"], selectedType

  markerIcons: ->
    "VIOLENT"  : "http://maps.google.com/mapfiles/ms/icons/red-dot.png",
    "PROPERTY" : "http://maps.google.com/mapfiles/ms/icons/blue-dot.png",
    "PERSONAL" : "http://maps.google.com/mapfiles/ms/icons/yellow-dot.png",
    "OTHER"    : "http://maps.google.com/mapfiles/ms/icons/green-dot.png"

  displayList: ->
    [
      {
        raw_name: "ASSAULT",
        display_name: "Assault"
      },
      {
        raw_name: "ARSON",
        display_name: "Arson"
      },
      {
        raw_name: "BATTERY",
        display_name: "Battery"
      },
      {
        raw_name: "BURGLARY",
        display_name: "Burglary"
      },
      {
        raw_name: "CRIMINAL DAMAGE",
        display_name: "Criminal Damage"
      },
      {
        raw_name: "CRIMINAL TRESPASS",
        display_name: "Trespass"
      },
      {
        raw_name: "CRIM SEXUAL ASSAULT",
        display_name: "Sexual Assault"
      },
      {
        raw_name: "DECEPTIVE PRACTICE",
        display_name: "Deceptive Practice"
      },
      {
        raw_name: "GAMBLING",
        display_name: "Gambling"
      },
      {
        raw_name: "HOMICIDE"
        display_name: "Homicide"
      },
      {
        raw_name: "INTERFERENCE WITH PUBLIC OFFICE",
        display_name: "Intereference with Public Office"
      },
      {
        raw_name: "INTIMIDATION",
        display_name: "Intimidation"
      },
      {
        raw_name: "KIDNAPPING",
        display_name: "Kidnapping"
      },
      {
        raw_name: "LIQUOR LAW VIOLATION",
        display_name: "Liquor Law Violation"
      },
      {
        raw_name: "MOTOR VEHICLE THEFT",
        display_name: "Motor Vehicle Theft"
      },
      {
        raw_name: "NARCOTICS",
        display_name: "Narcotics"
      },
      {
        raw_name: "NON-CRIMINAL",
        display_name: "Non-Criminal"
      },
      {
        raw_name: "OBSCENITY",
        display_name: "Obscenity"
      },
      {
        raw_name: "OFFENSE INVOLVING CHILDREN",
        display_name: "Offense Involving Children"
      },
      {
        raw_name: "OTHER NARCOTIC VIOLATION",
        display_name: "Other Narcotic Violation"
      },
      {
        raw_name: "OTHER OFFENSE",
        display_name: "Other"
      },
      {
        raw_name: "PROSTITUTION",
        display_name: "Prostitution"
      },
      {
        raw_name: "PUBLIC PEACE VIOLATION",
        display_name: "Public Peace Violation"
      },
      {
        raw_name: "ROBBERY",
        display_name: "Robbery"
      },
      {
        raw_name: "SEX OFFENSE",
        display_name: "Sex Offense"
      },
      {
        raw_name: "STALKING",
        display_name: "Stalking"
      },
      {
        raw_name: "THEFT",
        display_name: "Theft"
      },
      {
        raw_name: "WEAPONS VIOLATION",
        display_name: "Weapons Violation"
      }
    ]

  masterList: ->
    [
      "ASSAULT",
      "ARSON",
      "BATTERY",
      "BURGLARY",
      "CRIMINAL DAMAGE",
      "CRIMINAL TRESPASS",
      "CRIM SEXUAL ASSAULT",
      "DECEPTIVE PRACTICE",
      "GAMBLING",
      "HOMICIDE",
      "INTERFERENCE WITH PUBLIC OFFICE",
      "INTIMIDATION",
      "KIDNAPPING",
      "LIQUOR LAW VIOLATION",
      "MOTOR VEHICLE THEFT",
      "NARCOTICS",
      "NON-CRIMINAL",
      "OBSCENITY",
      "OFFENSE INVOLVING CHILDREN",
      "OTHER NARCOTIC VIOLATION",
      "OTHER OFFENSE",
      "PROSTITUTION",
      "PUBLIC PEACE VIOLATION",
      "ROBBERY",
      "SEX OFFENSE",
      "STALKING",
      "THEFT",
      "WEAPONS VIOLATION"
    ]

window.IncidentCategories = IncidentCategories
