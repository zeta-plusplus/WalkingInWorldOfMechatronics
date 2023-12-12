within WalkingInWorldOfMechatronics.Temp;

model InvPendulum_001
  extends Modelica.Icons.Example;
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, animateGround = false)  annotation(
    Placement(visible = true, transformation(origin = {-86, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(displayUnit = "rad",fixed = true, start = -80), useAxisFlange = true)  annotation(
    Placement(visible = true, transformation(origin = {-12, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(angles_start = {0.5235987755982988, 0, 0}, length = bodyShape.r[1],m = 1, r = {0.6, 0, 0}, r_CM = bodyShape.r, sphereDiameter = 4^(1/3)*0.02, width = 1/10*bodyShape.sphereDiameter)  annotation(
    Placement(visible = true, transformation(origin = {-12, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = 0, phi_nominal = 1e-9)  annotation(
    Placement(visible = true, transformation(origin = {-40, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(world.frame_b, revolute.frame_a) annotation(
    Line(points = {{-76, -32}, {-12, -32}}));
  connect(revolute.frame_b, bodyShape.frame_a) annotation(
    Line(points = {{-12, -12}, {-12, 4}}));
  connect(revolute.support, damper.flange_a) annotation(
    Line(points = {{-22, -28}, {-40, -28}, {-40, -22}}));
  connect(damper.flange_b, revolute.axis) annotation(
    Line(points = {{-40, -2}, {-22, -2}, {-22, -22}}));
annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-09, Interval = 0.001));
end InvPendulum_001;
