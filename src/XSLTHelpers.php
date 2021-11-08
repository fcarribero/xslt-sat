<?php

namespace Webneex\XSLTSAT;

use DOMDocument;
use Exception;
use XSLTProcessor;

class XSLTHelpers {

    public static function transformDom($dom, $schema) {

        if (substr($schema, 0, 2) == './') $schema = __DIR__ . '/../files/' . substr($schema, 2);

        $style = new DOMDocument;
        $style->load($schema, LIBXML_NOCDATA);
        $xslt = new XSLTProcessor;
        $prev_config = libxml_use_internal_errors(true);
        if (!@$xslt->importStylesheet($style)) {
            throw new Exception('Ocurrió un error al importar Stylesheet.');
        }
        libxml_use_internal_errors($prev_config);
        return $xslt->transformToXML($dom);
    }

    public static function transformString($string, $schema) {
        $dom = new DOMDocument;
        $dom->loadXML($string);

        return static::transformDom($dom, $schema);
    }
}