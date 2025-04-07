## Töötlus

Failide ALATES_1992.csv ja KANDIDEERIMISKORDI.csv saamiseks on VVK veebilehelt ja Valimiste avaandmete lehelt saadud andmeid töödeldud järgmiselt:

1. Valimiste avaandmete lehelt laeti alla KOV 2021, RK 2023 ja EP 2024 kandideerimisandmed - XML-failid ELECTION_CANDIDATES.xml.
2. XML-failid teisendati JSON-kujul - käesolevas kaustas oleva Go programmi konverter abil. Vt jaotis "konverter" allpool.
3. jq abil teisendati JSON-failid CSV-kujule. Vastavad jq-skriptid: teisendaja_kov.sh, teisendaja_rk.sh, teisendaja_ep.sh.
4. VVK veebilehelt laeti alla 1992-2019 valimiste kandideerimisandmete CSV-fail.
5. Kõigis CSV-failides seati kandidaatide nimed pöördjärjestusse (s.t perekonnanimi enne eesnime).
6. Saadud CSV-failid liideti ja sorditi.
7. Kandideerimiskordade "edetabeli" saamiseks tehti vastavad teisendused (vt täpsemalt eraldi jaotises allpool).

## konverter

Go programm, mis teisendab valimiste avaandmete XML-vormingus kandidaatide faili (ELECTION_CANDIDATES.xml) JSON-kujule.

Kasutamine:

`go run . -infile <XML-faili tee> -outfile <JSON-faili tee>

Kasulikku:

- `go mod init konverter` (programmi konverter alustamine)
- `https://github.com/txix-open/goxml2json` (XML -> JSON teisendusteek)
- `go get github.com/txix-open/goxml2json` (teegi paigaldamine)
  VS Code Go laiendus lisab ise required laused go.mod faili
- `./konverter` (programmi konverter täitmine) 


## Nimede pöördjärjestusse seadmine
Sortimise eeltoiminguna, selleks, et andmeid saaks sirvida perekonnanimede järjestuses.

Regulaaravaldis: Otsi: `([^;]*)\s([^;]*)(;.*)\n`, Asenda: `$2 $1$3\n`
 
Nt: 

```
IVO KAPPET;RK 2023;685;Erakond Eesti 200;Tallinna Kesklinna, Lasnamäe ja Pirita linnaosa
IVO KARINDI;KOV 2021;129;Eesti Konservatiivne Rahvaerakond;08.09.1969;;Lääne-Nigula vald
```

teiseneb

```
KAPPET IVO;RK 2023;685;Erakond Eesti 200;Tallinna Kesklinna, Lasnamäe ja Pirita linnaosa
KARINDI IVO;KOV 2021;129;Eesti Konservatiivne Rahvaerakond;08.09.1969;;Lääne-Nigula vald
```

Nimepööramise saab teha VS Code-s. Võib kasutada ka nt Rust käsureavahendit sd (sed analoog):

```
$ echo 'MILVI OJAPÕLD; KOV 1999; OHOO' | sd '([^;]*)\s([^;]*)(;.*)\n' '$2 $1$3\n' 
OJAPÕLD MILVI; KOV 1999; OHOOKUNI
```

```
cat KUNI_2019.csv | sd '([^;]*)\s([^;]*)(;.*)\n' '$2 $1$3\n' > KUNI_2019_PÖÖRD.csv
```

## Failide sidurdamine ja sortimine
`cat KUNI_2019_PÖÖRD.csv ALATES_2021_PÖÖRD.csv | LC_ALL=C sort > ALATES_1993.csv`

(Locale seadmine `LC_ALL=C` on vajalik õige leksikograafilise järjestuse tagamiseks).

## Kandideerimiskordade "edetabel"

`cat ALATES_1993.csv | sd '([^;]*).*' '$1' > NIMED.csv`

`cat NIMED.csv | uniq -c > KORDI.csv`

`cat KORDI.csv | sort > KORDI_EDETABEL.csv`

