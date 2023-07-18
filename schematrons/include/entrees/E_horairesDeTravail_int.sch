<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_horairesDeTravail_int.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée Work shift observation (1.3.6.1.4.1.19376.1.5.3.1.4.20.7)
    aux spécifications du CI-SIS
    
    Historique :
    29/06/23 : ANS : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_horairesDeTravail_int">
    <title>CI-SIS horaire de travail </title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.20.7"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_horairesDeTravail_int] Erreur de conformité CI-SIS : Dans l'entrée Work shift observation(1.3.6.1.4.1.19376.1.5.3.1.4.20.7), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</assert>
        <assert test='count(cda:id)&gt;=1'>
            [E_horairesDeTravail_int] : Erreur de conformité CI-SIS : L'élément id est obligatoirement présent une ou plusieurs fois [1..*].
        </assert>
        <assert test="cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.20.7'">
            [E_horairesDeTravail_int] Erreur de conformité CI-SIS : Dans l'entrée Work shift observation, Il doit y avoir le templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.20.7'
        </assert>
        <assert test='count(cda:code)=1 and cda:code/@code="74159-5" and cda:code/@codeSystem="2.16.840.1.113883.6.1"'>
            [E_horairesDeTravail_int] : Erreur de conformité CI-SIS : L'élément code doit être présent une fois et doit avoir l'attribut @code='74159-5' et
            le codeSystem='2.16.840.1.113883.6.1'.
        </assert>
        
        <assert test="cda:statusCode[@code='completed']"> 
            [E_horairesDeTravail_int] : Erreur de conformité CI-SIS : Le composant "statutCode" 
            est toujours fixé à la valeur code='completed'. </assert>
        
        <assert test='count(cda:value)=1'>
            [E_horairesDeTravail_int] : Erreur de conformité CI-SIS : L'élément value doit être présent une fois [1..1].
        </assert>
        
    </rule>
    
</pattern>
