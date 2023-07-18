<?xml version="1.0" encoding="UTF-8"?>
<!--             
    
    E_organismeAssuranceMaladie_fr.sch :
    Contenu :
       Contrôle la conformité de l'entrée FR-Organisme-assurance-maladie conformément au volet Modèles de contenu CDA.
    Historique :
    05/07/2023 : Création  
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_organismeAssuranceMaladie_fr">
    <title>Vérification de la conformité de l'entrée FR-Organisme-assurance-maladie</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.18"]'>
        
        <assert test="self::cda:act[@classCode = 'ACT' and @moodCode = 'EVN']">
            [E_organismeAssuranceMaladie_fr] Erreur de conformité CI-SIS : L'élément "act" doit
            contenir les attributs @classCode="ACT" et @moodCode="EVN". 
        </assert>
        
        <!-- Test des templateId pour l'entrée "FR-Organisme-assurance-maladie" -->
        <assert test="(cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.18'] and cda:templateId[@root='2.16.840.1.113883.10.20.1.26'])
            or cda:templateId[@root='1.2.250.1.213.1.1.3.94']">
            
            [E_organismeAssuranceMaladie_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Organisme-assurance-maladie" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.18"
            - Un deuxième 'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.26" 
        </assert>
        <!-- Test présence de l'élément 'id' -->
        <assert test="count(cda:id)&gt;=1">
            [E_organismeAssuranceMaladie_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Organisme-assurance-maladie " doit comporter un ou plusieurs élément 'id'.
        </assert>
        
        <!-- Test présence de l'élément 'code' -->
        <assert test="count(cda:code)=1">
            [E_organismeAssuranceMaladie_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Organisme-assurance-maladie " doit comporter un élément 'code'.
        </assert>
        <!-- Test présence de l'élément 'statusCode' -->
        <assert test="cda:statusCode[@code='completed']"> 
            [E_organismeAssuranceMaladie_fr.sch] : Erreur de conformité CI-SIS : Le composant "statutCode" est toujours fixé à la valeur code='completed'. 
        </assert>
    </rule>
    
    <!-- performer -->
    
    <rule context="*[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.18']/cda:performer">
        <assert test="@typeCode='PRF'">
            [E_organismeAssuranceMaladie_fr.sch] Errreur de conformité CI-SIS : Dans l'entrée 'FR-Organisme-assurance-maladie', l'élément 'performer' doit contenir un attribut typeCode='PRF'.
        </assert>
        <assert test="cda:assignedEntity">
            [E_organismeAssuranceMaladie_fr.sch] Errreur de conformité CI-SIS : Dans l'entrée 'FR-Organisme-assurance-maladie', l'élément 'performer' doit contenir un élément 'assignedEntity'. 
        </assert>
    
    </rule>
</pattern>