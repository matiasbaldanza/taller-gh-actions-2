import ClientComponent from "@/components/client-component";
import Link from "next/link";

// app/page.tsx (Server Component)
export default function Home() {
  async function getServerActionResult() {
    "use server";
    return "Hello from server action!";
  }

  return (
    <div className="flex flex-col justify-center gap-2">
      <p>✅ Hola desde un server component!</p>
      <p>✅ Resultado desde una server action: {getServerActionResult()}</p>
      <ClientComponent />
      <br />
      <nav className="flex justify-center gap-2">
        <Link href="/">
          ⬅︎ Volver a <code className="text-blue-500 hover:bg-blue-500 hover:text-white transition-all duration-300 px-1 rounded-md">Homepage</code>
        </Link>
      </nav>
    </div>
  );
}