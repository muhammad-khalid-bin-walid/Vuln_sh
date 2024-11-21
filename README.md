# Vuln_sh
The script is designed to check a list of URLs for various web vulnerabilities using the tools gf and httpx. 
Step 01:
Use this command to gather subdomains of our target url :
subfinder -d www.target.com -silent | tee -a urls.txt
Do not forget to specify the target website
Tip: 
Run the script from the directory where your urls.txt is located
Step 02:
Do chmod+X gf_vuln.sh
Then while being in the directory run the script using the command : bash gf_vulb.sh
Then script will start working
