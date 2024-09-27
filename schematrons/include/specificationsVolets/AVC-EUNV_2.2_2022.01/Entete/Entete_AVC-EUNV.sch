<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_AVC-EUNV.sch
    Teste la conformité de l'entete du volet AVC-EUNV au CI-SIS
    
    Historique :
    01/02/2018 : Création
    10/11/2022 : Mise à jour suite à la migration des terminologies
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_AVC-EUNV">
    
    <rule context='cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent'>
         
        <!-- Teste la présence de la representedOrganisation -->
        <assert test="cda:performer/cda:assignedEntity/cda:representedOrganization">
            [Entete_AVC-EUNV] L'organisation représentée est obligatoirement présente 
        </assert>
    </rule>
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.16']"> 
            [Entete_AVC-EUNV] Le template du modèle AVC-EUNV (1.2.250.1.213.1.1.1.16) doit être présent.
        </assert>
        
        <assert test="./cda:code[@code='34133-9' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [Entete_AVC-EUNV] L'élément code doit avoir @code ="34133-9" et @codeSystem = "2.16.840.1.113883.6.1"/>. 
        </assert>
    </rule>
</pattern>