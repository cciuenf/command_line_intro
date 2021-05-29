#quando falta luz o servidor reinicia e o apache atrapalha o site a subir
#por isso criei um script de comandos que o servidor executa quando liga
#esse script para o apache e inicia o nginx e o docker do site 

start on startup #avisa ao servidor que é pra executar au iniciar
task #inicio da lista de execução
exec sudo /etc/init.d/apache2 stop #para a inicialização do apache
exec cd uenf_digital #entra na pasta onde esta o docker do site
exec docker-compose up -d #levanta o container
exec sudo systemctl start nginx #inicia o proxy reverso
