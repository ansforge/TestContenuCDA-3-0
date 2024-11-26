<?xml version="1.0" encoding="UTF-8"?>

<!-- Entete_eDIS-MED.sch    
     ......................................................................................................................................................
     Vérification de la conformité de l'entête au modèle du document eDIS-MED du CI-SIS.
     ......................................................................................................................................................
     Historique :
        - 17/06/2024 : Création
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_eDISP-MED_2024.01">
    
    <rule context="cda:ClinicalDocument">
        <!-- Conformité au Volet IHE Pharm DIS -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.1.3']"> 
            [eDIS-DM_2024.01] Erreur de conformité : Le templateId "1.3.6.1.4.1.19376.1.9.1.1.3" de IHE Pharm DIS est obligatoire.
        </assert>
        <!-- Conformité au volet IHE PCC -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.1.1']"> 
            [eDIS-DM_2024.01] Erreur de conformité : Le templateId "1.3.6.1.4.1.19376.1.5.3.1.1.1" est obligatoire.
        </assert>
        <!-- Conformité au modèle de document eDIS-MED v2024.01 -->
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.54']"> 
            [eDIS-DM_2024.01] Erreur de conformité : Le templateId "1.2.250.1.213.1.1.1.54" est obligatoire.
        </assert>        
        <!-- Code du document -->
        <assert test="./cda:code[@code='60593-1' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [eDIS-DM_2024.01] Erreur de conformité : L'élément "code" doit avoir les attributs @code="60593-1" et @codeSystem="2.16.840.1.113883.6.1"/>. 
        </assert>
        <!-- Code de l'acte documenté -->
        <assert test="cda:documentationOf/cda:serviceEvent/cda:code/@code='60593-1'"> 
            [eDIS-DM_2024.01] Erreur de conformité : Le code @code='60593-1' de l'acte documenté est obligatoire.
        </assert>  
        
    </rule>
    
</pattern>