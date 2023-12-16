within WalkingInWorldOfMechatronics.Easy;

model InvPend_CtrldTrq_001
  extends Modelica.Icons.Example;
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, animateGround = false) annotation(
    Placement(visible = true, transformation(origin = {-28, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(displayUnit = "rad", fixed = true, start = 60*Modelica.Constants.pi/180), useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {93, -59}, extent = {{-17, -17}, {17, 17}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(angles_start = {0.5235987755982988, 0, 0}, length = bodyShape.r[1], m = 1, r = {0.6, 0, 0}, r_CM = bodyShape.r, sphereDiameter = 4^(1/3)*0.06, width = 1/8*bodyShape.sphereDiameter) annotation(
    Placement(visible = true, transformation(origin = {93, 75}, extent = {{-17, -17}, {17, 17}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = 0, phi_nominal = 1e-9) annotation(
    Placement(visible = true, transformation(origin = {56, -51}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Torque torque_actuator annotation(
    Placement(visible = true, transformation(origin = {52, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.RelAngleSensor relAngleSensor annotation(
    Placement(visible = true, transformation(origin = {31, -45}, extent = {{-7, 7}, {7, -7}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_tgtAng(duration = 0.1, height = 20, offset = 90, startTime = 15) annotation(
    Placement(visible = true, transformation(origin = {-174, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-122, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain ctrl_P(k = 30) annotation(
    Placement(visible = true, transformation(origin = {-67, 24}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_deg from_deg annotation(
    Placement(visible = true, transformation(origin = {-145, 24}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Sum sum1(nin = 3) annotation(
    Placement(visible = true, transformation(origin = {-35, 24}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator ctrl_I(k = 40) annotation(
    Placement(visible = true, transformation(origin = {-67, -3}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Continuous.Der der1 annotation(
    Placement(visible = true, transformation(origin = {-89, -28}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Gain ctrl_D(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-67, -28}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.WorldForce force1(animation = false, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.frame_resolve) annotation(
    Placement(visible = true, transformation(origin = {60, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid_distForce(amplitude = 500, falling = 0.001, nperiod = 1, offset = 0, period = 10, rising = 0.001, startTime = 7, width = 0.001) annotation(
    Placement(visible = true, transformation(origin = {-84, 118}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-81, 93}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-81, 77}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.WorldForce force(animation = false, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.frame_resolve) annotation(
    Placement(visible = true, transformation(origin = {58, 168}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = 10) annotation(
    Placement(visible = true, transformation(origin = {-65, 187}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const3(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-33, 177}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const4(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-33, 159}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
equation
  connect(world.frame_b, revolute.frame_a) annotation(
    Line(points = {{-18, -76}, {93, -76}}, thickness = 1));
  connect(revolute.frame_b, bodyShape.frame_a) annotation(
    Line(points = {{93, -42}, {93, 58}}, thickness = 2));
  connect(revolute.support, damper.flange_a) annotation(
    Line(points = {{76, -69}, {56, -69}, {56, -59}}, thickness = 1));
  connect(damper.flange_b, revolute.axis) annotation(
    Line(points = {{56, -43}, {76, -43}, {76, -59}}, thickness = 1));
  connect(relAngleSensor.flange_b, revolute.axis) annotation(
    Line(points = {{31, -38}, {76, -38}, {76, -59}}));
  connect(revolute.support, relAngleSensor.flange_a) annotation(
    Line(points = {{76, -69}, {31, -69}, {31, -52}}));
  connect(torque_actuator.flange, revolute.axis) annotation(
    Line(points = {{62, -20}, {76, -20}, {76, -59}}, thickness = 1));
  connect(feedback.y, ctrl_P.u) annotation(
    Line(points = {{-113, 24}, {-76, 24}}, color = {0, 0, 127}));
  connect(relAngleSensor.phi_rel, feedback.u2) annotation(
    Line(points = {{23, -45}, {-122, -45}, {-122, 16}}, color = {0, 0, 127}));
  connect(from_deg.y, feedback.u1) annotation(
    Line(points = {{-137.3, 24}, {-130.3, 24}}, color = {0, 0, 127}));
  connect(ramp_tgtAng.y, from_deg.u) annotation(
    Line(points = {{-163, 24}, {-155, 24}}, color = {0, 0, 127}));
  connect(ctrl_P.y, sum1.u[1]) annotation(
    Line(points = {{-59.3, 24}, {-42.3, 24}}, color = {0, 0, 127}));
  connect(sum1.y, torque_actuator.tau) annotation(
    Line(points = {{-27, 24}, {-18, 24}, {-18, -20}, {40, -20}}, color = {0, 0, 127}));
  connect(ctrl_I.y, sum1.u[2]) annotation(
    Line(points = {{-59.3, -3}, {-54.3, -3}, {-54.3, 24}, {-44.3, 24}}, color = {0, 0, 127}));
  connect(feedback.y, ctrl_I.u) annotation(
    Line(points = {{-113, 24}, {-103, 24}, {-103, -3}, {-76, -3}}, color = {0, 0, 127}));
  connect(der1.y, ctrl_D.u) annotation(
    Line(points = {{-81.3, -28}, {-75.3, -28}}, color = {0, 0, 127}));
  connect(ctrl_D.y, sum1.u[3]) annotation(
    Line(points = {{-59.3, -28}, {-49.3, -28}, {-49.3, 24}, {-43.3, 24}}, color = {0, 0, 127}));
  connect(feedback.y, der1.u) annotation(
    Line(points = {{-113, 24}, {-109, 24}, {-109, -28}, {-99, -28}}, color = {0, 0, 127}));
  connect(force1.frame_b, bodyShape.frame_b) annotation(
    Line(points = {{70, 92}, {94, 92}}));
  connect(trapezoid_distForce.y, force1.force[1]) annotation(
    Line(points = {{-73, 118}, {-6.3, 118}, {-6.3, 92}, {48, 92}}, color = {0, 0, 127}));
  connect(const.y, force1.force[2]) annotation(
    Line(points = {{-75.5, 93}, {-10.9, 93}, {-10.9, 92}, {48, 92}}, color = {0, 0, 127}));
  connect(const1.y, force1.force[3]) annotation(
    Line(points = {{-75.5, 77}, {-16.4, 77}, {-16.4, 92}, {48, 92}}, color = {0, 0, 127}));
  connect(force1.frame_resolve, world.frame_b) annotation(
    Line(points = {{60, 82}, {6, 82}, {6, -76}, {-18, -76}}, pattern = LinePattern.Dash));
  connect(force.frame_resolve, world.frame_b) annotation(
    Line(points = {{58, 158}, {6, 158}, {6, -76}, {-18, -76}}, pattern = LinePattern.Dash));
  connect(force.frame_b, bodyShape.frame_b) annotation(
    Line(points = {{68, 168}, {76, 168}, {76, 92}, {94, 92}}, color = {95, 95, 95}));
  connect(const2.y, force.force[1]) annotation(
    Line(points = {{-55, 187}, {18, 187}, {18, 168}, {46, 168}}, color = {0, 0, 127}));
  connect(const3.y, force.force[2]) annotation(
    Line(points = {{-27.5, 177}, {14, 177}, {14, 168}, {46, 168}}, color = {0, 0, 127}));
  connect(const4.y, force.force[3]) annotation(
    Line(points = {{-27.5, 159}, {-12, 159}, {-12, 168}, {46, 168}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-09, Interval = 0.001),
    Diagram(graphics = {Text(origin = {56, 0}, extent = {{-16, 6}, {16, -6}}, textString = "Positive
 = clockwise", horizontalAlignment = TextAlignment.Left), Rectangle(origin = {-100, -1}, pattern = LinePattern.Dash, lineThickness = 0.5, extent = {{-96, 53}, {96, -53}}), Text(origin = {-162, 61}, extent = {{-28, 5}, {28, -5}}, textString = "control", horizontalAlignment = TextAlignment.Left), Text(origin = {48, 11}, extent = {{-34, 7}, {34, -7}}, textString = "Rotational Actuator", horizontalAlignment = TextAlignment.Left), Text(origin = {-92, 140}, extent = {{-48, 6}, {48, -6}}, textString = "Input Disturbance Force", horizontalAlignment = TextAlignment.Left), Text(origin = {-48, 206}, extent = {{-48, 6}, {48, -6}}, textString = "Constant disturbance force", horizontalAlignment = TextAlignment.Left), Text(origin = {-166, -9}, extent = {{-26, 13}, {26, -13}}, textString = "Input signal:
target angle", horizontalAlignment = TextAlignment.Left)}, coordinateSystem(extent = {{-200, -100}, {160, 220}})));
end InvPend_CtrldTrq_001;
