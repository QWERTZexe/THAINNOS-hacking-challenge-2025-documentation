#!/bin/bash

# File paths
INPUT_FILE="random.bin"
PRIVATE_KEY="private_key_guenther.pem"
BLOCK_SIZE=512  # Block size in bytes
OUTPUT_DIR="decrypted_blocks"  # Directory to store decrypted outputs
LOG_FILE="decryption_log.txt"  # Log file to store results

# Create output directory and log file
mkdir -p "$OUTPUT_DIR"
echo "Decryption Log - $(date)" > "$LOG_FILE"
echo "Input File: $INPUT_FILE" >> "$LOG_FILE"
echo "Private Key: $PRIVATE_KEY" >> "$LOG_FILE"
echo "Block Size: $BLOCK_SIZE bytes" >> "$LOG_FILE"
echo "----------------------------------------" >> "$LOG_FILE"

# Get the file size in bytes
FILE_SIZE=$(stat -c%s "$INPUT_FILE")
TOTAL_BLOCKS=$((FILE_SIZE / BLOCK_SIZE))

echo "File size: $FILE_SIZE bytes"
echo "Total blocks: $TOTAL_BLOCKS"

# Loop through all possible offsets
for ((i = 0; i < TOTAL_BLOCKS; i++)); do
    echo "Processing block $i of $TOTAL_BLOCKS..." | tee -a "$LOG_FILE"

    # Extract the current block from the file
    dd if="$INPUT_FILE" bs=$BLOCK_SIZE skip=$i count=1 of=block_$i.bin status=none

    # Attempt decryption with OpenSSL
    openssl pkeyutl -decrypt -inkey "$PRIVATE_KEY" -in block_$i.bin -out "$OUTPUT_DIR/decrypted_block_$i.txt" 2>/dev/null

    # Check if decryption was successful
    if [ $? -eq 0 ]; then
        echo "Decryption succeeded for block $i!" | tee -a "$LOG_FILE"
        echo "Decrypted content:" >> "$LOG_FILE"
        cat "$OUTPUT_DIR/decrypted_block_$i.txt" >> "$LOG_FILE"
        echo "--------------------------" >> "$LOG_FILE"
    else
        echo "Decryption failed for block $i." | tee -a "$LOG_FILE"
    fi

    # Clean up extracted block
    rm -f block_$i.bin
done

echo "Decryption process completed. Check '$OUTPUT_DIR' for results."