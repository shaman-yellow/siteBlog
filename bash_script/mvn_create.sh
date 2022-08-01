## bash

mvn archetype:generate \
  -B \
  -DarchetypeGroupId=org.apache.maven.archetypes \
  -DarchetypeArtifactId=maven-archetype-quickstart \
  -DarchetypeCatalog=internal \
  -Dversion=0.9 \
  -DgroupId=$1 \
  -DartifactId=$2 \
  -Dpackage=$3
