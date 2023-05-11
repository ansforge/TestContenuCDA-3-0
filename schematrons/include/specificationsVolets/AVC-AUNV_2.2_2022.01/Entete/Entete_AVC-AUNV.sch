<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_AVC-AUNV.sch
    Teste la conformité de l'entete du volet AVC-AUNV au CI-SIS
    
    Historique :
    01/02/2018 : Création
    10/11/2022 : Mise à jour suite à la migration des terminologies
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_AVC-AUNV">
    
    <rule context='cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent'>
         
        <!-- Teste la présence de la representedOrganisation -->
        <assert test="cda:performer/cda:assignedEntity/cda:representedOrganization">
            [Entete_AVC-AUNV] L'organisation représentée est obligatoirement présente 
        </assert>
    </rule>
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.15']"> 
            [Entete_AVC-AUNV] Le template du modèle AVC-AUNV (1.2.250.1.213.1.1.1.15) doit être présent.
        </assert>
        
        <assert test="./cda:code[@code='34133-9' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [Entete_AVC-AUNV] L'élément code doit avoir @code ="34133-9" et @codeSystem = "2.16.840.1.113883.6.1" 
        </assert>
    </rule>
    
    
</pattern>