<?xml version="1.0" encoding="UTF-8"?>

<!--                  
    Entete_TLM-DA.sch
    Teste la conformité de l'entete du document TLM-DA au CI-SIS
    
    Historique :
    02/09/2019 : Création
    19/12/2019 : Corrections
    05/05/2020 : Mise à jour de la liste des codes possibles pour cda:documentationOf/cda:serviceEvent/cda:code
    10/11/2022 : Mises à jour sui à la migration des terminologies
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="Entete_TLM-DA">

    <rule context='cda:ClinicalDocument'>
        <assert test="cda:templateId[@root = '1.2.250.1.213.1.1.1.38']"> 
            [Entete_TLM-DA] Erreur de conformité : Le templateID du modèle TLM-DA (1.2.250.1.213.1.1.1.38) doit être présent.
        </assert>
        <assert test="cda:code[@code='75496-0']">
            [Entete_TLM-DA] Le code du document TLM-DA doit être égal à '75496-0'
        </assert>
    </rule>
    
    <!-- contrôle de la valeur du code -->    
    <rule context="cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent/cda:code">
        <assert test="@code='TCG' or @code='TC' or @code='TE1' or @code='TE2' or @code='TLD' or @code='TLL' or @code='TLM' or @code='TLS'">
            [Entete_TLM-DA] Le code de l'acte documenté est obligatoire et doit être égal à 'TCG' ou 'TC' ou 'TE1' ou 'TE2' ou 'TLD' ou 'TLL' ou 'TLM' ou 'TLS'.            
        </assert>
    </rule>
</pattern>