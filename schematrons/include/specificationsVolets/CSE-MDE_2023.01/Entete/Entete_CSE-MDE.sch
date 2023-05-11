<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_CSE-MDE.sch
    Teste la conformité de l'entete du volet CSE au CI-SIS
    
    Historique :
    21/12/2022 : NBE : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_CSE-MDE">
    
    <rule context="cda:ClinicalDocument">
        <assert test="./cda:recordTarget/cda:patientRole/cda:addr/cda:postalCode and not(./cda:recordTarget/cda:patientRole/cda:addr/cda:streetAddressLine)"> 
            [Entete_CSE-MDE] Erreur de conformité : 
            L'utilisation des composants élémentaires de l’adresse est obligatoire. Le code postal est aussi obligatoire.
        </assert>
    </rule>
    
    <rule context='cda:ClinicalDocument/cda:recordTarget/cda:patientRole'>
         
        <!-- Teste la présence de la representedOrganisation -->
        <assert test="cda:patient/cda:birthTime and cda:patient/cda:birthplace">
            [Entete_CSE-MDE] La date et lieu de naissance du patient sont oblgatoirement présents dans le volet CSE
        </assert>
        <assert test="not(cda:patient/cda:guardian/cda:guardianPerson) or cda:patient/cda:guardian/cda:guardianPerson/cda:name/cda:family">
            [Entete_CSE-MDE] Le nom de famille du représentant est obligatoirement présent
        </assert>
    </rule>
    
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity">
        
        <assert test="cda:assignedPerson"> 
            [Entete_CSE-MDE] Erreur de conformité :
            Le PS ayant réalisé l’examen est obligatoire.
        </assert>
        <assert test="cda:representedOrganization/cda:id"> 
            [Entete_CSE-MDE] Erreur de conformité :
            L'identifiant de l’organisation est obligatoire.
        </assert>
        <assert test="cda:representedOrganization/cda:name"> 
            [Entete_CSE-MDE] Erreur de conformité :
            Le nom de l’organisation est obligatoire.
        </assert>
        <assert test="cda:representedOrganization/cda:addr/cda:postalCode"> 
            [Entete_CSE-MDE] Erreur de conformité :
            L'adresse de l’organisation est obligatoire. L'utilisation des composants élémentaires de l’adresse est obligatoire et le code postal est obligatoire.
        </assert>
        
    </rule>
    
    
    
</pattern>