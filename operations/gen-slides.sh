#!/bin/bash

ASCIIDOCTOR=asciidoctor
BACKEND_TEMPLATES=~/asciidoctor-backends
TEMPLATE_ENGINE=slim
DECK=index

if [ "$1" == "pack" ]; then
  PACK=1
fi

if [ ! -z $PACK ]; then
  $ASCIIDOCTOR -b dzslides -a docinfo1 -a linkcss! -a data-uri -T $BACKEND_TEMPLATES/$TEMPLATE_ENGINE -o - $DECK.adoc | sed 's/<\(\/\?html\|\/\?head\|\/\?body\|section\|script\|link\|meta\|title\|style\)/\n&/g' > $DECK-packed.html
else
  # sed is used to prettify the slim output
  $ASCIIDOCTOR -b dzslides -a docinfo1 -T $BACKEND_TEMPLATES/$TEMPLATE_ENGINE -o - $DECK.adoc | sed 's/<\(\/\?html\|\/\?head\|\/\?body\|section\|script\|link\|meta\|title\|style\)/\n&/g' > $DECK.html
fi
