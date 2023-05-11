<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    E_FR-Vaccination_CNAM-HR.sch :
    
    Vérification de la conformité d'une entrée FR-Vaccination (1.3.6.1.4.1.19376.1.5.3.1.4.12)
    
    Historique :
    13/01/2021 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_FR-Vaccination_CNAM-HR">
    <p>Vérification de la conformité d'une entrée FR-Vaccination (1.3.6.1.4.1.19376.1.5.3.1.4.12)</p>
    <rule context="*[cda:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.12']">


        <assert test="cda:id">
            [E_FR-Vaccination_CNAM-HR] Erreur de conformité : Une entrée FR-Vaccination
            ('1.3.6.1.4.1.19376.1.5.3.1.4.12') doit avoir un id@nullFlavor 'UNK'.</assert>

        <assert test="cda:effectiveTime"> 
            [E_FR-Vaccination_CNAM-HR] Erreur de conformité :
            Une entrée FR-Vaccination ('1.3.6.1.4.1.19376.1.5.3.1.4.12') doit avoir un effectiveTime/@nullFlavor 'UNK'. 
        </assert>
        
        <assert test="(cda:entryRelationship/cda:supply[cda:templateId/@root='1.2.250.1.213.1.1.3.44']/cda:performer/cda:assignedEntity/cda:id[@nullFlavor = 'UNK'])
            or (not(cda:entryRelationship[cda:supply/cda:templateId[@root='1.2.250.1.213.1.1.3.44']]))"> 
            [E_FR-Vaccination_CNAM-HR] Erreur de conformité :
            Une entrée FR-Vaccination ('1.3.6.1.4.1.19376.1.5.3.1.4.12') doit avoir un entryRelationship/supply/performer/assignedEntity/id/@nullFlavor 'UNK'. 
        </assert>
    </rule>
</pattern>
