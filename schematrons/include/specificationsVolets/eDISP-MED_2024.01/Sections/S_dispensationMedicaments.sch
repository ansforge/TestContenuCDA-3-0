<?xml version="1.0" encoding="UTF-8"?>

<!-- S_dispensationMedicaments.sch
     ......................................................................................................................................................
     Vérification de la conformité de la section "FR-Dispensation-medicaments"
     ......................................................................................................................................................
     Historique :
        - 24/01/2023 : creation
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_dispensationMedicaments">
    <title>CI-SIS section "FR-Dispensation-medicaments"</title>
    
    
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.9.1.2.3']">
        
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.2.236']">
            [1] [S_dispensationMedicaments.sch] Erreur de conformité CI-SIS : 
            La section "FR-Dispensation-medicaments" doit avoir un templateId dont l'attribut @root="1.2.250.1.213.1.1.2.236" (Conformité de la section au format CI-SIS)
        </assert>
        
        <assert test="cda:code[@code='60590-7' and @codeSystem='2.16.840.1.113883.6.1']">
            [1] [S_dispensationMedicaments.sch] Erreur de conformité CI-SIS : 
            La section "FR-Dispensation-medicaments" doit avoir un code dont l'attribut @code="60590-7" et @codeSystem="2.16.840.1.113883.6.1"
        </assert>
        
        <assert test="not(cda:author) or cda:author/cda:assignedAuthor/cda:code[@code='G15_21' and @codeSystem='1.2.250.1.213.1.1.4.5']">
            [1] [S_dispensationMedicaments.sch] Erreur de conformité CI-SIS : 
            La section "FR-Dispensation-medicaments" doit avoir un author (dispensateur) dont le code/@code="G15_21" et code/@codeSystem="1.2.250.1.213.1.1.4.5".
        </assert>
        
        <!-- Conformité au format CI-SIS de l'entrée "FR-Traitement-dispense" -->
        <assert test="count(cda:entry/cda:supply/cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.3.4'])&gt;=1">
            [2] [S_dispensationMedicaments.sch] Erreur de conformité CI-SIS :
            La section "FR-Dispensation-medicaments" doit obligatoirement contenir l'entrée "FR-Traitement-dispense" (cardinalité [1..1]),
            dont le templateId' doit être @root="1.3.6.1.4.1.19376.1.9.1.3.4" (conformité de l'entrée au format IHE PHARM DIS).
        </assert>
    </rule>
</pattern>
