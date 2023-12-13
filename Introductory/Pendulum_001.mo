within WalkingInWorldOfMechatronics.Introductory;

model Pendulum_001
  extends Modelica.Icons.Example;
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, animateGround = false) annotation(
    Placement(visible = true, transformation(origin = {-56, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(displayUnit = "rad", fixed = true, start = -10*Modelica.Constants.pi/180), useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {18, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(angles_start = {0.5235987755982988, 0, 0}, length = bodyShape.r[1], m = 1, r = {0.6, 0, 0}, r_CM = bodyShape.r, sphereDiameter = 4^(1/3)*0.02, width = 1/10*bodyShape.sphereDiameter) annotation(
    Placement(visible = true, transformation(origin = {18, 14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = 0.02, phi_nominal = 1e-9) annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(world.frame_b, revolute.frame_a) annotation(
    Line(points = {{-46, 50}, {18, 50}}));
  connect(revolute.frame_b, bodyShape.frame_a) annotation(
    Line(points = {{18, 70}, {18, 24}}));
  connect(revolute.support, damper.flange_a) annotation(
    Line(points = {{8, 54}, {-10, 54}, {-10, 60}}));
  connect(damper.flange_b, revolute.axis) annotation(
    Line(points = {{-10, 80}, {8, 80}, {8, 60}}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-09, Interval = 0.001));
end Pendulum_001;
