# Uurimine

Arendust ettevalmistav uurimine.

Eesmärk: Leida tehnoloogiliselt võimalikult lihtne viis nõutava funktsionaalsuse saavutamiseks.

Lähteidee: "Kandideerimise ajaloo" teenuses tuleks võimalusel vältida "raskekaalulist" tehnoloogiapinu. "Raskekaaluliseks" tundub olevat SQL-andmebaas, aga ka Angular. "Raskekaaluliseks" tuleb lugeda ka tehnoloogiad ja komponendid, mis vajavad suuremahulist hooldust (uuendusi, paikamisi, turvanõrkuste seiret) ja/või mis vajavad arenduses suuremahulisi töid (nt end-to-end testimine).

Uurimine keskendub praegu valimiste avaandmete XML-failidest selliste JSON-failide, võimalik, et ka lihtsalt tekstifailide (TXT) moodustamisele, mis võimaldaksid nõutavaid otsinguid ja sirvimisi teha suhteliselt lihtsalt. "Suhteliselt lihtsalt" ideaaljuhul võiks tähendada ka tekstifailis kasutaja poolt Ctrl+F otsingu tegemist ja tekstifaili vahetut sirvimist (kerimist) kasutaja poolt.

Tehtu:

- Uurimuslik programm, mis teisendab valimiste avaandmete XML-kujulise kandidaatide faili JSON-kujule - Konverter, vt kaust "Konverter".
- Uurimuslik jq programm (skript), mis nimetatud JSON-failist moodustab "lameda" (_flat_) kandideerimisfaktide faili. KOV 2021 valimiste fail: KOV_2021_KANDIDEERIMISED.txt (samas kaustas).



