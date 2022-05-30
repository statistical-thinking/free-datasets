###################
# C O D E B U C H #
###################
# CALIBRE - Herstellerbezeichnung des Uhrwerks
# TYPE - Handaufzug (0); Automatikaufzug (1)
# DIAMETER - Durchmesser des Uhrwerks
# HEIGHT - Höhe des Uhrwerks
# JEWELS - Anzahl verbauter Lagersteine
# VPH - Anzahl an Halbschwingungen in einer Stunde
# HZ - Frequenz des Uhrwerks in Hertz
# POWER - Gangreserve in Stunden
# SECONDS - Zentrale Sekunde (0); Kleine Sekunde (1)
# DATE - Ohne Datum (0); Mit Datum (1); Mit Datum und Schnellverstellung (2)
# DAY - Ohne Tagesanzeige (0); Mit Tagesanzeige
# HACKING - Ohne Sekundenstopp (0); Mit Sekundenstopp (1)
# ROTORBLL - Ohne Kugellagerung (0), Mit Kugellagerung (1)

#####################################
# F O R S C H U N G S A U F T R A G #
#####################################

# Welche Eigenschaften muss ein neu zu konstruierendes Uhrwerk aufweisen, welches möglichst klein sein und dabei eine hohe Gangreserve aufweisen soll?

#########################################
# S T A R T   I H R E R   A N A L Y S E #
#########################################

# Datensatz einlesen
eta.calibres <- read.csv("https://raw.githubusercontent.com/statistical-thinking/datasets/main/eta.calibres.csv")