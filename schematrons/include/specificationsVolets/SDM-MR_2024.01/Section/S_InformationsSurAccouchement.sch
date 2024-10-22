<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
   S_InformationsSurAccouchement.sch
   Schématron de vérification de la conformité au modèle du CI-SIS de la section FR-Informations-sur-l-accouchement(1.3.6.1.4.1.19376.1.5.3.1.1.21.2.4) dans le document SDM-MR
      ...................................................................................................................................................... 
   SDM-MR : Set de Données Minimum – Maladies Rares
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
    20/02/2024 : SBM : Création
    21/10/2024 : Suppression du contrôle de la donnée "Présence de malformations anténatales"
   ......................................................................................................................................................    
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_InformationsSurAccouchement">
    
    <title>CI-SIS SDM-MR Informations sur l'accouchement </title>
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.21.2.4"]'>
        
        <!-- Vérifier la cardinalité de la sous-section FR-Examen-physique-detaille-code '1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1' [1..1]-->
        <assert test='count(./cda:component/cda:section[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1"])= 1'>
            [S_InformationsSurAccouchement-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Informations-sur-l-accouchement (1.3.6.1.4.1.19376.1.5.3.1.1.21.2.4)
            doit obligatoirement contenir [1..1] sous-section FR-Examen-physique-detaille-code '1.3.6.1.4.1.19376.1.5.3.1.1.9.15.1'.
        </assert>
        
    </rule>
    
    <!-- Sous-section FR-Actes-et-interventions --> 
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.21.2.4"]/cda:component/cda:section[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11"]'>
        <!-- Vérifier l'entrée FR-Acte : ASSISTANCE MÉDICALE À LA PROCRÉATION -->
        <assert test='./cda:entry/cda:procedure[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.19"]/cda:code/@code="09.02"'>
            [S_InformationsSurAccouchement-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Acte(1.3.6.1.4.1.19376.1.5.3.1.4.5) doit obligatoirement contenir le code/@code="09.02".
        </assert>
    </rule>
    
    <!-- Sous-section FR-Resultats-evenements : l'âge gestationnel du foetus --> 
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.1.21.2.4"]/cda:component/cda:section[cda:templateId/@root="1.3.6.1.4.1.19376.1.7.3.1.1.13.7"]'>
        <!-- Vérifier l'entrée FR-Simple-Observation : Présence de malformations anténatales -->
        <!--<assert test='not(./cda:entry/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13"]) or 
            ./cda:entry/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13"]/cda:code/@code="MED-078"'>
            [S_InformationsSurAccouchement-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Simple-Observation (Présence de malformations anténatales) doit obligatoirement contenir le code/@code="MED-078".
        </assert>-->
        
        <!-- Vérifier l'entrée FR-Simple-Observation : l'âge gestationnel du foetus -->
        <assert test='not(./cda:entry/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13"]) or 
            ./cda:entry/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13"]/cda:code/@code="11884-4"'>
            [S_InformationsSurAccouchement-CISIS] Erreur de conformité au modèle SDM-MR : L'entrée FR-Simple-Observation (l'âge gestationnel du foetus) doit obligatoirement contenir le code/@code="11884-4".
        </assert>
    </rule>
    
</pattern>

