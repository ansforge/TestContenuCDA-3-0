<?xml version="1.0" encoding="UTF-8"?>

<!-- Entete_EP-MED-DM.sch    
     ......................................................................................................................................................
     Vérification de la conformité de l'entête au modèle du document eP-MED-DM du CI-SIS.
     ......................................................................................................................................................
     Historique :
        - 05/06/2020 : Création
        - 30/11/2020 : Mise à jour
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_EP-MED-DM_2022.01">
    
    <rule context="cda:ClinicalDocument">
        <!-- Conformité spécifications HL7 France -->
        <assert test="cda:templateId[@root='2.16.840.1.113883.2.8.2.1']"> 
            [EP-MED-DM_2022.01] Erreur de conformité : Le templateId "2.16.840.1.113883.2.8.2.1" est obligatoire.
        </assert>
        <!-- Conformité spécifications au CI-SIS -->
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.1']"> 
            [EP-MED-DM_2022.01] Erreur de conformité : Le templateId "1.2.250.1.213.1.1.1.1" est obligatoire.
        </assert>
        <!-- Conformité au Volet IHE Pharm suppl. PRE -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.9.1.1.1']"> 
            [EP-MED-DM_2022.01] Erreur de conformité : Le templateId "1.3.6.1.4.1.19376.1.9.1.1.1" est obligatoire.
        </assert>
        <!-- Conformité au volet IHE PCC -->
        <assert test="cda:templateId[@root='1.3.6.1.4.1.19376.1.5.3.1.1.1']"> 
            [EP-MED-DM_2022.01] Erreur de conformité : Le templateId "1.3.6.1.4.1.19376.1.5.3.1.1.1" est obligatoire.
        </assert>
        <!-- Conformité au modèle de document eP-MED v2020.01 -->
        <assert test="cda:templateId[@root='1.2.250.1.213.1.1.1.39']"> 
            [EP-MED-DM_2022.01] Erreur de conformité : Le templateId "1.2.250.1.213.1.1.1.27" est obligatoire.
        </assert>            
        
        <assert test="./cda:code[@code='57833-6' and @codeSystem='2.16.840.1.113883.6.1']"> 
            [EP-MED-DM_2022.01] Erreur de conformité : L'élément "code" doit avoir les attributs @code="57833-6" et @codeSystem="2.16.840.1.113883.6.1"/>. 
        </assert>
        
        <!-- Ajout Nizar-->
        <assert test="./cda:recordTarget/cda:patientRole/cda:telecom"> 
            [EP-MED-DM_2022.01] Erreur de conformité : Les coordonnées télécom du patient sont obligatoires. 
        </assert>
        
        <assert test="./cda:recordTarget/cda:patientRole/cda:addr"> 
            [EP-MED-DM_2022.01] Erreur de conformité : L'adresse du patient est obligatoire. 
        </assert>
        
        <assert test="./cda:author/cda:assignedAuthor/cda:id"> 
            [EP-MED-DM_2022.01] Erreur de conformité :L'identifiant de l'auteur est obligatoire. 
        </assert>
        
        <assert test="./cda:author/cda:assignedAuthor/cda:code"> 
            [EP-MED-DM_2022.01] Erreur de conformité : La profession/spécialité de l'auteur est obligatoire. 
        </assert>
        
        <assert test="./cda:author/cda:assignedAuthor/cda:representedOrganization/cda:id"> 
            [EP-MED-DM_2022.01] Erreur de conformité : L'identifiant de l'organisation de rattachement de l'auteur est obligatoire. 
        </assert>
        
        <assert test="./cda:author/cda:assignedAuthor/cda:representedOrganization/cda:name"> 
            [EP-MED-DM_2022.01] Erreur de conformité : Le nom de l'organisation de rattachement de l'auteur est obligatoire. 
        </assert>
        
        <assert test="cda:documentationOf/cda:serviceEvent/cda:effectiveTime/cda:high and //cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent/cda:effectiveTime/cda:low"> 
            [EP-MED-DM_2022.01] Erreur de conformité : La date de début et la date de fin de validité de la prescription sont obligatoires.
        </assert>  
        <!-- Fin Ajout Nizar-->
        
    </rule>
    
</pattern>