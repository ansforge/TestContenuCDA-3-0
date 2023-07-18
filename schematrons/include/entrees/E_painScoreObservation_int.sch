<?xml version="1.0" encoding="UTF-8"?>
<!--             
    
    E_painScoreObservation_int.sch :
    Contenu :
       Contrôle la conformité de l'entrée IHE Pain Score Observation en fonction du profil IHE PCC
 .
    Historique :
    04/07/2023 : Création  
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_painScoreObservation_int">
    <title>Vérification de la conformité de l'entrée IHE Pain Score Observation</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.12.3.1"]'>
        
        <assert test="self::cda:observation[@classCode = 'OBS']">
            [E_painScoreObservation_int] Erreur de conformité CI-SIS : L'élément "observation" doit
            contenir l' attribut @classCode="OBS".
        </assert>
        
        <!-- Test des templateId pour l'entrée "IHE Pain Score Observation" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']
            and cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.1.12.3.1']">
            
            [1] [E_painScoreObservation_int.sch] Erreur de conformité CI-SIS : 
            L'entrée "HE Pain Score Observation" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.13"
            - Un deuxième 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.1.12.3.1"
        </assert>
        
        <!-- Test présence de l'élément 'code' -->
        <assert test="cda:code[@code ='38208-5'or @code='38221-8' or @code='38214-3' and @codeSystem ='2.16.840.1.113883.6.1']">
            [E_painScoreObservation_int.sch] Erreur de conformité CI-SIS : L'entrée "IHE Pain Score Observation" doit comporter un élément 'code,fixé à la valeur suivante :
            '38208-5' or '38221-8' or '38214-3'
        </assert>
        
        <!-- Test présence de l'élément 'value' -->
        <assert test="count(cda:value)&lt;=1">
            [E_painScoreObservation_int.sch] Erreur de conformité CI-SIS : L'entrée "HE Pain Score Observation" doit comporter un ou plusieurs élément 'value'.
        </assert>
        
        
    </rule>
</pattern>