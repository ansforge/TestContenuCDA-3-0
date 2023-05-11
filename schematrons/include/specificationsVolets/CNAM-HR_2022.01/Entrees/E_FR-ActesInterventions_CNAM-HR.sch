<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    E_FR-ActesInterventions_CNAM-HR.sch :
    
    Vérification de la conformité d'une entrée FR-Acte (1.3.6.1.4.1.19376.1.5.3.1.4.19)
    
    Historique :
    05/11/2022 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_FR-ActesInterventions_CNAM-HR">
    <p>Vérification de la conformité d'une entrée FR-Acte (1.3.6.1.4.1.19376.1.5.3.1.4.19)</p>
    <rule context="*[cda:templateId/@root = '1.3.6.1.4.1.19376.1.5.3.1.4.19']">

        <!-- <assert test="cda:performer/cda:assignedEntity/cda:id[@nullFlavor = 'UNK']"> 
            [E_FR-ActesInterventions_CNAM-HR] Erreur de conformité :
            Une entrée FR-Acte ('1.3.6.1.4.1.19376.1.5.3.1.4.19') doit avoir un performer/assignedEntity/id/@nullFlavor 'UNK'. 
        </assert> -->

    </rule>
</pattern>
