// https://nuxt.com/docs/api/configuration/nuxt-config

export default defineNuxtConfig({
  ssr: false,
  nitro: {
    output: {
      publicDir: 'target'
    }
  },
  compatibilityDate: '2024-04-03',
  devtools: { enabled: false }
})
