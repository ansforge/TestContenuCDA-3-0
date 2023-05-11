<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_CARD-F-PRC-AVK.sch
    Teste la conformité de l'entete de CARD-F-PRC-AVK au CI-SIS
    
    Historique :
    02/01/2023: Création    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_CARD-F-PRC-AVK">
    
    <!-- Contrôles spécifiques à l'en tête -->
    <rule context="cda:ClinicalDocument">
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.2.1.1']"> 
            [Entete_CARD-F-PRC-AVK] Erreur de conformité au modèle : Le templateId "1.2.250.1.213.1.1.1.2.1.1" doit être présent.
        </assert>
        <assert test="./cda:code[@code='34133-9' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [Entete_CARD-F-PRC-AVK] Erreur de conformité au modèle : L'élément "code" doit avoir les attributs @code="77436-4" et @codeSystem="2.16.840.1.113883.6.1". 
        </assert>
    </rule>
    <rule context="cda:ClinicalDocument/cda:participant">
        <assert test="./@typeCode='INF'"> 
            [Entete_CARD-F-PRC-AVK] Erreur de conformité au modèle : L'élément "participant" doit avoir l'attribut @typeCode='INF'.
        </assert>
        <assert test="./cda:functionCode[@code='PCP' or @code='ATTPHYS']"> 
            [Entete_CARD-F-PRC-AVK] Erreur de conformité au modèle : L'élément "participant/functionCode" doit avoir l'attribut @code='PCP' pour le médecin traitant et @code='ATTPHYS' pour le Cardiologue traitant.
        </assert>
    </rule>
    
    
</pattern>