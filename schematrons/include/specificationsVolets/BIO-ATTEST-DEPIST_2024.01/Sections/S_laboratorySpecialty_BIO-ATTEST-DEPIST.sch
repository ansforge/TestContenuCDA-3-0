<?xml version="1.0" encoding="UTF-8"?>

<!-- S_laboratorySpecialty_BIO-ATTEST-DEPIST
    
    Teste la conformité de la section FR-CR-BIO-Chapitre (Laboratory Specialty Section - 1.3.6.1.4.1.19376.1.3.3.2.1)
    aux spécifications du voletBIO-ATTEST-DEPIST du CI-SIS.
    
    Historique :
    20/12/2023 : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_laboratorySpecialty_BIO-ATTEST-DEPIST">
    <title>Vérification de la conformité de la section CR-BIO-Chapitre du BIO-ATTEST-DEPIST</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.3.3.2.1"]'>        
        
        <!-- Entrée FR-Resultats-examens-de-biologie-medicale -->
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.3.1"]'>
            [S_laboratorySpecialty_BIO-ATTEST-DEPIST] Erreur de conformité : L'entrée FR-Resultats-examens-de-biologie-medicale (1.3.6.1.4.1.19376.1.3.3.2.1) est obligatoire.
        </assert>
    </rule>
</pattern>