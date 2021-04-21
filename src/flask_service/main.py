import logging
import re
import sys

from gunicorn.app.wsgiapp import run
from gunicorn.http import message

logger = logging.getLogger(__name__)

if __name__ == "__main__":
    message.MAX_REQUEST_LINE = 2048
    sys.argv[0] = re.sub(r"(-script\.pyw?|\.exe)?$", "", sys.argv[0])
    
    logger.info("there is no function to execute in this example")

    sys.exit(run())  # to help k8s