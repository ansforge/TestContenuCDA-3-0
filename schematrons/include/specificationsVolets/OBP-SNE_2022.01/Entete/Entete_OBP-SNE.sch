<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_OBP-SNE.sch
    Teste la conformité de l'entete du volet OBP-SNE au CI-SIS
    
    Historique :
    07/02/2018 : ANS : Création
    03/11/2022 : ANS : Mise à jour suite à la migration
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_OBP-SNE">
    
    <rule context='cda:ClinicalDocument'>
        
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.12.3']"> 
            [Entete_OBP-SNE] Le template "Synthèse Salle de Naissance Enfant (SNE)" (1.2.250.1.213.1.1.1.12.2) doit être présent.
        </assert>
        
        <assert test="cda:code[@code='15508-5' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [Entete_OBP-SNE] L'élément code doit avoir @code="15508-5" et @codeSystem="2.16.840.1.113883.6.1"/>. 
        </assert>
        
        <assert test="cda:participant">
            [Entete_OBP-SNE] Le médecin traitant est un élément obligatoire du modèle OBP-SNE
        </assert>
        
        <assert test="cda:participant[@typeCode='INF'] or cda:participant[@typeCode='CON']">
            [Entete_OBP-SNE] L'attribut typeCode de l'élément participant prend la valeur typeCode='INF' s'il s'agit du médecin traitant et typeCode='CON' s'il s'agit d'un correspondant.
        </assert>
        <assert test="cda:participant/cda:associatedEntity/cda:telecom">
            [Entete_OBP-SNE] L'adresse de télécomunication telecom est obligatoire et a une cardinalité [1..*]
        </assert>
        
    </rule>
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent">
        
        <assert test="cda:code[@code='57057-2']">
            [Entete_OBP-SNE] L'attribut code de documentationOf/serviceEvent/Code est fixé à '57057-2'
        </assert>
                
    </rule>
    
    
</pattern>