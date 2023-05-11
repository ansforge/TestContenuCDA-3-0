<?xml version="1.0" encoding="UTF-8"?>

<!--  E_SondeDefOrg-CARD-F-PRC-DCI.sch
    
    Teste la conformité aux spécifications du volet 'Patients à riques en cardiologie' du CI-SIS 
    des entrées 'sonde auriculaire', 'sonde ventriculaire droite', et 'sonde ventriculaire gauche'
    pour défibrillateurs.
    
    Historique :
    10/08/2011 : Création pour les sondes défibrillateurs
    24/08/2011 : Regroupement des éléments 'mesures à l'implantation' et 'mesures de dernier contrôle'
    dans les entrées 'sonde auriculaire', 'sonde ventriculaire droite', et 'sonde ventriculaire gauche'.
    31/08/2011 : Spécialisation des tests en Sondes pour défibrillateurs ( UFCV_SondeDefOrg.sch) et Stimulateurs ( UFCV_SondeStimOrg.sch)
    08/11/2017 : Mise à jour du templateID 1.2.250.1.213.1.1.3.1
    22/02/2021 : Renommage
    04/01/2023 : Renommage : nouvelle version 2023.01 
                 Modification des controles, du path du contexte et des paths des asserts
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_SondeDefOrg-CARD-F-PRC-DCI">
    <title>CI-SIS - Défibrillateur/Stimulateurs</title>    
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.20" and cda:participant/cda:participantRole/cda:playingDevice/cda:code[(@code ="D0001-3" or @code="D0001-4" or @code="D0001-5") and not(@code="D0001-1")]]'>        
        
        <!-- vérifier que les entrées concernant 
            les sondes A, VD, VG sont présents--> 
        
        <assert test='cda:participant/cda:participantRole/cda:playingDevice/cda:code[@code ="D0001-3" or
            @code ="D0001-4" or 
            @code ="D0001-5"]'> 
            [E_SondeDefOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: Les codes des entrées 'Sonde autriculaire', 'sonde ventricule droit' et 'sonde ventricule gauche' doivent etre consécutivement
             D0001-3, D0001-4 et D0001-5 pris dans le vocabulaire TA_PRC (1.2.250.1.213.1.1.4.2)
        </assert> 
        <!-- vérifier le vocabulaire du codage des entrées -->
        <assert test='cda:participant/cda:participantRole/cda:playingDevice/cda:code[@codeSystem = "1.2.250.1.213.1.1.4.2"]'> 
            [E_SondeDefOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: L'élément 'codeSystem' de l'entrée 'Défibrillateur'
            doit être codé dans dans le vocabulaire TA_PRC (1.2.250.1.213.1.1.4.2). 
        </assert>
             
        <!-- Localisation de l'implant -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code="257880008"'>
            [E_SondeDefOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: La localisation de l'implant est un élément
            obligatoire de l'entrée.</assert>
        
        <!-- Mesures à l'Implantation Courant -->
        <assert
            test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code="L0021"'>
            [E_SondeDefOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: la mesure à l'Implantation courant est un élément
            obligatoire de l'entrée.</assert>
        
        <!-- Détection (D+S) -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]
            /cda:code/@code="L0022"'> 
            [E_SondeDefOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: 'Détection' est un élément obligatoire mesuré à l'implémentation des sondes.
        </assert>
        
        <!-- Impédance (D+S) -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code="L0015"'> 
            [E_SondeDefOrg-CARD-F-PRC-DCI]  Erreur de Conformité CI-SIS: 'Impédance' est un élément obligatoire mesuré à l'implémentation des sondes. 
        </assert>
        
        <!-- Seuil à ms (D+S) -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code="L0023"'> 
            [E_SondeDefOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: 'Seuil à ms' est un élément obligatoire mesuré à l'implémentation des sondes.
        </assert>
        
        <!-- Temps de Charge (D) -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code="L0016"'> 
            [E_SondeDefOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: 'Temps de Charge' est un élément obligatoire mesuré à l'implémentation des sondes
        </assert>
        
        <!-- Seuil de Stimulation (D+S) -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code="L0026"'> 
            [E_SondeDefOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: 'Seuil de Stimulation' est un élément obligatoire mesuré à l'implémentation des sondes</assert>

        <!-- Polarité -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]
            /cda:code/@code="L0053"'> 
            [E_SondeDefOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: 'Polarité' est un élément obligtoire. 
        </assert>
        
        <!-- Connexions -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]
            /cda:code/@code="L0017"'> 
            [E_SondeDefOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: 'Connexions' est un élément obligtoire. 
        </assert>
        
        <!-- Adapteur -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]
            /cda:code/@code="L0018"'> 
            [E_SondeDefOrg-CARD-F-PRC-DCI]  Erreur de Conformité CI-SIS: 'Adapteur'est un élément obligtoire. 
        </assert>
        <!-- Voie d'abord  -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]
            /cda:code/@code="406148008"'> 
            [E_SondeDefOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: 'Voie d'abord' est un élément obligtoire. 
        </assert>
    </rule>
    
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.20" and cda:participant/cda:participantRole/cda:playingDevice/cda:code[@code="D0001-4"]]'>  
        
        <!-- Défibrillation efficace (D) -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code="L0024"'> 
            [E_SondeDefOrg-CARD-F-PRC-DCI] Erreur de Conformité CI-SIS: 'Défibrillation efficace' est un élément obligatoire mesuré à l'implémentation de la sonde ventriculaire droite. 
        </assert>
        <!-- Impédance de choc (D) VD uniquement -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code/@code="L0025"'> 
            [E_SondeDefOrg-CARD-F-PRC-DCI]  Erreur de Conformité CI-SIS: 'Impédance de choc' est un élément obligatoire mesuré à l'implémentation de la sonde ventriculaire droite.
        </assert> 
       
    </rule>
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.3.20" and cda:participant/cda:participantRole/cda:playingDevice/cda:code[@code="D0001-4" and @code="D0001-3"]]'>  
        <!-- Recueil -->
        <assert test='cda:entryRelationship/cda:observation[cda:templateId/@root="1.2.250.1.213.1.1.3.48"]/cda:code[@code="L0027"]'> 
            [E_SondeDefOrg-CARD-F-PRC-DCI]  Erreur de Conformité CI-SIS: 'Recueil' est un élément obligatoire  mesuré à l'implémentation des sondes
        </assert>
    </rule>
    
</pattern>


