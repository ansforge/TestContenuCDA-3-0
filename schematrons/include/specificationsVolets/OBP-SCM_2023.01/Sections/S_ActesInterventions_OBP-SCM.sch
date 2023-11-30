<?xml version="1.0" encoding="UTF-8"?>

<!--  S_ActesInterventions_OBP-SCM.sch 
    
    
    Historique :
    03/11/2022 : ANS : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_ActesInterventions_OBP-SCM">  
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11"]'>  
        
        <assert test="cda:entry/cda:procedure[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.19']">
            [S_ActesInterventions_OBP-SCM] : L'entrée (FR-Acte) est obligatoire
        </assert>
        
    </rule>
</pattern>