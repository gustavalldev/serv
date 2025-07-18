wg show
cat /etc/wireguard/wg0.conf
sysctl net.ipv4.ip_forward
ufw status numbered
ip route show
journalctl -u wg-quick@wg0 --since "10 minutes ago" | tail -10
iptables -t nat -L -n -v
systemctl stop wg-quick@wg0
sed -i 's/eth0/ens3/g' /etc/wireguard/wg0.conf
systemctl start wg-quick@wg0
systemctl status wg-quick@wg0
wg show
iptables -t nat -L -n -v
ping -c 3 8.8.8.8
cat /root/test_client.conf
netstat -tulpn | grep 51820
apt install net-tools -y
netstat -tulpn | grep 51820
ufw status verbose
journalctl -u wg-quick@wg0 -f
ip addr show wg0
tcpdump -i ens3 udp port 51820 -n
wg show | grep "public key"
sed -i '/Address = 10.8.0.2\/32/a MTU = 1420' /root/test_client.conf
sed -i 's/DNS = 1.1.1.1/DNS = 8.8.8.8/' /root/test_client.conf
systemctl restart wg-quick@wg0
cat /root/test_client.conf
journalctl -u wg-quick@wg0 -f
wg show
iptables -L FORWARD -n -v
iptables -t nat -L POSTROUTING -n -v
ping -c 3 10.8.0.2
ip route show
iptables -t nat -L POSTROUTING -n -v
echo "" >> /etc/wireguard/wg0.conf
echo "[Peer]" >> /etc/wireguard/wg0.conf
echo "PublicKey = KcQnVzon0z3n8gvxjP7ipqlvKschN4GnCJ" >> /etc/wireguard/wg0.conf
echo "AllowedIPs = 10.8.0.2/32" >> /etc/wireguard/wg0.conf
cat /etc/wireguard/wg0.conf
systemctl restart wg-quick@wg0
wg show
ping -c 3 10.8.0.2
systemctl status wg-quick@wg0
journalctl -u wg-quick@wg0 --since "2 minutes ago"
tcpdump -i ens3 udp port 51820 -n
wg show
ping -c 3 10.8.0.2
systemctl status wg-quick@wg0
journalctl -u wg-quick@wg0 --since "2 minutes ago"
tcpdump -i ens3 udp port 51820 -n
ssh-keygen -t rsa -b 4096 -C "vpn_bot_access"
cat ~/.ssh/id_rsa.pub
rm ~/.ssh/id_rsa
rm ~/.ssh/id_rsa.pub
rm ~/.ssh/id_rsa ~/.ssh/id_rsa.pub
wg genkey > /root/new_client_private.key
cat /root/new_client_private.key | wg pubkey > /root/new_client_public.key
cat /root/new_client_public.key
cat > /root/new_test_client.conf << EOF
[Interface]
PrivateKey = $(cat /root/new_client_private.key)
Address = 10.8.0.3/32
MTU = 1420
DNS = 8.8.8.8
[Peer]
PublicKey = BTeHvM6BlReq8rt/5tBKNkKWRqh/qtigYTfLOGS73Rg=
Endpoint = 109.107.170.233:51820
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25
EOF

sed -i '/\[Peer\]/,+2d' /etc/wireguard/wg0.conf
echo "" >> /etc/wireguard/wg0.conf
echo "[Peer]" >> /etc/wireguard/wg0.conf
echo "PublicKey = ipZSXqs9IkTYs9t3/9KwCAI1XkpKUeokccNDM59kjic=" >> /etc/wireguard/wg0.conf
echo "AllowedIPs = 10.8.0.3/32" >> /etc/wireguard/wg0.conf
systemctl restart wg-quick@wg0
wg show
journalctl -u wg-quick@wg0 -f
apt update && apt upgrade -y
apt install wireguard -y
echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
sysctl -p
curl -o setup-wireguard-server.sh https://raw.githubusercontent.com/gustavalldev/wg-tg/main/setup-wireguard-server.sh
chmod +x setup-wireguard-server.sh
./setup-wireguard-server.sh
