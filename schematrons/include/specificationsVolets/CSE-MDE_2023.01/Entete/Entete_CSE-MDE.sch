<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_CSE-MDE.sch
    Teste la conformité de l'entete du volet CSE au CI-SIS
    
    Historique :
    21/12/2022 : NBE : Création
    09/04/2024 : APE : Suppression du contrôle du format des adresses
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_CSE-MDE">
    
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
        
    </rule>   
    
    
</pattern>