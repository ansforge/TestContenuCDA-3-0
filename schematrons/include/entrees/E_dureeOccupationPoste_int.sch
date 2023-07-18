<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_dureeOccupationPoste_int.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée IHE-PCC - Usual Occupation Duration (1.3.6.1.4.1.19376.1.5.3.1.4.20.9)
    aux spécifications du CI-SIS
    
    Historique :
    30/06/23 : ANS : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_dureeOccupationPoste_int">
    <title>CI-SIS durée d'occupation de poste </title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.20.9"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_dureeOccupationPoste_int] Erreur de conformité CI-SIS : Dans l'entrée IHE-PCC - Usual Occupation Duration(1.3.6.1.4.1.19376.1.5.3.1.4.20.9), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</assert>
        
        <assert test='count(cda:id)&gt;1'>
            [E_dureeOccupationPoste_int] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une ou plusieurs fois.
        </assert>
        
        <!-- Test des templateId pour l'entrée "IHE-PCC - Usual Occupation Duration" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.4.20.9']">
            
            [1] [E_dureeOccupationPoste_int] Erreur de conformité CI-SIS : 
            L'entrée "IHE-PCC - Usual Occupation Duration" doit comporter le 'templateId' suivant:
            - Un 'templateId' dont l'attribut @root="1.3.6.1.4.1.19376.1.5.3.1.4.20.9"
        </assert>
        
        <assert test='count(cda:code)=1 and cda:code/@code="74163-7" and cda:code/@codeSystem="2.16.840.1.113883.6.1"'>
            [E_dureeOccupationPoste_int] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='74163-7' et
            le codeSystem='2.16.840.1.113883.6.1'.
        </assert>
        
        <assert test="cda:statusCode[@code='completed']"> 
            [E_dureeOccupationPoste_int] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. </assert>
        
        <assert test='count(cda:value)=1'>
            [E_dureeOccupationPoste_int] : Erreur de conformité CI-SIS : L'élément value doit être présent une fois [1..1].
        </assert>
        
    </rule>
    
</pattern>
