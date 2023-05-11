<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
  S_EducationDuPatient_IMG-CR-IMG.sh
   Schématron de vérification de la conformité au modèle du CI-SIS de la section FR-Education-du-patient (1.2.250.1.213.1.1.2.107) dans le document IMG-CR-IMG qui décrit 
   les observations information au patient
   
   IMG-CR-IMG : Compte rendu d'imagerie
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
    26/03/2021 : SBM : Création
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_EducationDuPatient_IMG-CR-IMG">
    <title>CI-SIS IMG-CR-IMG Section Education du patient </title>
    
        <rule context='cda:section[cda:templateId/@root="1.2.250.1.213.1.1.2.107"]'>
            
            <!-- Vérifier le code de l'entrée 'FR-Simple-Observation' : Informations transmises au patient -->
            <assert test="cda:entry/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']/cda:code/@code='99622-3' and 
                cda:entry/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']/cda:code/@codeSystem='2.16.840.1.113883.6.1'">
                [S_EducationDuPatient_IMG-CR-IMG] Erreur de conformité au modèle IMG-DA-IMG : l'entrée FR-Simple-Observation(1.3.6.1.4.1.19376.1.5.3.1.4.13) doit obligatoirement avoir comme code : @code='99622-3' et @codeSystem='2.16.840.1.113883.6.1'
            </assert>
            
            <!-- Vérifier le text de l'entrée 'FR-Simple-Observation' : Informations transmises au patient -->
            <assert test="cda:entry/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']/cda:text">
                [S_EducationDuPatient_IMG-CR-IMG] Erreur de conformité au modèle IMG-DA-IMG : l'entrée FR-Simple-Observation(1.3.6.1.4.1.19376.1.5.3.1.4.13) doit contenir obligatoirement un élement text [1..1] qui contient la référence vers l'information transmise au patient contenue dans la partie narrative de la section.
            </assert>
            
        </rule>
        
</pattern>