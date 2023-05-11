<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_D2LM-FIDD.sch
    Teste la conformité de l'entete du volet D2LM au CI-SIS
    
    Historique :
    02/02/2018 :  NMA : Création
    
-->


<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_D2LM-FIDD">
    
    <rule context='cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient'>
         
        <assert test="cda:birthTime">
            [Entete_D2LM-FIDD] La date de naissance du patient est obligatoirement présente 
        </assert>
    </rule>
    
    
</pattern>