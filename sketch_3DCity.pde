////////// 3D City //////////////////////////////////////////
/////////// Freya Berkhout ///////////////////////////////////
//////////// Inspired by Brutalism and the idea of community//
//////////////////////////////////////////////////////////////

import peasy.*;
PeasyCam cam;
boolean drawSphere = true;
boolean drawGrid = true;

// declare data structures
ArrayList <PVector> positions;
ArrayList <PVector> sizes;
ArrayList <PVector> rotations;
ArrayList <PVector> buildingColour;
ArrayList <PVector> starPositions;
ArrayList <PVector> starSizes;
ArrayList <PVector> starRotations;
ArrayList <PVector> starColour;
ArrayList <PVector> poolPositions;
ArrayList <PVector> poolSizes;
ArrayList <PVector> poolRotations;


void setup() {
  size(1280, 800, P3D); // use the P3D renderer

  cam = new PeasyCam(this, 2000); // instantiate PeasyCam
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(5000);

  // initialise the data structures
  positions = new ArrayList <PVector>();
  sizes = new ArrayList <PVector>();
  rotations = new ArrayList <PVector>();
  buildingColour = new ArrayList <PVector>();
  starPositions = new ArrayList <PVector>();
  starSizes = new ArrayList <PVector>();
  starRotations = new ArrayList <PVector>();
  starColour = new ArrayList <PVector>();
  poolPositions = new ArrayList <PVector>();
  poolSizes = new ArrayList <PVector>();
  poolRotations = new ArrayList <PVector>();


  // building
  for (int i = 0; i < 1200; i++) { 
    int d = 600;
    PVector pos = new PVector(random(-d, d), random(-d, d), 0); // x, y, z
    PVector sz = new PVector(random(100), random(100), random(500,1000)); // w, h, d
    PVector rot = new PVector(0, 0, 0); // rx, ry, rz
    PVector buildingCol = new PVector(random(20, 60), random(40), random(200, 255));
    PVector starPos = new PVector(random(-200, 300), random(-200, 300), random(-800, 780)); // x, y, z
    PVector starSz = new PVector(random(20), random( 20), random( 20)); // w, h, d
    PVector starRot = new PVector(random(-100, 100), random(-100, 100), random(-100, 100)); // rx, ry, rz
    PVector starCol = new PVector(random(180, 255), random(180, 210), random(40));
    PVector poolPos = new PVector(random(-d * 2, d * 2), random(-d * 2, d * 2),0);
    PVector poolSz = new PVector(random(800, 1500), random(800,1500), random(30));
    PVector poolRot = new PVector(0, 0, 0);


    positions.add(pos);
    sizes.add(sz);
    rotations.add(rot);
    buildingColour.add(buildingCol);
    starPositions.add(starPos);
    starSizes.add(starSz);
    starRotations.add(starRot);
    starColour.add(starCol);
    poolPositions.add(poolPos);
    poolSizes.add(poolSz);
    poolRotations.add(poolRot);
  }
}

void draw() {
  background(168, 241, 255); // always redraw
  if (drawSphere) drawSphere();
  if (drawGrid) drawGrid(30, 100);

  int len = positions.size();
  for (int i = 0; i < len; i++) {

    PVector tempPos = positions.get(i);
    PVector tempSz = sizes.get(i);
    PVector tempRot = rotations.get(i);
    PVector tempBuildingCol = buildingColour.get(i);
    PVector tempStarPos = starPositions.get(i);
    PVector tempStarSz = starSizes.get(i);
    PVector tempStarRot = starRotations.get(i);
    PVector tempStarCol = starColour.get(i);
    PVector tempPoolPos = poolPositions.get(i);
    PVector tempPoolSz = poolSizes.get(i);
    PVector tempPoolRot = poolRotations.get(i);


    pushMatrix();
    
    // main building
    stroke(0);
    strokeWeight(1);
    fill(0, 100);
    box(100, 400, 1400);
    
    // building plot
    rotateX(tempPoolRot.x);
    rotateY(tempPoolRot.y);
    rotateZ(tempPoolRot.z);
    strokeWeight(1);
    fill(127, 100);
    box(tempPoolSz.x, tempPoolSz.y, tempPoolSz.z);
    
    // buildings
    translate(tempPos.x, tempPos.y, tempPos.z);
    rotateX(tempRot.x);
    rotateY(tempRot.y);
    rotateZ(tempRot.z);
    fill(tempBuildingCol.x, tempBuildingCol.y, tempBuildingCol.z, 100);
    box(tempSz.x, tempSz.y, tempSz.z);

    // star matter
    translate(tempStarPos.x, tempStarPos.y, tempStarPos.z);
    rotateX(tempStarRot.x);
    rotateY(tempStarRot.y);
    rotateZ(tempStarRot.z);
    fill(tempStarCol.x, tempStarCol.y, tempStarCol.z);
    box(tempStarSz.x, tempStarSz.y, tempStarSz.z);

    popMatrix();
  }
}

void drawGrid(int numCells, float cellSize) {
  pushMatrix();

  translate(-numCells * cellSize /2, - numCells * cellSize / 2, 0);
  for (int i = 0; i <= numCells; i++) {
    line(i * cellSize, 0, 0, i * cellSize, numCells * cellSize, 0); // rows
    line(0, i * cellSize, 0, numCells * cellSize, i * cellSize, 0); // columns
  }
  popMatrix();
}

void keyPressed() {
  if (key == 's');
  drawSphere = !drawSphere;

  if (key == 'g');
  drawGrid = !drawGrid;
}

void addBox() {
}

void drawSphere() {
  // sphere
  int len = 300;
  pushStyle();
  strokeWeight(1);
  stroke(252, 76, 0);
  noFill();
  sphere(len * 4);
  popStyle();
}