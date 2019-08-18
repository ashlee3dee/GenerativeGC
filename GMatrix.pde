// Daniel Shiffman
// http://youtube.com/thecodingtrain
// http://codingtra.in

// Coding Challenge #112: 3D Rendering with Rotation and Projection
// https://youtu.be/p4Iz0XJY-Qk

// Matrix Multiplication
// https://youtu.be/tzsgS19RRc8
class GMatrix {
  //fields
  private PVector rotationVector = new PVector(0f, 0f, 0f);
  private float[][] rotationMatrixX = {
    { 1, 0, 0}, 
    { 0, 0, 0}, 
    { 0, 0, 0}
  };
  private float[][] rotationMatrixY = {
    { 0, 0, 0}, 
    { 0, 1, 0}, 
    { 0, 0, 0}
  };
  private float[][]rotationMatrixZ = {
    { 0, 0, 0}, 
    { 0, 0, 0}, 
    { 0, 0, 1}
  };
  //constructors
  GMatrix() {
    setRotationVector(new PVector(0f, 0f, 0f));
  }
  //methods
  void setRotationVector(PVector _rot) {
    rotationVector.x=radians(_rot.x);
    rotationVector.y=radians(_rot.y);
    rotationVector.z=radians(_rot.z);
    //rotationVector=_rot;
    rotationMatrixX = new float[][]{
      { 1, 0, 0}, 
      { 0, cos(rotationVector.x), -sin(rotationVector.x)}, 
      { 0, sin(rotationVector.x), cos(rotationVector.x)}, 
    };
    rotationMatrixY = new float[][]{
      { cos(rotationVector.y), 0, sin(rotationVector.y)}, 
      { 0, 1, 0}, 
      { -sin(rotationVector.y), 0, cos(rotationVector.y)}
    };

    rotationMatrixZ = new float[][]{
      { cos(rotationVector.z), -sin(rotationVector.z), 0}, 
      { sin(rotationVector.z), cos(rotationVector.z), 0}, 
      { 0, 0, 1}
    };
  }
  PVector applyPerspective(PVector _v) {
    float[][] projection = {
      {1, 0, 0}, 
      {0, 1, 0}
    };
    _v = matmul(rotationMatrixX, _v);
    _v = matmul(rotationMatrixY, _v);
    _v = matmul(rotationMatrixZ, _v);
    _v = matmul(projection, _v);
    return _v;
  }
    PVector applyPerspective(PVector _v, float distance) {
    float d = distance;
    float z=1/(d-_v.z);
    float[][] projection = {
      {z, 0, 0}, 
      {0, z, 0}
    };
    _v = matmul(rotationMatrixX, _v);
    _v = matmul(rotationMatrixY, _v);
    _v = matmul(rotationMatrixZ, _v);
    _v = matmul(projection, _v);
    return _v;
  }

  float[][] vecToMatrix(PVector v) {
    float[][] m = new float[3][1];
    m[0][0] = v.x;
    m[1][0] = v.y;
    m[2][0] = v.z;
    return m;
  }

  PVector matrixToVec(float[][] m) {
    PVector v = new PVector();
    v.x = m[0][0];
    v.y = m[1][0];
    if (m.length > 2) {
      v.z = m[2][0];
    }
    return v;
  }

  PVector matmul(float[][] a, PVector b) {
    float[][] m = vecToMatrix(b);
    return matrixToVec(matmul(a, m));
  }

  float[][] matmul(float[][] a, float[][] b) {
    int colsA = a[0].length;
    int rowsA = a.length;
    int colsB = b[0].length;
    int rowsB = b.length;

    if (colsA != rowsB) {
      println("Columns of A must match rows of B");
      return null;
    }

    float result[][] = new float[rowsA][colsB];

    for (int i = 0; i < rowsA; i++) {
      for (int j = 0; j < colsB; j++) {
        float sum = 0;
        for (int k = 0; k < colsA; k++) {
          sum += a[i][k] * b[k][j];
        }
        result[i][j] = sum;
      }
    }
    return result;
  }
}
