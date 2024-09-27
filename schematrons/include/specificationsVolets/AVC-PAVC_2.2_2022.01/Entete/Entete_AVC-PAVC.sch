<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_AVC-PAVC.sch
    Teste la conformité de l'entete du volet AVC-PAVC au CI-SIS
    
    Historique :
    01/02/2018 : Création
    10/11/2022 : Mise à jour suite à la migration des terminologies
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_AVC-PAVC">
    
    <rule context='cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent'>
         
        <!-- Teste la présence de la representedOrganisation -->
        <assert test="cda:performer/cda:assignedEntity/cda:representedOrganization">
            [Entete_AVC-PAVC] L'organisation représentée est obligatoirement présente 
        </assert>
    </rule>
    
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.25']"> 
            [CI-SIS_AVC-PAVC_2.2_2022.01_2022.01] Le template du modèle AVC-PAVC (1.2.250.1.213.1.1.1.25) doit être présent.
        </assert>
        
        <assert test="./cda:code[@code='11488-4' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [CI-SIS_AVC-PAVC_2.2_2022.01_2022.01] L'élément code doit avoir @code ="11488-4" et @codeSystem = "2.16.840.1.113883.6.1"/>. 
        </assert>
    </rule>
</pattern>