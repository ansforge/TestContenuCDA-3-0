<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ S_codedSocialHistory_OBP.sch ]O@%#o>>=-

Teste la conformité de la section "Coded Social History" (1.3.6.1.4.1.19376.1.5.3.1.3.16.1)
aux spécifications d'IHE PCC v3.0
Vérification que les entrées sont du type Social History Observation (1.3.6.1.4.1.19376.1.5.3.1.4.13.4)

Historique :
24/06/11 : CRI : Création
25/10/17 : NMA : Renommage du schématron en S_codedSocialHistory_OBP

-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_codedSocialHistory_OBP">
   
    <title>IHE PCC Social History Observation: 1.3.6.1.4.1.19376.1.5.3.1.4.13.4</title>   
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13.4"]'> 
        
        <assert test='.//cda:code[
            @code = "XX-MCH177" 
            or @code="XX-MCH181"
            or @code="OBS_011"
            or @code="OBS_012"
            or @code="OBS_013"
            ]'> 
            [S_codedSocialHistory_OBP] La section "Coded Social History"  doit uniquement contenir des éléments spécifiés dans le volet OBP.
        </assert> 
    </rule>
</pattern>

