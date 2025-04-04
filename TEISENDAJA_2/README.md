# Teisendaja_2

jq programm (skript), mis nimetatud JSON-failist moodustab "lameda" (_flat_) kandideerimisfaktide faili.

# LÕIGE 1

        if type == "string" then
          "ERAKONNAL RINGKONNAS KANDIDAATE EI OLNUD" as $comment | empty
        else
          .candidate |
            if type == "record" then
              "ERAKONNAS VÕI ÜKSIKKANDIDAATIDE SEAS ÜKS KANDIDAAT" as $comment |
              (.forename? + " " + .surname? + ", " +
                .candidateRegNumber? + ", " + .partyName? + ", " + 
                .birthday? + ", " + .employment? + ", " +
              $district)
            else
              .[] | (.forename? + " " + .surname? + ", " +
                .candidateRegNumber? + ", " + .partyName? + ", " + 
                .birthday? + ", " + .employment? + ", " +
                $district)
            end
        end

# LÕIGE 2

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

# LÕIGE 3

    "TALLINN, TARTU" as $comment | .districts.district |
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
      "TARTU" as $comment |
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

