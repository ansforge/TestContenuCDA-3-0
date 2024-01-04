<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_OBP-SAP.sch
    Teste la conformité de l'entete du volet OBP-SAP au CI-SIS
    
    Historique :
    07/02/2018 : Création
    25/10/2022 : Version 2022.01
    11/05/2023 : Version 2023.01
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_OBP-SAP">
    
    <rule context='cda:ClinicalDocument'>
        
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.12.1']"> 
            [Entete_OBP-SAP] Le template du modèle OBP-SAP (1.2.250.1.213.1.1.1.12.1) doit être présent.
        </assert>
        
        <assert test="./cda:code[@code='57055-6' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [Entete_OBP-SAP] L'élément code doit avoir @code ="57055-6" et @codeSystem = "2.16.840.1.113883.6.1". 
        </assert>
        
        <assert test="cda:participant">
            [Entete_OBP-SAP] Le médecin traitant est un élément obligatoire du modèle OBP-SAP
        </assert>
        
        <assert test="cda:participant[@typeCode='INF'] or cda:participant[@typeCode='CON']">
            [Entete_OBP-SAP] L'attribut typeCode de l'élément participant prend la valeur typeCode='INF' s'il s'agit du médecin traitant et typeCode='CON' s'il s'agit d'un correspondant.
        </assert>
        <assert test="cda:participant/cda:associatedEntity/cda:telecom">
            [Entete_OBP-SAP] L'adresse de télécomunication telecom est obligatoire et a une cardinalité [1..*]
        </assert>
        
    </rule>
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent">
        
        <assert test="cda:code[@code='11429006']">
            [Entete_OBP-SAP] L'attribut code de documentationOf/serviceEvent/Code est fixé à '11429006'
        </assert>       
    </rule>    
    
</pattern>