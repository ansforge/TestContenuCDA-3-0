<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_CSE.sch
    Teste la conformité de l'entete du volet CSE au CI-SIS
    
    Historique :
    02/02/2018 :  NMA : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_CSE-CS9">
    
    <rule context='cda:ClinicalDocument/cda:recordTarget/cda:patientRole'>
         
        <!-- Teste la présence de la representedOrganisation -->
        <assert test="cda:patient/cda:birthTime">
            [Entete_CSE-CS9] La date de naissance du patient est oblgatoirement présente dans le volet CSE
        </assert>
        <assert test="not(cda:patient/cda:guardian/cda:guardianPerson) or cda:patient/cda:guardian/cda:guardianPerson/cda:name/cda:family">
            [Entete_CSE-CS9] Le nom de famille du représentant est obligatoirement présent
        </assert>
    </rule>
    
    <rule context="cda:ClinicalDocument">
        <assert test="./cda:templateId[@root='1.2.250.1.213.1.1.1.5.2']"> 
            [Entete_CSE-CS9] Erreur de conformité :
            L'élément ClinicalDocument/templateId doit être présent avec @root="1.2.250.1.213.1.1.1.5.2".
        </assert>
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.5']"> 
            [Entete_CSE-CS9] Erreur de conformité : 
            Le template parent "Certificat de Santé de l'Enfant" (1.2.250.1.213.1.1.1.5) doit être présent.
        </assert>            
        <assert test="./cda:code[@code='CERT_DECL' and @codeSystem='1.2.250.1.213.1.1.4.12']"> 
            [Entete_CSE-CS9] Erreur de conformité : 
            L'élément code doit avoir @code ="CERT_DECL" et @codeSystem = "1.2.250.1.213.1.1.4.12"/>.
        </assert>  
        <assert test="./cda:recordTarget/cda:patientRole/cda:addr/cda:postalCode and not(./cda:recordTarget/cda:patientRole/cda:addr/cda:streetAddressLine)"> 
            [Entete_CSE-CS9] Erreur de conformité :
            L'utilisation des composants élémentaires de l’adresse est obligatoire et le code postal est obligatoire.
        </assert>
        <!--<assert test="./cda:informant/cda:relatedEntity/cda:code/@code='MTH'"> 
            [Entete_CSE-CS9] Erreur de conformité : 
            La présence de la mère est obligatoire dans le volet CS9
        </assert>-->
        <assert test="./cda:documentationOf/cda:serviceEvent/cda:code/@code='11429006'"> 
            [Entete_CSE-CS9] Erreur de conformité : 
            Le code de l'acte documenté est obligatoire et est fixé à "11429006" dans le volet CS9
        </assert>
        <assert test="./cda:documentationOf/cda:serviceEvent/cda:effectiveTime"> 
            [Entete_CSE-CS9] Erreur de conformité : 
            La date de l’examen est obligatoire dans le volet CS9
        </assert>
        <assert test="./cda:documentationOf/cda:serviceEvent/cda:performer"> 
            [Entete_CSE-CS9] Erreur de conformité : 
            Le médecin ayant réalisé l’examen médical est obligatoire dans le volet CS9
        </assert>
    </rule>
    
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity">
        
        <assert test="cda:id"> 
            [Entete_CSE-CS9] Erreur de conformité :
            L'identifiant du médecin ayant réalisé l’examen médical est obligatoire.
        </assert>
        <assert test="cda:code"> 
            [Entete_CSE-CS9] Erreur de conformité :
            La profession/spécialité est obligatoire.
        </assert>
        <assert test="cda:assignedPerson"> 
            [Entete_CSE-CS9] Erreur de conformité :
            Le PS ayant réalisé l’examen est obligatoire.
        </assert>
        <assert test="cda:assignedPerson/cda:name"> 
            [Entete_CSE-CS9] Erreur de conformité :
            Le Nom / Prénom du PS ayant réalisé l'examen est obligatoire.
        </assert>
        <assert test="cda:representedOrganization"> 
            [Entete_CSE-CS9] Erreur de conformité :
            La structure pour le compte de laquelle intervient le médecin est obligatoire.
        </assert>
        <assert test="cda:representedOrganization/cda:id"> 
            [Entete_CSE-CS9] Erreur de conformité :
            L'identifiant de la structure est obligatoire.
        </assert>
        <assert test="cda:representedOrganization/cda:name"> 
            [Entete_CSE-CS9] Erreur de conformité :
            Le nom de la structure est obligatoire.
        </assert>
        <assert test="cda:representedOrganization/cda:addr/cda:postalCode"> 
            [Entete_CSE-CS9] Erreur de conformité :
            L'adresse de la structure est obligatoire. 
            L'utilisation des composants élémentaires de l’adresse est obligatoire et le code postal est obligatoire.
        </assert>
        
    </rule>
    
    
</pattern>