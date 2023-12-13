within WalkingInWorldOfMechatronics.Temp;

model InvPendulum_Ctrld_001
  extends Modelica.Icons.Example;
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, animateGround = false) annotation(
    Placement(visible = true, transformation(origin = {-28, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(displayUnit = "rad", fixed = true, start = 80*Modelica.Constants.pi/180), useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {93, -59}, extent = {{-17, -17}, {17, 17}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(angles_start = {0.5235987755982988, 0, 0}, length = bodyShape.r[1], m = 1, r = {0.6, 0, 0}, r_CM = bodyShape.r, sphereDiameter = 4^(1/3)*0.02, width = 1/10*bodyShape.sphereDiameter) annotation(
    Placement(visible = true, transformation(origin = {93, 39}, extent = {{-17, -17}, {17, 17}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = 0, phi_nominal = 1e-9) annotation(
    Placement(visible = true, transformation(origin = {60, -56}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation(
    Placement(visible = true, transformation(origin = {34, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.RelAngleSensor relAngleSensor annotation(
    Placement(visible = true, transformation(origin = {39, -45}, extent = {{-7, 7}, {7, -7}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_tgtAng(duration = 0, height = 0, offset = 90, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-146, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-86, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain ctrl_P(k = 10) annotation(
    Placement(visible = true, transformation(origin = {-43, -4}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_deg from_deg annotation(
    Placement(visible = true, transformation(origin = {-117, -4}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
equation
  connect(world.frame_b, revolute.frame_a) annotation(
    Line(points = {{-18, -76}, {93, -76}}));
  connect(revolute.frame_b, bodyShape.frame_a) annotation(
    Line(points = {{93, -42}, {93, 22}}, thickness = 1));
  connect(revolute.support, damper.flange_a) annotation(
    Line(points = {{76, -69}, {60, -69}, {60, -64.4}}));
  connect(damper.flange_b, revolute.axis) annotation(
    Line(points = {{60, -48}, {60, -45}, {76, -45}, {76, -59}}));
  connect(relAngleSensor.flange_b, revolute.axis) annotation(
    Line(points = {{39, -38}, {76, -38}, {76, -59}}));
  connect(revolute.support, relAngleSensor.flange_a) annotation(
    Line(points = {{76, -69}, {39, -69}, {39, -52}}));
  connect(torque.flange, revolute.axis) annotation(
    Line(points = {{44, -20}, {76, -20}, {76, -59}}));
  connect(feedback.y, ctrl_P.u) annotation(
    Line(points = {{-77, -4}, {-52, -4}}, color = {0, 0, 127}));
  connect(ctrl_P.y, torque.tau) annotation(
    Line(points = {{-35.3, -4}, {-6.3, -4}, {-6.3, -20}, {22, -20}}, color = {0, 0, 127}));
  connect(relAngleSensor.phi_rel, feedback.u2) annotation(
    Line(points = {{31, -45}, {-86, -45}, {-86, -12}}, color = {0, 0, 127}));
  connect(from_deg.y, feedback.u1) annotation(
    Line(points = {{-109.3, -4}, {-93.3, -4}}, color = {0, 0, 127}));
  connect(ramp_tgtAng.y, from_deg.u) annotation(
    Line(points = {{-135, -4}, {-127, -4}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-09, Interval = 0.001),
    Diagram(graphics = {Text(origin = {38, 0}, extent = {{-16, 6}, {16, -6}}, textString = "Positive
 = clockwise", horizontalAlignment = TextAlignment.Left)}, coordinateSystem(extent = {{-160, -100}, {160, 100}})));
end InvPendulum_Ctrld_001;
