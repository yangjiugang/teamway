
package teamway.shenzhen.net;

public interface UDPServer
{
    boolean initServer(int port, int buffer);
    NetData receive();
    boolean send(NetData data);
}
