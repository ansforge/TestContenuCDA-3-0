<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_laboratoryObservation_int.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée Laboratory Observation aux spécifications du profil  IHE LAB
    
    Historique :
    06/07/2023 : ANS : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_laboratoryObservation_int">
    <title>Vérification de la conformité de l'entrée "Laboratory Observation" </title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.3.1.6"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_laboratoryObservation_int] Erreur de conformité IHE LAB : Dans l'entrée Laboratory Observation, 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</assert>
        
        <!-- Test des templateId pour l'entrée "Laboratory Observation" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.3.1.6']">
            
            [E_laboratoryObservation_int] Erreur de conformité IHE LAB : 
            L'entrée "Laboratory Observation" doit comporter le 'templateId' suivant:
            - 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.3.1.6"
        </assert>
        <!--Vérifier la présence de l'élément code --> 
        <assert test='count(cda:code)=1'>
            [E_laboratoryObservation_int] : Erreur de conformité IHE LAB : L'élément "code" doit être présent une fois[1..1].
        </assert>
        
        <!--Vérifier la présence de l'élément statusCode et la cohérence de ses attributs  --> 
        <assert test="cda:statusCode/@code='completed' or cda:statusCode/@code='aborted' ">
            [E_laboratoryObservation_int] Erreur de Conformité IHE LAB : L'élément "statusCode" doit être présent et fixé à la valeur @code='completed' ou @code='aborted'.
        </assert>
    </rule>
    
</pattern>
