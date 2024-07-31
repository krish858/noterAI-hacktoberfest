import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import Navigationbar from "@/components/Navigationbar";
import {Providers} from "./providers";
import { Suspense } from "react";


const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Create Next App",
  description: "Generated by create next app",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <Providers>
          <div><Navigationbar /></div>
          <Suspense fallback={<div>Loading...</div>}>
          {children}
          </Suspense>
        </Providers>
      </body>
    </html>
  );
}
