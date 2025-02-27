"use client";
import { useEffect, useState } from "react";

export default function ClientComponent() {
  const [routeMessage, setRouteMessage] = useState("");

  useEffect(() => {
    fetch("/api/route")
      .then((res) => res.json())
      .then((data) => setRouteMessage(data.message));
  }, []);

  return (
    <div className="flex flex-col justify-center gap-2">
      <p>✅ Hola desde un client component!</p>
      <p>✅ Resultado desde un route handler: {routeMessage}</p>
    </div>
  );
}