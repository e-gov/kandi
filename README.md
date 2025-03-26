# Kandideerimisajaloo teenus

Võimalus vaadata, kas inimene on varem kandideerinud, millistel valimistel, millises erakonnas või valimisliidus ja millise tulemusega, on eeldatavalt huvipakkuv ja väärtust loov paljudele kasutajatele.

"Kandideerimisajaloo teenus" on praegu Vabariigi Valimiskomisjoni (VVK) domeeninime alt pakutava lehe "Toimunud valimiste kandidaatide otsing": http://vvk.ee/arhiiv/kandidaadi-otsing/ ajakohastamise järel tekkiv avalik teenus. Ajakohastamise eesmärgid:
- Tänapäevastada teenuse kasutajaliides; rakendada Valimiste infosüsteemi (VIS3) kujundusstiili;
- Teha teenus kergestileitavaks; selleks pakkuda teenust domeeni valimised.ee alamdomeeni alt.
- Täiendada teenuses pakutavat kandideerimisandmete hulka pärast 2019 toimunud valimiste andmetega.

## Tehniline kontseptsioon (avalik osa)

1  Ajakohastatud teenus saab koosnema kahest komponendist: a) andmefail; b) kasutajaliides.

2  Andmefail sisaldab teenuse kuvatavaid kandideerimisajaloo andmeid.
- Faili struktuuri aluseks võetakse senise teenuse andmefail (CSV).
- CSV-fail teisendatakse JSON-failiks ja edaspidi kasutatakse JSON-formaati.
- Faili täiendatakse pärast 2019 toimunud valimiste andmetega.
- Andmefail on suhteliselt staatiline. Faili täiendatakse pärast igakordsete valimiste lõppemist.

3  Kasutajaliides teostatakse Angulari veebiraamistikus.
- Kasutajaliidesele rakendatakse VIS3 kujundusstiili.

4  Andmefaili ja kasutajaliidese koodi hoitakse GitHub-is, RIA kontrolli all oleva organisatsiooni e-gov (https://github.com/e-gov) all, omaette repos https://github.com/e-gov/kandi.
- Repo kood publitseeritakse avaliku koodina, MIT litsentsiga.
- Repo andmefail publitseeritakse avaandmetena. Reposse lisatakse vastav selgitus ja litsents.

5  Kasutajaliides publitseeritakse GitHub publitseerimisteenuse GitHub Pages abil (https://pages.github.com/).

6  Kasutajaliides seotakse domeeninimega kandideerimisajalugu.valimised.ee vms sarnasega.

...

11  Turvalisus (põhijooned)
- Teenuses esitatavad andmed on olemuselt avalik teave, mis on ka varem (valimissündmuste lehtedel, valimistulemuste detailandmestutes) juba avaldatud. Teenus ainult annab kasutajale kergema pääsu andmeteni (otsinguvõimaluse).
- Kasutajaliidese kood on lihtne; koodi mitteavalikustamise vajadus puudub.

12  Jõudlus
- Kohaliku omavalitsuse valimistel võib olla kuni 10 000 kandidaati. Teistel valimistel on kandidaate vähem. Kandideerimiste ajaloo fail võib seega sisaldada suurusjärgus 100 000 kandideerimisfakti andmeid.
- Lihtsaima kasuliku teenuse (MVP) saamise prioriteedist lähtudes rakendame kogu andmefaili laadimist kasutajaliidesesse. S.t teenusel puudub serveripoolne töötlus. Teenuse testimisel selgitada välja, kas selline tööviis tagab piisava jõudluse ja reaktsiooniaja. Kui mitte, siis tuleb kontseptsioon uuesti läbi vaadata (nt kaaluda andmestu jagamist failideks).
- Teenuse kasutustihedust saab eeldada kujunevat suhteliselt madalaks. Teadasaamine, kas inimene on varem kandideerinud, millistel valimistel, millises erakonnas või valimisliidus ja millise tulemusega, on eeldatavalt huvipakkuv ja väärtust loov paljudele kasutajatele. Samas ei ole ajaloo-otsing otseselt ühegi menetlustoimingu osa või eeldus.
