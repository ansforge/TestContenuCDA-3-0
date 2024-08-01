<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_BIO-TROD.sch
    Teste la conformité de l'entete du BIO-TROD au CI-SIS
    
    Historique :
    20/12/2023 : Création 
     01/08/2024 : renommage du document en BIO-TROD 
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_BIO-TROD">
    
    <rule context='cda:ClinicalDocument'>         
        <assert test='cda:code[@code="96173-0" and @displayName="Test rapide d&apos;orientation diagnostique" and @codeSystem="2.16.840.1.113883.6.1"]'>
            [Entete_BIO-TROD] L'élément code est obligatoire et doit être fixé à @code="96173-0" @displayName="Test rapide d'orientation diagnostique" @codeSystem="2.16.840.1.113883.6.1".
        </assert>
        <assert test='cda:title'>
            [Entete_BIO-TROD] L'élément title est obligatoire et doit être fixé à "Attestation de dépistage [Pathologie]".
        </assert>
        <assert test='cda:templateId[@root="1.2.250.1.213.1.1.1.59"]'>
            [Entete_BIO-TROD] L'élément templateId fixé à @root="1.2.250.1.213.1.1.1.59" est obligatoire
        </assert>
        <assert test="./cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.1.1']"> 
            [Entete_BIO-TROD] Erreur de conformité : L'élément clinicalDocument/templateId doit être présent avec @root='1.3.6.1.4.1.19376.1.5.3.1.1.1'.
        </assert>
        <assert test="./cda:templateId[@root='1.2.250.1.213.1.1.1.1']"> 
            [Entete_BIO-TROD] Erreur de conformité : L'élément clinicalDocument/templateId doit être présent avec @root='1.2.250.1.213.1.1.1.1'.
        </assert>
        <assert test="./cda:templateId[@root='2.16.840.1.113883.2.8.2.1']"> 
            [Entete_BIO-TROD] Erreur de conformité : L'élément clinicalDocument/templateId doit être présent avec @root='2.16.840.1.113883.2.8.2.1'.
        </assert>
    </rule>
    
    <rule context='cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent'>
        <assert test="cda:code">
            [Entete_BIO-TROD] Le code de l'acte documenté est obligatoire dans l'élément documentationOf/serviceEvent/code.
        </assert>
        <assert test="cda:performer">
            [Entete_BIO-TROD] Le professionnel de santé ayant réalisé le test de dépistage est obligatoire.
        </assert>
    </rule>
    
    <rule context='cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent/cda:performer'>
        <assert test='cda:assignedEntity/cda:representedOrganization/cda:standardIndustryClassCode'>
            [Entete_BIO-TROD] Le cadre d'exercice du laboratoire est obligatoire.
        </assert>
        <assert test="cda:assignedEntity/cda:representedOrganization/cda:standardIndustryClassCode[@code='DEPISTAGE' and @codeSystem='1.2.250.1.213.1.1.4.9']">
            [Entete_BIO-TROD] Le code du cadre de l'exercice du laboratoire est fixée à [@code='DEPISTAGE' and @displayName='dépistage' and @codeSystem='1.2.250.1.213.1.1.4.9'].
        </assert>
    </rule>
    
        <!-- Contrôle de la section FR-CR-BIO-Chapitre -->
    <rule context="cda:structuredBody/cda:component/cda:section">
        <assert test="(./cda:templateId[@root='1.3.6.1.4.1.19376.1.3.3.2.1'])"> 
            [Entete_BIO-TROD] Erreur de conformité : une attestation de dépistage comporte que la section FR-CR-BIO-Chapitre(1.3.6.1.4.1.19376.1.3.3.2.1). 
        </assert>
    </rule>
</pattern>