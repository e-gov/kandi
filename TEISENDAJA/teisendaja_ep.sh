#!/bin/bash

# Moodustab valimiste avaandmete XML-failist ELECTION_CANDIDATES.xml
# JSON-kujule teisendatud failist kandidaatide loendi.
# Suudab töödelda EP 2024 (ja hilisemate) faile. Teiste valimissündmuste tüüpide failide formaat erineb.

# Kasutamine: ./teisendaja_ep.sh <sisendfail> <väljundfail>

# <sisendfail> - valimiste avaandmete XML-failist JSON-kujule teisendatud fail
# <väljundfail> - kandidaatide loend, kujul: eesnimi, perekonnanimi,
# kandidaadi registreerimisnumber, kuuluvus erakonda või valimisliitu, sünniaeg,
# töökoht, valimisringkond

# Nt: ./teisendaja_ep.sh ../ANDMED/KANDIDAADID_2024.json ../ANDMED/KANDIDAADID_2024.csv

cat $1 | \
jq --raw-output '
  .OutputReport | .data | .electionDistrict.parties.party | .[] |
	.partyName as $erakond |
  .candidates.candidate | 
  if type == "array" then
    .[] |
    (.forename + " " + .surname + ";EP 2024;" + .candidateRegNumber + ";" +
    $erakond)
  else
    (.forename + " " + .surname + ";EP 2024;" + .candidateRegNumber + ";" +
    $erakond)
  end
  ' > \
$2

