####################################################################################
# BIOS 6640: Project                                                               #
# 01_Cuffney_BIOS6640_Project.R                                                    #
# Reading in the weather data for each district then combing them into one dataset #
# Michael Cuffney                                                                  #
# Data Created: 11/27/2017                                                         #
# Last Edited: 12/07/2017                                                          #
####################################################################################

library(foreign)
setwd("C:\\Users\\micha\\Desktop\\Python & R in Data Science\\Project\\Weather")
# Reading in the Data

library(plyr)
paths <- dir(pattern = "\\.txt$")
names(paths) <- basename(paths)

# Create a distric name varaible for each distric weather dataset    
  
# Alto Molocue
altomol <- `ALTO_MOLOCUE_ZAM_fldas_daily_20100101-20170724.txt`
altomol["District"] <- NA
altomol$District <- "ALTO MOLOCUE"
rm(`ALTO_MOLOCUE_ZAM_fldas_daily_20100101-20170724.txt`)

# ANCUABE
ancuabe <- `ANCUABE_CAB_fldas_daily_20100101-20170724.txt`
ancuabe["District"] <- NA
ancuabe$District <- "ANCUABE"
rm(`ANCUABE_CAB_fldas_daily_20100101-20170724.txt`)

# "ANGOCHE" 
angoche <- `ANGOCHE_NAM_fldas_daily_20100101-20170724.txt`
angoche["District"] <- NA
angoche$District <- "ANGOCHE"
rm(`ANGOCHE_NAM_fldas_daily_20100101-20170724.txt`)

# "ANGONIA" 
angonia <- `ANGONIA_TET_fldas_daily_20100101-20170724.txt`
angonia["District"] <- NA
angonia$District <- "ANGONIA"
rm(`ANGONIA_TET_fldas_daily_20100101-20170724.txt`)

#  "BALAMA"
balama <- `BALAMA_CAB_fldas_daily_20100101-20170724.txt`
balama["District"] <- NA
balama$District <- "BALAMA"
rm(`BALAMA_CAB_fldas_daily_20100101-20170724.txt`)

# "BARUE" 
barue <- `BARUE_MAN_fldas_daily_20100101-20170724.txt`
barue["District"] <- NA
barue$District <- "BARUE"
rm(`BARUE_MAN_fldas_daily_20100101-20170724.txt`)

# "BILENE - MACIA"
bilene_macia <- `BILENE_MACIA_GAZ_fldas_daily_20100101-20170724.txt`
bilene_macia["District"] <- NA
bilene_macia$District <- "BILENE - MACIA"
rm(`BILENE_MACIA_GAZ_fldas_daily_20100101-20170724.txt`)

# "BOANE"
boane <- `BOANE_MAP_fldas_daily_20100101-20170724.txt`
boane["District"] <- NA
boane$District <- "BOANE"
rm(`BOANE_MAP_fldas_daily_20100101-20170724.txt`)

# "BUZI"
buzi <- `BUZI_SOF_fldas_daily_20100101-20170724.txt`
buzi["District"] <- NA
buzi$District <- "BUZI"
rm(`BUZI_SOF_fldas_daily_20100101-20170724.txt`)

#"CAHORA-BASSA"
cahora_bassa <- `CAHORA_BASSA_TET_fldas_daily_20100101-20170724.txt`
cahora_bassa["District"] <- NA
cahora_bassa$District <- "CAHORA-BASSA"
rm(`CAHORA_BASSA_TET_fldas_daily_20100101-20170724.txt`)

# "CAIA"  
caia <- `CAIA_SOF_fldas_daily_20100101-20170724.txt`
caia["District"] <- NA
caia$District <- "CAIA"
rm(`CAIA_SOF_fldas_daily_20100101-20170724.txt`)

# "CHANGARA"
changara <- `CHANGARA_TET_fldas_daily_20100101-20170724.txt`
changara["District"] <- NA
changara$District <- "CHANGARA"
rm(`CHANGARA_TET_fldas_daily_20100101-20170724.txt`)

# "CHEMBA"
chemba <- `CHEMBA_SOF_fldas_daily_20100101-20170724.txt`
chemba["District"] <- NA
chemba$District <- "CHEMBA"
rm(`CHEMBA_SOF_fldas_daily_20100101-20170724.txt`)

# "CHERINGOMA"
cheringoma <- `CHERINGOMA_SOF_fldas_daily_20100101-20170724.txt`
cheringoma["District"] <- NA
cheringoma$District <- "CHERINGOMA"
rm(`CHERINGOMA_SOF_fldas_daily_20100101-20170724.txt`)

# "CHIBABAVA"   
chibabava <- `CHIBABAVA_SOF_fldas_daily_20100101-20170724.txt`
chibabava["District"] <- NA
chibabava$District <- "CHIBABAVA"
rm(`CHIBABAVA_SOF_fldas_daily_20100101-20170724.txt`)

# "CHIBUTO" 
chibuto <- `CHIBUTO_GAZ_fldas_daily_20100101-20170724.txt`
chibuto["District"] <- NA
chibuto$District <- "CHIBUTO"
rm(`CHIBUTO_GAZ_fldas_daily_20100101-20170724.txt`)

# "CHICUALACUALA"          
chicualacuala <- `CHICUALACUALA_GAZ_fldas_daily_20100101-20170724.txt`
chicualacuala["District"] <- NA
chicualacuala$District <- "CHICUALACUALA"
rm(`CHICUALACUALA_GAZ_fldas_daily_20100101-20170724.txt`)

# "CHIFUNDE"
chifunde <- `CHIFUNDE_TET_fldas_daily_20100101-20170724.txt`
chifunde["District"] <- NA
chifunde$District <- "CHIFUNDE"
rm(`CHIFUNDE_TET_fldas_daily_20100101-20170724.txt`)

# "CHIGUBO"
chigubo <- `CHIGUBO_GAZ_fldas_daily_20100101-20170724.txt`
chigubo["District"] <- NA
chigubo$District <- "CHIGUBO"
rm(`CHIGUBO_GAZ_fldas_daily_20100101-20170724.txt`)

# "CHINDE"
chinde <- `CHINDE_ZAM_fldas_daily_20100101-20170724.txt`
chinde["District"] <- NA
chinde$District <- "CHINDE"
rm(`CHINDE_ZAM_fldas_daily_20100101-20170724.txt`)

# "CHIURE"
chiure <- `CHIURE_CAB_fldas_daily_20100101-20170724.txt`
chiure["District"] <- NA
chiure$District <- "CHIURE"
rm(`CHIURE_CAB_fldas_daily_20100101-20170724.txt`)

# "CHIUTA"
chiuta <- `CHIUTA_TET_fldas_daily_20100101-20170724.txt`
chiuta["District"] <- NA
chiuta$District <- "CHIUTA"
rm(`CHIUTA_TET_fldas_daily_20100101-20170724.txt`)

# "CHOKWE"
chokwe <- `CHOKWE_GAZ_fldas_daily_20100101-20170724.txt`
chokwe["District"] <- NA
chokwe$District <- "CHOKWE"
rm(`CHOKWE_GAZ_fldas_daily_20100101-20170724.txt`)

# "CIDADE DA MATOLA"
cidade_da_matola <- `CIDADE_DA_MATOLA_MAP_fldas_daily_20100101-20170724.txt`
cidade_da_matola["District"] <- NA
cidade_da_matola$District <- "CIDADE DA MATOLA"
rm(`CIDADE_DA_MATOLA_MAP_fldas_daily_20100101-20170724.txt`)

# "CIDADE DE  BEIRA"
cidade_de_beira <- `CIDADE_DE_BEIRA_SOF_fldas_daily_20100101-20170724.txt`
cidade_de_beira["District"] <- NA
cidade_de_beira$District <- "CIDADE DE BEIRA"
rm(`CIDADE_DE_BEIRA_SOF_fldas_daily_20100101-20170724.txt`)

# "CIDADE DE  CHIMOIO"
cidade_de_chimoio <- `CIDADE_DE_CHIMOIO_MAN_fldas_daily_20100101-20170724.txt`
cidade_de_chimoio["District"] <- NA
cidade_de_chimoio$District <- "CIDADE DE CHIMOIO"
rm(`CIDADE_DE_CHIMOIO_MAN_fldas_daily_20100101-20170724.txt`)

# "CIDADE DE  INHAMBANE"   
cidade_de_inhambane <- `CIDADE_DE_INHAMBANE_INH_fldas_daily_20100101-20170724.txt`
cidade_de_inhambane["District"] <- NA
cidade_de_inhambane$District <- "CIDADE DE INHAMBANE"
rm(`CIDADE_DE_INHAMBANE_INH_fldas_daily_20100101-20170724.txt`)

# "CIDADE DE LICHINGA"
cidade_de_lichinga <- `CIDADE_DE_LICHINGA_NIA_fldas_daily_20100101-20170724.txt`
cidade_de_lichinga["District"] <- NA
cidade_de_lichinga$District <- "CIDADE DE LICHINGA"
rm(`CIDADE_DE_LICHINGA_NIA_fldas_daily_20100101-20170724.txt`)

# "CIDADE DE MAPUTO"
cidade_de_maputo <- `CIDADE_DE_MAPUTO_MAP_fldas_daily_20100101-20170724.txt`
cidade_de_maputo["District"] <- NA
cidade_de_maputo$District <- "CIDADE DE MAPUTO"
rm(`CIDADE_DE_MAPUTO_MAP_fldas_daily_20100101-20170724.txt`)

# "CIDADE DE MAXIXE"
cidade_de_maxixe <- `CIDADE_DE_MAXIXE_INH_fldas_daily_20100101-20170724.txt`
cidade_de_maxixe["District"] <- NA
cidade_de_maxixe$District <- "CIDADE DE MAXIXE"
rm(`CIDADE_DE_MAXIXE_INH_fldas_daily_20100101-20170724.txt`)

# "CIDADE DE NACALA-PORTO" 
cidade_de_nacalaporto <- `CIDADE_DE_NACALA_PORTO_NAM_fldas_daily_20100101-20170724.txt`
cidade_de_nacalaporto["District"] <- NA
cidade_de_nacalaporto$District <- "CIDADE DE NACALA-PORTO"
rm(`CIDADE_DE_NACALA_PORTO_NAM_fldas_daily_20100101-20170724.txt`)

# "CIDADE DE NAMPULA"
cidade_de_nampula <- `CIDADE_DE_NAMPULA_NAM_fldas_daily_20100101-20170724.txt`
cidade_de_nampula["District"] <- NA
cidade_de_nampula$District <- "CIDADE DE NAMPULA"
rm(`CIDADE_DE_NAMPULA_NAM_fldas_daily_20100101-20170724.txt`)

# "CIDADE DE PEMBA" 
cidade_de_pemba <- `CIDADE_DE_PEMBA_CAB_fldas_daily_20100101-20170724.txt`
cidade_de_pemba["District"] <- NA
cidade_de_pemba$District <- "CIDADE DE PEMBA"
rm(`CIDADE_DE_PEMBA_CAB_fldas_daily_20100101-20170724.txt`)

# "CIDADE DE QUELIMANE"
cidade_de_quelimane <- `CIDADE_DE_QUELIMANE_ZAM_fldas_daily_20100101-20170724.txt`
cidade_de_quelimane["District"] <- NA
cidade_de_quelimane$District <- "CIDADE DE QUELIMANE"
rm(`CIDADE_DE_QUELIMANE_ZAM_fldas_daily_20100101-20170724.txt`)

# "CIDADE DE TETE"
cidade_de_tete <- `CIDADE_DE_TETE_TET_fldas_daily_20100101-20170724.txt`
cidade_de_tete["District"] <- NA
cidade_de_tete$District <- "CIDADE DE TETE"
rm(`CIDADE_DE_TETE_TET_fldas_daily_20100101-20170724.txt`)

# "CIDADE DE XAI-XAI"
cidade_de_xaixai <- `CIDADE_DE_XAI_XAI_GAZ_fldas_daily_20100101-20170724.txt`
cidade_de_xaixai["District"] <- NA
cidade_de_xaixai$District <- "CIDADE DE XAI-XAI"
rm(`CIDADE_DE_XAI_XAI_GAZ_fldas_daily_20100101-20170724.txt`)

# "CORONGOSA"              
corongosa <- `CORONGOSA_SOF_fldas_daily_20100101-20170724.txt`
corongosa["District"] <- NA
corongosa$District <- "CORONGOSA"
rm(`CORONGOSA_SOF_fldas_daily_20100101-20170724.txt`)

# "CUAMBA"            
cuamba <- `CUAMBA_NIA_fldas_daily_20100101-20170724.txt`
cuamba["District"] <- NA
cuamba$District <- "CUAMBA"
rm(`CUAMBA_NIA_fldas_daily_20100101-20170724.txt`)

# "DONDO"               
dondo <- `DONDO_SOF_fldas_daily_20100101-20170724.txt`
dondo["District"] <- NA
dondo$District <- "DONDO"
rm(`DONDO_SOF_fldas_daily_20100101-20170724.txt`)

# "FUNHALOURO"
funhalouro <- `FUNHALOURO_INH_fldas_daily_20100101-20170724.txt`
funhalouro["District"] <- NA
funhalouro$District <- "FUNHALOURO"
rm(`FUNHALOURO_INH_fldas_daily_20100101-20170724.txt`)

#  "GILE" 
gile <- `GILE_ZAM_fldas_daily_20100101-20170724.txt`
gile["District"] <- NA
gile$District <- "GILE"
rm(`GILE_ZAM_fldas_daily_20100101-20170724.txt`)

# "GONDOLA"           
gondola <- `GONDOLA_MAN_fldas_daily_20100101-20170724.txt`
gondola["District"] <- NA
gondola$District <- "GONDOLA"
rm(`GONDOLA_MAN_fldas_daily_20100101-20170724.txt`)

# "GOVURO"                 
govuro <- `GOVURO_INH_fldas_daily_20100101-20170724.txt`
govuro["District"] <- NA
govuro$District <- "GOVURO"
rm(`GOVURO_INH_fldas_daily_20100101-20170724.txt`)

# "GUIJA" 
guija <- `GUIJA_GAZ_fldas_daily_20100101-20170724.txt`
guija["District"] <- NA
guija$District <- "GUIJA"
rm(`GUIJA_GAZ_fldas_daily_20100101-20170724.txt`)

# "GURO"                
guro <- `GURO_MAN_fldas_daily_20100101-20170724.txt`
guro["District"] <- NA
guro$District <- "GURO"
rm(`GURO_MAN_fldas_daily_20100101-20170724.txt`)

# "GURUE"             
gurue <- `GURUE_ZAM_fldas_daily_20100101-20170724.txt`
gurue["District"] <- NA
gurue$District <- "GURUE"
rm(`GURUE_ZAM_fldas_daily_20100101-20170724.txt`)

# "HOMOINE"             
homoine <- `HOMOINE_INH_fldas_daily_20100101-20170724.txt`
homoine["District"] <- NA
homoine$District <- "HOMOINE"
rm(`HOMOINE_INH_fldas_daily_20100101-20170724.txt`)

# "IBO"                    
ibo <- `IBO_CAB_fldas_daily_20100101-20170724.txt`
ibo["District"] <- NA
ibo$District <- "IBO"
rm(`IBO_CAB_fldas_daily_20100101-20170724.txt`)

# "ILE"             
ile <- `ILE_ZAM_fldas_daily_20100101-20170724.txt`
ile["District"] <- NA
ile$District <- "ILE"
rm(`ILE_ZAM_fldas_daily_20100101-20170724.txt`)

# "ILHA DE MOAMBIQUE"
ilha_de_moambique <- `ILHA_DE_MOAMBIQUE_NAM_fldas_daily_20100101-20170724.txt`
ilha_de_moambique["District"] <- NA
ilha_de_moambique$District <- "ILHA DE MOAMBIQUE"
rm(`ILHA_DE_MOAMBIQUE_NAM_fldas_daily_20100101-20170724.txt`)

# "INHARRIME"              
inharrime <- `INHARRIME_INH_fldas_daily_20100101-20170724.txt`
inharrime["District"] <- NA
inharrime$District <- "INHARRIME"
rm(`INHARRIME_INH_fldas_daily_20100101-20170724.txt`)

# "INHASSORO"              
inhassoro <- `INHASSORO_INH_fldas_daily_20100101-20170724.txt`
inhassoro["District"] <- NA
inhassoro$District <- "INHASSORO"
rm(`INHASSORO_INH_fldas_daily_20100101-20170724.txt`)

# "INHASSUNGE"
inhassunge <- `INHASSUNGE_ZAM_fldas_daily_20100101-20170724.txt`
inhassunge["District"] <- NA
inhassunge$District <- "INHASSUNGE"
rm(`INHASSUNGE_ZAM_fldas_daily_20100101-20170724.txt`)

# "JANGAMO"                
jangamo <- `JANGAMO_INH_fldas_daily_20100101-20170724.txt`
jangamo["District"] <- NA
jangamo$District <- "JANGAMO"
rm(`JANGAMO_INH_fldas_daily_20100101-20170724.txt`)

# "LAGO"                  
lago <- `LAGO_NIA_fldas_daily_20100101-20170724.txt`
lago["District"] <- NA
lago$District <- "LAGO"
rm(`LAGO_NIA_fldas_daily_20100101-20170724.txt`)

# "LALAUA"                 
lalaua <- `LALAUA_NAM_fldas_daily_20100101-20170724.txt`
lalaua["District"] <- NA
lalaua$District <- "LALAUA"
rm(`LALAUA_NAM_fldas_daily_20100101-20170724.txt`)

# "LICHINGA"              
lichinga <- `LICHINGA_NIA_fldas_daily_20100101-20170724.txt`
lichinga["District"] <- NA
lichinga$District <- "LICHINGA"
rm(`LICHINGA_NIA_fldas_daily_20100101-20170724.txt`)

# "LUGELA"                 
lugela <- `LUGELA_ZAM_fldas_daily_20100101-20170724.txt`
lugela["District"] <- NA
lugela$District <- "LUGELA"
rm(`LUGELA_ZAM_fldas_daily_20100101-20170724.txt`)

# "MABALANE"              
mabalane <- `MABALANE_GAZ_fldas_daily_20100101-20170724.txt`
mabalane["District"] <- NA
mabalane$District <- "MABALANE"
rm(`MABALANE_GAZ_fldas_daily_20100101-20170724.txt`)

# "MABOTE"                
mabote <- `MABOTE_INH_fldas_daily_20100101-20170724.txt`
mabote["District"] <- NA
mabote$District <- "MABOTE"
rm(`MABOTE_INH_fldas_daily_20100101-20170724.txt`)

# "MACANGA" 
macanga <- `MACANGA_TET_fldas_daily_20100101-20170724.txt`
macanga["District"] <- NA
macanga$District <- "MACANGA"
rm(`MACANGA_TET_fldas_daily_20100101-20170724.txt`)

# "MACHANGA"               
machanga <- `MACHANGA_SOF_fldas_daily_20100101-20170724.txt`
machanga["District"] <- NA
machanga$District <- "MACHANGA"
rm(`MACHANGA_SOF_fldas_daily_20100101-20170724.txt`)

# "MACHAZE"                
machaze <- `MACHAZE_MAN_fldas_daily_20100101-20170724.txt`
machaze["District"] <- NA
machaze$District <- "MACHAZE"
rm(`MACHAZE_MAN_fldas_daily_20100101-20170724.txt`)

# "MACOMIA"                
macomia<- `MACOMIA_CAB_fldas_daily_20100101-20170724.txt`
macomia["District"] <- NA
macomia$District <- "MACOMIA"
rm(`MACOMIA_CAB_fldas_daily_20100101-20170724.txt`)

# "MACOSSA"               
macossa <- `MACOSSA_MAN_fldas_daily_20100101-20170724.txt`
macossa["District"] <- NA
macossa$District <- "macossa"
rm(`MACOSSA_MAN_fldas_daily_20100101-20170724.txt`)

# "MAGANJA DA COSTA"       
maganja <- `MAGANJA_DA_COSTA_ZAM_fldas_daily_20100101-20170724.txt`
maganja["District"] <- NA
maganja$District <- "MAGANJA"
rm(`MAGANJA_DA_COSTA_ZAM_fldas_daily_20100101-20170724.txt`)

# "MAGOE"                  
magoe <- `MAGOE_TET_fldas_daily_20100101-20170724.txt`
magoe["District"] <- NA
magoe$District <- "MAGOE"
rm(`MAGOE_TET_fldas_daily_20100101-20170724.txt`)

# "MAGUDE"            
magude <- `MAGUDE_MAP_fldas_daily_20100101-20170724.txt`
magude["District"] <- NA
magude$District <- "MAGUDE"
rm(`MAGUDE_MAP_fldas_daily_20100101-20170724.txt`)

# "MAJUNE"                
majune <- `MAJUNE_NIA_fldas_daily_20100101-20170724.txt`
majune["District"] <- NA
majune$District <- "MAJUNE"
rm(`MAJUNE_NIA_fldas_daily_20100101-20170724.txt`)

# "MALEMA"                
malema <- `MALEMA_NAM_fldas_daily_20100101-20170724.txt`
malema["District"] <- NA
malema$District <- "MALEMA"
rm(`MALEMA_NAM_fldas_daily_20100101-20170724.txt`)

# "MANDIMBA"              
mandimba <- `MANDIMBA_NIA_fldas_daily_20100101-20170724.txt`
mandimba["District"] <- NA
mandimba$District <- "MANDIMBA"
rm(`MANDIMBA_NIA_fldas_daily_20100101-20170724.txt`)

# "MANDLACAZE"             
mandlacaze <- `MANDLACAZE_GAZ_fldas_daily_20100101-20170724.txt`
mandlacaze["District"] <- NA
mandlacaze$District <- "MANDLACAZE"
rm(`MANDLACAZE_GAZ_fldas_daily_20100101-20170724.txt`)

# "MANHIA"                 
manhia <- `MANHIA_MAP_fldas_daily_20100101-20170724.txt`
manhia["District"] <- NA
manhia$District <- "MANHIA"
rm(`MANHIA_MAP_fldas_daily_20100101-20170724.txt`)

# "MANICA" 
manica <- `MANICA_MAN_fldas_daily_20100101-20170724.txt`
manica["District"] <- NA
manica$District <- "MANICA"
rm(`MANICA_MAN_fldas_daily_20100101-20170724.txt`)

# "MARAVIA"               
maravia <- `MARAVIA_TET_fldas_daily_20100101-20170724.txt`
maravia["District"] <- NA
maravia$District <- "MARAVIA"
rm(`MARAVIA_TET_fldas_daily_20100101-20170724.txt`)

# "MARINGUE"               
maringue <- `MARINGUE_SOF_fldas_daily_20100101-20170724.txt`
maringue["District"] <- NA
maringue$District <- "MARINGUE"
rm(`MARINGUE_SOF_fldas_daily_20100101-20170724.txt`)

# "MARRACUENE"             
marracuene <- `MARRACUENE_MAP_fldas_daily_20100101-20170724.txt`
marracuene["District"] <- NA
marracuene$District <- "MARRACUENE"
rm(`MARRACUENE_MAP_fldas_daily_20100101-20170724.txt`)

# "MARROMEU"               
marromeu <- `MARROMEU_SOF_fldas_daily_20100101-20170724.txt`
marromeu["District"] <- NA
marromeu$District <- "MARROMEU"
rm(`MARROMEU_SOF_fldas_daily_20100101-20170724.txt`)

# "MARRUPA"                
marrupa <- `MARRUPA_NIA_fldas_daily_20100101-20170724.txt`
marrupa["District"] <- NA
marrupa$District <- "MARRUPA"
rm(`MARRUPA_NIA_fldas_daily_20100101-20170724.txt`)

# "MASSANGENA"            
massangena <- `MASSANGENA_GAZ_fldas_daily_20100101-20170724.txt`
massangena["District"] <- NA
massangena$District <- "MASSANGENA"
rm(`MASSANGENA_GAZ_fldas_daily_20100101-20170724.txt`)

# "MASSINGA"               
massinga <- `MASSINGA_INH_fldas_daily_20100101-20170724.txt`
massinga["District"] <- NA
massinga$District <- "MASSINGA"
rm(`MASSINGA_INH_fldas_daily_20100101-20170724.txt`)

# "MASSINGIR"              
massingir <- `MASSINGIR_GAZ_fldas_daily_20100101-20170724.txt`
massingir["District"] <- NA
massingir$District <- "MASSINGIR"
rm(`MASSINGIR_GAZ_fldas_daily_20100101-20170724.txt`)

# "MATUTUINE"
matutuine <- `MATUTUINE_MAP_fldas_daily_20100101-20170724.txt`
matutuine["District"] <- NA
matutuine$District <- "MATUTUINE"
rm(`MATUTUINE_MAP_fldas_daily_20100101-20170724.txt`)

# "MAUA"                   
maua <- `MAUA_NIA_fldas_daily_20100101-20170724.txt`
maua["District"] <- NA
maua$District <- "MAUA"
rm(`MAUA_NIA_fldas_daily_20100101-20170724.txt`)

# "MAVAGO"            
mavago <- `MAVAGO_NIA_fldas_daily_20100101-20170724.txt`
mavago["District"] <- NA
mavago$District <- "MAVAGO"
rm(`MAVAGO_NIA_fldas_daily_20100101-20170724.txt`)

# "MECANHELAS"            
mecanhelas <- `MECANHELAS_NIA_fldas_daily_20100101-20170724.txt`
mecanhelas["District"] <- NA
mecanhelas$District <- "MECANHELAS"
rm(`MECANHELAS_NIA_fldas_daily_20100101-20170724.txt`)

# "MECONTA"                
meconta <- `MECONTA_NAM_fldas_daily_20100101-20170724.txt`
meconta["District"] <- NA
meconta$District <- "MECONTA"
rm(`MECONTA_NAM_fldas_daily_20100101-20170724.txt`)

# "MECUBURI"               
mecuburi <- `MECUBURI_NAM_fldas_daily_20100101-20170724.txt`
mecuburi["District"] <- NA
mecuburi$District <- "MECUBURI"
rm(`MECUBURI_NAM_fldas_daily_20100101-20170724.txt`)

# "MECUFI"   
mecufi <- `MECUFI_CAB_fldas_daily_20100101-20170724.txt`
mecufi["District"] <- NA
mecufi$District <- "MECUFI"
rm(`MECUFI_CAB_fldas_daily_20100101-20170724.txt`)

# "MECULA"
mecula <- `MECULA_NIA_fldas_daily_20100101-20170724.txt`
mecula["District"] <- NA
mecula$District <- "MECULA"
rm(`MECULA_NIA_fldas_daily_20100101-20170724.txt`)

# "MELUCO"                
meluco <- `MELUCO_CAB_fldas_daily_20100101-20170724.txt`
meluco["District"] <- NA
meluco$District <- "MELUCO"
rm(`MELUCO_CAB_fldas_daily_20100101-20170724.txt`)

# "MEMBA"                 
memba <- `MEMBA_NAM_fldas_daily_20100101-20170724.txt`
memba["District"] <- NA
memba$District <- "MEMBA"
rm(`MEMBA_NAM_fldas_daily_20100101-20170724.txt`)

# "METARICA"            
metarica <- `METARICA_NIA_fldas_daily_20100101-20170724.txt`
metarica["District"] <- NA
metarica$District <- "METARICA"
rm(`METARICA_NIA_fldas_daily_20100101-20170724.txt`)

# "MILANGE"                
milange <- `MILANGE_ZAM_fldas_daily_20100101-20170724.txt`
milange["District"] <- NA
milange$District <- "MILANGE"
rm(`MILANGE_ZAM_fldas_daily_20100101-20170724.txt`)

# "MOAMBA" 
moamba <- `MOAMBA_MAP_fldas_daily_20100101-20170724.txt`
moamba["District"] <- NA
moamba$District <- "MOAMBA"
rm(`MOAMBA_MAP_fldas_daily_20100101-20170724.txt`)

# "MOATIZE"               
moatize <- `MOATIZE_TET_fldas_daily_20100101-20170724.txt`
moatize["District"] <- NA
moatize$District <- "MOATIZE"
rm(`MOATIZE_TET_fldas_daily_20100101-20170724.txt`)

#"MOCIMBOA DA PRAIA"      
mocimboa_da_praia <- `MOCIMBOA_DA_PRAIA_CAB_fldas_daily_20100101-20170724.txt`
mocimboa_da_praia["District"] <- NA
mocimboa_da_praia$District <- "MOCIMBOA DA PRAIA"
rm(`MOCIMBOA_DA_PRAIA_CAB_fldas_daily_20100101-20170724.txt`)

# "MOCUBA"                 
mocuba <- `MOCUBA_ZAM_fldas_daily_20100101-20170724.txt`
mocuba["District"] <- NA
mocuba$District <- "MOCUBA"
rm(`MOCUBA_ZAM_fldas_daily_20100101-20170724.txt`)

# "MOGINCUAL"             
mogincual <- `MOGINCUAL_NAM_fldas_daily_20100101-20170724.txt`
mogincual["District"] <- NA
mogincual$District <- "MOGINCUAL"
rm(`MOGINCUAL_NAM_fldas_daily_20100101-20170724.txt`)

# "MOGOVOLAS"             
mogovolas <- `MOGOVOLAS_NAM_fldas_daily_20100101-20170724.txt`
mogovolas["District"] <- NA
mogovolas$District <- "MOGOVOLAS"
rm(`MOGOVOLAS_NAM_fldas_daily_20100101-20170724.txt`)

# "MOMA"  
moma <- `MOMA_NAM_fldas_daily_20100101-20170724.txt`
moma["District"] <- NA
moma$District <- "MOMA"
rm(`MOMA_NAM_fldas_daily_20100101-20170724.txt`)

# "MONAPO"            
monapo <- `MONAPO_NAM_fldas_daily_20100101-20170724.txt`
monapo["District"] <- NA
monapo$District <- "MONAPO"
rm(`MONAPO_NAM_fldas_daily_20100101-20170724.txt`)

# "MONTEPUEZ"             
montepuez <- `MONTEPUEZ_CAB_fldas_daily_20100101-20170724.txt`
montepuez["District"] <- NA
montepuez$District <- "MONTEPUEZ"
rm(`MONTEPUEZ_CAB_fldas_daily_20100101-20170724.txt`)

# "MOPEIA"                 
mopeia <- `MOPEIA_ZAM_fldas_daily_20100101-20170724.txt`
mopeia["District"] <- NA
mopeia$District <- "MOPEIA"
rm(`MOPEIA_ZAM_fldas_daily_20100101-20170724.txt`)

# "MORRUMBALA"            
morrumbala <- `MORRUMBALA_ZAM_fldas_daily_20100101-20170724.txt`
morrumbala["District"] <- NA
morrumbala$District <- "MORRUMBALA"
rm(`MORRUMBALA_ZAM_fldas_daily_20100101-20170724.txt`)

# "MORRUMBENE"             
morrumbene <- `MORRUMBENE_INH_fldas_daily_20100101-20170724.txt`
morrumbene["District"] <- NA
morrumbene$District <- "MORRUMBENE"
rm(`MORRUMBENE_INH_fldas_daily_20100101-20170724.txt`)

# "MOSSURIL"  
mossuril <-`MOSSURIL_NAM_fldas_daily_20100101-20170724.txt`
mossuril["District"] <- NA
mossuril$District <- "MOSSURIL"
rm(`MOSSURIL_NAM_fldas_daily_20100101-20170724.txt`)

# "MOSSURIZE"              
mossurize <- `MOSSURIZE_MAN_fldas_daily_20100101-20170724.txt`
mossurize["District"] <- NA
mossurize$District <- "MOSSURIZE"
rm(`MOSSURIZE_MAN_fldas_daily_20100101-20170724.txt`)

# "MUANZA"   
muanza <- `MUANZA_SOF_fldas_daily_20100101-20170724.txt`
muanza["District"] <- NA
muanza$District <- "MUANZA"
rm(`MUANZA_SOF_fldas_daily_20100101-20170724.txt`)

# "MUECATE"  
muecate <- `MUECATE_NAM_fldas_daily_20100101-20170724.txt`
muecate["District"] <- NA
muecate$District <- "MUECATE"
rm(`MUECATE_NAM_fldas_daily_20100101-20170724.txt`)

# "MUEDA"                 
mueda <- `MUEDA_CAB_fldas_daily_20100101-20170724.txt`
mueda["District"] <- NA
mueda$District <- "MUEDA"
rm(`MUEDA_CAB_fldas_daily_20100101-20170724.txt`)

# "MUEMBE"   
muembe <-  `MUEMBE_NIA_fldas_daily_20100101-20170724.txt`
muembe["District"] <- NA
muembe$District <- "MUEMBE"
rm(`MUEMBE_NIA_fldas_daily_20100101-20170724.txt`)

# "MUIDUMBE"              
muidumbe <- `MUIDUMBE_CAB_fldas_daily_20100101-20170724.txt`
muidumbe["District"] <- NA
muidumbe$District <- "MUIDUMBE"
rm(`MUIDUMBE_CAB_fldas_daily_20100101-20170724.txt`)

# "MURRUPULA"              
murrupula <- `MURRUPULA_NAM_fldas_daily_20100101-20170724.txt`
murrupula["District"] <- NA
murrupula$District <- "MURRUPULA"
rm(`MURRUPULA_NAM_fldas_daily_20100101-20170724.txt`)

# "MUTARARA"              
mutarara <- `MUTARARA_TET_fldas_daily_20100101-20170724.txt`
mutarara["District"] <- NA
mutarara$District <- "MUTARARA"
rm(`MUTARARA_TET_fldas_daily_20100101-20170724.txt`)

# "NACALA-VELHA"  
nacala_velha <- `NACALA_VELHA_NAM_fldas_daily_20100101-20170724.txt`
nacala_velha["District"] <- NA
nacala_velha$District <- "NACALA-VELHA"
rm(`NACALA_VELHA_NAM_fldas_daily_20100101-20170724.txt`)

# "NACAROA"                
nacaroa <- `NACAROA_NAM_fldas_daily_20100101-20170724.txt`
nacaroa["District"] <- NA
nacaroa$District <- "NACAROA"
rm(`NACAROA_NAM_fldas_daily_20100101-20170724.txt`)

# "NAMAACHA"
namaacha <- `NAMAACHA_MAP_fldas_daily_20100101-20170724.txt`
namaacha["District"] <- NA
namaacha$District <- "NAMAACHA"
rm(`NAMAACHA_MAP_fldas_daily_20100101-20170724.txt`)

# "NAMACURRA"              
namacurra <- `NAMACURRA_ZAM_fldas_daily_20100101-20170724.txt`
namacurra["District"] <- NA
namacurra$District <- "NAMACURRA"
rm(`NAMACURRA_ZAM_fldas_daily_20100101-20170724.txt`)

# "NAMAPA - ERATI"        
namapa_erati <- `NAMAPA_ERATI_NAM_fldas_daily_20100101-20170724.txt`
namapa_erati["District"] <- NA
namapa_erati$District <- "NAMAPA - ERATI"
rm(`NAMAPA_ERATI_NAM_fldas_daily_20100101-20170724.txt`)

# "NAMAROI"                
namaroi <- `NAMAROI_ZAM_fldas_daily_20100101-20170724.txt`
namaroi["District"] <- NA
namaroi$District <- "NAMAROI"
rm(`NAMAROI_ZAM_fldas_daily_20100101-20170724.txt`)

# "NAMUNO"                 
namuno <- `NAMUNO_CAB_fldas_daily_20100101-20170724.txt`
namuno["District"] <- NA
namuno$District <- "NAMUNO"
rm(`NAMUNO_CAB_fldas_daily_20100101-20170724.txt`)

# "NANGADE"               
nangade <- `NANGADE_CAB_fldas_daily_20100101-20170724.txt`
nangade["District"] <- NA
nangade$District <- "NANGADE"
rm(`NANGADE_CAB_fldas_daily_20100101-20170724.txt`)

# "NGAUMA"                 
ngauma <- `NGAUMA_NIA_fldas_daily_20100101-20170724.txt`
ngauma["District"] <- NA
ngauma$District <- "NGAUMA"
rm(`NGAUMA_NIA_fldas_daily_20100101-20170724.txt`)

# "NHAMATANDA"            
nhamatanda <- `NHAMATANDA_SOF_fldas_daily_20100101-20170724.txt`
nhamatanda["District"] <- NA
nhamatanda$District <- "NHAMATANDA"
rm(`NHAMATANDA_SOF_fldas_daily_20100101-20170724.txt`)

# "NICOADALA"              
nicodala <- `NICOADALA_ZAM_fldas_daily_20100101-20170724.txt`
nicodala["District"] <- NA
nicodala$District <- "NICOADALA"
rm(`NICOADALA_ZAM_fldas_daily_20100101-20170724.txt`)

# "NIPEPE" 
nipepe <- `NIPEPE_NIA_fldas_daily_20100101-20170724.txt`
nipepe["District"] <- NA
nipepe$District <- "NIPEPE"
rm(`NIPEPE_NIA_fldas_daily_20100101-20170724.txt`)

# "PALMA"
palma <- `PALMA_CAB_fldas_daily_20100101-20170724.txt`
palma["District"] <- NA
palma$District <- "PALMA"
rm(`PALMA_CAB_fldas_daily_20100101-20170724.txt`)

# "PANDA"               
panda <- `PANDA_INH_fldas_daily_20100101-20170724.txt`
panda["District"] <- NA
panda$District <- "PANDA"
rm(`PANDA_INH_fldas_daily_20100101-20170724.txt`)

# "PEBANE"
pebane <- `PEBANE_ZAM_fldas_daily_20100101-20170724.txt`
pebane["District"] <- NA
pebane$District <- "PEBANE"
rm(`PEBANE_ZAM_fldas_daily_20100101-20170724.txt`)

# "PEMBA"                 
pemba <- `PEMBA_CAB_fldas_daily_20100101-20170724.txt`
pemba["District"] <- NA
pemba$District <- "PEMBA"
rm(`PEMBA_CAB_fldas_daily_20100101-20170724.txt`)

# "QUISSANGA"           
quissanga <- `QUISSANGA_CAB_fldas_daily_20100101-20170724.txt`
quissanga["District"] <- NA
quissanga$District <- "QUISSANGA"
rm(`QUISSANGA_CAB_fldas_daily_20100101-20170724.txt`)

# "RAPALE-NAMPULA"  
rapale_nampula <- `RAPALE_NAMPULA_NAM_fldas_daily_20100101-20170724.txt`
rapale_nampula["District"] <- NA
rapale_nampula$District <- "RAPALE-NAMPULA"
rm(`RAPALE_NAMPULA_NAM_fldas_daily_20100101-20170724.txt`)

# "RIBAUE"                 
ribaue <- `RIBAUE_NAM_fldas_daily_20100101-20170724.txt`
ribaue["District"] <- NA
ribaue$District <- "RIBAUE"
rm(`RIBAUE_NAM_fldas_daily_20100101-20170724.txt`)

# "SANGA"
sanga <- `SANGA_NIA_fldas_daily_20100101-20170724.txt`
sanga["District"] <- NA
sanga$District <- "SANGA"
rm(`SANGA_NIA_fldas_daily_20100101-20170724.txt`)

# "SUSSUNDENGA" 
sussundenga <- `SUSSUNDENGA_MAN_fldas_daily_20100101-20170724.txt`
sussundenga["District"] <- NA
sussundenga$District <- "SUSSUNDENGA"
rm(`SUSSUNDENGA_MAN_fldas_daily_20100101-20170724.txt`)

# "TAMBARA"  
tambara <- `TAMBARA_MAN_fldas_daily_20100101-20170724.txt`
tambara["District"] <- NA
tambara$District <- "TAMBARA"
rm(`TAMBARA_MAN_fldas_daily_20100101-20170724.txt`)

# "TSANGANO"               
tsangano <- `TSANGANO_TET_fldas_daily_20100101-20170724.txt`
tsangano["District"] <- NA
tsangano$District <- "TSANGANO"
rm(`TSANGANO_TET_fldas_daily_20100101-20170724.txt`)

# "VILANKULO" 
vilankulo <- `VILANKULO_INH_fldas_daily_20100101-20170724.txt`
vilankulo["District"] <- NA
vilankulo$District <- "VILANKULO"
rm(`VILANKULO_INH_fldas_daily_20100101-20170724.txt`)

# "XAI-XAI"
xai_xai <- `XAI_XAI_GAZ_fldas_daily_20100101-20170724.txt`
xai_xai["District"] <- NA
xai_xai$District <- "XAI-XAI"
rm(`XAI_XAI_GAZ_fldas_daily_20100101-20170724.txt`)

# "ZAVALA"
zavala <- `ZAVALA_INH_fldas_daily_20100101-20170724.txt`
zavala["District"] <- NA
zavala$District <- "ZAVALA"
rm(`ZAVALA_INH_fldas_daily_20100101-20170724.txt`)

# ZUMBO
zumbo <- `ZUMBO_TET_fldas_daily_20100101-20170724.txt`
zumbo["District"] <- NA
zumbo$District <- "ZUMBO"
rm(`ZUMBO_TET_fldas_daily_20100101-20170724.txt`)


# Combine all districts into a single dataset
dfnames <- Filter(function(x) class(get(x))=='data.frame', ls(env=globalenv()))
dfnm <- lapply(dfnames, get)
test <- do.call(rbind, dfnm)
as.data.frame()