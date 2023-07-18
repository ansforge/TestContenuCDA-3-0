<?xml version="1.0" encoding="UTF-8"?>

<!-- E_en-rapport-avec-la-prevention_ANS
     ......................................................................................................................................................
     Vérification de la conformité de l'entrée FR-En-rapport-avec-la-prevention (1.2.250.1.213.1.1.3.48.34) créée par l'ANS
     ......................................................................................................................................................
     Historique :
     - 03/07/2023 : Création
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_enRapportAvecLaPrevention_ANS">
    <title>Vérification de la conformité de l'entrée FR-En-rapport-avec-la-prevention (1.2.250.1.213.1.1.3.48.34) créée par l'ANS</title>     
    
    <rule context="*[cda:templateId/@root='1.2.250.1.213.1.1.3.48.34']">
        
        <let name="count_valueTrue" value="(count(cda:value[@value='true']))"/>
        <let name="count_valueFalse" value="(count(cda:value[@value='false']))"/>
        
        <!-- Test des templateId pour l'entrée "FR-En-rapport-avec-la-prevention" -->
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.3.48'] and cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.13'] and cda:templateId[@root='1.2.250.1.213.1.1.3.48.34']">
            [1] [E_enRapportAvecLaPrevention.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-En-rapport-avec-la-prevention" doit avoir trois 'templateId' :
            - Un premier 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.13" (Conformité de l'entrée au parent IHE PCC)
            - Un deuxième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.48" (Conformité de l'entrée au parent CI-SIS)
            - Un troisième 'templateId' dont l'attribut @root="1.2.250.1.213.1.1.3.48.34" (Conformité de l'entrée au format CI-SIS)
        </assert>
        
        <!-- Test présence et nombre max de l'élément 'id' -->
        <assert test="count(cda:id)=1">
            [2] [E_enRapportAvecLaPrevention.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-En-rapport-avec-la-prevention" doit comporter un élément 'id'.
        </assert>        
        
        <!-- Test présence et format de l'élément 'code' -->
        <assert test="(count(cda:code[@code='GEN-295'][@codeSystem='1.2.250.1.213.1.1.4.322'])=1)">
            [3] [E_enRapportAvecLaPrevention.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-En-rapport-avec-la-prevention" doit comporter un élément 'code' avec les attributs :
            - @code="GEN-295" (cardinalité [1..1])
            - @codeSystem="1.2.250.1.213.1.1.4.322" (cardinalité [1..1])
        </assert>            
        
        <!-- Test de la présence de l'élément fils 'reference' -->
        <assert test="count(cda:text/cda:reference)=1">
            [4] [E_enRapportAvecLaPrevention.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-En-rapport-avec-la-prevention" doit comporter un élément 'text/reference'. 
        </assert>
        
        <!-- Test de la présence de l'élément 'statusCode' -->
        <assert test="(count(cda:statusCode[@code='completed'])=1)">
            [5] [E_enRapportAvecLaPrevention.sch] Erreur de conformité CI-SIS :  
            L'entrée "FR-En-rapport-avec-la-prevention" doit comporter un élément 'statusCode' et son attribut @code="completed". 
        </assert>
        
        <!-- Test présence de l'élément 'value' -->
        <assert test="(($count_valueTrue=1) or ($count_valueFalse=1)) and count(cda:value)=1">
            [7] [E_enRapportAvecLaPrevention.sch] Erreur de conformité CI-SIS : 
            L'entrée "FR-En-rapport-avec-la-prevention" doit comporter un élément 'value' qui ne peut prendre qu'une des valeurs suivantes :
            value='true' : le traitement est prescrit dans le cadre d'une prévention
            value='false' : le traitement n'est pas prescrit dans le cadre d'une prévention
        </assert>
        
    </rule>
    
</pattern>
