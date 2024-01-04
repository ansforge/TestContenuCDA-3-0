<?xml version="1.0" encoding="UTF-8"?>

<!-- S_procedureEntry_OBP-SEM.sch 
    
    Teste la conformité de la section "Procedures" (1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11)
    aux spécifications du volet OBP-SEM.
    
    Historique :
    30/11/2023 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_procedureEntry_OBP-SEM">
    <title>Procedures and Intervention Section</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11"]'>         
        <assert test='cda:entry/cda:procedure/cda:code[@code="275977009"]'>
            [S_procedureEntry_OBP-SEM]: Une section "Procedures and Interventions" 
            doit contenir une entrée "Test de Guthrie"
        </assert>
        <assert test='cda:entry/cda:procedure/cda:code[@code="GEN-092.04.13"]'>
            [S_procedureEntry_OBP-SEM]: Une section "Procedures and Interventions" 
            doit contenir une entrée "Autre autre"
        </assert>
    </rule>
</pattern>