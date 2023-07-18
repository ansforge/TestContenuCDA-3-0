<?xml version="1.0" encoding="UTF-8"?>
<!--                  -=<<o#%@O[ E_rangDeLaVaccination_fr.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée FR-Rang-de-la-vaccination (1.2.250.1.213.1.1.3.82) aux spécifications du CI-SIS
    
    Historique :
    05/07/2023 : ANS : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_rangDeLaVaccination_fr">
    <title>Vérification de la conformité de l'entrée FR-Rang-de-la-vaccination </title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.82"]'>
        
        <assert
            test="self::cda:observation[@classCode='OBS' and @moodCode='EVN']">
            [E_rangDeLaVaccination_fr] Erreur de conformité CI-SIS : Dans l'entrée FR-Rang-de-la-vaccination (1.2.250.1.213.1.1.3.82), 
            les attributs de l'élément CDA 'observation' sont classCode='OBS' et moodCode='EVN'</assert>
        
        <!-- Test des templateId pour l'entrée "FR-Rang-de-la-vaccination " -->
        <assert test="cda:templateId[@root='2.16.840.1.113883.10.20.1.46']">
            
            [E_rangDeLaVaccination_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Rang-de-la-vaccination " doit comporter le 'templateId' suivant:
            -'templateId' dont l'attribut @root="2.16.840.1.113883.10.20.1.46"
        </assert>
        
        <!-- Test présence de l'élément 'code' -->
        <assert test='count(cda:code)=1 and cda:code/@code="30973-2" and cda:code/@codeSystem="2.16.840.1.113883.6.1"'>
            [E_rangDeLaVaccination_fr] : Erreur de conformité CI-SIS : L'élément "code" doit être présent une fois et doit avoir l'attribut @code='30973-2' et
            le codeSystem='2.16.840.1.113883.6.1'.
        </assert>
        
        <!-- Test présence de l'élément 'statusCode' -->
        <assert test="cda:statusCode"> 
            [E_rangDeLaVaccination_fr] : Erreur de conformité CI-SIS : Le composant "statutCode" doit être présent une fois.
        </assert>

        <!-- Test présence de l'élément 'value' -->
        <assert test='count(cda:value)=1'>
            [E_rangDeLaVaccination_fr] : Erreur de conformité CI-SIS : L'élément "value" doit être présent une fois [1..1].
        </assert>
    </rule>
    
</pattern>
