<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_criticite_fr.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée FR-Criticite (1.2.250.1.213.1.1.3.172)
    aux spécifications du CI-SIS
    
    Historique :
    29/06/23 : ANS : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_criticite_fr">
    <title>CI-SIS Criticite </title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.172"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_criticite_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Criticite(1.2.250.1.213.1.1.3.172), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</assert>
        
        <assert test='count(cda:id)=1'>
            [E_criticite_fr] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une fois.
        </assert>
        
        <assert test='count(cda:code)=1 and cda:code/@code="82606-5" and cda:code/@codeSystem="2.16.840.1.113883.6.1"'>
            [E_criticite_fr] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='82606-5' et
            le codeSystem='2.16.840.1.113883.6.1'.
        </assert>
        
        <assert test="cda:statusCode[@code='completed']"> 
            [E_criticite_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. </assert>
        
        <assert test='cda:effectiveTime'>
            [E_criticite_fr] : Erreur de conformité CI-SIS : L'élément effectiveTime doit être présent une fois.
        </assert>
        
        <assert test='cda:value'>
            [E_criticite_fr] : Erreur de conformité CI-SIS : L'élément value doit être présent une fois [1..1].
        </assert>
        
        <assert test='count(cda:repeatNumber)&lt;=1'>
            [E_criticite_fr] : Erreur de conformité CI-SIS : L'élément repeatNumber doit être présent maximum une fois [0..1].
        </assert>
        
        <assert test='count(cda:author)&lt;=1'>
            [E_criticite_fr] : Erreur de conformité CI-SIS : L'élément author doit être présent maximum une fois [0..1].
        </assert>
    </rule>
    
</pattern>
