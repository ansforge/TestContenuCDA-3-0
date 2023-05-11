<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    E_FR-Dispositif-medical_CNAM-HR.sch :
    
    Vérification de la conformité d'une entrée FR-Dispositif-medical (1.2.250.1.213.1.1.3.20)
    
    Historique :
    13/01/2021 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_FR-DispositifMedical_CNAM-HR">
    <p>Vérification de la conformité d'une entrée FR-Dispositif-medical (1.2.250.1.213.1.1.3.20)</p>
    <rule context="*[cda:templateId/@root = '1.2.250.1.213.1.1.3.20']">

        <assert test="(cda:performer/cda:assignedEntity/cda:id[@nullFlavor = 'UNK'])
            or (not(cda:performer))"> 
            [E_FR-DispositifMedical_CNAM-HR] Erreur de conformité :
            Une entrée FR-Dispositif-medical ('1.2.250.1.213.1.1.3.20') doit avoir un performer/assignedEntity/id/@nullFlavor 'UNK'. 
        </assert>

    </rule>
</pattern>
