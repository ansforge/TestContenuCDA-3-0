<?xml version="1.0" encoding="UTF-8"?>

<!-- E_produitDeSante_fr
     ......................................................................................................................................................
     Vérification de la conformité de l'entrée FR-Produit-de-sante aux spécifications du CI-SIS.
     ......................................................................................................................................................
     Historique :
     - 11/01/2023 : Création
-->

    <pattern xmlns="http://purl.oclc.org/dsdl/schematron" id="E_produitDeSante_fr">
        <title>CI-SIS Entrée "FR-Produit-de-sante-prescrit"</title>
    
        <rule context="//cda:entry/cda:substanceAdministration/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial">
            
            <!-- Test des templateId pour l'entrée "FR-Produit-de-sante" -->
            <assert test="not(cda:code[@codeSystem]) or cda:code[@codeSystem='1.2.250.1.213.2.3.1']">
                [1] [E_produitDeSante_fr.sch] Erreur de conformité CI-SIS : 
                Dans l'entrée "FR-Produit-de-sante" le produit de santé est codé en CIS dans la balise "code".
            </assert>
        </rule>       
    </pattern>
