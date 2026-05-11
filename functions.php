<?php
/*
Plugin Name: AFL Custom Functions
Description: Plugin to manage custom AFL hooks.
Version: 1.3
Author: YoannMis
date: 11.may.2026
*/

/**
 * Returns the mapping between Forminator field names and database column names.
 * @param int $form_id - Forminator form ID
 * @return array Mapping array for the given form, or empty array if no mapping exists
 */
function get_forminator_to_db_mapping($form_id) {
    $mappings = array(
        $form_id => array(
            'number-1'   => 'machine_nb',
            'currency-1' => 'cycle_price',
        ),
    );

    return isset($mappings[$form_id]) ? $mappings[$form_id] : array();
}

/**
 * Saves Forminator form responses to wp_form_responses
 * and calculates the median of prices.
 * @param Forminator_Form_Entry_Model $entry            - Entry Object
 * @param int                         $form_id          - Form ID
 * @param array                       $field_data_array - Data fields
 */
add_action('forminator_custom_form_submit_before_set_fields', 'afl_save_form_response_and_calculate_median', 10, 3);
function afl_save_form_response_and_calculate_median($entry, $form_id, $field_data_array) {
    // Only process submissions for the specific survey form (ID: 6728)
    $survey_form_id = 6728;
    
    if ((int) $form_id !== $survey_form_id) {
        return;
    }
        
    global $wpdb;

    // 1. Table names with WordPress prefix
    $responses_table = $wpdb->prefix . 'test_form_responses';
    $results_table = $wpdb->prefix . 'test_analysis_results';

    // Get field name to database column mapping
    $mapping = get_forminator_to_db_mapping($form_id);
    error_log( print_r( $mapping, true ) ); // Debug: log mapping for verification
    if (empty($mapping)) {
        return; // Exit if no field mapping is defined
    }

    // 2. Prepare data for test_form_responses
    $response_data = [
        'form_id' => $form_id,
    ];

    // 3. Map Forminator fields to database columns using mapping
    foreach ($field_data_array as $field) {
        $field_name = sanitize_key($field['name']); // Sanitize field name
        $field_value = is_numeric($field['value']) ? floatval($field['value']) : sanitize_text_field($field['value']);

        // Only include fields that have a database column mapping
        if (isset($mapping[$field_name])) {
            $db_column_name = $mapping[$field_name];
            $response_data[$db_column_name] = $field_value;
        }
    }
    error_log( print_r( $response_data, true ) ); // Debug: log prepared data before insert

    // 4. Insert into test_form_responses
    $wpdb->insert($responses_table, $response_data);

    // 5. Calculate median of prices (all responses)
    $median = afl_calculate_median_tarif($responses_table);
    if ($median !== false) {
        // 6. Save result to wp_analysis_results
        $wpdb->insert($results_table, [
            'median_prices' => $median,
            'responses_nb' => $wpdb->get_var("SELECT COUNT(*) FROM $responses_table"),
        ]);
    }
}

/**
 * Calculates the median of prices in the wp_form_responses table.
 */
function afl_calculate_median_tarif($table_name) {
    global $wpdb;

    // 1. Get all sorted prices
    $prices = $wpdb->get_col("SELECT cycle_price FROM $table_name WHERE cycle_price IS NOT NULL ORDER BY cycle_price ASC");

    if (empty($prices)) {
        return false;
    }

    // 2. Calculate median
    $count = count($prices);
    $middle = floor($count / 2);

    if ($count % 2 == 0) {
        // Even count: average of 2 central values
        $median = ($prices[$middle - 1] + $prices[$middle]) / 2;
    } else {
        // Odd count: central value
        $median = $prices[$middle];
    }

    return round($median, 2); // Rounded to 2 decimal places
}