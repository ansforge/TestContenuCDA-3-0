<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ S_patientEducationAndConsents_OBP.sch ]O@%#o>>=-
    
    Teste la conformité des entrées pour la section "patient Education And Consents" dans le volet OBP
    aux spécifications d'IHE PCC v3.0
    
    Historique :
    25/07/11 : CRI : Création
    25/10/17 : NMA : Renommage du schématron en S_patientEducationAndConsents_OBP
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_patientEducationAndConsents_OBP">
    <title>IHE PCC v3.0 patient Education And Consents</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.39"]'>
        <assert test='(.//cda:entry/cda:procedure/cda:code[@code="XX-MCH035"])'>
            [S_patientEducationAndConsents_OBP] La section doit comporter un élément 'Préparation à la naissance' (XX-MCH035).        
        </assert>
        <assert test='(.//cda:entry/cda:procedure/cda:code[@code="OBS_009"])'>
            [S_patientEducationAndConsents_OBP] La section doit comporter un élément 
            'Consultation auprès d'un centre de diagnostic prénatal' (OBS_009).        
        </assert>
        
    </rule>
</pattern>

