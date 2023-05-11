<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_CNAM-HR.sch
    Teste la conformité de l'entete du CNAM-HR au CI-SIS
    
    Historique :
    07/11/2022 : Création    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_CNAM-HR">
    
    <rule context='cda:ClinicalDocument'>         
        <assert test='cda:title = "Données de remboursement"'>
            [Entete_CNAM-HR] L'élément title est obligatoire et doit être fixé à "Données de remboursement".
        </assert>
        <assert test='cda:code[@code="REMB" and @displayName="Données de remboursement" and @codeSystem="1.2.250.1.213.1.1.4.12"]'>
            [Entete_CNAM-HR] L'élément code est obligatoire et doit être fixé à @code="REMB" @displayName="Données de remboursement" @codeSystem="1.2.250.1.213.1.1.4.12".
        </assert>
        <assert test='cda:templateId[@root="1.2.250.1.213.1.1.1.36" and @extension="2022.01"]'>
            [Entete_CNAM-HR] L'élément templateId fixé à @root="1.2.250.1.213.1.1.1.36" et @extension="2022.01" est obligatoire
        </assert>
    </rule>
    
    <rule context='cda:ClinicalDocument/cda:recordTarget/cda:patientRole'>         
        <assert test='not(cda:addr[@nullFlavor]) or cda:addr[@nullFlavor="NASK"]'>
            [Entete_CNAM-HR] Si aucune adresse n’est connue, utiliser la valeur nullFlavor='NASK'.
        </assert>
        <assert test='not(cda:telecom[@nullFlavor]) or cda:telecom[@nullFlavor="NASK"]'>
            [Entete_CNAM-HR] Si aucune coordonnée n’est connue, utiliser la valeur nullFlavor='NASK'.
        </assert>
        <assert test='not(cda:patient/cda:administrativeGenderCode[@nullFlavor]) or cda:patient/cda:administrativeGenderCode[@nullFlavor="NASK"]'>
            [Entete_CNAM-HR] Si le sexe n’est pas connu, utiliser la valeur nullFlavor='NASK'.
        </assert>
        <assert test='not(cda:patient/cda:birthTime[@nullFlavor]) or cda:patient/cda:birthTime[@nullFlavor="NASK"]'>
            [Entete_CNAM-HR] Si la date de naissance n’est pas connue, utiliser la valeur nullFlavor='NASK'.
        </assert>
    </rule>
    
    <rule context='cda:ClinicalDocument/cda:legalAuthenticator'>
        
        <assert test="cda:time">
            [Entete_CNAM-HR] La date et heure de la prise de responsabilité est obligatoire.
        </assert>
        
        <assert test="cda:assignedEntity/cda:id">
            [Entete_CNAM-HR] L'identifiant du responsable du document est obligatoire dans l'élément legalAuthenticator.
        </assert>
        
        <assert test="(cda:assignedEntity/cda:assignedPerson/cda:name/cda:family)">
            [Entete_CNAM-HR] Le nom du responsable du document est obligatoire dans l'élément legalAuthenticator/assignedEntity/assignedPerson/name est fixé à "Assurance maladie".
        </assert>
    </rule> 
    
    <rule context='cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent'>
        <assert test="cda:effectiveTime">
            [Entete_CNAM-HR] L'effectiveTime de l'acte documenté est obligatoire dans l'élément documentationOf/serviceEvent/effectiveTime.
        </assert>
    </rule>
    
    <rule context='cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent/cda:performer'>
        <assert test="cda:id">
            [Entete_CNAM-HR] L'identifiant du PS est obligatoire.
        </assert>
        <assert test="cda:assignedEntity/cda:assignedPerson/cda:name">
            [Entete_CNAM-HR] Le nom du directeur de laboratoire est obligatoire.
        </assert>
    </rule>

    <rule context='cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter'>
        <assert test="cda:responsibleParty/cda:assignedEntity/cda:id">
            [Entete_CNAM-HR] L'identifiant du PS doit être présent (responsibleParty/assignedEntity/id)
        </assert>
        <assert test="cda:responsibleParty/cda:assignedEntity/cda:code">
            [Entete_CNAM-HR] La profession/spécialité du PS doit être présente (responsibleParty/assignedEntity/code)
        </assert>
        <assert test="cda:responsibleParty/cda:assignedEntity/cda:assignedPerson/cda:name/cda:family">
            [Entete_CNAM-HR] L'identité du PS doit être présente (responsibleParty/assignedEntity/assignedPerson/name/family)
        </assert>

    </rule>
    
</pattern>