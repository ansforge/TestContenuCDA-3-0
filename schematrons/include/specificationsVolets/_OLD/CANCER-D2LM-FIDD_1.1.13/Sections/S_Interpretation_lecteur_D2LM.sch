<?xml version="1.0" encoding="UTF-8"?>

<!-- 
   ......................................................................................................................................................    
   S_Radiologie_D2LM.sch
   Schématron de vérification de la conformité au modèle du CI-SIS d'une section "Interprétation du lecteur" (1.2.250.1.213.1.1.2.58) dans un document D2LM 
   
   D2LM : CR de seconde lecture de mammographie
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
    23/10/2017 : NMA : Création
    30/07/2020 : SBM : Modification
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_Interpretation_lecteur_D2LM">
    <title>CI-SIS D2LM Section d'interprétation du lecteur</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.58"]'>
        <!-- Présence obligatoire de la section coded results -->
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.28"]'>
            [S_Interpretation_lecteur_D2LM.sch] Erreur de conformité au modèle D2LM : La section FR-Resultats-examens (1.3.6.1.4.1.19376.1.5.3.1.3.28) est obligatoire dans la section "Interprétation du lecteur" (1.2.250.1.213.1.1.2.58).
        </assert>  
        <!-- Présence obligatoire de la section active problems -->
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.6"]'>
            [S_Interpretation_lecteur_D2LM.sch] Erreur de conformité au modèle D2LM : La section FR-Problemes-actifs (1.3.6.1.4.1.19376.1.5.3.1.3.6) est obligatoire dans la section "Interprétation du lecteur" (1.2.250.1.213.1.1.2.58).
        </assert>  
        <!-- Présence obligatoire de l'entrée  Problem act dans la section active problems -->
        <assert test='.//*[cda:templateId/@root = "1.3.6.1.4.1.19376.1.5.3.1.3.6"]//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.5.2"]'>
            [S_Interpretation_lecteur_D2LM.sch] Erreur de conformité au modèle D2LM : L'entrée FR-Liste-des-problemes (1.3.6.1.4.1.19376.1.5.3.1.4.5.2) est obligatoire dans la section FR-Problemes-actifs (1.3.6.1.4.1.19376.1.5.3.1.3.6) .
        </assert> 
        <!-- Présence obligatoire de la section coded care plan -->
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.36"]'>
            [S_Interpretation_lecteur_D2LM.sch] Erreur de conformité au modèle D2LM : La section FR-Plan-de-soins (1.3.6.1.4.1.19376.1.5.3.1.3.36) est obligatoire dans la section "Interprétation du lecteur" (1.2.250.1.213.1.1.2.58).
        </assert>
        <!-- Présence obligatoire de la section images illustratives -->
        <assert test='.//cda:templateId[@root = "1.2.250.1.213.1.1.2.37"]'>
            [S_Interpretation_lecteur_D2LM.sch] Erreur de conformité au modèle D2LM : La section FR-Documents-ajoutes (1.2.250.1.213.1.1.2.37) est obligatoire dans la section "Interprétation du lecteur" (1.2.250.1.213.1.1.2.58).
        </assert>  
        <assert test='.//cda:code[@code = "22030-1"]'>
            [S_Interpretation_lecteur_D2LM.sch] Erreur de conformité au modèle D2LM : Le code de la section "Interprétation du lecteur" (1.2.250.1.213.1.1.2.58) doit être "22030-1"
        </assert>  
        <assert test='.//cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'>
            [S_Interpretation_lecteur_D2LM.sch] Erreur de conformité au modèle D2LM : Le code de la section "Interprétation du lecteur" (1.2.250.1.213.1.1.2.58) doit faire partie de la nomenclature LOINC
        </assert>  
        
    </rule>
    
</pattern>
