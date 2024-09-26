<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_CSE.sch
    Teste la conformité de l'entete du volet CSE au CI-SIS
    
    Historique :
    02/02/2018 : NMA : Création
    10/11/2022 : Mises à jour suite à la migration des terminologies
    25/09/2024 : Ajout des tests sur les deux éléments "setId" et "versionNumber"
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_CSE-CS8">
    
    <rule context="cda:ClinicalDocument">
        
        <assert test="./count(cda:setId[@root])=1"> 
            [Entete_CSE-CS8]  Erreur de conformité au modèle : L'élément "setId" doit être présent. 
        </assert>
        <assert test="./count(cda:versionNumber[@value])=1"> 
            [Entete_CSE-CS8]  Erreur de conformité au modèle : L'élément "versionNumber" doit être présent. 
        </assert>
        <assert test="./cda:recordTarget/cda:patientRole/cda:addr/cda:postalCode and not(./cda:recordTarget/cda:patientRole/cda:addr/cda:streetAddressLine)"> 
            [Entete_CSE-CS8] Erreur de conformité : 
            L'utilisation des composants élémentaires de l’adresse est obligatoire. Le code postal est aussi obligatoire.
        </assert>
        <assert test="./cda:informant/cda:relatedEntity/cda:code/@code='MTH'"> 
            [Entete_CSE-CS8] Erreur de conformité : 
            La présence de la mère est obligatoire dans le volet CS8
        </assert>
        <assert test="not(./cda:participant/cda:functionCode) or (./cda:participant/cda:functionCode/@code='CORRE')"> 
            [Entete_CSE-CS8] Erreur de conformité : 
            Le rôle fonctionnel du médecin qui suivra l’enfant est obligatoire dans le volet CS8
        </assert>
        <assert test="./cda:documentationOf/cda:serviceEvent/cda:code/@code='11429006'"> 
            [Entete_CSE-CS8] Erreur de conformité : 
            Le code de l'acte documenté est obligatoire et est fixé à "11429006" dans le volet CS8
        </assert>
        <assert test="./cda:documentationOf/cda:serviceEvent/cda:effectiveTime"> 
            [Entete_CSE-CS8] Erreur de conformité : 
            La date de l’examen est obligatoire dans le volet CS8
        </assert>
        <assert test="./cda:documentationOf/cda:serviceEvent/cda:performer"> 
            [Entete_CSE-CS8] Erreur de conformité : 
            Le médecin ayant réalisé l’examen médical est obligatoire dans le volet CS8
        </assert>
        
    </rule>
    
    <rule context='cda:ClinicalDocument/cda:recordTarget/cda:patientRole'>
         
        <!-- Teste la présence de la representedOrganisation -->
        <assert test="cda:patient/cda:birthTime">
            [Entete_CSE-CS8] La date de naissance du patient est oblgatoirement présente dans le volet CSE
        </assert>
        <assert test="not(cda:patient/cda:guardian/cda:guardianPerson) or cda:patient/cda:guardian/cda:guardianPerson/cda:name/cda:family">
            [Entete_CSE-CS8] Le nom de famille du représentant est obligatoirement présent
        </assert>
    </rule>
    
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity">
        
        <assert test="cda:id"> 
            [Entete_CSE-CS8] Erreur de conformité :
            L'identifiant du médecin ayant réalisé l’examen médical est obligatoire.
        </assert>
        <assert test="cda:code"> 
            [Entete_CSE-CS8] Erreur de conformité :
            La profession/spécialité est obligatoire.
        </assert>
        <assert test="cda:assignedPerson"> 
            [Entete_CSE-CS8] Erreur de conformité :
            Le PS ayant réalisé l’examen est obligatoire.
        </assert>
        <assert test="cda:assignedPerson/cda:name"> 
            [Entete_CSE-CS8] Erreur de conformité :
            Le Nom / Prénom du PS ayant réalisé l'examen est obligatoire.
        </assert>
        <assert test="cda:representedOrganization"> 
            [Entete_CSE-CS8] Erreur de conformité :
            La structure pour le compte de laquelle intervient le médecin est obligatoire.
        </assert>
        <assert test="cda:representedOrganization/cda:id"> 
            [Entete_CSE-CS8] Erreur de conformité :
            L'identifiant de la structure est obligatoire.
        </assert>
        <assert test="cda:representedOrganization/cda:name"> 
            [Entete_CSE-CS8] Erreur de conformité :
            Le nom de la structure est obligatoire.
        </assert>
        <assert test="cda:representedOrganization/cda:addr/cda:postalCode"> 
            [Entete_CSE-CS8] Erreur de conformité :
            L'adresse de la structure est obligatoire. L'utilisation des composants élémentaires de l’adresse est obligatoire et le code postal est obligatoire.
        </assert>
        
    </rule>
    
    
    
</pattern>