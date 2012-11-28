<?php

        $expires = 1354085792000; // Poor man's milliseconds.
        $signature = urlencode(base64_encode(hash_hmac('sha1', "authentication***REMOVED***1354085792000", "***REMOVED***", TRUE)));
        print $signature . "\n";
?>
