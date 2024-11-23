import requests
from bs4 import BeautifulSoup
import os

# URL of the website to scrape
url = 'https://pages.hmc.edu/harris/cmosvlsi/4e/lect/'

# Send a GET request to the website
response = requests.get(url)
response.raise_for_status()  # Check that the request was successful

# Parse the HTML content of the page
soup = BeautifulSoup(response.text, 'html.parser')

# Find all links on the page
links = soup.find_all('a')

# Create a directory to save the downloaded files
os.makedirs('downloads', exist_ok=True)

# Loop through all the links and download the files
for link in links:
    href = link.get('href')
    if href and href.endswith('.ppt'):
        file_url = url + href
        file_name = os.path.join('downloads', href)
        
        # Download the file
        print(f'Downloading {file_url}')
        file_response = requests.get(file_url)
        file_response.raise_for_status()
        
        # Save the file
        with open(file_name, 'wb') as file:
            file.write(file_response.content)

print('All files downloaded.')