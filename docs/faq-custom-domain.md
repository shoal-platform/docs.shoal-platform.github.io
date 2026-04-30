# How do I set up a custom domain?

To use your own domain (e.g. `app.mycompany.com`) instead of the default `eu1.shoal.live` address:

1. In your proxy node config, note the full Shoal address for your deployment (e.g. `my-app.eu1.shoal.live`).
2. Go to your DNS provider and add a `CNAME` record:

    | Type  | Name | Value                 |
    |-------|------|-----------------------|
    | CNAME | app  | my-app.eu1.shoal.live |

3. DNS changes can take a few minutes to propagate. Once live, your custom domain will route to your Shoal deployment automatically.

Shoal handles SSL for custom domains - no certificate setup needed.
