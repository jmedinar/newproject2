FROM fedora
RUN dnf install -yqq nginx hostname \
  && touch output.txt \
  && echo "Some random text" > output.txt \
  && ls -l output.txt
COPY index.html /usr/share/nginx/html/index.html
RUN hostname >> /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/nginx.conf
#RUN sed -i '/::*80/s/^/#/' /etc/nginx/nginx.conf
EXPOSE 80
CMD nginx -g 'daemon off;'

