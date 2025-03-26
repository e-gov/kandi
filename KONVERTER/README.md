# Konverter

Konverter on uurimuslik Go programm, mis teisendab valimiste avaandmete XML-vormingus kandidaatide faili (ELECTION_CANDIDATES.xml) JSON-kujule.

Kasulikku:

- `go mod init konverter` (programmi konverter alustamine)
- `https://github.com/txix-open/goxml2json` (XML -> JSON teisendusteek)
- `go get github.com/txix-open/goxml2json` (teegi paigaldamine)
  VS Code Go laiendus lisab ise required laused go.mod faili
- `./konverter` (programmi konverter täitmine) 