<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
  S_DispositifsMedicaux-CISIS.sh
   Schématron de vérification de la conformité au modèle du CI-SIS de la section FR-Dispositifs-medicaux (1.2.250.1.213.1.1.2.1) dans le document CNAM-HR
   
   ANEST-CR-ANEST : Compte rendu d'anesthésie
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
    03/11/2022 : NBS : Création
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_DispositifsMedicaux-CISIS">
    <title>CI-SIS CNAM-HR Section Dispositifs Médicaux </title>
    
  
    
    <rule context='*[cda:templateId/@root="1.2.250.1.213.1.1.2.1"]'>
        
        <!-- Vérifier le title de la section 'FR-Dispositifs-medicaux' -->
        <assert test=".//cda:title/text()='Dispositifs médicaux'">
            [S_DispositifsMedicaux-CISIS] Erreur de conformité au modèle CNAM-HR : Une section FR-Dispositifs-medicaux (1.2.250.1.213.1.1.2.1) doit obligatoirement contenir le title 'Dispositifs médicaux'
        </assert>
        
    </rule>
    
</pattern>