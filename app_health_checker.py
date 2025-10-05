import requests
import sys

def check_app_health(url):
    try:
        response = requests.get(url, timeout=5)
        if response.status_code == 200:
            print(f"Application is UP. Status code: {response.status_code}")
            return True
        else:
            print(f"Application is DOWN. Status code: {response.status_code}")
            return False
    except requests.exceptions.RequestException as e:
        print(f"Application is DOWN. Error: {e}")
        return False

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python app_health_checker.py <application_url>")
        sys.exit(1)

    url = sys.argv[1]
    check_app_health(url)
