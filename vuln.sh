#!/bin/bash

# File containing URLs to test
URLS_FILE="urls.txt"
OUTPUT_DIR="results"
LOG_FILE="scan.log"

# Create results and log directory if it doesn't exist
mkdir -p $OUTPUT_DIR
touch $LOG_FILE

# Function to run gf and httpx for a specific pattern
run_test() {
    local pattern=$1
    local output_file=$2

    echo "Running test for $pattern..." | tee -a $LOG_FILE
    cat $URLS_FILE | gf $pattern | httpx -silent > "$OUTPUT_DIR/$output_file"
    echo "Finished test for $pattern. Results saved in $output_file." | tee -a $LOG_FILE
}

# Check for required tools
if ! command -v gf &> /dev/null; then
    echo "Error: gf could not be found. Please install gf." | tee -a $LOG_FILE
    exit 1
fi

if ! command -v httpx &> /dev/null; then
    echo "Error: httpx could not be found. Please install httpx." | tee -a $LOG_FILE
    exit 1
fi

# Check if URLs file exists
if [[ ! -f $URLS_FILE ]]; then
    echo "Error: File '$URLS_FILE' not found. Make sure to have the urls.txt gathered by your subdomain enumeration process." | tee -a $LOG_FILE
    exit 1
fi

# Run tests for different patterns
run_test "xss" "xss_results.txt"
run_test "ssrf" "ssrf_results.txt"
run_test "sqli" "sqli_results.txt"
run_test "lfi" "lfi_results.txt"
run_test "rce" "rce_results.txt"
run_test "redirect" "redirect_results.txt"
run_test "interestingsubs" "interestingsubs_results.txt"
run_test "interestingparams" "interestingparams_results.txt"
run_test "debuglogic" "debuglogic_results.txt"
run_test "interestingEXT" "interestingEXT_results.txt"

echo "All tests completed. Results are saved in the '$OUTPUT_DIR' directory." | tee -a $LOG_FILE
