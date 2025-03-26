#!/bin/bash

# Moodustab valimiste avaandmete XML-failist ELECTION_CANDIDATES.xml
# JSON-kujule teisendatud failist kandidaatide loendi.

# Kasutamine: ./KOOSTA.sh <sisendfail> <väljundfail>

# <sisendfail> - valimiste avaandmete XML-failist ELECTION_CANDIDATES.xml
# JSON-kujule teisendatud fail
# <väljundfail> - kandidaatide loend, kujul: eesnimi, perekonnanimi,
# kandidaadi registreerimisnumber, kuuluvus erakonda või valimisliitu, sünniaeg,
# töökoht, valimisringkond

# Nt: ./KOOSTA KOV_2021_KANDIDEERIMISED.json KOV_2021_KANDIDEERIMISED.txt

cat $1 | \
jq --raw-output '
  .OutputReport | .data | .adminUnit | .[] | 
  .name as $maakonnanimi |
  if .childAdminUnits == "" then 
    "Tallinn, Tartu" as $comment | .districts.district |
    if type == "array" then
      "Tallinn" as $comment | .[] |
      .districtComment as $distict |
      .parties | .party | .[] |
      .candidates | 
      if type == "string" then
        "ERAKONNAL RINGKONNAS KANDIDAATE EI OLNUD" as $comment | empty
      else
        .candidate | .[] | (.forename? + " " + .surname? + ", " +
          .candidateRegNumber? + ", " + .partyName? + ", " + 
          .birthday? + ", " + .employment? + ", " +
          $distict)
      end
    else
      "Tartu" as $comment |
      .districtComment as $distict |
      .parties | .party | .[] |
      .candidates | 
      if type == "string" then
        "ERAKONNAL RINGKONNAS KANDIDAATE EI OLNUD" as $comment | empty
      else
        .candidate | .[] | (.forename? + " " + .surname? + ", " +
          .candidateRegNumber? + ", " + .partyName? + ", " + 
          .birthday? + ", " + .employment? + ", " +
          $distict)
      end
    end
  else
    "MAAKONNAD" as $comment | .childAdminUnits | .adminUnit |
    if type == "object" then
      "HIIUMAA" as $comment |
      .districts | .district | 
      .districtComment as $district |
      .parties | .party | .[] |
      .candidates | 
      if type == "string" then
        "ERAKONNAL RINGKONNAS KANDIDAATE EI OLNUD" as $comment | empty
      else
        .candidate | .[] | (.forename? + " " + .surname? + ", " +
          .candidateRegNumber? + ", " + .partyName? + ", " + 
          .birthday? + ", " + .employment? + ", " +
          $district)
      end
    else  
      "MUUD MAAKONNAD KUI HIIUMAA" as $comment | 
      .[] | .districts | .district |
      if type == "array" then
        "MASSIIV"
      else
        .districtComment as $district |
        .parties | .party | .[] |
        .candidates | 
        if type == "string" then
          "ERAKONNAL RINGKONNAS KANDIDAATE EI OLNUD" as $comment | empty
        else
          .candidate | .[] | (.forename? + " " + .surname? + ", " +
            .candidateRegNumber? + ", " + .partyName? + ", " + 
            .birthday? + ", " + .employment? + ", " +
            $district)
        end
      end
    end
  end
  ' > \
$2

