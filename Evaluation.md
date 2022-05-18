# Hodnotenie

### Celkovo

---
- Replikovatelnost testu macOS: 0:5    (PASS:FAIL)
- Replikovatelnost testu windows: 5:0    (PASS:FAIL)
---

#### Errors:

  - chyba nastava v momente, ked ides na link klikat. Kedze mam windows virtualizovany, je podstatne pomalsi a stranka sa stihned donacitat (network je slabsi tiez). Naopak  na macOS stranka nabehne hned a produkty su tam este neni v bode, kedy ides nan kliknut - vyriesit by to slo tym, ze by si vzdy cakal na element, na ktory ides klikat

  
- Z pohladu testingu:
  - subor je neprehladny, je tam kopa 'balastu', ktory by sa dal odmigrovat prec
  - ak sa pozeram iba na cast `*** Test Cases ***` v tomto pripade vidim o co ide, a s troskou snahy sa viem dopatrat co by mal test robit
  - ako si napisal, chyba tam validacia na ceny
  - troska z pohladu nezaujateho testera mam problem s tym co je `Delete One Product`
    - prvy?  alebo nahodny? alebo 3? 

- Z pohladu automatizacie:
  - je to velky mess mat vsetko v 1 file, lahko sa stym robi, ale to je tak vsetko
  - uz ked aspon to rozdelit na 'helpers.resource' a 'heureka'
  - kde su subory `heureka1.robot` a `heureka2.robot`, ked sa hlavny vola `heureka3.robot`?
  - xpathy do *** Test Cases *** nepatria
  - pridanie kazdeho produktu je skoro zhodny keyword, jedine co sa ti meni je 1 xpath, urcite to chce rework
  - chybaju mi subory `requirements.txt` a nejaka forma `README` co mi povie co s tym
    - ak by som bol non-python clovek, netusim co treba spravit a ako vobec test spustim


- ***Overall***:

  - chybaju mi subory vyssie popisane
  - niektore klikacky mas skor, ako sa elementy objavia (to sa da vyriesit 'pomalsim' networkom)


### Keywords subor

- ziadny keywords subor neevidujem

### Variables subor

- vsetky variables mas v hlavnom tc subore

### Test Cases subor

- nezatvara mi chrome, chybajuce `[Setup]` a `[Teardown]`
- v main test file su xpathy, ktore netusim ako 'tester' kam mieria a co to je za divny zapis

#### Keywords sekcia

  - General: 
    - mas strasne moc copy/paste kodu
    - ak uz, mohol si na to co sa ti opakuje vytvorit dalsi KW, ktory by si iba prevolal v `Add ...` keywordoch

  - 3 keywordy na pridanie 3 produktov mi biju do oci, treba ich parametrizovat a mas univerzalny keyword
  - Keyword: `Delete One Product`
    - ako pisem, je moc genericky a netusim co 'One' v tomto pripade znamena, treba to bud indexovat alebo pouzit nazov produktu
  
  - Keyword: `Navigate to grill section`
    - zase, parametrizujme, ak sa pozies, tie sekcie su vsetky //h2 , je easy to sparametrizovat a mat univerzalne riesenie

  

#### Variables sekcia
  
  - nepouzivas vobec, coz je skoda, pretoze mas kopu codu 'copy/paste'

### Readme.md subor

- chyba mi informacia co mam robit?
- co mam nainstalovat, co je to ten .robot file?
- cast hodnotenia je aj README v akomkolvek formate, kde mi vysvetlis o co ide a hlavne AKO s tym pracovat

### requirements.txt subor
 
- chyba mi informacia ako projekt rozbeham, co mam nainstalovat?

### Git repository

- tu je iba a len test
- je to dostatocne na to co sme sa bavili