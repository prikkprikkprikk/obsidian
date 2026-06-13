Procuro is a tool for managing the procurement of data center servers and their components, to gain insights into prices, how prices change over time, comparing costs of ready-made servers and custom setups built internally from components sourced from different vendors.

## Platforms
There are different server platform categories, and versions of these with different requirements and configurations.

Right now there are four:

- CP – Compute (versions 9, 10 and 11)
- NT – Network (versions 2 and 3)
- IO – Input/Output (versions 16, 17 and 18)
- ST – Storage (versions 11, 12 and 13)

Other platform types might come in the future, for example a platform for AI, therefore these types should not be hard-coded.

Older versions might be decomissioned, so versions should be able to be marked as such.

### Platform versions
The platforms have different version numbers, each with varying properties. (CPUs, cores, drives, memory etc.)

The ready-made ones have a total price as set by their vendors.

The custom built ones will have a calculated total price as the sum of the price of their components. When composing such a server, one should be able to easily configure it with appropriate components from the database.

## Prices
Prices of components and ready-made servers should be tracked (manually entered), with a graph showing cost development over time.

## Comparing cost
The main purpose of this tool is to acquire prices of ready-made servers and components, and compare various alternatives to find the most affordable server/configuration at the current time.

## Data storage
The data _must_ be stored locally and securely. An SQLite database stored in Proton Drive, for example.

## Data models
This section is a work in progress, neither structures or names are set in stone (yet).

### Platform requirements
Requirements for all components that make up a server of this platform type and version number.

Serves as a template for setting up alternatives (see directly below).

### Platform+version alternatives
One of:

- a ready-made server from a vendor
- a custom built server built with components from different vendors

### Components
Chassis, RAM, drives, CPUs etc.

- Name
- Vendor
- Some sort of part number

### Component prices
- Component ID
- Date
- Price (integer, in dollar cents)

