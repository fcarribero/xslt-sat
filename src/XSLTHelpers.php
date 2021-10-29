<?php

namespace Webneex\XSLTSAT;

use DOMDocument;
use XSLTProcessor;

class XSLTHelpers {

    public static function transformDom($dom, $schema) {

        if (substr($schema, 0, 2) == './') $schema = __DIR__ . '/../files/' . substr($schema, 2);

        $style = new DOMDocument;
        $style->load($schema, LIBXML_NOCDATA);
        $xslt = new XSLTProcessor;
        $xslt->importStylesheet($style);

        return $xslt->transformToXML($dom);
    }

    public static function transformString($string, $schema) {
        $dom = new DOMDocument;
        $dom->loadXML($string);

        return static::transformDom($dom, $schema);
    }
}