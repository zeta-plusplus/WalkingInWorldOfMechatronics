within WalkingInWorldOfMechatronics.Easy;

model InvPend_CtrldTrq_001
  extends Modelica.Icons.Example;
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, animateGround = false) annotation(
    Placement(visible = true, transformation(origin = {-28, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(displayUnit = "rad", fixed = true, start = 60*Modelica.Constants.pi/180), useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {125, -59}, extent = {{-17, -17}, {17, 17}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(angles_start = {0.5235987755982988, 0, 0}, length = bodyShape.r[1], m = 1, r = {0.6, 0, 0}, r_CM = bodyShape.r, sphereDiameter = 4^(1/3)*0.06, width = 1/8*bodyShape.sphereDiameter) annotation(
    Placement(visible = true, transformation(origin = {125, 75}, extent = {{-17, -17}, {17, 17}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = 0, phi_nominal = 1e-9) annotation(
    Placement(visible = true, transformation(origin = {84, -51}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Torque torque_actuator annotation(
    Placement(visible = true, transformation(origin = {52, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.RelAngleSensor relAngleSensor annotation(
    Placement(visible = true, transformation(origin = {41, -45}, extent = {{-7, 7}, {7, -7}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_tgtAng(duration = 1, height = 20, offset = 90, startTime = 15) annotation(
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
  Modelica.Mechanics.MultiBody.Forces.WorldForce force1(animation = false, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.world) annotation(
    Placement(visible = true, transformation(origin = {36, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid_distForce(amplitude = 50, falling = 0.001, nperiod = 1, offset = 0, period = 10, rising = 0.001, startTime = 7, width = 0.02) annotation(
    Placement(visible = true, transformation(origin = {-84, 118}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-81, 93}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-81, 77}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.WorldForce force(animation = false, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.world) annotation(
    Placement(visible = true, transformation(origin = {58, 168}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = 10) annotation(
    Placement(visible = true, transformation(origin = {-65, 187}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const3(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-33, 177}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const4(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-33, 159}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Sensors.CutForce cutForce(animation = false, positiveSign = true, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve) annotation(
    Placement(visible = true, transformation(origin = {78, 135}, extent = {{5, 5}, {-5, -5}}, rotation = -270)));
  Modelica.Mechanics.MultiBody.Sensors.CutForce cutForce1(animation = false, positiveSign = true, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve) annotation(
    Placement(visible = true, transformation(origin = {61, 92}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Sensors.CutForce cutForce_body_b_tot(animation = false, positiveSign = true, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve) annotation(
    Placement(visible = true, transformation(origin = {93, 92}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
equation
  connect(world.frame_b, revolute.frame_a) annotation(
    Line(points = {{-18, -76}, {125, -76}}, thickness = 1));
  connect(revolute.frame_b, bodyShape.frame_a) annotation(
    Line(points = {{125, -42}, {125, 58}}, thickness = 2));
  connect(revolute.support, damper.flange_a) annotation(
    Line(points = {{108, -69}, {84, -69}, {84, -59}}, thickness = 1));
  connect(damper.flange_b, revolute.axis) annotation(
    Line(points = {{84, -43}, {98, -43}, {98, -59}, {108, -59}}, thickness = 1));
  connect(relAngleSensor.flange_b, revolute.axis) annotation(
    Line(points = {{41, -38}, {108, -38}, {108, -59}}, thickness = 0.5));
  connect(revolute.support, relAngleSensor.flange_a) annotation(
    Line(points = {{108, -69}, {41, -69}, {41, -52}}, thickness = 0.5));
  connect(torque_actuator.flange, revolute.axis) annotation(
    Line(points = {{62, -20}, {98, -20}, {98, -59}, {108, -59}}, thickness = 1));
  connect(feedback.y, ctrl_P.u) annotation(
    Line(points = {{-113, 24}, {-76, 24}}, color = {0, 0, 127}));
  connect(relAngleSensor.phi_rel, feedback.u2) annotation(
    Line(points = {{33, -45}, {-120, -45}, {-120, 16}, {-122, 16}}, color = {0, 0, 127}));
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
  connect(trapezoid_distForce.y, force1.force[1]) annotation(
    Line(points = {{-73, 118}, {-6.3, 118}, {-6.3, 92}, {24, 92}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(const.y, force1.force[2]) annotation(
    Line(points = {{-75.5, 93}, {-10.9, 93}, {-10.9, 92}, {24, 92}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(const1.y, force1.force[3]) annotation(
    Line(points = {{-75.5, 77}, {-16.4, 77}, {-16.4, 92}, {24, 92}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(force1.frame_resolve, world.frame_b) annotation(
    Line(points = {{36, 82}, {6, 82}, {6, -76}, {-18, -76}}, pattern = LinePattern.Dash));
  connect(const2.y, force.force[1]) annotation(
    Line(points = {{-55, 187}, {18, 187}, {18, 168}, {46, 168}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(const3.y, force.force[2]) annotation(
    Line(points = {{-27.5, 177}, {14, 177}, {14, 168}, {46, 168}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(const4.y, force.force[3]) annotation(
    Line(points = {{-27.5, 159}, {-12, 159}, {-12, 168}, {46, 168}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(force.frame_resolve, world.frame_b) annotation(
    Line(points = {{58, 158}, {6, 158}, {6, -76}, {-18, -76}}, color = {95, 95, 95}, pattern = LinePattern.Dash));
  connect(force.frame_b, cutForce.frame_a) annotation(
    Line(points = {{68, 168}, {78, 168}, {78, 140}}, color = {95, 95, 95}, thickness = 0.5));
  connect(force1.frame_b, cutForce1.frame_a) annotation(
    Line(points = {{46, 92}, {56, 92}}, color = {95, 95, 95}, thickness = 0.5));
  connect(cutForce.frame_resolve, world.frame_b) annotation(
    Line(points = {{73, 131}, {6, 131}, {6, -76}, {-18, -76}}, color = {95, 95, 95}, pattern = LinePattern.Dash));
  connect(cutForce1.frame_resolve, world.frame_b) annotation(
    Line(points = {{65, 87}, {65, 74}, {6, 74}, {6, -76}, {-18, -76}}, pattern = LinePattern.Dash));
  connect(cutForce.frame_b, cutForce_body_b_tot.frame_a) annotation(
    Line(points = {{78, 130}, {78, 92}, {88, 92}}, color = {95, 95, 95}, thickness = 0.5));
  connect(cutForce1.frame_b, cutForce_body_b_tot.frame_a) annotation(
    Line(points = {{66, 92}, {88, 92}}, color = {95, 95, 95}, thickness = 0.5));
  connect(cutForce_body_b_tot.frame_b, bodyShape.frame_b) annotation(
    Line(points = {{98, 92}, {126, 92}}, thickness = 0.5));
  connect(world.frame_b, cutForce_body_b_tot.frame_resolve) annotation(
    Line(points = {{-18, -76}, {6, -76}, {6, 74}, {97, 74}, {97, 87}}, pattern = LinePattern.Dash));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-09, Interval = 0.001),
    Diagram(graphics = {Text(origin = {56, 0}, extent = {{-16, 6}, {16, -6}}, textString = "Positive
 = clockwise", horizontalAlignment = TextAlignment.Left), Rectangle(origin = {-100, -1}, pattern = LinePattern.Dash, lineThickness = 0.5, extent = {{-96, 53}, {96, -53}}), Text(origin = {-162, 61}, extent = {{-28, 5}, {28, -5}}, textString = "control", horizontalAlignment = TextAlignment.Left), Text(origin = {48, 11}, extent = {{-34, 7}, {34, -7}}, textString = "Rotational Actuator", horizontalAlignment = TextAlignment.Left), Text(origin = {-92, 140}, extent = {{-48, 6}, {48, -6}}, textString = "Input Disturbance Force", horizontalAlignment = TextAlignment.Left), Text(origin = {-48, 206}, extent = {{-48, 6}, {48, -6}}, textString = "Constant disturbance force", horizontalAlignment = TextAlignment.Left), Text(origin = {-166, -9}, extent = {{-26, 13}, {26, -13}}, textString = "Input signal:
target angle", horizontalAlignment = TextAlignment.Left)}, coordinateSystem(extent = {{-200, -100}, {160, 220}})));
end InvPend_CtrldTrq_001;
