<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_OBP-SCE.sch
    Teste la conformité de l'entete du volet OBP-SCE au CI-SIS
    
    Historique :
    07/02/2018 :  NMA : Création
    03/11/2022 : ANS : Mises à jour suite à la migration
    
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_OBP-SCE">
    
    <rule context='cda:ClinicalDocument'>
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.12.5']"> 
            [Entete_OBP-SCE] Le template du modèle OBP-SCE (1.2.250.1.213.1.1.1.12.5) doit être présent.
        </assert>
        
        <assert test="./cda:code[@code='15508-5' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [Entete_OBP-SCE] L'élément code doit avoir @code ="15508-5" et @codeSystem = "2.16.840.1.113883.6.1"/>. 
        </assert>
        
        <assert test="cda:participant">
            [Entete_OBP-SCE] Le médecin traitant est un élément obligatoire des modèles OBP
        </assert>
        
        <assert test="cda:participant[@typeCode='INF'] or cda:participant[@typeCode='CON']">
            [Entete_OBP-SCE] L'attribut typeCode de l'élément participant prend la valeur typeCode='INF' s'il s'agit du médecin traitant et typeCode='CON' s'il s'agit d'un correspondant.
        </assert>
        <assert test="cda:participant/cda:associatedEntity/cda:telecom">
            [Entete_OBP-SCE] L'adresse de télécomunication telecom est obligatoire et a une cardinalité [1..*]
        </assert>
        
    </rule>
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent">
        <assert test="cda:code[@code='63893-2']">
            [Entete_OBP-SCE] L'attribut code de documentationOf/serviceEvent/Code est fixé à '63893-2' pour le SCE
        </assert>
        
    </rule>
    
    
</pattern>