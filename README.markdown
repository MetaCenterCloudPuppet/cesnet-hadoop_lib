#### Table of Contents

1. [Module Description - What the module does and why it is useful](#module-description)
2. [Setup - The basics of getting started with hadoop\_lib](#setup)
    * [What hadoop\_lib affects](#what-hadoop_lib-affects)
3. [Usage - Beginning, configuration options, and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
    * [Classes](#classes)
     * [hadoop\_lib::env](#class-env)
    * [Resource Types](#resources)
     * [hadoop\_lib::postinstall](#resource-postinstall)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

<a name="module-description"></a>
## Module Description

Common puppet library for Hadoop and its addons. It manages alternatives as used in Cloudera and provides necessary environment variables.

<a name="setup"></a>
## Setup

<a name="what-hadoop-affects"></a>
### What hadoop\_lib affects

* Files created (*env* class):
 * */etc/profile.d/hadoop.sh*
 * */etc/profile.d/hadoop.csh*
* Alternatives (*postinstall* resource type):
 * */etc/&lt;NAME&gt;/conf*: it can be switched to the new alternative, so original configuration is kept intact

<a name="usage"></a>
## Usage

    Package['hive']
    ->
    ::hadoop_lib::postinstall { 'hive':
      alternatives => 'cluster',
    }

    ::hadoop_lib::env

<a name="reference"></a>
## Reference

<a name="classes"></a>
###Classes

* [**`hadoop_lib::env`**](#class-env): Common setup steps

<a name="resources"></a>
###Resources

* [**`hadoop_lib::postinstall`**](#resource-postinstall): Post-installation steps

<a name="class-env"></a>
### hadoop\_lib::env

#### Parameters

(none)

<a name="resource-postinstall"></a>
### hadoop\_lib::postinstall

#### Parameters

#####`alternatives`

Switches the alternatives used for the configuration. Default: 'cluster' (Debian) or undef.

It can be used only when supported (for example with Cloudera distribution).

<a name="development"></a>
##Development

* Repository: [https://github.com/MetaCenterCloudPuppet/cesnet-hadoop\_lib](https://github.com/MetaCenterCloudPuppet/cesnet-hadoop_lib)
* Tests:
 * basic: see *.travis.yml*
 * vagrant: [https://github.com/MetaCenterCloudPuppet/hadoop-tests](https://github.com/MetaCenterCloudPuppet/hadoop-tests)
* Email: František Dvořák &lt;valtri@civ.zcu.cz&gt;
