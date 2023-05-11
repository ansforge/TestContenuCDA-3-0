<?xml version="1.0" encoding="UTF-8"?>

<!-- 
   ......................................................................................................................................................    
   S_identification_D2LM
   Schématron de vérification de la conformité au modèle du CI-SIS d'une section FR-Identification-mammographe-D2LM-FIN (1.2.250.1.213.1.1.2.56) dans un document D2LM 
   
   D2LM : CR de seconde lecture de mammographie
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
    23/10/2017 : NMA : Création
    30/07/2020 : SBM : Modification
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_identification_D2LM">
    <title>CI-SIS D2LM Section Identification</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.56"]'>
        <!-- Présence obligatoire de la section Procédures et interventions -->
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11"]'>
            [S_Identification_D2LM.sch] Erreur de conformité au modèle D2LM : La section FR-Actes-et-interventions (1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11) est obligatoire dans la section FR-Identification-mammographe-D2LM-FIN (1.2.250.1.213.1.1.2.56).
        </assert>  
        <assert test='.//cda:code[@code = "45964-4"]'>
            [S_Identification_D2LM.sch] Erreur de conformité au modèle D2LM : Le code de la section FR-Identification-mammographe-D2LM-FIN (1.2.250.1.213.1.1.2.56) doit être "45964-4"
        </assert>  
        <assert test='.//cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'>
            [S_Identification_D2LM.sch] Erreur de conformité au modèle D2LM : Le code de la section FR-Identification-mammographe-D2LM-FIN (1.2.250.1.213.1.1.2.56) doit faire partie de la nomenclature LOINC
        </assert>  
    </rule>
    
</pattern>
