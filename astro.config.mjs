import { defineConfig } from "astro/config";

import tailwind from "@tailwindcss/vite";
import sitemap from "@astrojs/sitemap";
import robotsTxt from "astro-robots-txt";

// https://astro.build/config
export default defineConfig({
  site: "https://maywood.dev",
  integrations: [
    sitemap(),
    robotsTxt({
      policy: [
        {
          // AI Assistant
          // https://darkvisitors.com/agents/chatgpt-user
          userAgent: "ChatGPT-User",
          disallow: "/",
        },
        {
          // AI Assistant
          // https://darkvisitors.com/agents/cohere-ai
          userAgent: "cohere-ai",
          disallow: "/",
        },
        {
          // AI Data Scraper
          // https://darkvisitors.com/agents/anthropic-ai
          userAgent: "anthropic-ai",
          disallow: "/",
        },
        {
          // AI Data Scraper
          // https://darkvisitors.com/agents/bytespider
          userAgent: "Bytespider",
          disallow: "/",
        },
        {
          // AI Data Scraper
          // https://darkvisitors.com/agents/ccbot
          userAgent: "CCBot",
          disallow: "/",
        },
        {
          // AI Data Scraper
          // https://darkvisitors.com/agents/facebookbot
          userAgent: "FacebookBot",
          disallow: "/",
        },
        {
          // AI Data Scraper
          // https://darkvisitors.com/agents/google-extended
          userAgent: "Google-Extended",
          disallow: "/",
        },
        {
          // AI Data Scraper
          // https://darkvisitors.com/agents/gptbot
          userAgent: "GPTBot",
          disallow: "/",
        },
        {
          // AI Data Scraper
          // https://darkvisitors.com/agents/omgilibot
          userAgent: "omgili",
          disallow: "/",
        },
      ],
    }),
  ],
  vite: {
    plugins: [tailwind()],
  },
});
