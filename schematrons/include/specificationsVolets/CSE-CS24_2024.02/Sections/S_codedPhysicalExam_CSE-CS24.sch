<?xml version="1.0" encoding="UTF-8"?>

<!-- S_codedPhysicalExam_CSE-CS24
    
    Teste la conformité de la section Examens physiques (Coded Physical Examination - 1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1)
    aux spécifications du volet CS24 du CI-SIS.
    
    Les sous-sections suivantes sont obligatoires :
    - Signes vitaux (Coded Vital Signs - 1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2)
    
    Historique :
    25/07/2011 : Création
    23/02/2021 : Renommage et vérification des sous-sections testées
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_codedPhysicalExam_CSE-CS24">
    <title>Vérification de la conformité de la section Examens physiques du CSE-CS24</title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1"]'>        
       
        <!-- Sous-section Signes vitaux -->
        <assert test='.//cda:templateId[@root ="1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2"]'>
            [S_codedPhysicalExam_CSE-CS24] Erreur de conformité : La sous-section Signes vitaux (1.3.6.1.4.1.19376.1.5.3.1.1.5.3.2) est obligatoire.
        </assert>
        
    </rule>
</pattern>