<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
   S_antecedents_D2LM
   Schématron de vérification de la conformité au modèle du CI-SIS d'une section FR-Antecedents-D2LM-FIN (1.2.250.1.213.1.1.2.57) dans un document D2LM 
   
   D2LM : CR de seconde lecture de mammographie
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
    23/10/2017 : NMA : Création
    28/07/2020 : SBM : Modification
    30/07/2020 : APE : Modification du nom du schématron dans le dernier test
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_antecedents_D2LM">
    <title>CI-SIS D2LM Section Antécédents</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.57"]'>
        <!-- Présence obligatoire de la section History of Past Illness -->
        <assert test='.//cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.3.8"]'>
            [S_antecedents_D2LM.sch] Erreur de conformité au modèle D2LM : La section FR-Antecedents-medicaux (1.3.6.1.4.1.19376.1.5.3.1.3.8) est obligatoire dans la section FR-Antecedents-D2LM-FIN (1.2.250.1.213.1.1.2.57).
        </assert>  
        <assert test='.//cda:code[@code = "11349-8"]'>
            [S_antecedents_D2LM.sch] Erreur de conformité au modèle D2LM : Le code de la section FR-Antecedents-D2LM-FIN (1.2.250.1.213.1.1.2.57) doit être "11349-8"
        </assert>  
        <assert test='.//cda:code[@codeSystem = "2.16.840.1.113883.6.1"]'>
            [S_antecedents_D2LM.sch] Erreur de conformité au modèle D2LM: Le code de la section FR-Antecedents-D2LM-FIN (1.2.250.1.213.1.1.2.57) doit faire partie de la nomenclature LOINC
        </assert>  
        
        <!-- Vérifier que la section 'History of Past Illness' contient l'entrée Problem Concern  -->
        <assert test='.//*[cda:templateId/@root = "1.3.6.1.4.1.19376.1.5.3.1.3.8"]//count(cda:templateId[@root = "1.3.6.1.4.1.19376.1.5.3.1.4.5.2"])&gt;=1'>
            [S_antecedents_D2LM.sch] Erreur de conformité au modèle D2LM : Une section FR-Antecedents-medicaux (1.3.6.1.4.1.19376.1.5.3.1.3.8) doit obligatoirement contenir une ou plusieurs entrées de type FR-Liste-des-antecedents-DL2M-FIN (1.3.6.1.4.1.19376.1.5.3.1.4.5.2).
        </assert>
        
    </rule>
    
</pattern>
