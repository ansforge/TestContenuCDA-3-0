<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_usualOccupationAndIndustryObservationEntry_int.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée IHE Usual Occupation And Industry Observation Entry aux spécifications du profil IHE PCC
    
    Historique :
    05/07/2023 : ANS : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_usualOccupationAndIndustryObservationEntry_int">
    <title>Vérification de la conformité de l'entrée IHE Usual Occupation And Industry Observation Entry </title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.20.5"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_usualOccupationAndIndustryObservationEntry_int] Erreur de conformité CI-SIS : Dans l'entrée IHE Usual Occupation And Industry Observation Entry (1.2.250.1.213.1.1.3.125), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</assert>
        
        <!-- Test des templateId pour l'entrée "IHE Usual Occupation And Industry Observation Entry " -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.20.5']">
            
            [E_usualOccupationAndIndustryObservationEntry_int] Erreur de conformité IHE PCC : 
            L'entrée "IHE Usual Occupation And Industry Observation Entry " doit comporter le 'templateId' suivant:
            - 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.20.5'"
        </assert>
        
        <!-- Test présence de l'élément 'id' -->
        <assert test='count(cda:id)&gt;=1'>
            [E_usualOccupationAndIndustryObservationEntry_int] : Erreur de conformité IHE PCC : L'élément "id" est présent une ou plusieurs fois.
        </assert>
        
        <!-- Test présence de l'élément 'code' -->
        <assert test='count(cda:code)=1'>
            [E_usualOccupationAndIndustryObservationEntry_int] : Erreur de conformité IHE PCC : L'élément "code" doit être présent une fois. 
        </assert>
        
        <!-- Test présence de l'élément 'statusCode' -->
        <assert test="cda:statusCode[@code='completed']"> 
            [E_usualOccupationAndIndustryObservationEntry_int] : Erreur de conformité IHE PCC : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. 
        </assert>
        <!-- Test présence de l'élément 'effectiveTime' -->
        <assert test='count(cda:effectiveTime)=1'>
            [E_usualOccupationAndIndustryObservationEntry_int] : Erreur de conformité IHE PCC : L'élément "effectiveTime" doit être présent une fois [1..1].
        </assert>
        <!-- Test présence de l'élément 'value' -->
        <assert test='count(cda:value)=1'>
            [E_usualOccupationAndIndustryObservationEntry_int] : Erreur de conformité IHE PCC : L'élément "value" doit être présent une fois [1..1].
        </assert>
        
    </rule>
    
</pattern>
