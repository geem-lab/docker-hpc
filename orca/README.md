## Dockerfile for ORCA 🐳 🐋

![3b676bf7d59310b9f6a2e10e51a56474](https://user-images.githubusercontent.com/60739184/149775497-2a6ef4f0-6784-4ac6-bb17-8f3f9670f8ce.gif)

![example workflow](https://github.com/Leticia-maria/Orca_dockerfile/actions/workflows/docker-publish.yml/badge.svg)

An automated way to install Orca software for quantum chemical calculations.

### Installed dependencies
 - [conda](https://docs.conda.io/en/latest/)
 - [pip](https://pypi.org/project/pip/)
 - [xtb](https://github.com/grimme-lab/xtb)
 - [autoDE](https://github.com/duartegroup/autodE)
 - [orca](https://www.orcasoftware.de/tutorials_orca/first_steps/input_output.html) (5.0.2 version)

For further information, check out the [documentation of ORCA software](https://orcaforum.kofo.mpg.de/app.php/portal)

### Usage

To use this docker container, you can pull the image from [DockerHub](https://hub.docker.com/) or [GitHub Container Registries](https://docs.github.com/pt/packages/working-with-a-github-packages-registry/working-with-the-container-registry)

- DockerHub

```shell
docker pull leticiamaria/orca:5.0.2
```

- GitHub Container Registries

```shell
docker pull ghcr.io/leticia-maria/orca:5.0.2
```

To run inside of your computer:

```shell
docker run -t -i leticia-maria/orca:5.0.2 /bin/bash
```

```shell
source /opt/orcainit5
```

```shell
orca *.inp
```

### References 

Please, don't forget to reference ORCA software in your paper:
### References for packages & methods

- `ORCA`: Neese, F.; Wennmohs, F.; Becker, U.; Riplinger, C. "The ORCA quantum chemistry program package", _J. Chem. Phys._ **2020**, _152_, 224108
- `xtb`: C. Bannwarth, E. Caldeweyher, S. Ehlert, A. Hansen, P. Pracht, J. Seibert, S. Spicher, S. Grimme _WIREs Comput. Mol. Sci._, **2020**, _11_, e01493
- `CREST`: Pracht, P.; Bohle, F.; Grimme, S. "Automated exploration of the low-energy chemical space with fast quantum chemical methods", _Phys. Chem. Chem. Phys._ **2020**, _22_, 7169
- `autodE`: Young, T. A.; Silcock, J. J.; Sterling, A. J.; Duarte, F.; _Angew. Chem. Int. Ed._ **2021**, _60_, 4266
- `NBO 7`: Glendening, E. D.; Landis, C. R.; Weinhold, F.; "NBO 7.0: New Vistas in Localized and Delocalized Chemical Bonding Theory," _J. Comput. Chem._ **2019**, _40_, 2234
