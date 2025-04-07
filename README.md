# Kandideerimisajalugu

Võimalus vaadata, kas inimene on riiklikel valimistel varem kandideerinud, on eeldatavalt huvipakkuv ja väärtust loov paljudele kasutajatele. Praegu on võimalused selleks killustatud:
- Vabariigi Valimiskomisjoni (VVK) veebilehelt http://vvk.ee/arhiiv/kandidaadi-otsing/ saab pärida kandideerimisandmeid 1992-2019 (v.a 2009) valimiste kohta. Märkus: Teenus vajab ajakohastamist, kasvõi tänapäeval ebaturvaliseks peetava HTTP protokolli osas.
- Valimiste avaandmete lehelt https://opendata.valimised.ee saab alla laadida kandideerimisandmeid 2021 ja järgnevate valimiste kohta. Andmed on valdavalt XML-vormingus ega paku ühtset koondit üle erinevate valimiste. 

Käesolevas repos on failid, millest isiku kandideerimisajaloo otsimine loodetavasti on kergem:
- ALATES_1992.csv - kandideerimised alates 1992.a kuni tänapäevani.
- KANDIDEERIMISKORDI.csv - mitu korda isik on kandideerinud.

Andmed põhinevad ülalnimetatud allikatest (VVK veebileht, Valimiste avaandmete leht). Andmeid on töödeldud, selle kohta vt lähemalt kaustas TEISENDAJA.

Tegu on avalike andmetega, mis on ka varem juba avaldatud ja mille kasutamine on vaba.

Kolm eeldatavat peamist "kasutuslugu":
- Isiku kandideerimiste otsing:
  - Avage fail ALATES_1992.csv; kuna fail on suur, siis vaatamiseks peate valima 'View raw'
  - Ctrl+F ja otsige isiku nime või nimeosa järgi.
- Kandidaatide sirvimine:
  - Avage fail ALATES_1992.csv ja sirvige.
- Isikute võrdlus kandideerimiskordade järgi:
  - Avage fail KANDIDEERIMISKORDI.csv ja sirvige.

Lühendid ja tähistused:
- KOV - kohaliku omavalitsuse valimised; RK - Riigikogu valimised; EP - Europarlamendi valimised
- 1992-2019 andmetes on: valimisringkonna nimetus ja number, kandidaadi registreerimisnumber, erakond (või valimisliit), saadud hääle arv ja valimiseks osutumine/mitteosutumine (1/0)
- 2021- andmetes on: kandidaadi registreerimisnumber, erakond (või valimisliit), kandidaadi sünniaeg ja valimisringkonna nimetus
- andmed ei erista sama ees- ja perekonnanimega isikuid. Seda on oluline arvestada eriti kandideerimiskordade andmete tõlgendamisel.

Piirangud:
- Andmed ei sisalda EP 2009 andmeid.

Statistikat:
- Andmekogumis on 124 535 kandideerimisfakti andmed.

