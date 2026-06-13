
Procuro is a tool for managing the procurement of data center servers and their components, to gain insights into prices, how prices change over time, comparing costs of ready-made servers and custom setups built internally from components sourced from different vendors.

## Platforms
There are different server platform categories, and versions of these with different requirements and configurations.

Right now there are four:

- CP – Compute (versions 9, 10 and 11)
- NT – Network (versions 2 and 3)
- IO – Input/Output (versions 16, 17 and 18)
- ST – Storage (versions 11, 12 and 13)

Other platform types might come, for example a platform for AI. So these types should not be hard-coded.

## Prices
Prices of servers and components should be tracked (manually entered), with a graph showing cost development over time.

## Storage
The data _must_ be stored locally and securely. An SQLite database stored in Proton Drive, for example.