vi /usr/local/nginx/conf/nginx.conf #�༭�����ļ�,���������޸�
user www www; #����userȥ��ע��,�޸�Nginx������Ϊwww www��������/usr/local/php/etc/php-fpm.conf�е�user,group������ͬ������php���г���
index index.php index.html index.htm; #���index.php
# pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
location ~ \.php$ {
root html;
fastcgi_pass 127.0.0.1:9000;
fastcgi_index index.php;
fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
include fastcgi_params;
}
#ȡ��FastCGI server����location��ע��,��Ҫע��fastcgi_param�еĲ���,��Ϊ
$document_root$fastcgi_script_name,����ʹ�þ���·��
/etc/init.d/nginx restart #����nginx
