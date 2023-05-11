<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
  S_Vaccinations-CISIS.sh
   Schématron de vérification de la conformité au modèle du CI-SIS de la section FR-Vaccinations(1.3.6.1.4.1.19376.1.5.3.1.3.23) dans le document ANEST-CR-CPA 
   Section FR-Vaccinations
   CNAM-HR
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
    03/11/2022 : NBS : Création
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_Vaccinations-CISIS">
    <title>CI-SIS CNAM-HR Section Vaccinations</title>
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.5.3.1.3.23"]'>
        
        
        <!-- Vérifier le title de la section 'FR-Vaccinations' -->
        <assert test='.//cda:title/text()="Vaccinations"'>
            [S_Vaccinations-CISIS] Erreur de conformité au modèle CNAM-HR : Une section FR-Vaccinations (1.3.6.1.4.1.19376.1.5.3.1.3.23) doit obligatoirement contenir le title 'Vaccinations'
        </assert>
        
    </rule>
    
</pattern>

