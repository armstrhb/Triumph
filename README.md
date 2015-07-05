# Triumph
Tiumph is an open-ended, generic achievement system using Ruby on Rails. Create achievements, categories, and levels of rarities, and track your progress!

## Scope
Triumph is an open-ended and personalizable achievement system geared toward gamification.  With Triumph, groups, departments, teams, and friends can create Achievements and track their progress and contribution to any aspect of their work and projects.

## It's generic
Triumph is generic. Users can create realms where users can progress to obtain achievements. Achievements can be categorized both in flavor and rarity.


## And integratable
A web interface allows users full access and control over the creation, progression, tracking, and viewing of their achievements.  Additionally, a REST API is available for integration with other areas and applications.  This will allow for outside processes to watch, poll, or batch run against external sources to detect achievement progression.

With this, teams can integrate with Triumph, and truly bring your progress to life.

## Secure
### Realms
Achievements are contained within realms. Users can be part of one or many realms and progress through achievements through any of the realms they belong to.

### Realm Administrators
Each realm has an administrative group that, along with the core Triumph administrators, can administer and cultivate a realm.  This includes creating/editing achievements, adding/removing users to the realm, and manually dolling out (or revoking) achievement progress.

### API Authentication and Authorization
Any Triumph user can gather information from the API. Read off all the achievement lists, user progress, and realm information you want! Create that slick achievement dashboard.

Modification of progress through the API, however, is restricted to those with accounts, and as being a member of the Triumph API Group.  

## Great, so how far along is it?
We just completed our [first pre-release](https://github.com/armstrhb/Triumph/releases/tag/v0.1.0). And while this is great (and very exciting!), our next steps are to get this thing stood up in a production environment. More things to shake out then :)
