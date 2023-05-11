<?xml version="1.0" encoding="UTF-8"?>

<!-- E_ProtheseValvulaireOrg-CARD-F-PRC-PPV.sch
    
    Teste la conformité de l'entrée "Dispositif Médical" (1.2.250.1.213.1.1.3.20)
    aux spécifications du volet 'Patients à riques en cardiologie' du CI-SIS concernant un dispositif 
    de prothèse valvulaire.    
    
    Historique :
    31/08/2011 : Création
    08/11/2017 : Mise à jour du templateID 1.2.250.1.213.1.1.3.48
    06/01/2023 : Nouvelle version 2023.01    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_ProtheseValvulaireOrg-CARD-F-PRC-PPV">
    <title>CI-SIS - Prothèse Valvulaire</title>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.20" and cda:participant/cda:participantRole/cda:playingDevice/cda:code/@code ="D0001-11"]'>      
        
        <!-- Vérifier le code de la section --> 
        <assert test='cda:participant/cda:participantRole/cda:playingDevice/cda:code/@code ="D0001-11"'> 
            [E_ProtheseValvulaireOrg-CARD-F-PRC-PPV] Erreur de Conformité CI-SIS: Le code de l'entrée 'Prothèse Valvulaire' doit être D0001-11
            pris dans le vocabulaire TA_PRC (1.2.250.1.213.1.1.4.2)</assert> 
        
        <assert test='cda:participant/cda:participantRole/cda:playingDevice/cda:code/@codeSystem = "1.2.250.1.213.1.1.4.2"'> 
            [E_ProtheseValvulaireOrg-CARD-F-PRC-PPV] Erreur de Conformité CI-SIS: L'élément 'codeSystem' de l'entrée 'Prothèse Valvulaire'
            doit être codé dans dans le vocabulaire TA_PRC (1.2.250.1.213.1.1.4.2).</assert>
        
        <!--=<<o#%@O[ Contenu de l'entrée ]O@%#o>>=-->
        
        <!-- Valve -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code="L0031"'> 
            [E_ProtheseValvulaireOrg-CARD-F-PRC-PPV] Erreur de Conformité CI-SIS: Le 'valve' que la prothèse remplace est un élément obligatoire de l'entrée.
        </assert>
        <!-- Composant -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code="L0032"'> 
            [E_ProtheseValvulaireOrg-CARD-F-PRC-PPV] Erreur de Conformité CI-SIS: Le 'composant' de la prothèse est un élément obligatoire de l'entrée.
        </assert>
        <!-- Diamètre -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code="L0033"'> 
            [E_ProtheseValvulaireOrg-CARD-F-PRC-PPV] Erreur de Conformité CI-SIS: Le 'diamètre' de la prothèse est un élément obligatoire de l'entrée.
        </assert>
        <!-- Gradient -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code="L0034"'> 
            [E_ProtheseValvulaireOrg-CARD-F-PRC-PPV] Erreur de Conformité CI-SIS: Le 'gradient' mesuré est un élément obligatoire de l'entrée.
        </assert>
        <!-- Niveau d'anticoagulation souhaité -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code="L0035"'> 
            [E_ProtheseValvulaireOrg-CARD-F-PRC-PPV] Erreur de Conformité CI-SIS: Le 'niveau d'anticoagulation souhaité' est un élément obligatoire de l'entrée.
        </assert>

    </rule>
</pattern>


