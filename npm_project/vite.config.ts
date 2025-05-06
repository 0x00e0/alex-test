import { defineConfig } from 'vite';
import path from 'path';

export default defineConfig({
  build: {
    outDir: '/dist',
    lib: {
      entry: path.resolve(__dirname, 'src/index.ts'),
      name: 'alexliudemo',
      fileName: (format) => `alexliudemo.${format}.js`,
    },
    rollupOptions: {
      output: {
        assetFileNames: (assetInfo) => {
          if (assetInfo.name && assetInfo.name.endsWith('.css')) {
            return 'alexliudemo.css';
          }
          return assetInfo.name!;
        }
      }
    }
  }
});
