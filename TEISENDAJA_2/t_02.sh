#!/bin/bash

# Mteisendaja_2.sh silumise abivahend.

# Nt: ./t_02.sh ../ANDMED/KANDIDAADID_2021.json ../ANDMED/KANDIDAADID_2021.csv

cat $1 | \
jq --raw-output '
  .OutputReport | .data | .adminUnit | .[] | 
  .name as $maakond | 
  if has("childAdminUnits") then 
    "MAAKONNAD" as $comment | .childAdminUnits | .adminUnit |
    if type == "object" then
      "HIIUMAA" as $comment | empty
    else  
      "MUUD MAAKONNAD KUI HIIUMAA" as $comment | 
      .[] | 
      .districts | .district |
      if type == "array" then
        "MASSIIV" as $comment | empty
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
                ("ÜKS ***" + .forename? + " " + .surname? + ", " +
                  .candidateRegNumber? + ", " + .partyName? + ", " + 
                  .birthday? + ", " + .employment? + ", " +
                $ringkond)
              else
                .[] | ("MITU ***" + .forename? + " " + .surname? + ", " +
                  .candidateRegNumber? + ", " + .partyName? + ", " + 
                  .birthday? + ", " + .employment? + ", " +
                  $ringkond)
              end
          end
      end
    end
  else
    "TALLINN, TARTU" as $comment | empty
  end
  ' > \
$2

