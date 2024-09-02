<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
   S_DossierMR.sch
   Schématron de vérification de la conformité au modèle du CI-SIS de la section FR-Dossier(1.2.250.1.213.1.1.2.66) dans le document SDM-MR
      ...................................................................................................................................................... 
   SDM-MR : Set de Données Minimum – Maladies Rares
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
    19/02/2024 : SBM : Création
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_DossierMR">
    <title>CI-SIS SDM-MR Dossier MR </title>
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.66"]'>
        
        <!-- Vérifier la cardinalité de l'entrée 'FR-Simple-Observation' [1..*]-->
        <assert test='count(./cda:entry[cda:observation/cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13"]) &gt;= 1'>
            [S_DossierMR-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Dossier (1.2.250.1.213.1.1.2.66)
            doit obligatoirement contenir [1..*] entrée FR-Simple-Observation(1.3.6.1.4.1.19376.1.5.3.1.4.13).
        </assert>
        
        <!-- Vérifier la Date de création du dossier -->
        <assert test='./cda:entry/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13" and cda:code/@code="GEN-164"]/cda:value'>
            [S_DossierMR-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Dossier (1.2.250.1.213.1.1.2.66)
            doit obligatoirement contenir une entrée FR-Simple-Observation(1.3.6.1.4.1.19376.1.5.3.1.4.13) précisant la Date de création du dossier dans l'élément value.
        </assert>
        
        <!-- Vérifier l'identifiant du dossier -->
        <assert test='./cda:entry/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13" and cda:code/@code="GEN-164"]/cda:id'>
            [S_DossierMR-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Dossier (1.2.250.1.213.1.1.2.66)
            doit obligatoirement contenir une entrée FR-Simple-Observation(1.3.6.1.4.1.19376.1.5.3.1.4.13) précisant l'identifiant du dossier 'id'.
        </assert>
        
        <!-- Vérifier la Date de la dernière mise à jour du dossier -->
        <assert test='./cda:entry/cda:observation[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.4.13" and cda:code/@code="GEN-165"]/cda:value'>
            [S_DossierMR-CISIS] Erreur de conformité au modèle SDM-MR : La section FR-Dossier (1.2.250.1.213.1.1.2.66)
            doit obligatoirement contenir une entrée FR-Simple-Observation(1.3.6.1.4.1.19376.1.5.3.1.4.13) précisant la Date de la dernière mise à jour du dossier dans l'élément value.
        </assert>
    </rule>
    
</pattern>

