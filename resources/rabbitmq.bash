docker run -d --hostname "$(hostname)" --name rabbitmq-flowback -p 5672:5672 --restart unless-stopped rabbitmq:latest
sleep 10
docker exec -ti rabbitmq-flowback bash -c "
rabbitmqctl add_user flowback flowback ;
rabbitmqctl add_vhost rabbitmq-flowback ;
rabbitmqctl set_user_tags flowback administrator ;
rabbitmqctl set_permissions -p rabbitmq-flowback flowback \".*\" \".*\" \".*\" ;"