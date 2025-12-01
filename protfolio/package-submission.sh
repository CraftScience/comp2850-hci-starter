#!/bin/bash

# COMP2850 HCI Portfolio Packaging Script
# This script creates the final submission ZIP file

# Configuration
STUDENT_NAME="YourName"  # ⚠️ CHANGE THIS TO YOUR NAME
SUBMISSION_DIR="COMP2850-Portfolio-${STUDENT_NAME}"
ZIP_NAME="${SUBMISSION_DIR}.zip"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "=========================================="
echo "COMP2850 HCI Portfolio Package Creator"
echo "=========================================="
echo ""

# Step 1: Create temporary submission directory
echo -e "${YELLOW}Step 1: Creating submission directory...${NC}"
rm -rf "$SUBMISSION_DIR"  # Clean up if exists
mkdir -p "$SUBMISSION_DIR"
mkdir -p "$SUBMISSION_DIR/evidence/screenshots"
mkdir -p "$SUBMISSION_DIR/evidence/pilot-notes"

# Step 2: Copy main files
echo -e "${YELLOW}Step 2: Copying main files...${NC}"

# Check if files exist and copy
if [ -f "protocol-tasks.md" ]; then
    cp protocol-tasks.md "$SUBMISSION_DIR/"
    echo -e "  ${GREEN}✓${NC} protocol-tasks.md"
else
    echo -e "  ${RED}✗ Missing: protocol-tasks.md${NC}"
fi

if [ -f "findings-table.csv" ]; then
    cp findings-table.csv "$SUBMISSION_DIR/"
    echo -e "  ${GREEN}✓${NC} findings-table.csv"
else
    echo -e "  ${RED}✗ Missing: findings-table.csv${NC}"
fi

if [ -f "data/metrics.csv" ]; then
    cp data/metrics.csv "$SUBMISSION_DIR/"
    echo -e "  ${GREEN}✓${NC} metrics.csv"
else
    echo -e "  ${RED}✗ Missing: data/metrics.csv${NC}"
fi

if [ -f "implementation-diffs.md" ]; then
    cp implementation-diffs.md "$SUBMISSION_DIR/"
    echo -e "  ${GREEN}✓${NC} implementation-diffs.md"
else
    echo -e "  ${RED}✗ Missing: implementation-diffs.md${NC}"
fi

if [ -f "verification.csv" ]; then
    cp verification.csv "$SUBMISSION_DIR/"
    echo -e "  ${GREEN}✓${NC} verification.csv"
else
    echo -e "  ${RED}✗ Missing: verification.csv${NC}"
fi

# Step 3: Copy evidence folder
echo -e "${YELLOW}Step 3: Copying evidence files...${NC}"

if [ -f "evidence/README.md" ]; then
    cp evidence/README.md "$SUBMISSION_DIR/evidence/"
    echo -e "  ${GREEN}✓${NC} evidence/README.md"
else
    echo -e "  ${RED}✗ Missing: evidence/README.md${NC}"
fi

# Copy screenshots
if [ -d "evidence/screenshots" ]; then
    cp evidence/screenshots/*.png "$SUBMISSION_DIR/evidence/screenshots/" 2>/dev/null || true
    cp evidence/screenshots/annotations.csv "$SUBMISSION_DIR/evidence/screenshots/" 2>/dev/null || true
    SCREENSHOT_COUNT=$(ls evidence/screenshots/*.png 2>/dev/null | wc -l)
    echo -e "  ${GREEN}✓${NC} Copied $SCREENSHOT_COUNT screenshots"
else
    echo -e "  ${RED}✗ Missing: evidence/screenshots directory${NC}"
fi

# Copy pilot notes
if [ -d "evidence/pilot-notes" ]; then
    cp evidence/pilot-notes/*.md "$SUBMISSION_DIR/evidence/pilot-notes/" 2>/dev/null || true
    NOTES_COUNT=$(ls evidence/pilot-notes/*.md 2>/dev/null | wc -l)
    echo -e "  ${GREEN}✓${NC} Copied $NOTES_COUNT pilot note files"
else
    echo -e "  ${RED}✗ Missing: evidence/pilot-notes directory${NC}"
fi

# Step 4: PII Check Reminder
echo ""
echo -e "${YELLOW}Step 4: PII Compliance Check${NC}"
echo "Before creating ZIP, verify:"
echo "  □ All screenshots cropped (no browser bookmarks visible)"
echo "  □ No names/emails/student IDs in any screenshot"
echo "  □ Session IDs use P1_xxxx format (not real names)"
echo "  □ metrics.csv has anonymous session IDs"
echo ""
read -p "Have you verified NO PII in screenshots/data? (y/n): " pii_check

if [ "$pii_check" != "y" ]; then
    echo -e "${RED}⚠️  Please check for PII before packaging!${NC}"
    exit 1
fi

# Step 5: Create ZIP file
echo ""
echo -e "${YELLOW}Step 5: Creating ZIP archive...${NC}"
rm -f "$ZIP_NAME"  # Remove old ZIP if exists
zip -r "$ZIP_NAME" "$SUBMISSION_DIR" > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Successfully created: $ZIP_NAME${NC}"
else
    echo -e "${RED}✗ Failed to create ZIP file${NC}"
    exit 1
fi

# Step 6: Verify ZIP contents
echo ""
echo -e "${YELLOW}Step 6: Verifying ZIP contents...${NC}"
echo "Files in archive:"
unzip -l "$ZIP_NAME" | grep -E '\.(md|csv|png)$' | awk '{print "  " $4}'

# Step 7: File size check
ZIP_SIZE=$(du -h "$ZIP_NAME" | cut -f1)
echo ""
echo -e "${GREEN}✓ Package created successfully!${NC}"
echo "  File: $ZIP_NAME"
echo "  Size: $ZIP_SIZE"

# Step 8: Final checklist
echo ""
echo "=========================================="
echo "FINAL SUBMISSION CHECKLIST"
echo "=========================================="
echo ""
echo "Required Files (Must have all 6):"
echo "  □ protocol-tasks.md"
echo "  □ findings-table.csv"
echo "  □ metrics.csv"
echo "  □ implementation-diffs.md"
echo "  □ verification.csv"
echo "  □ evidence/ folder (with README.md, screenshots/, pilot-notes/)"
echo ""
echo "Evidence Chain Check:"
echo "  □ findings-table.csv links to metrics.csv lines OR pilot notes timestamps"
echo "  □ implementation-diffs.md references findings from findings-table.csv"
echo "  □ verification.csv shows before/after for implemented fixes"
echo ""
echo "Minimum Requirements:"
echo "  □ n≥2 participants (check metrics.csv session IDs)"
echo "  □ 3+ findings with evidence (check findings-table.csv)"
echo "  □ 1-3 code fixes (check implementation-diffs.md)"
echo "  □ 20 WCAG checks complete (check verification.csv Part A)"
echo ""
echo "Privacy & Ethics:"
echo "  □ No PII in screenshots (names/emails/student IDs removed)"
echo "  □ Session IDs anonymous (P1_xxxx format)"
echo "  □ Consent documented (pilot-notes/consent-log.md)"
echo ""
echo -e "${GREEN}If all checks pass, upload $ZIP_NAME to Gradescope!${NC}"
echo ""

# Clean up temporary directory
rm -rf "$SUBMISSION_DIR"
echo "Cleaned up temporary files."
echo ""
echo "=========================================="
echo "Package complete!"
echo "=========================================="