within WalkingInWorldOfMechatronics.Easy;

model KapitzaPendulum_001
  extends Modelica.Icons.Example;
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, animateGround = false) annotation(
    Placement(visible = true, transformation(origin = {-28, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(displayUnit = "rad", fixed = true, start = 90*Modelica.Constants.pi/180), useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {124, -5}, extent = {{-17, -17}, {17, 17}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(angles_start = {0.5235987755982988, 0, 0}, length = bodyShape.r[1], m = 1, r = {0.6, 0, 0}, r_CM = bodyShape.r, sphereDiameter = 4^(1/3)*0.06, width = 1/8*bodyShape.sphereDiameter) annotation(
    Placement(visible = true, transformation(origin = {124, 75}, extent = {{-17, -17}, {17, 17}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = 0.1, phi_nominal = 1e-9) annotation(
    Placement(visible = true, transformation(origin = {84, 1}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Forces.WorldForce force1(animation = false, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.world) annotation(
    Placement(visible = true, transformation(origin = {36, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid_distForce(amplitude = 100, falling = 0.001, nperiod = 1, offset = 0, period = 10, rising = 0.001, startTime = 1, width = 0.05) annotation(
    Placement(visible = true, transformation(origin = {-84, 118}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-81, 93}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-81, 77}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.WorldForce force(animation = false, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.world) annotation(
    Placement(visible = true, transformation(origin = {58, 168}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(boxHeight = 4^(1/3)*0.06, boxWidth = 4^(1/3)*0.06, boxWidthDirection = {1, 0, 0}, n = {0, 1, 0}, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {124, -60}, extent = {{-16, -16}, {16, 16}}, rotation = 90)));
  Modelica.Mechanics.Translational.Sources.Position position(useSupport = true) annotation(
    Placement(visible = true, transformation(origin = {60, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine(amplitude = 0.05, f = 50) annotation(
    Placement(visible = true, transformation(origin = {25, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.RelAngleSensor relAngleSensor annotation(
    Placement(visible = true, transformation(origin = {51, 5}, extent = {{-7, 7}, {7, -7}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, height = 20, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-56, 188}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(revolute.frame_b, bodyShape.frame_a) annotation(
    Line(points = {{124, 12}, {124, 58}}, thickness = 2));
  connect(revolute.support, damper.flange_a) annotation(
    Line(points = {{107, -15}, {84, -15}, {84, -7}}, thickness = 1));
  connect(damper.flange_b, revolute.axis) annotation(
    Line(points = {{84, 9}, {98, 9}, {98, -5}, {107, -5}}, thickness = 1));
  connect(trapezoid_distForce.y, force1.force[1]) annotation(
    Line(points = {{-73, 118}, {-6.3, 118}, {-6.3, 92}, {24, 92}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(const.y, force1.force[2]) annotation(
    Line(points = {{-75.5, 93}, {-10.9, 93}, {-10.9, 92}, {24, 92}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(const1.y, force1.force[3]) annotation(
    Line(points = {{-75.5, 77}, {-16.4, 77}, {-16.4, 92}, {24, 92}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(force1.frame_resolve, world.frame_b) annotation(
    Line(points = {{36, 82}, {6, 82}, {6, -76}, {-18, -76}}, pattern = LinePattern.Dash));
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
    Line(points = {{98, 92}, {124, 92}}, thickness = 0.5));
  connect(world.frame_b, cutForce_body_b_tot.frame_resolve) annotation(
    Line(points = {{-18, -76}, {6, -76}, {6, 74}, {97, 74}, {97, 87}}, pattern = LinePattern.Dash));
  connect(world.frame_b, prismatic.frame_a) annotation(
    Line(points = {{-18, -76}, {124, -76}}, thickness = 1));
  connect(prismatic.support, position.support) annotation(
    Line(points = {{114, -66}, {60, -66}, {60, -46}}, color = {0, 127, 0}, thickness = 1));
  connect(revolute.frame_a, prismatic.frame_b) annotation(
    Line(points = {{124, -22}, {124, -44}}, thickness = 1));
  connect(sine.y, position.s_ref) annotation(
    Line(points = {{36, -36}, {48, -36}}, color = {0, 0, 127}));
  connect(revolute.axis, relAngleSensor.flange_b) annotation(
    Line(points = {{108, -4}, {104, -4}, {104, 12}, {51, 12}}));
  connect(revolute.support, relAngleSensor.flange_a) annotation(
    Line(points = {{108, -16}, {51, -16}, {51, -2}}));
  connect(ramp.y, force.force[1]) annotation(
    Line(points = {{-44, 188}, {36, 188}, {36, 168}, {46, 168}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(position.flange, prismatic.axis) annotation(
    Line(points = {{70, -36}, {114, -36}, {114, -48}}, color = {0, 127, 0}, thickness = 1));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-09, Interval = 0.01),
    Diagram(graphics = {Text(origin = {-92, 140}, extent = {{-48, 6}, {48, -6}}, textString = "Input Disturbance Force", horizontalAlignment = TextAlignment.Left), Text(origin = {-39, 207}, extent = {{-57, 5}, {57, -5}}, textString = "Semi-Constant disturbance force", horizontalAlignment = TextAlignment.Left)}, coordinateSystem(extent = {{-200, -100}, {160, 220}})));
end KapitzaPendulum_001;
