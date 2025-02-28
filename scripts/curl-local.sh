# Testear ruta API /api/routelocalmente
echo "🔍 Testeando ruta API localmente..."
curl -X GET http://localhost:8080/api/route

# Testear / localmente
echo "🔍 Testeando / localmente..."
curl -X GET http://localhost:8080/

# Testear /hello localmente
echo "🔍 Testeando /hola localmente..."
curl -X GET http://localhost:8080/hola


