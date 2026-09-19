-- ====================================================================
-- Base de Datos Relacional de Investigacion: Ubajay (Hexachlamys edulis)
-- Dr. Ignacio Sebastian Povilonis - Tesis Doctoral FAUBA / CONICET
-- Formato: SQLite 3
-- ====================================================================

CREATE TABLE "site_er_characterization" (
"site" TEXT,
  "phenotype" INTEGER,
  "latitude" REAL,
  "longitude" REAL,
  "altitude" REAL,
  "dbh" REAL,
  "base_diameter" REAL,
  "larger_diameter" REAL,
  "minor_diameter" REAL,
  "height" REAL
);

CREATE TABLE "site_er_ndvi_evi_indices" (
"site" TEXT,
  "phenotype" INTEGER,
  "latitude" REAL,
  "longitude" REAL,
  "year" INTEGER,
  "date" TIMESTAMP,
  "ndvi" REAL,
  "evi" REAL
);

CREATE TABLE "site_rubi_coordinates" (
"latitude" INTEGER,
  "longitude" INTEGER
);

CREATE TABLE "site_er_tree_dendrometry" (
"col_0" INTEGER,
  "dbh" REAL,
  "base_diameter" REAL,
  "larger_diameter" REAL,
  "minor_diameter" REAL,
  "height" REAL
);

CREATE TABLE "site_concordia_populations" (
"concordia" TEXT,
  "num_31_2968885620915" REAL,
  "num_57_967029575163394" REAL
);

CREATE TABLE "climate_er_monthly_summary" (
"site" TEXT,
  "month" INTEGER,
  "t_mean" REAL,
  "t_min" REAL,
  "t_max" REAL,
  "pp_mean" INTEGER,
  "hr_mean" INTEGER,
  "dwp_mean" INTEGER,
  "sun_hours" REAL
);

CREATE TABLE "climate_er_smn_daily_records" (
"site" TEXT,
  "year" INTEGER,
  "month" INTEGER,
  "date_long" TEXT,
  "date_short" TEXT,
  "temp" REAL,
  "hr" REAL,
  "wind" INTEGER,
  "prec" REAL,
  "dew_point_at_station_elevation" REAL,
  "hidden_temp_var_1_for_ffmc" REAL,
  "hidden_temp_var_2_for_ffmc" REAL,
  "ffmc" REAL,
  "hidden_temp_var_2_for_dmc" REAL,
  "dmc" REAL,
  "d" REAL,
  "v" REAL,
  "do" REAL,
  "do_2" REAL,
  "dr1" REAL,
  "qr" REAL,
  "qo" REAL,
  "rd" REAL,
  "fl" REAL,
  "dc" REAL,
  "isi" REAL,
  "bui" REAL,
  "fwi" REAL
);

CREATE TABLE "climate_er_smn_gualeguaychu_2023" (
"fecha" INTEGER,
  "temp" REAL,
  "hum" REAL,
  "pnm" INTEGER,
  "dd" REAL,
  "ff" REAL
);

CREATE TABLE "climate_er_photosynthetically_active_radiation" (
"date" TIMESTAMP,
  "site" TEXT,
  "phenotype" INTEGER,
  "num_1" INTEGER,
  "num_2" INTEGER,
  "num_3" INTEGER,
  "num_4" INTEGER,
  "num_5" INTEGER,
  "num_6" INTEGER,
  "num_7" INTEGER,
  "num_8" INTEGER,
  "num_9" INTEGER,
  "hour" TIME,
  "outside" REAL
);

CREATE TABLE "climate_er_day_length" (
"year" INTEGER,
  "site" TEXT,
  "number" INTEGER,
  "date" TIMESTAMP,
  "date_complete" TIMESTAMP,
  "hour" TEXT,
  "temp" REAL,
  "hr" TEXT,
  "temp_soil" REAL
);

CREATE TABLE "climate_moreno_inta_weather_records" (
"year" INTEGER,
  "month" INTEGER,
  "date" TIMESTAMP,
  "date_complete" TEXT,
  "number" INTEGER,
  "temp_abr" REAL,
  "tem_abr_max" REAL,
  "temp_abr_min" REAL,
  "temp_soil" REAL,
  "temperatura_intemperie_150cm_minima" REAL,
  "pp_pluv" REAL,
  "pp_cron" REAL,
  "precipitacion_maxima_30minutos" REAL,
  "heliofania_efectiva" REAL,
  "heliofania_relativa" REAL,
  "tesion_vapor_media" REAL,
  "humedad_media" INTEGER,
  "humedad_media_8_14_20" REAL,
  "rocio_medio" REAL,
  "duracion_follaje_mojado" REAL,
  "velocidad_viento_200cm_media" REAL,
  "direccion_viento_200cm" TEXT,
  "velocidad_viento_1000cm_media" REAL,
  "direccion_viento_1000cm" TEXT,
  "velocidad_viento_maxima" REAL,
  "presion_media" REAL,
  "radiacion_global" REAL,
  "horas_frio" REAL,
  "unidades_frio" REAL
);

CREATE TABLE "climate_moreno_weather_complete" (
"date" TEXT,
  "temp" REAL,
  "temp_max" REAL,
  "temp_min" REAL,
  "temperatura_media" REAL
);

CREATE TABLE "climate_moreno_frost_events" (
"month" INTEGER,
  "year" INTEGER,
  "heladas" REAL
);

CREATE TABLE "ecology_associated_species_census" (
"reg" TEXT,
  "censo" INTEGER,
  "acacia_caven" INTEGER,
  "allophyllus_edulis" INTEGER,
  "anredera_cordifolia" INTEGER,
  "asparagus_setaceus" INTEGER,
  "blepharocalyx_salicifolius" INTEGER,
  "buddleja_globosa" INTEGER,
  "butia_yatay" INTEGER,
  "celtis_iguanaea" INTEGER,
  "celtis_tala" INTEGER,
  "clematis_montevidensis" INTEGER,
  "crataegus_oxyacantha" INTEGER,
  "ephedra_twediana" INTEGER,
  "erythrina_crista_galli" INTEGER,
  "eugenia_uniflora" INTEGER,
  "eugenia_uruguayensis" INTEGER,
  "fuchsia_magellanica" INTEGER,
  "heterothalamus_alienus" INTEGER,
  "ipomea_sp" INTEGER,
  "ipomoea_cairica" INTEGER,
  "juncus_acutus" INTEGER,
  "ligustrum_lucidum" INTEGER,
  "ligustrum_sinensis" INTEGER,
  "maytenus_ilicifolius" INTEGER,
  "mimosa_pilulifera" INTEGER,
  "muehlenbeckia_sagittifolia" INTEGER,
  "myrrhinium_atropurpureum" INTEGER,
  "myrsine_laetevirens" INTEGER,
  "myrtus_mucronatum" INTEGER,
  "pavonia_hastata" INTEGER,
  "pavonia_malvacea" INTEGER,
  "populus_nigra" INTEGER,
  "pouteria_salicifolia" INTEGER,
  "schinus_longifolius" INTEGER,
  "schinus_molle" INTEGER,
  "scutia_buxifolia" INTEGER,
  "sebastiania_brasiliensis" INTEGER,
  "solanum_jazminoides" INTEGER,
  "solanum_mauritianum" INTEGER,
  "stigmaphyllon_bonarense" INTEGER
);

CREATE TABLE "ecology_forest_cover_evolution" (
"year" INTEGER,
  "area" INTEGER,
  "percentage" REAL
);

CREATE TABLE "ecology_aquatic_terrestrial_transition" (
"site" TEXT,
  "phenotype" INTEGER,
  "date" TEXT,
  "cardinal_point" TEXT,
  "moisture_origin" INTEGER,
  "moisture" INTEGER
);

CREATE TABLE "ecology_soil_properties_entre_rios" (
"sitio" TEXT,
  "micrositio" TEXT,
  "ce" REAL,
  "h2o_saturacion" REAL,
  "ph_agua" REAL,
  "ph_cacl2" REAL,
  "ph_kcl" REAL,
  "mo" REAL,
  "co" REAL,
  "no" REAL,
  "c_n" REAL
);

CREATE TABLE "ecology_soil_bulk_density" (
"site" TEXT,
  "phenotype" INTEGER,
  "date" TEXT,
  "rep" INTEGER,
  "weight_fresh" REAL,
  "weight_fresh_2" REAL,
  "weight_dry" REAL,
  "hpct" REAL
);

CREATE TABLE "ecology_companion_species_detailed" (
"site" TEXT,
  "census" INTEGER,
  "species" TEXT,
  "native" INTEGER,
  "family" TEXT,
  "abundancy" INTEGER
);

CREATE TABLE "ecology_discriminant_analysis" (
"site" TEXT,
  "census" INTEGER,
  "axis_1" REAL,
  "axis_2" REAL,
  "species" TEXT,
  "axis_sp1" REAL,
  "axis_sp2" REAL
);

CREATE TABLE "ecology_companion_species_occurrences" (
"reg" TEXT,
  "censo" INTEGER,
  "acacia_caven" INTEGER,
  "allophyllus_edulis" INTEGER,
  "anredera_cordifolia" INTEGER,
  "asparagus_setaceus" INTEGER,
  "blepharocalyx_salicifolius" INTEGER,
  "buddleja_globosa" INTEGER,
  "butia_yatay" INTEGER,
  "celtis_iguanaea" INTEGER,
  "celtis_tala" INTEGER,
  "clematis_montevidensis" INTEGER,
  "crataegus_oxyacantha" INTEGER,
  "ephedra_twediana" INTEGER,
  "erythrina_crista_galli" INTEGER,
  "eugenia_uniflora" INTEGER,
  "eugenia_uruguayensis" INTEGER,
  "fuchsia_magellanica" INTEGER,
  "heterothalamus_alienus" INTEGER,
  "ipomea_sp" INTEGER,
  "ipomoea_cairica" INTEGER,
  "juncus_acutus" INTEGER,
  "ligustrum_lucidum" INTEGER,
  "ligustrum_sinensis" INTEGER,
  "maytenus_ilicifolius" INTEGER,
  "mimosa_pilulifera" INTEGER,
  "muehlenbeckia_sagittifolia" INTEGER,
  "myrrhinium_atropurpureum" INTEGER,
  "myrsine_laetevirens" INTEGER,
  "myrtus_mucronatum" INTEGER,
  "pavonia_hastata" INTEGER,
  "pavonia_malvacea" INTEGER,
  "populus_nigra" INTEGER,
  "pouteria_salicifolia" INTEGER,
  "schinus_longifolius" INTEGER,
  "schinus_molle" INTEGER,
  "scutia_buxifolia" INTEGER,
  "sebastiania_brasiliensis" INTEGER,
  "solanum_jazminoides" INTEGER,
  "solanum_mauritianum" INTEGER,
  "stigmaphyllon_bonarense" INTEGER
);

CREATE TABLE "ecology_companion_presence_absence" (
"reg" TEXT,
  "censo" INTEGER,
  "acacia_caven" INTEGER,
  "allophyllus_edulis" INTEGER,
  "anredera_cordifolia" INTEGER,
  "asparagus_setaceus" INTEGER,
  "blepharocalyx_salicifolius" INTEGER,
  "buddleja_globosa" INTEGER,
  "butia_yatay" INTEGER,
  "celtis_iguanaea" INTEGER,
  "celtis_tala" INTEGER,
  "clematis_montevidensis" INTEGER,
  "crataegus_oxyacantha" INTEGER,
  "ephedra_twediana" INTEGER,
  "erythrina_crista_galli" INTEGER,
  "eugenia_uniflora" INTEGER,
  "eugenia_uruguayensis" INTEGER,
  "fuchsia_magellanica" INTEGER,
  "heterothalamus_alienus" INTEGER,
  "ipomea_sp" INTEGER,
  "ipomoea_cairica" INTEGER,
  "juncus_acutus" INTEGER,
  "ligustrum_lucidum" INTEGER,
  "ligustrum_sinensis" INTEGER,
  "maytenus_ilicifolius" INTEGER,
  "mimosa_pilulifera" INTEGER,
  "muehlenbeckia_sagittifolia" INTEGER,
  "myrrhinium_atropurpureum" INTEGER,
  "myrsine_laetevirens" INTEGER,
  "myrtus_mucronatum" INTEGER,
  "pavonia_hastata" INTEGER,
  "pavonia_malvacea" INTEGER,
  "populus_nigra" INTEGER,
  "pouteria_salicifolia" INTEGER,
  "schinus_longifolius" INTEGER,
  "schinus_molle" INTEGER,
  "scutia_buxifolia" INTEGER,
  "sebastiania_brasiliensis" INTEGER,
  "solanum_jazminoides" INTEGER,
  "solanum_mauritianum" INTEGER,
  "stigmaphyllon_bonarense" INTEGER,
  "xx1" REAL,
  "xx2" REAL
);

CREATE TABLE "ecology_anthropogenic_influence" (
"site" TEXT,
  "anthropic_ia" REAL
);

CREATE TABLE "ecology_biodiversity_indices_alpha" (
"site" TEXT,
  "censo" INTEGER,
  "n_species" INTEGER,
  "n_individuals" INTEGER,
  "dominance_d" REAL,
  "simpson_1d" REAL,
  "shannon_h" REAL,
  "evenness_ehs" REAL,
  "brillouin" REAL,
  "menhinick" REAL,
  "margalef" REAL,
  "equitability_j" REAL,
  "fisher_alpha" REAL,
  "berger_parker" REAL,
  "chao_1" REAL
);

CREATE TABLE "ecology_biodiversity_indices_beta" (
"site" TEXT,
  "variable" TEXT,
  "n" INTEGER,
  "mean" REAL,
  "sd" REAL,
  "min" REAL,
  "max" REAL
);

CREATE TABLE "ecology_biodiversity_indices_gamma" (
"site" TEXT,
  "censo" INTEGER,
  "richness" INTEGER,
  "abundance" INTEGER,
  "dominance_d" REAL,
  "simpson_1d" REAL,
  "shannon_h" REAL,
  "evenness_ehs" REAL,
  "brillouin" REAL,
  "menhinick" REAL,
  "margalef" REAL,
  "equitability_j" REAL,
  "fisher_alpha" REAL,
  "berger_parker" REAL,
  "chao_1" REAL,
  "anthropic_ia" REAL
);

CREATE TABLE "phenology_federacion_site" (
"site" TEXT,
  "month" TEXT,
  "med" REAL,
  "min" REAL,
  "max" REAL,
  "rain" INTEGER,
  "hum" INTEGER,
  "sun" REAL
);

CREATE TABLE "phenology_developmental_stages" (
"year" INTEGER,
  "date" TIMESTAMP,
  "fen" TEXT,
  "var" REAL
);

CREATE TABLE "pollination_experiments_seed_set" (
"tratamiento" TEXT,
  "ef" REAL
);

CREATE TABLE "pollination_rates" (
"tra" TEXT,
  "total" INTEGER,
  "fin" INTEGER,
  "prop" REAL
);

CREATE TABLE "yield_moreno_annual_records" (
"year" INTEGER,
  "acc" INTEGER,
  "week" INTEGER,
  "date" TIMESTAMP,
  "n" REAL,
  "p" REAL,
  "np" REAL
);

CREATE TABLE "yield_moreno_plant_observations" (
"year" INTEGER,
  "acc" INTEGER,
  "p" REAL
);

CREATE TABLE "yield_prediction_models" (
"accesion" INTEGER,
  "altura" REAL,
  "dap" REAL
);

CREATE TABLE "yield_thermal_sum_regression_models" (
"mes_inicio" TIMESTAMP,
  "col_1" TEXT,
  "inicio_de_floracion" TEXT,
  "plena_floracion" TEXT
);

CREATE TABLE "maturity_physical_chemical_stages" (
"madurez" TEXT,
  "pff" REAL,
  "dem" REAL,
  "dem_2" REAL,
  "dp" REAL,
  "psf" REAL,
  "h" REAL,
  "ns" INTEGER,
  "pss" REAL,
  "psspsf" REAL,
  "pssc" REAL,
  "de" REAL,
  "col_12" REAL,
  "col_13" REAL,
  "col_14" REAL,
  "col_15" REAL,
  "col_16" REAL,
  "col_17" REAL,
  "col_18" REAL,
  "col_19" REAL,
  "col_20" REAL,
  "col_21" REAL,
  "col_22" REAL
);

CREATE TABLE "maturity_cie_lab_colorimetry" (
"madurez" TEXT,
  "color_l" REAL,
  "color_a" REAL,
  "color_b" REAL,
  "col_4" REAL,
  "col_5" REAL,
  "col_6" REAL
);

CREATE TABLE "maturity_antioxidant_activity" (
"trata" TEXT,
  "muestra" INTEGER,
  "conc" REAL,
  "in" REAL,
  "pip" REAL
);

CREATE TABLE "maturity_total_polyphenols" (
"madurez" TEXT,
  "fenoles" REAL,
  "brix" REAL,
  "ph" REAL,
  "acidez" REAL,
  "ratio" REAL,
  "fenoles_ps" REAL
);

CREATE TABLE "maturity_organic_acids_profile" (
"mad" TEXT,
  "rep" INTEGER,
  "sucrose" REAL,
  "glucose" REAL,
  "fructose" REAL,
  "tartaric" REAL,
  "malic" REAL,
  "quinic" REAL,
  "succinic" REAL,
  "glufru" REAL
);

CREATE TABLE "maturity_soluble_carbohydrates" (
"car" TEXT,
  "mad" TEXT,
  "rep" INTEGER,
  "cons" REAL,
  "conf" REAL,
  "h" REAL,
  "ps" REAL
);

CREATE TABLE "maturity_starch_content" (
"mad" TEXT,
  "starch" REAL,
  "starchs" REAL
);

CREATE TABLE "maturity_mineral_cations" (
"car" TEXT,
  "mad" TEXT,
  "rep" INTEGER,
  "cons" REAL,
  "conf" REAL,
  "humedad" REAL,
  "ps" REAL
);

CREATE TABLE "maturity_dietary_fiber_fractions" (
"car" TEXT,
  "mad" TEXT,
  "conf" REAL,
  "cons" REAL
);

CREATE TABLE "maturity_multivariate_pca_coordinates" (
"madurez" TEXT,
  "l" REAL,
  "a" REAL,
  "b" REAL,
  "pff" REAL,
  "dmif" REAL,
  "dmaf" REAL,
  "dpf" REAL,
  "dmafdpf" REAL,
  "psf" REAL,
  "h" REAL,
  "pss" REAL,
  "psspsf" REAL,
  "dpph" REAL,
  "pt" REAL,
  "pthplc" INTEGER,
  "galico" INTEGER,
  "siringico" INTEGER,
  "catecol" INTEGER,
  "catequina" INTEGER,
  "tanico" INTEGER,
  "rutina" INTEGER,
  "ss" REAL,
  "ph" REAL,
  "att" REAL,
  "att_ss" REAL,
  "sacarosa" REAL,
  "glucosa" REAL,
  "fructosa" REAL,
  "tartarico" REAL,
  "malico" REAL,
  "quinico" REAL,
  "succinico" REAL,
  "glufru" REAL,
  "ts" REAL,
  "almidon" REAL,
  "fdi" REAL,
  "fds" REAL,
  "fdt" REAL,
  "ctc" INTEGER,
  "cla" REAL,
  "clb" REAL,
  "feofitina_a" REAL,
  "feofitina_b" REAL,
  "luteina" REAL,
  "beta_cryptoxantina" REAL,
  "beta_caroteno" REAL,
  "esteres_beta_criptoxantina" REAL,
  "di_esteres_luteina" REAL,
  "respiracion" REAL,
  "pen" REAL,
  "mg" REAL,
  "k" REAL,
  "mn" REAL,
  "ct" REAL
);

CREATE TABLE "variability_branch_architecture" (
"year" INTEGER,
  "site" TEXT,
  "phenotype" INTEGER,
  "branch" TEXT,
  "length" REAL,
  "node" REAL,
  "nfl" REAL,
  "nfr" INTEGER,
  "fr" INTEGER,
  "pff" TEXT,
  "psf" REAL,
  "nh" REAL,
  "psh" REAL,
  "nfr_nfl" REAL,
  "nfl_cm" REAL,
  "nfl_per_node" REAL,
  "nfr_per_cm" REAL,
  "nfr_per_nudo" REAL,
  "nh_per_nfr" REAL,
  "psh_per_nfr" REAL,
  "psh_per_psfr" REAL
);

CREATE TABLE "variability_shoot_growth_dynamics" (
"site" TEXT,
  "year" INTEGER,
  "phenotype" INTEGER,
  "cardinal_point" TEXT,
  "longitude" REAL,
  "nodes" REAL,
  "yt" INTEGER,
  "yv" REAL,
  "yf" INTEGER,
  "cd" REAL,
  "e" REAL,
  "f1_f2" REAL,
  "f3" REAL,
  "h" INTEGER
);

CREATE TABLE "variability_reproductive_variables" (
"year" INTEGER,
  "site" TEXT,
  "phenotype" INTEGER,
  "id" INTEGER,
  "psfl" REAL,
  "polen_type" TEXT,
  "max_polen2" REAL,
  "min_polen2" REAL,
  "dmap" REAL,
  "dmip" REAL,
  "mean_polen" REAL,
  "no" REAL,
  "ns" REAL,
  "ns_no" REAL
);

CREATE TABLE "variability_in_vitro_pollen_germination" (
"site" TEXT,
  "phenotype" INTEGER,
  "germinated" INTEGER,
  "aborted" INTEGER,
  "not_germinated" INTEGER
);

CREATE TABLE "variability_fruit_physical_dimensions" (
"year" INTEGER,
  "site" TEXT,
  "phenotype" INTEGER,
  "id" INTEGER,
  "pff" REAL,
  "de" REAL,
  "dp" REAL,
  "pen" REAL,
  "mad" TEXT,
  "psf" REAL,
  "ns" REAL,
  "pss" REAL,
  "dan" REAL,
  "pff_todos" REAL,
  "pss_psf" REAL
);

CREATE TABLE "variability_fruit_colorimetry" (
"year" INTEGER,
  "site" TEXT,
  "phenotype" INTEGER,
  "rep" INTEGER,
  "id" INTEGER,
  "mad" TEXT,
  "color_l" REAL,
  "color_a" REAL,
  "color_b" REAL,
  "color_g" REAL,
  "axis_1" REAL,
  "axis_2" REAL,
  "mad_disc" TEXT,
  "axis_3" REAL,
  "axis_4" REAL,
  "site_disc" TEXT
);

CREATE TABLE "variability_chemical_composition" (
"year" INTEGER,
  "site" TEXT,
  "phenotype" INTEGER,
  "id" INTEGER,
  "aao" REAL,
  "fen" REAL,
  "cloa" REAL,
  "clob" REAL,
  "caro" REAL,
  "indmad" REAL,
  "att" REAL,
  "ratio" REAL,
  "brix" REAL,
  "aao25" REAL,
  "aao50" REAL,
  "aao100" REAL,
  "aao250" REAL
);

CREATE TABLE "variability_secondary_metabolites" (
"year" INTEGER,
  "site" TEXT,
  "phenotype" INTEGER,
  "bag" INTEGER,
  "phenols" REAL
);

CREATE TABLE "variability_pulp_dry_matter" (
"num" INTEGER,
  "year" INTEGER,
  "site" TEXT,
  "phenotype" INTEGER,
  "id" INTEGER,
  "mad" TEXT,
  "pff" REAL
);

CREATE TABLE "variability_titratable_acidity_brix" (
"year" INTEGER,
  "site" TEXT,
  "phenotype" INTEGER,
  "id" INTEGER,
  "vol" REAL,
  "phi" REAL,
  "ph7" REAL,
  "ph8" REAL,
  "ac" REAL,
  "ratio" REAL,
  "brix" REAL,
  "mad" TEXT
);

CREATE TABLE "variability_ledesma_accession" (
"year" INTEGER,
  "site" TEXT,
  "phenotype" INTEGER,
  "est_cd" INTEGER,
  "est_e" INTEGER,
  "est_f1f2" INTEGER,
  "est_f3" INTEGER,
  "est_g" INTEGER,
  "capullo" INTEGER,
  "antesis_polinacion" INTEGER,
  "estigma_receptivo" INTEGER
);

CREATE TABLE "variability_reproductive_efficiency" (
"year" INTEGER,
  "site" TEXT,
  "phenotype" INTEGER,
  "cardinal_point" TEXT,
  "long" REAL,
  "nudos" REAL,
  "nfl" REAL,
  "nfr" REAL,
  "fr" INTEGER,
  "pff" REAL,
  "psf" REAL,
  "nh" REAL,
  "ps_hojas" REAL,
  "nfr_per_nfl" REAL,
  "nfr_per_cm" REAL,
  "nfr_per_nudo" REAL,
  "nfr_per_hoja" REAL,
  "nfr_per_pshojas" REAL,
  "psf_per_pshojas" REAL
);

CREATE TABLE "variability_morphological_measurements" (
"year" INTEGER,
  "site" TEXT,
  "phenotype" INTEGER,
  "n" INTEGER,
  "pff" REAL,
  "de" REAL
);

CREATE TABLE "variability_variance_components" (
"year" INTEGER,
  "reg" TEXT,
  "acc" INTEGER,
  "n" INTEGER,
  "pff" REAL,
  "de" REAL,
  "dp" REAL,
  "pen" REAL,
  "mad" TEXT,
  "psf" REAL,
  "ns" INTEGER,
  "pss" REAL,
  "dan" REAL,
  "latd" REAL
);

CREATE TABLE "variability_intraclass_correlation_coefficients" (
"type" TEXT,
  "vr" TEXT,
  "level" TEXT,
  "porc" REAL,
  "id" INTEGER,
  "col_6" REAL
);

CREATE TABLE "variability_genetic_repeatability_parameters" (
"col_0" TEXT,
  "col_1" TEXT,
  "col_2" TEXT,
  "col_3" TEXT,
  "col_4" TEXT,
  "col_5" TEXT,
  "col_6" TEXT,
  "col_7" TEXT,
  "col_8" TEXT,
  "col_9" TEXT,
  "col_10" TEXT,
  "col_11" TEXT,
  "col_12" TEXT,
  "col_13" TEXT,
  "col_14" TEXT,
  "col_15" TEXT,
  "col_16" TEXT,
  "col_17" TEXT,
  "col_18" TEXT,
  "col_19" TEXT,
  "col_20" TEXT,
  "col_21" TEXT,
  "col_22" TEXT,
  "col_23" TEXT,
  "col_24" TEXT,
  "col_25" TEXT,
  "col_26" TEXT,
  "col_27" TEXT
);

CREATE TABLE "postharvest_respiration_rates" (
"site" TEXT,
  "time" INTEGER,
  "respiration" REAL
);

CREATE TABLE "postharvest_respiration_kinetics_daily" (
"time" TIME,
  "matu" TEXT,
  "rep" INTEGER,
  "time_interval" INTEGER,
  "carbon_ml" REAL,
  "oxi_ml" REAL,
  "oxi_mg" REAL,
  "carbon_mg" REAL,
  "oxi_por" REAL,
  "carbon_por" REAL
);

CREATE TABLE "postharvest_respiration_replicates" (
"time" TIME,
  "matu" TEXT,
  "rep" INTEGER,
  "time_interval" INTEGER,
  "oxi_por" REAL,
  "carbon_por" REAL,
  "carbon_ml" REAL,
  "carbon_ac" REAL
);

CREATE TABLE "postharvest_climacteric_color_evolution" (
"days" TEXT,
  "regul" TEXT,
  "treat" TEXT,
  "color_l" REAL,
  "color_a" REAL,
  "color_b" REAL,
  "color_c" REAL,
  "color_h" REAL,
  "color_g" REAL,
  "axis_1" REAL,
  "axis_2" REAL,
  "treat_disc" TEXT,
  "pc1" TEXT,
  "pc2" TEXT
);

CREATE TABLE "postharvest_cordoba_cold_storage" (
"dia" INTEGER,
  "fecha" TIMESTAMP,
  "temp" INTEGER,
  "id" INTEGER,
  "peso" REAL,
  "l" REAL,
  "a" REAL,
  "b" REAL,
  "c" REAL,
  "t" REAL,
  "de" REAL,
  "dp" REAL,
  "e" INTEGER
);

CREATE TABLE "postharvest_weight_loss_kinetics" (
"temp" INTEGER,
  "id" INTEGER,
  "basal" REAL,
  "num_3" REAL,
  "num_7" REAL,
  "num_10" REAL,
  "num_14" REAL
);

CREATE TABLE "postharvest_color_spread_matrix" (
"var" TEXT,
  "temp" INTEGER,
  "id" INTEGER,
  "basal" REAL,
  "num_3" REAL,
  "num_7" REAL,
  "num_10" REAL,
  "num_14" REAL
);

CREATE TABLE "postharvest_puncture_firmness_test" (
"dia" INTEGER,
  "temp" TEXT,
  "fu" REAL,
  "di" REAL,
  "gr" REAL,
  "pi" INTEGER
);

CREATE TABLE "postharvest_texture_shear_force" (
"vr" TEXT,
  "dia" INTEGER,
  "temp" INTEGER,
  "n" INTEGER,
  "mean" REAL,
  "sd" REAL,
  "se" REAL,
  "ci" REAL
);

CREATE TABLE "postharvest_conservation_trial_5" (
"estado" TEXT,
  "respiracion" REAL
);

CREATE TABLE "postharvest_conservation_trial_6" (
"dia" INTEGER,
  "tratamiento" TEXT,
  "respiracion" REAL
);

CREATE TABLE "postharvest_climacteric_parameters" (
"dia" INTEGER,
  "temp" INTEGER,
  "ph" REAL,
  "ss" REAL,
  "ac" REAL
);

CREATE TABLE "postharvest_texture_firmness_replicates" (
"vr" TEXT,
  "dia" INTEGER,
  "temp" INTEGER,
  "n" INTEGER,
  "mean" REAL,
  "sd" REAL,
  "se" REAL,
  "ci" REAL
);

CREATE TABLE "postharvest_compression_elasticity_test" (
"dia" INTEGER,
  "temp" INTEGER,
  "fu" REAL,
  "gr" REAL,
  "di" REAL,
  "id" INTEGER
);

CREATE TABLE "postharvest_unlp_cold_storage_trial_1" (
"dia" INTEGER,
  "rep" INTEGER,
  "conc" REAL,
  "aao" REAL
);

CREATE TABLE "postharvest_unlp_cold_storage_trial_2" (
"dia" INTEGER,
  "rep" INTEGER,
  "fenoles" REAL,
  "carotenoides" REAL,
  "clorofila_a" REAL,
  "clorofila_b" REAL,
  "solidos" REAL,
  "ph_inicial" REAL,
  "acidez" REAL,
  "ratio" REAL
);

CREATE TABLE "postharvest_unlp_cold_storage_trial_3" (
"dia" INTEGER,
  "firmeza" REAL,
  "l_color" REAL,
  "a_color" REAL,
  "b_color" REAL,
  "respiracion" REAL
);

CREATE TABLE "postharvest_unlp_multivariate_pca" (
"dia" INTEGER,
  "firmeza" REAL,
  "l_color" REAL,
  "a_color" REAL,
  "b_color" REAL,
  "aao_0_125" REAL,
  "aao_0_250" REAL,
  "aao_0_500" REAL,
  "fenoles" REAL,
  "carotenoides" REAL,
  "clo_a" REAL,
  "clo_b" REAL,
  "ph" REAL,
  "att" REAL,
  "solidos" REAL,
  "ratio" REAL,
  "respiracion" REAL
);

CREATE TABLE "biochem_antioxidant_activity_fresh_samples" (
"year" INTEGER,
  "phenotype" INTEGER,
  "conc" REAL,
  "rep_1n" REAL,
  "rep_2s" REAL,
  "rep_3e" REAL,
  "rep_4o" REAL
);

CREATE TABLE "biochem_chemical_profile_campaign_2022" (
"phenotype" INTEGER,
  "site" TEXT,
  "maturity" TEXT,
  "fenoles" REAL,
  "clo_a" REAL,
  "clo_b" REAL,
  "carotenoids" REAL,
  "aao_0_025" REAL,
  "aao_0_05" REAL,
  "aao_0_1" REAL,
  "aao_0_25" REAL,
  "phi" REAL,
  "ph81" REAL,
  "acidity" REAL,
  "ss_brix" REAL,
  "phenols_ps" REAL,
  "clo_a_ps" REAL,
  "clo_b_ps" REAL,
  "caro_ps" REAL,
  "id" INTEGER
);

CREATE TABLE "biostatistics_variance_homogeneity_tests" (
"jar" INTEGER,
  "species" TEXT,
  "method" TEXT,
  "phenols" REAL
);

CREATE TABLE "biostatistics_carbohydrates_variance_homogeneity" (
"method" TEXT,
  "caroten" REAL,
  "clo_a" REAL,
  "clo_b" REAL
);

CREATE TABLE "processing_drying_preliminary_trial" (
"temperatura" INTEGER,
  "repeticion" INTEGER,
  "hora" INTEGER,
  "peso" REAL,
  "peso_seco" REAL,
  "col_5" REAL
);

CREATE TABLE "processing_drying_carbohydrates_dynamics" (
"dia" INTEGER,
  "tratamiento" TEXT,
  "b_car" REAL,
  "clo_a" REAL,
  "clo_b" REAL
);

CREATE TABLE "comparative_calafate_phenotypic_profile" (
"season" TEXT,
  "light" TEXT,
  "fertilization" INTEGER,
  "efd" REAL,
  "pfd" REAL,
  "fc" REAL,
  "ff" REAL,
  "ffw" REAL,
  "dfw" REAL,
  "matsec" REAL,
  "tfs" REAL,
  "pr" REAL,
  "ra" REAL,
  "ba" REAL,
  "es" REAL,
  "fnp" REAL,
  "ffwp" REAL,
  "pfpro" REAL,
  "npr" REAL
);

CREATE TABLE "comparative_calafate_antioxidants" (
"season" TEXT,
  "light" TEXT,
  "fertilization" INTEGER,
  "irradiance" INTEGER,
  "npr" REAL
);

CREATE TABLE "processing_drying_antioxidant_retention" (
"especie" TEXT,
  "dia" INTEGER,
  "tratamiento" TEXT,
  "id" INTEGER,
  "peso_seco" REAL,
  "concentracion" REAL,
  "aao" REAL
);

CREATE TABLE "processing_drying_anthocyanin_degradation" (
"dia" INTEGER,
  "tratamiento" TEXT,
  "id" INTEGER,
  "antocianinas" REAL
);

CREATE TABLE "phenology_entre_rios_flower_survey_complete" (
"year" INTEGER,
  "site" TEXT,
  "phenotype" INTEGER,
  "id" INTEGER,
  "ps_flor" REAL,
  "n_ovu" REAL,
  "polen_type" TEXT,
  "max_polen2" REAL,
  "min_polen2" REAL,
  "max_polen" REAL,
  "min_polen" REAL,
  "mean_polen" REAL
);

CREATE TABLE "biotechnology_in_vitro_micropropagation" (
"hormona" REAL,
  "explanto" TEXT,
  "antioxidante" TEXT,
  "supervivencia" INTEGER
);

