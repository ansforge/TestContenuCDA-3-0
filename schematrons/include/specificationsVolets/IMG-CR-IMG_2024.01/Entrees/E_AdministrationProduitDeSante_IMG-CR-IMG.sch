<?xml version="1.0" encoding="UTF-8"?>

<!-- 
   ......................................................................................................................................................    
  E_AdministrationProduitDeSante_IMG-CR-IMG.sh
   Schématron de vérification de la conformité au modèle du CI-SIS l'entrée FR-DICOM-Administration-produit-de-sante(1.2.250.1.213.1.1.3.151) dans le document IMG-CR-IMG qui décrit 
   l'administration de produits (hors radiopharmaceutiques).
   
   IMG-CR-IMG : Compte rendu d'imagerie
   auteur : ANS
   ......................................................................................................................................................    
    Historique :
    07/07/2022 : ANS : Création
   ......................................................................................................................................................    
-->

<pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_AdministrationProduitDeSante_IMG-CR-IMG">
    
    
    <rule context="cda:substanceAdministration[cda:templateId/@root='1.2.250.1.213.1.1.3.151']"> 
        
        <!-- Vérifier la voie d'administration [0..1] -->
        <assert test="count(./cda:routeCode)&lt;=1">
            [E_AdministrationProduitDeSante_IMG-CR-IMG] Erreur de conformité au modèle IMG-CR-IMG : l'entrée FR-DICOM-Administration-produit-de-sante (1.2.250.1.213.1.1.3.151) peut contenir au maximum un élément routeCode [0..1].
        </assert>
        
        <!-- Vérifier la dose administrée [0..1] -->
        <assert test="count(./cda:doseQuantity)&lt;=1">
            [E_AdministrationProduitDeSante_IMG-CR-IMG] Erreur de conformité au modèle IMG-CR-IMG : l'entrée FR-DICOM-Administration-produit-de-sante (1.2.250.1.213.1.1.3.151) peut contenir au maximum un élément doseQuantity [0..1].
        </assert>
        
        <!-- Vérifier le produit administré [1..1] -->
        <assert test="count(./cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code)=1">
            [E_AdministrationProduitDeSante_IMG-CR-IMG] Erreur de conformité au modèle IMG-CR-IMG : l'entrée FR-DICOM-Administration-produit-de-sante (1.2.250.1.213.1.1.3.151) doit obligatoirement contenir l'élément consumable/manufacturedProduct/manufacturedMaterial/code [1..1] pour préciser le produit administré issue des référentiels du médicament (code CIP ou UCD + code ATC).
        </assert>
    </rule>
    
</pattern>