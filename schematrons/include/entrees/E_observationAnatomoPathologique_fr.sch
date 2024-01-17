<?xml version="1.0" encoding="UTF-8"?>
<!--             
    
    E_observationAnatomoPathologique_fr.sch :
    Contenu :
       Contrôle la conformité de l'entrée FR-Observation-Anatomo-pathologique conformément au volet Modèles de contenu CDA.
    Historique :
    04/07/2023 : Création  
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_observationAnatomoPathologique_fr">
    <title>Vérification de la conformité de l'entrée FR-Observation-Anatomo-pathologique</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.102"]'>
        
        <assert test="self::cda:observation[@classCode = 'OBS' and @moodCode = 'EVN']">
            [E_observationAnatomoPathologique_fr] Erreur de conformité CI-SIS : L'élément "observation" doit
            contenir les attributs @classCode="OBS" et @moodCode="EVN".
        </assert>
        
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.8.1.4.9'] and cda:templateId[@root='1.2.250.1.213.1.1.3.102']">
            
            [E_observationAnatomoPathologique_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Observation-Anatomo-pathologique" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.8.1.4.9"
            - Un deuxième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.102"
        </assert>
        
        <!-- Test présence de l'élément 'code' -->
        <assert test="cda:code">
            [E_observationAnatomoPathologique_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Observation-Anatomo-pathologique" doit comporter un élément 'code'.
        </assert>
        
        <!-- Test présence de l'élément 'statusCode' -->
        <assert test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted'">
            [E_observationAnatomoPathologique_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Observation-Anatomo-pathologique" doit comporter un élément 'statusCode' et fixé à la valeur :
            - "completed" si l'observation a été effectuée et porte une valeur dans l'élément "value".
            - "aborted" dans les autres cas (la valeur n'arrivera pas).
            
        </assert>
        
        <!-- Test présence de l'élément 'effectiveTime' -->
        <assert test="count(cda:effectiveTime)=1">
            [E_observationAnatomoPathologique_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Observation-Anatomo-pathologique" doit contenir un élément "effectiveTime".</assert>
        
        <!-- Test présence de l'élément 'interpretationCode' -->
        <assert test="count(cda:interpretationCode)&lt;=1">
            [E_observationAnatomoPathologique_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Observation-Anatomo-pathologique" peut contenir un élément "interpretationCode" (cardinalité [0..1]).</assert>
        
        <!-- Test présence de l'élément 'methodCode' -->
        <assert test="count(cda:methodCode)&lt;=1">
            [E_observationAnatomoPathologique_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Observation-Anatomo-pathologique" peut contenir un élément "methodCode" (cardinalité [0..1]).</assert>
        
        <!-- Test présence de l'élément 'performer' -->
        <assert test="count(cda:performer)&lt;=1">
            [E_observationAnatomoPathologique_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Observation-Anatomo-pathologique" peut contenir un élément "performer" (cardinalité [0..1]).</assert>
        
    </rule>
</pattern>