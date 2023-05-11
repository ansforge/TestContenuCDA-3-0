<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
  S_HistoriquePriseEnChargeMedicale.sh
   Schématron de vérification de la conformité au modèle du CI-SIS de la section FR-Historique-prises-en-charge-medicales (1.2.250.1.213.1.1.2.76) dans le document CNAM-HR
   
   CNAM-HR
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
    03/11/2022 : NBS : Création
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_HistoriquePriseEnChargeMedicale">
    <title>CI-SIS CNAM-HR Section Historique prises en harge médicales</title>
    
  
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.76"]'>
        
        <!-- Vérifier le title de la section 'FR-Historique-prises-en-charge-medicales' -->
        <assert test=".//cda:title/text()='Hospitalisations'">
            [S_HistoriquePriseEnChargeMedicale] Erreur de conformité au modèle CNAM-HR : Une section FR-Historique-prises-en-charge-medicales  (1.2.250.1.213.1.1.2.76) doit obligatoirement contenir le title 'Hospitalisations'
        </assert>
        
    </rule>
    
</pattern>