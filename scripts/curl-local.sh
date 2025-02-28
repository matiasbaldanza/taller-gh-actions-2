# Testear ruta API /api/routelocalmente
echo "🔍 Testeando ruta API localmente..."
curl -X GET http://localhost:8080/api/route | jq

# Testear / localmente
echo "🔍 Testeando / localmente..."
curl -X GET http://localhost:8080/ | jq

# Testear /hello localmente
echo "🔍 Testeando /hola localmente..."
curl -X GET http://localhost:8080/hola | jq


