<?xml version="1.0" encoding="UTF-8"?>
<!--             
    
    E_observationSurEchelleDouleur_fr.sch :
    Contenu :
       Contrôle la conformité des éléments E_observationSurEchelleDouleur_fr conformément au volet Modèles de contenu CDA.
    Historique :
    04/07/2023 : Création  
    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_observationSurEchelleDouleur_fr">
    <title>Vérification de la conformité de l'entrée FR-Observation-sur-echelle-douleur(1.3.6.1.4.1.19376.1.5.3.1.1.12.3.1)</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.89"]'>
        
        <assert test="self::cda:observation[@classCode = 'OBS' and @moodCode = 'EVN']">
            [E_observationSurEchelleDouleur_fr] Erreur de conformité CI-SIS : L'élément "observation" doit
            contenir les attributs @classCode="OBS" et @moodCode="EVN".
        </assert>
        
        <!-- Test des templateId pour l'entrée "FR-Observation-sur-echelle-douleur" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.1.12.3.1'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']
            and cda:templateId[@root='1.2.250.1.213.1.1.3.89']">
            
            [1] [E_observationSurEchelleDouleur_fr.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-Notes-du-dispensateur" doit comporter les 'templateId' suivants:
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.13"
            - Un deuxième 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.1.12.3.1"
            - Un troisième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.89"
        </assert>
        <!-- Test présence de l'élément 'id' -->
        <assert test="count(cda:id)=1">
            [E_observationSurEchelleDouleur_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Observation-sur-echelle-douleur" doit comporter au moins un élément 'id'.
        </assert>
        
        <!-- Test présence de l'élément 'code' -->
        <assert test="cda:code[@code ='38208-5' and @codeSystem ='2.16.840.1.113883.6.1']">
            [E_observationSurEchelleDouleur_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Observation-sur-echelle-douleur" doit comporter un élément 'code'.
        </assert>
        <!-- Test présence de l'élément 'text' -->
        <assert test="count(cda:text)=1">
            [E_observationSurEchelleDouleur_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Observation-sur-echelle-douleur" doit comporter au moins un élément 'text'.
        </assert>
        
        <!-- Test présence de l'élément 'statusCode' -->
        <assert test="count(cda:statusCode)=1 and cda:statusCode[@code ='completed']">
            [E_observationSurEchelleDouleur_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Observation-sur-echelle-douleur" doit comporter un élément 'statusCode' fixé à la valeur 'completed'.
        </assert>
        <!-- Test présence de l'élément 'value' -->
        <assert test="count(cda:value)=1">
            [E_observationSurEchelleDouleur_fr.sch] Erreur de conformité CI-SIS : L'entrée "FR-Observation-sur-echelle-douleur" doit comporter un élément 'value'.
        </assert>
        
       
    </rule>
</pattern>