<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    E_FR-HistoriquePrisesEnChargeMedicales_CNAM-HR.sch :
    
    Vérification de la conformité d'une entrée FR-Rencontre (1.3.6.1.4.1.19376.1.5.3.1.4.14)
    
    Historique :
    13/01/2021 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_FR-HistoriquePrisesEnChargeMedicales_CNAM-HR">
    <p>Vérification de la conformité d'une entrée FR-Rencontre (1.3.6.1.4.1.19376.1.5.3.1.4.14)</p>
    <rule context="*[cda:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.14']">

        <assert test="(cda:code/@code = 'IMP') or (cda:code/@displayName = 'Aucun')"> 
            [E_FR-HistoriquePrisesEnChargeMedicales_CNAM-HR] Erreur de conformité :
            Une entrée FR-Rencontre ('1.3.6.1.4.1.19376.1.5.3.1.4.14') doit avoir un code/@code 'IMP' ou un code Wolf ‘Aucun’ . 
        </assert>
        
        <assert test="(cda:performer/cda:assignedEntity/cda:id[@nullFlavor = 'UNK']) or (not(cda:performer))"> 
            [E_FR-HistoriquePrisesEnChargeMedicales_CNAM-HR] Erreur de conformité :
            Une entrée FR-Rencontre ('1.3.6.1.4.1.19376.1.5.3.1.4.14') doit avoir un performer/assignedEntity/id/@nullFlavor 'UNK'. 
        </assert>

    </rule>
</pattern>
