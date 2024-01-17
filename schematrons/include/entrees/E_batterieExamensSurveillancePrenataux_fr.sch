<?xml version="1.0" encoding="UTF-8"?>

<!--                  -=<<o#%@O[ E_batterieExamensSurveillancePrenataux_fr.sch ]O@%#o>>=-
    
    Teste la conformité de l'entrée "FR-Batterie-Examens-et-surveillance-prenataux (1.2.250.1.213.1.1.3.98)aux spécifications CI-SIS
    
    Historique :
    12/01/2024 : Création

-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_batterieExamensSurveillancePrenataux_fr">
    <title>Vérification de la conformité de  l'entrée FR-Batterie-Examens-et-surveillance-prenataux</title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.98"]'>
        <assert test='../cda:organizer'> 
            [E_batterieExamensSurveillancePrenataux_fr] Erreur de Conformité  CI-SIS: 'Conformité CI-SIS (Erreur):' ne peut être utilisé que comme organizer.
        </assert> 
        <!-- Test des templateId pour l'entrée "FR-Batterie-Examens-et-surveillance-prenataux" -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.1.21.3.10']">
            
            [E_batterieExamensSurveillancePrenataux_fr] Erreur de conformité CI-SIS : 
            L'entrée "FR-Batterie-Examens-et-surveillance-prenataux" doit comporter le 'templateId' suivant : '1.3.6.1.4.1.19376.1.5.3.1.1.21.3.10'
        </assert>
        <!-- Test présence de l'élément 'id' -->
        <assert test='cda:id'>
            [E_batterieExamensSurveillancePrenataux_fr] "Coded Antenatal Testing and Surveillance Organizer" aura nécessairement un identifiant &lt;id&gt;.
        </assert>
        <!-- Test présence de l'élément 'code' -->
        <assert test='cda:code[@code="XX-ANTENATALTESTINGBATTERY" and 
            @displayName="ANTENATAL TESTING AND SURVEILLANCE BATTERY" and
            @codeSystem="2.16.840.1.113883.6.1" and
            @codeSystemName="LOINC"]'>
            [E_batterieExamensSurveillancePrenataux_fr] L'élément &lt;code&gt; de l'organizer "Antenatal Testing and Surveillance"est requis, et 
            identifie celui-ci comme un organizer contenant des données de test et de surveillance: &lt;code code='XX-ANTENATALTESTINGBATTERY'
            displayName='ANTENATAL TESTING AND SURVEILLANCE BATTERY' codeSystem='2.16.840.1.113883.6.1' codeSystemName="LOINC"</assert>
        <!-- Test présence de l'élément 'statusCode' -->
        <assert test='cda:statusCode[@code="completed"]'>
            [E_batterieExamensSurveillancePrenataux_fr] La valeur de l'élément "statusCode" de "Coded Antenatal Testing and Surveillance Organizer" est fixée à "completed".
        </assert>
        <!-- Test présence de l'élément 'effectiveTime' -->
                <assert test='cda:effectiveTime'>
            [E_codedAntenatalTestingAndSurveillanceOrg] l'élément effectiveTime est requis. Il indique quand l'observation a été faite.
        </assert>
        <assert test='cda:effectiveTime/cda:low'>
            [E_codedAntenatalTestingAndSurveillanceOrg] l'élément effectiveTime/low est obligatoire.
        </assert>
        
    </rule>
</pattern>

