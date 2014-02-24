var IncidentTypes = function() {};

IncidentTypes.prototype.category = {
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
}

IncidentTypes.prototype.markerIcon = {
  "VIOLENT"  : "http://maps.google.com/mapfiles/ms/icons/red-dot.png",
  "PROPERTY" : "http://maps.google.com/mapfiles/ms/icons/blue-dot.png",
  "PERSONAL" : "http://maps.google.com/mapfiles/ms/icons/yellow-dot.png",
  "OTHER"    : "http://maps.google.com/mapfiles/ms/icons/green-dot.png"
}

var masterList = [
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

