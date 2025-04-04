# Uurimine

Arendust ettevalmistav uurimine.

Eesmärk: Leida tehnoloogiliselt võimalikult lihtne viis nõutava funktsionaalsuse saavutamiseks.

Lähteidee: "Kandideerimise ajaloo" teenuses tuleks võimalusel vältida "raskekaalulist" tehnoloogiapinu. "Raskekaaluliseks" tundub olevat SQL-andmebaas, aga ka Angular. "Raskekaaluliseks" tuleb lugeda ka tehnoloogiad ja komponendid, mis vajavad suuremahulist hooldust (uuendusi, paikamisi, turvanõrkuste seiret) ja/või mis vajavad arenduses suuremahulisi töid (nt end-to-end testimine).

Uurimine keskendub praegu valimiste avaandmete XML-failidest selliste JSON-failide, võimalik, et ka lihtsalt tekstifailide (TXT) moodustamisele, mis võimaldaksid nõutavaid otsinguid ja sirvimisi teha suhteliselt lihtsalt. "Suhteliselt lihtsalt" ideaaljuhul võiks tähendada ka tekstifailis kasutaja poolt Ctrl+F otsingu tegemist ja tekstifaili vahetut sirvimist (kerimist) kasutaja poolt.

# Teisendaja_1

Teisendaja_1 on uurimuslik Go programm, mis teisendab valimiste avaandmete XML-vormingus kandidaatide faili (ELECTION_CANDIDATES.xml) JSON-kujule.

Kasutamine:

`go run . -infile <XML-faili tee> -outfile <JSON-faili tee>

Kasulikku:

- `go mod init konverter` (programmi konverter alustamine)
- `https://github.com/txix-open/goxml2json` (XML -> JSON teisendusteek)
- `go get github.com/txix-open/goxml2json` (teegi paigaldamine)
  VS Code Go laiendus lisab ise required laused go.mod faili
- `./konverter` (programmi konverter täitmine) 

