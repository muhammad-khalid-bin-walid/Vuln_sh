# Vuln_sh
This script is designed to check a list of URLs for various web vulnerabilities using the tools gf and httpx.
Step 01:
Use the following command to collect subdomains of your target URL:
subfinder -d www.target.com -silent | tee -a urls.txt
Remember to replace 'www.target.com' with your actual target website.
Tip:
Execute the script from the directory where your urls.txt file is located.
Step 02:
Perform chmod +x gf_vuln.sh
Then, while in the directory, execute the script with the command: bash gf_vuln.sh
The script will then begin to execute.
