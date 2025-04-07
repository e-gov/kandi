#!/bin/bash

# Moodustab valimiste avaandmete XML-failist ELECTION_CANDIDATES.xml
# JSON-kujule teisendatud failist kandidaatide loendi.
# Suudab töödelda RK 2023 (ja hilisemate) faile. Teiste valimissündmuste tüüpide failide formaat erineb.

# Kasutamine: ./teisendaja_rk.sh <sisendfail> <väljundfail>

# <sisendfail> - valimiste avaandmete XML-failist JSON-kujule teisendatud fail
# <väljundfail> - kandidaatide loend, kujul: eesnimi, perekonnanimi,
# kandidaadi registreerimisnumber, kuuluvus erakonda või valimisliitu, sünniaeg,
# töökoht, valimisringkond

# Nt: ./teisendaja_rk.sh ../ANDMED/KANDIDAADID_2023.json ../ANDMED/KANDIDAADID_2023.csv

cat $1 | \
jq --raw-output '
  .OutputReport | .data | .electionDistrict | .[] |
  .districtName as $ringkond |
  .parties.party | .[] | 
  .partyName as $erakond |
  .candidates.candidate | 
  if type == "array" then
    .[] |
    (.forename + " " + .surname + ";RK 2023;" + .candidateRegNumber + ";" +
    $erakond + ";" + $ringkond)
  else
    (.forename + " " + .surname + ";RK 2023;" + .candidateRegNumber + ";" +
    $erakond + ";" + $ringkond)
  end  
  ' > \
$2

