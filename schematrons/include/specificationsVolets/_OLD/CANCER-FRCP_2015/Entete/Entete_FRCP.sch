<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_FRCP.sch
    Teste la conformité de l'entete de la FRCP au CI-SIS
    
    Historique :
    30/01/2018 :  NMA : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_FRCP">
   
        
      <!--  -->  
    <rule context='cda:ClinicalDocument/cda:recordTarget/cda:patientRole'>
        <!--<rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.2"]'> -->
            
         
        <!-- Teste la cohérence RCP-Organe avec l'appareil concerné -->
        <assert test="cda:patient/cda:name/cda:given and cda:patient/cda:name/cda:family">
            [Entete_FRCP] Le prénom et le(s) nom(s) du patient doivent être présents. 
        </assert>
    </rule>
    
    <rule context="cda:ClinicalDocument/cda:author">
        <assert test="cda:assignedAuthor/cda:assignedPerson/cda:name/cda:family or not(cda:assignedAuthor/cda:assignedPerson)">
            [Entete_FRCP] Le nom de famille est obligatoirement présent si l'identité du PS est présente            
        </assert>
    </rule>
    <rule context="cda:ClinicalDocument/cda:legalAuthenticator">
        <assert test="cda:assignedEntity/cda:code">
            [Entete_FRCP] Le code, qui ici représente la pécialité du PS est obligatoirement présent            
        </assert>
        <assert test="cda:assignedEntity/cda:representedOrganization">
            [Entete_FRCP] L'organisation représentée doit obligatoirement être renseignée            
        </assert>
    </rule>
    <rule context="cda:ClinicalDocument/cda:participant">
        <!-- <assert test="cda:time/cda:low or cda:time/cda:high or cda:time[@nullFlavor]">
            [Entete_FRCP] L'élément "time" doit avoir un sous-élément low ou high au moins pour indiquer la date de participation           
        </assert> -->
        <assert test="cda:associatedEntity/cda:associatedPerson/cda:name/cda:family">
            [Entete_FRCP] Le nom de famille du participant doit obligatoirement être renseigné          
        </assert>
    </rule>
    <rule context="cda:ClinicalDocument/cda:documentationOf">
        <assert test="cda:serviceEvent/cda:code">
            [Entete_FRCP] Le code de l'acte documenté est obligatoire            
        </assert>
    </rule>
    <rule context="cda:ClinicalDocument/cda:componentOf">
        <assert test="count(cda:encompassingEncounter/cda:id)=4">
            [Entete_FRCP] Il doit y avoir 4 identifiants pour identifier: le RRC, le gestionnaire RCP, la RCP et la session de la RCP            
        </assert>
        <assert test="cda:encompassingEncounter/cda:responsibleParty/cda:assignedEntity/cda:code or not(cda:encompassingEncounter/cda:responsibleParty)">
            [Entete_FRCP] La profession/Spécialité du PS est obligatoire            
        </assert>
        <assert test="cda:encompassingEncounter/cda:encounterParticipant[@typeCode='REF']/cda:assignedEntity/cda:code or not(cda:encompassingEncounter/cda:encounterParticipant[@typeCode='REF'])">
            [Entete_FRCP] La profession/Spécialité du PS est obligatoire            
        </assert>
        <assert test="cda:encompassingEncounter/cda:encounterParticipant[@typeCode='CON']/cda:assignedEntity/cda:code or not(cda:encompassingEncounter/cda:encounterParticipant[@typeCode='CON'])">
            [Entete_FRCP] La profession/Spécialité du PS est obligatoire            
        </assert>
        <assert test="cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:code">
            [Entete_FRCP] La modalité d'exercice est obligatoirement présente         
        </assert>
        <assert test="cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:location">
            [Entete_FRCP] La localisation de l'établissement de soin est obligatoirement présente         
        </assert>
        
    </rule>
</pattern>