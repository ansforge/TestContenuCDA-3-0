<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_AVC-SUNV.sch
    Teste la conformité de l'entete du volet AVC-SUNV au CI-SIS
    
    Historique :
    01/02/2018 : Création
    10/11/2022 : Mise à jour suite à la migration des terminologies
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_AVC-SUNV">
    
    <rule context='cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent'>
         
        <!-- Teste la présence de la representedOrganisation -->
        <assert test="cda:performer/cda:assignedEntity/cda:representedOrganization">
            [Entete_AVC-SUNV] L'organisation représentée est obligatoirement présente 
        </assert>
    </rule>
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.17']"> 
            [Entete_AVC-SUNV] Le template du modèle AVC-SUNV (1.2.250.1.213.1.1.1.17) doit être présent.
        </assert>
        
        <assert test="./cda:code[@code='34133-9' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [Entete_AVC-SUNV] L'élément code doit avoir @code ="34133-9" et @codeSystem = "2.16.840.1.113883.6.1"/>. 
        </assert>
    </rule>
    
    
</pattern>