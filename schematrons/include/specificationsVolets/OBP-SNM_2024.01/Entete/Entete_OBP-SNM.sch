<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_OBP-SNM.sch
    Teste la conformité de l'entête du document OBP-SNM au CI-SIS
    
    Historique :
    30/11/2023 : Création
    25/09/2024 : Ajout des tests sur les deux éléments "setId" et "versionNumber"
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_OBP-SNM">
    
    <rule context='cda:ClinicalDocument'>
        
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.12.2']"> 
            [Entete_OBP-SNM] Le template du modèle OPB-SNM (1.2.250.1.213.1.1.1.12.2) doit être présent.
        </assert>            
        <assert test="./cda:code[@code='57057-2' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [Entete_OBP-SNM] L'élément code doit avoir @code ="57057-2" et @codeSystem = "2.16.840.1.113883.6.1"/>. 
        </assert>
        
        <!-- Verifier le setId du modèle -->
        <assert test="./count(cda:setId[@root])=1"> 
            [Entete_OBP-SNM]  Erreur de conformité au modèle : L'élément "setId" doit être présent. 
        </assert>
        <!-- Verifier le versionNumber du modèle -->
        <assert test="./count(cda:versionNumber[@value])=1"> 
            [Entete_OBP-SNM] Erreur de conformité au modèle : L'élément "versionNumber" doit être présent. 
        </assert>
        
        <assert test="cda:participant/cda:associatedEntity/cda:telecom">
            [Entete_OBP-SNM] L'adresse de télécomunication telecom est obligatoire et a une cardinalité [1..*]
        </assert>        
    </rule>
    
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent">
        <assert test="cda:code[@code='236973005']">
            [Entete_OBP-SNM] L'attribut code de documentationOf/serviceEvent/code est fixé à '236973005' [SNOMED CT].
        </assert>        
    </rule>
    
</pattern>