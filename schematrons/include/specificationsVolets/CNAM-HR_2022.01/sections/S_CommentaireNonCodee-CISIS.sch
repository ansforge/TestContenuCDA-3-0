<?xml version="1.0" encoding="UTF-8"?>
<!-- 
   ......................................................................................................................................................    
  S_CommentaireNonCodee-CISIS.sh
   Schématron de vérification de la conformité au modèle du CI-SIS de la section FR-Commentaire-ER (1.2.250.1.213.1.1.3.32) dans le document CNAM-HR 
   qui décrit les observations particulières ou faits marquants / Évènements
   
   CNAM-HR 
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
    04/11/2022 : SBM : Création
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="S_CommentaireNonCodee-CISIS">
    <title>CI-SIS CNAM-HR Section Commentaire non codé </title>
    
    
    
    <rule context='*[cda:templateId/@root="1.3.6.1.4.1.19376.1.4.1.2.16"]'>
        
        <!-- Vérifier le title de la section 'FR-Commentaire-ER' -->
        <assert test=".//cda:title/text()='Usage et Responsabilités'">
            [S_CommentaireNonCodee-CISIS] Erreur de conformité au modèle CNAM-HR : Si elle existe, une section FR-Commentaire-ER (1.3.6.1.4.1.19376.1.4.1.2.16) doit obligatoirement contenir le title 'Usage et Responsabilités'
        </assert>
        
    </rule>
    
</pattern>