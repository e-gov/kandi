#!/bin/bash

# Moodustab valimiste avaandmete XML-failist ELECTION_CANDIDATES.xml
# JSON-kujule teisendatud failist kandidaatide loendi.
# Suudab töödelda KOV 2021 (ja hilisemate) faile. Teiste valimissündmuste tüüpide failide formaat erineb.

# Kasutamine: ./teisendaja_kov.sh <sisendfail> <väljundfail>

# <sisendfail> - valimiste avaandmete XML-failist JSON-kujule teisendatud fail
# <väljundfail> - kandidaatide loend, kujul: eesnimi, perekonnanimi,
# kandidaadi registreerimisnumber, kuuluvus erakonda või valimisliitu, sünniaeg,
# töökoht, valimisringkond

# Nt: ./teisendaja_kov.sh ../ANDMED/KANDIDAADID_2021.json ../ANDMED/KANDIDAADID_2021.csv

cat $1 | \
jq --raw-output '
  .OutputReport | .data | .adminUnit | .[] | 
  .name as $maakond | 
  if has("childAdminUnits") then 
    "MAAKONNAD" as $comment | .childAdminUnits | .adminUnit |
    if type == "object" then
      "HIIUMAA" as $comment |
      .districts | .district | 
      .districtComment as $ringkond |
      .parties | .party | .[] |
        .candidates | 
        if type == "string" then
          "ERAKONNAL RINGKONNAS KANDIDAATE EI OLNUD" as $comment | empty
        else
          .candidate |
            if type == "object" then
              "ERAKONNAS VÕI ÜKSIKKANDIDAATIDE SEAS ÜKS KANDIDAAT" as $comment |
              (.forename + " " + .surname + ";KOV 2021;" +
                .candidateRegNumber? + ";" + .partyName? + ";" + 
                .birthday? + ";" + .employment? + ";" +
              $ringkond)
            else
              .[] | (.forename + " " + .surname + ";KOV 2021;" +
                .candidateRegNumber? + ";" + .partyName? + ";" + 
                .birthday? + ";" + .employment? + ";" +
              $ringkond)
            end
        end
    else  
      "MUUD MAAKONNAD KUI HIIUMAA" as $comment | 
      .[] | 
      .districts | .district |
      if type == "array" then
        "Peipsiääre vald" as $comment | 
        .[] | 
        .districtComment as $ringkond |
        .parties | .party | .[] |
          .candidates | 
          if type == "string" then
            "ERAKONNAL RINGKONNAS KANDIDAATE EI OLNUD" as $comment | empty
          else
            .candidate |
              if type == "object" then
                "ERAKONNAS VÕI ÜKSIKKANDIDAATIDE SEAS ÜKS KANDIDAAT" as $comment |
                (.forename + " " + .surname + ";KOV 2021;" +
                .candidateRegNumber? + ";" + .partyName? + ";" + 
                .birthday? + ";" + .employment? + ";" +
              $ringkond)
              else
                .[] | (.forename + " " + .surname + ";KOV 2021;" +
                .candidateRegNumber? + ";" + .partyName? + ";" + 
                .birthday? + ";" + .employment? + ";" +
              $ringkond)
              end
          end
      else
        .districtComment as $ringkond |
        .parties | .party | .[] |
          .candidates | 
          if type == "string" then
            "ERAKONNAL RINGKONNAS KANDIDAATE EI OLNUD" as $comment | empty
          else
            .candidate |
              if type == "object" then
                "ERAKONNAS VÕI ÜKSIKKANDIDAATIDE SEAS ÜKS KANDIDAAT" as $comment |
                (.forename + " " + .surname + ";KOV 2021;" +
                .candidateRegNumber? + ";" + .partyName? + ";" + 
                .birthday? + ";" + .employment? + ";" +
              $ringkond)
              else
                .[] | (.forename + " " + .surname + ";KOV 2021;" +
                .candidateRegNumber? + ";" + .partyName? + ";" + 
                .birthday? + ";" + .employment? + ";" +
              $ringkond)
              end
          end
      end
    end
  else
    "TALLINN, TARTU" as $comment | .districts.district |
    if type == "array" then
      "Tallinn" as $comment | .[] |
      .districtComment as $ringkond |
      .parties | .party | .[] |
        .candidates | 
        if type == "string" then
          "ERAKONNAL RINGKONNAS KANDIDAATE EI OLNUD" as $comment | empty
        else
          .candidate |
            if type == "object" then
              "ERAKONNAS VÕI ÜKSIKKANDIDAATIDE SEAS ÜKS KANDIDAAT" as $comment |
              (.forename + " " + .surname + ";KOV 2021;" +
                .candidateRegNumber? + ";" + .partyName? + ";" + 
                .birthday? + ";" + .employment? + ";" +
              $ringkond)
            else
              .[] | (.forename + " " + .surname + ";KOV 2021;" +
                .candidateRegNumber? + ";" + .partyName? + ";" + 
                .birthday? + ";" + .employment? + ";" +
              $ringkond)
            end
        end
    else
      "TARTU" as $comment |
      .districtComment as $ringkond |
      .parties | .party | .[] |
        .candidates | 
        if type == "string" then
          "ERAKONNAL RINGKONNAS KANDIDAATE EI OLNUD" as $comment | empty
        else
          .candidate |
            if type == "object" then
              "ERAKONNAS VÕI ÜKSIKKANDIDAATIDE SEAS ÜKS KANDIDAAT" as $comment |
              (.forename + " " + .surname + ";KOV 2021;" +
                .candidateRegNumber? + ";" + .partyName? + ";" + 
                .birthday? + ";" + .employment? + ";" +
              $ringkond)
            else
              .[] | (.forename + " " + .surname + ";KOV 2021;" +
                .candidateRegNumber? + ";" + .partyName? + ";" + 
                .birthday? + ";" + .employment? + ";" +
              $ringkond)
            end
        end
    end
  end
  ' > \
$2

