<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
  S_EducationDuPatient_IMG-DA-IMG.sh
   Schématron de vérification de la conformité au modèle IMG-DA-IMG de l'entrée FR-Simple-Observation(11.3.6.1.4.1.19376.1.5.3.1.4.13) dans le document IMG-DA-IMG.
   
   IMG-DA-IMG : Demande d'acte d'imagerie
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
    18/05/2022 : ANS : Création
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_EducationDuPatient_IMG-DA-IMG">
    <title>CI-SIS IMG-DA-IMG Section Education du patient</title>
    
    <rule context='cda:section[cda:templateId/@root="1.2.250.1.213.1.1.2.107"]'>
        
        <!-- Vérifier le code de l'entrée 'FR-Simple-Observation' :  Le patient a-t-il été informé des risques relatifs à l'examen d'imagerie médicale ? -->
        <assert test="cda:entry/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']/cda:code/@code='MED-1130' and 
            cda:entry/cda:observation[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.4.13']/cda:code/@codeSystem='1.2.250.1.213.1.1.4.322'">
            [S_EducationDuPatient_IMG-DA-IMG] Erreur de conformité au modèle IMG-DA-IMG : l'entrée FR-Simple-Observation(1.3.6.1.4.1.19376.1.5.3.1.4.13.7) doit obligatoirement avoir comme code : @code='MED-1130' et @codeSystem='1.2.250.1.213.1.1.4.322'
        </assert>
        
    </rule>
    
</pattern>