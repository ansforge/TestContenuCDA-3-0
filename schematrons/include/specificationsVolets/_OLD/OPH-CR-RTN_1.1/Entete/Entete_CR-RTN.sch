<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_CR-RTN.sch
    Teste la conformité de l'entete du CR-RTN au CI-SIS
    
    Historique :
    02/02/2018 : Création
    22/02/2021 : Renommage
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_CR-RTN">
    
    <rule context='cda:ClinicalDocument'>
        
        <assert test="cda:code[@code='75492-9']">
            [Entete_CR-RTN] L'élément code doit être présent et égal à 75492-9
        </assert>
        
    </rule>
    
    <rule context='cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent'>
        
        <assert test="cda:performer/cda:assignedEntity">
            [Entete_CR-RTN] L'élément performer et le sous élément assignedEntity sont obligatoires dans le cadre du volet CR-RTN
        </assert>
        <assert test="cda:performer/cda:assignedEntity/cda:representedOrganization">
            [Entete_CR-RTN] Le lieu d'exercice est obligatoire dans le cadre du volet CR-RTN
        </assert>
        
    </rule>
</pattern>