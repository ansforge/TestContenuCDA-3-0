<?xml version="1.0" encoding="UTF-8"?>

<!--  IHE PCC  "FR-Vaccinations" (1.3.6.1.4.1.19376.1.5.3.1.3.23) -->

<!--                  -=<<o#%@O[ S_Vaccination_VAC-Note.sch ]O@%#o>>=-
    
    Teste la conformité de la Section "Vaccination" (1.3.6.1.4.1.19376.1.5.3.1.3.23)
    aux spécifications du volet VAC-Note du CI-SIS.
    
    Historique :
    29/11/2022 : NNA : Création
    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_Vaccination_VAC-Note">
    <title>CI-SIS Vaccination VA-Note</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.23"]'>
        
        <!-- Présence obligatoire d'une Entrée Specimen Procedure Step  -->
        <assert test='count(.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.12"])=1'>
            [S_Vaccination_VAC-Note] Erreur de Conformité volet VAC-Note: Dans le volet VAC-Note, une et seulement une seule entrée FR-Vaccination (1.3.6.1.4.1.19376.1.5.3.1.4.12) est obligatoire.
        </assert>  
                  
    </rule>
    
</pattern>