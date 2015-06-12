# Triumph
An open-ended achievement system.

## Scope
Triumph will be an open-ended and personalizable achievement system geared toward gamification.  With Triumph, groups, departments, teams, and friends can create Achievements and track their progress and contribution to any aspect of their work and projects.

### Extensibility
Triumph is generic. Users can create realms where users can progress to obtain achievements. Achievements can be categorized both in flavor and rarity.

Additionally, opening up an API will allow for any interface to work with Triumph.

### Interfaces
A web interface will be created to allow users full access and control over the creation, progression, tracking, and viewing of their achievements.  Additionally, a REST API will be available for integration with other areas and applications.  This will allow for outside processes to watch, poll, or batch run against external sources to detect achievement progression.

Within all interfaces, the following will be available:

* Viewing achievement listings
* Viewing individual achievement details
* Viewing personal progress for achievements
* Viewing recent progress activity, both personally and for other users
* Creating achievements, and reconfiguring existing ones
* Granting achievements to users
* Granting progress of an achievement to users
* Enabling and disabling achievements
* Deleting achievements
 
Role based security will control what users can see and do, but this will be covered at another time.

### Backends
Achievement details, users, and progress will be stored within an internal database.  For development, we use the rails des standard of sqlite. Production flavors will be on something more robust: MySQL for example.
