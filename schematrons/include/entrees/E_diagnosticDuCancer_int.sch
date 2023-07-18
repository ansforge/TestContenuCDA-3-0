<?xml version="1.0" encoding="UTF-8"?>
<!--             
    
    E_diagnosticDuCancer_int.sch :
    Contenu :
       Contrôle la conformité des éléments E_diagnosticDuCancer_int conformément au volet Modèles de contenu CDA.
    Historique :
    29/06/2023 : Création  
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_diagnosticDuCancer_int">
    <title>Vérification de la conformité de l'entrée IHE Cancer Diagnosis Entry(1.3.6.1.4.1.19376.1.7.3.1.4.14.1)</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.7.3.1.4.14.1"]'>
        
        <!-- Test des templateId pour l'entrée "IHE Cancer Diagnosis Entry" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.7.3.1.4.14.1'] and 
            cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.5']">
            
            [1] [E_diagnosticDuCancer_int.sch] Erreur de conformité CI-SIS : 
            L'entrée "IHE Cancer Diagnosis Entry" doit comporter les 'templateId' suivants:
            - Un premier'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.7.3.1.4.14.1"
            - Un deuxième 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.5"
        </assert>
        
        <!-- Test présence de l'élément 'code' -->
        <assert test="count(cda:code)=1 and cda:code/@code='282291009'">
            [E_diagnosticDuCancer_int.sch] Erreur de conformité CI-SIS : L'entrée "IHE Cancer Diagnosis Entry" doit comporter un élément 'code' ayant comme attribut @code='282291009'.
        </assert>
        
        <!-- Test présence de l'élément 'statusCode' -->
        <assert test="count(cda:statusCode)=1">
            [E_diagnosticDuCancer_int.sch] Erreur de conformité CI-SIS : L'entrée "IHE Cancer Diagnosis Entry" doit comporter un élément 'statusCode'.
        </assert>
        
        <!-- Test présence de l'élément 'value' -->
        <assert test="count(cda:value)&gt;=1">
            [E_diagnosticDuCancer_int.sch] Erreur de conformité CI-SIS : L'entrée "IHE Cancer Diagnosis Entry" doit comporter au moins un élément 'value'.
        </assert>
        
        <!-- Test présence de l'élément 'targetSiteCode' -->
        <assert test="count(cda:targetSiteCode)&gt;=1">
            [E_diagnosticDuCancer_int.sch] Erreur de conformité CI-SIS : L'entrée "IHE Cancer Diagnosis Entry" doit comporter au moins un élément 'targetSiteCode'.
        </assert>
        
        <assert test="not(cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='false']/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.4.14.2']) or cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='false']/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.7.3.1.4.14.2']/cda:code[@code='75620-5']">
            [E_diagnosticDuCancer_int.sch] Erreur de conformité CI-SIS : Si l'entrée 'TNM Clinical Stage Information' est présente, les attributs @typeCode et @inversionInd doivent avoir les valeurs suivantes 'SUBJ' et 'false'.
            L'élément code de l'entrée TNM Clinical Stage Information est obligatoire [1..1] et doit avoir comme attribut @code='75620-5'.
        </assert>
        
        <assert test="not(cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='false']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48']) or cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='false']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48']/cda:code[@code='21918-8']">
            [E_diagnosticDuCancer_int.sch] Erreur de conformité CI-SIS : Si l'entrée 'Autre stade si pertinent' est présente, les attributs @typeCode et @inversionInd doivent avoir les valeurs suivantes 'SUBJ' et 'false'.
            L'élément code de l'entrée 'Autre stade si pertinent' est obligatoire [1..1] et doit avoir comme attribut @code='21918-8'.
        </assert>
        
        <assert test="not(cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='true']/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.2']) or cda:entryRelationship[@typeCode='SUBJ' and @inversionInd='true']/cda:act[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.2']/cda:code[@code='48767-8']">
            [E_diagnosticDuCancer_int.sch] Erreur de conformité CI-SIS : Si l'entrée 'FR-Commentaire-ER' est présente, les attributs @typeCode et @inversionInd doivent avoir les valeurs suivantes 'SUBJ' et 'true'.
            L'élément code de l'entrée 'FR-Commentaire-ER' est obligatoire [1..1] et doit avoir comme attribut @code='48767-8'.
        </assert>
    </rule>
    
</pattern>