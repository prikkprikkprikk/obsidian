https://youtu.be/epMbfE37014

[Vite Livewire plugin](https://laravel-news.com/vite-livewire-plugin)

  

[Freek.dev](http://Freek.dev) har to artiklar å lese for å få hot reload til å funke med Blade og Valet.

Summen av desse to er oppsummert i vite.config.js nedanfor.

> [!info] Making Vite and Valet play nice together | freek.dev  
> Yesterday, the Laravel team launched the official vite-plugin.  
> [https://freek.dev/2276-making-vite-and-valet-play-nice-together](https://freek.dev/2276-making-vite-and-valet-play-nice-together)  

> [!info] Using Laravel Vite to automatically refresh your browser when changing a Blade file | freek.dev  
> Yesterday, the Laravel team released the vite-plugin.  
> [https://freek.dev/2277-using-laravel-vite-to-automatically-refresh-your-browser-when-changing-a-blade-file](https://freek.dev/2277-using-laravel-vite-to-automatically-refresh-your-browser-when-changing-a-blade-file)  

## Oppsummert: vite.config.js

```JavaScript
import fs from 'fs';
import laravel from 'laravel-vite-plugin'
import {defineConfig} from 'vite'
import {homedir} from 'os'
import {resolve} from 'path'

let host = 'projectname.test'

export default defineConfig({
		plugins: [
        laravel([
            'resources/css/app.css',
            'resources/js/app.js',
        ]),
        {
            name: 'blade',
            handleHotUpdate({ file, server }) {
                if (file.endsWith('.blade.php')) {
                    server.ws.send({
                        type: 'full-reload',
                        path: '*',
                    });
                }
            },
        }
    ],
    server: detectServerConfig(host),
})

function detectServerConfig(host) {
    let keyPath = resolve(homedir(), `.config/valet/Certificates/${host}.key`)
    let certificatePath = resolve(homedir(), `.config/valet/Certificates/${host}.crt`)

    if (!fs.existsSync(keyPath)) {
        return {}
    }

    if (!fs.existsSync(certificatePath)) {
        return {}
    }

    return {
        hmr: {host},
        host,
        https: {
            key: fs.readFileSync(keyPath),
            cert: fs.readFileSync(certificatePath),
        },
    }
}
```