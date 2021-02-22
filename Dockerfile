FROM ubuntu/trusty

RUN sudo apt-get update \
  && sudo apt-get install texlive xzdec -y \
  && tlmgr init-usertree \
  # TODO: Update to work with 2016+ tex at some point. \
  && tlmgr option repository ftp://tug.org/historic/systems/texlive/2015/tlnet-final \
  && tlmgr install collection-fontsrecommended euenc xunicode unicode-math ucharcat filehook etoolbox textpos biblatex logreq

ENTRYPOINT lualatex