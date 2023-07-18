<?xml version="1.0" encoding="UTF-8"?>
<!--             
    
    E_acte_fr.sch :
    Contenu :
       Contrôle la conformité des éléments E_acte_fr conformément au volet Modèles de contenu CDA.
    Historique :
    28/06/2023 : Création  
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_acte_fr">
    <title>Vérification de la conformité de l'entrée FR-Acte(1.3.6.1.4.1.19376.1.5.3.1.4.19)</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.19"]'>
        
        <!-- Test des templateId pour l'entrée "FR-Acte" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.19'] and (cda:templateId[@root='2.16.840.1.113883.10.20.1.29']
            or cda:templateId[@root='2.16.840.1.113883.10.20.1.25']) and cda:templateId[@root='1.2.250.1.213.1.1.3.62']">
            
            [1] [E_acte_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Acte" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.19"
            - Un deuxième 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.29" si l'acte est réalisé
            - Un troisième 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.25" si l'acte est prévu
            - Un quatrième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.62"
        </assert>
        
        <!-- Test présence de l'élément 'code' -->
        <assert test="count(cda:code)=1">
            [E_acte_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Acte" doit comporter un élément 'code'.
        </assert>
        
        <!-- Test présence de l'élément 'text' -->
        <assert test="count(cda:text)=1">
            [E_acte_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Acte" doit comporter un élément 'text'.
        </assert>
        
        <!-- Test présence de l'élément 'text' -->
        <assert test="count(cda:statusCode)=1">
            [E_acte_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Acte" doit comporter un élément 'statusCode'.
        </assert>
        
        <assert test='count(cda:targetSiteCode)&gt;=0'>
            [E_acte_fr.sch] Erreur de conformité CI-SIS : Un seul élément targetSiteCode au maximum peut être présent
        </assert>
        
        <assert test="not(cda:entryRelationship[@typeCode='COMP' and @inversionInd='true']/cda:act[cda:templateId/@root='1.2.250.1.213.1.1.3.36']) or cda:entryRelationship[@typeCode='COMP' and @inversionInd='true']/cda:act[cda:templateId/@root='1.2.250.1.213.1.1.3.36']/cda:code">
            [E_acte_fr.sch] Erreur de conformité CI-SIS : Si l'entrée 'Circonstances ayant décidé de l'acte' est présente, les attributs @typeCode et @inversionInd doivent avoir les valeurs suivantes 'COMP' et 'true'.
            L'élément code de l'entrée est obligatoire [1..1].
        </assert>
        
        <assert test="not(cda:entryRelationship[@typeCode='RSON' and @inversionInd='false']/cda:act[cda:templateId/@root='1.2.250.1.213.1.1.3.36']) or cda:entryRelationship[@typeCode='RSON' and @inversionInd='false']/cda:act[cda:templateId/@root='1.2.250.1.213.1.1.3.36']/cda:code">
            [E_acte_fr.sch] Erreur de conformité CI-SIS : Si l'entrée 'Motif de l'acte' est présente, les attributs @typeCode et @inversionInd doivent avoir les valeurs suivantes 'RSON' et 'false'.
            L'élément code de l'entrée est obligatoire [1..1].
        </assert>
        
        <assert test="not(cda:entryRelationship[@typeCode='REFR' and @inversionInd='false']/cda:act[cda:templateId/@root='1.2.250.1.213.1.1.3.36']) or cda:entryRelationship[@typeCode='REFR' and @inversionInd='false']/cda:act[cda:templateId/@root='1.2.250.1.213.1.1.3.36']/cda:code">
            [E_acte_fr.sch] Erreur de conformité CI-SIS : Si l'entrée 'Réference interne au DM' est présente, les attributs @typeCode et @inversionInd doivent avoir les valeurs suivantes 'REFR' et 'false'.
            L'élément code de l'entrée est obligatoire [1..1].
        </assert>
        
        <assert test="not(cda:entryRelationship[cda:observation/cda:code/@code='GEN-023' and @typeCode='COMP' and @inversionInd='false']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48']) or cda:entryRelationship[@typeCode='COMP' and @inversionInd='false']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48']/cda:code[@code='GEN-023']">
            [E_acte_fr.sch] Erreur de conformité CI-SIS : Si l'entrée 'Difficulté' est présente, les attributs @typeCode et @inversionInd doivent avoir les valeurs suivantes 'COMP' et 'false'.
            Le code de l'entrée doit avoir l'attribut @code='GEN-023'.
            L'élément code de l'entrée est obligatoire [1..1].
        </assert>
        
        <assert test="not(cda:entryRelationship[cda:observation/cda:code/@code!='GEN-023' and @typeCode='COMP' and @inversionInd='false']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48']) or cda:entryRelationship[@typeCode='COMP' and @inversionInd='false']/cda:observation[cda:templateId/@root='1.2.250.1.213.1.1.3.48']/cda:code">
            [E_acte_fr.sch] Erreur de conformité CI-SIS : Si l'entrée 'Score' est présente, les attributs @typeCode et @inversionInd doivent avoir les valeurs suivantes 'COMP' et 'false'.
            L'élément code de l'entrée est obligatoire [1..1].
        </assert>
    </rule>
    
</pattern>