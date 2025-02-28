import Link from "next/link";

// app/page.tsx (Server Component)
export default function Home() {
  return (
    <div className="flex flex-col items-center justify-center gap-2">
      <h1 className="text-2xl font-bold">Homepage</h1>
      <br />
      <nav className="flex justify-center gap-2">
        <Link href="/hola">
          Ir a <code className="text-blue-500 hover:bg-blue-500 hover:text-white transition-all duration-300 px-1 rounded-md">/hola</code>
        </Link>
      </nav>
    </div>
  );
}