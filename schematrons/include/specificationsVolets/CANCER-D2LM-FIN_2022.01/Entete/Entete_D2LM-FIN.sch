<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_D2LM-FIN.sch
    Teste la conformité de l'entete du volet Entete_D2LM-FIN au CI-SIS
    
    Historique :
    10/11/2022 : Création
    25/09/2024 : Ajout des tests sur les deux éléments "setId" et "versionNumber" 

    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_D2LM-FIN">
    
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.27']"> 
            [Entete_D2LM-FIN] Le templateId "1.2.250.1.213.1.1.1.27" doit être présent.
        </assert>
        <assert test="./cda:code[@code='18748-4' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [Entete_D2LM-FIN] L'élément "code" doit avoir les attributs @code="18748-4" et @codeSystem="2.16.840.1.113883.6.1". 
        </assert>
        <assert test="./count(cda:setId[@root])=1"> 
            [Entete_D2LM-FIN] Erreur de conformité au modèle : L'élément "setId" doit être présent. 
        </assert>
        <assert test="./count(cda:versionNumber[@value])=1"> 
            [Entete_D2LM-FIN] Erreur de conformité au modèle : L'élément "versionNumber" doit être présent. 
        </assert>
    </rule>
    
</pattern>