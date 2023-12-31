within WalkingInWorldOfMechatronics.Easy;

model KapitzaPendulum_001
  extends Modelica.Icons.Example;
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, animateGround = false) annotation(
    Placement(visible = true, transformation(origin = {-58, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(displayUnit = "rad", fixed = true, start = 90*Modelica.Constants.pi/180), useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {80, -7}, extent = {{-17, -17}, {17, 17}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyShape bodyShape(angles_start = {0.5235987755982988, 0, 0}, length = bodyShape.r[1], m = 1, r = {0.6, 0, 0}, r_CM = bodyShape.r, sphereDiameter = 4^(1/3)*0.06, width = 1/8*bodyShape.sphereDiameter) annotation(
    Placement(visible = true, transformation(origin = {80, 73}, extent = {{-17, -17}, {17, 17}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = 0.1, phi_nominal = 1e-9) annotation(
    Placement(visible = true, transformation(origin = {40, -1}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Forces.WorldForce force1(animation = false, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.world) annotation(
    Placement(visible = true, transformation(origin = {-8, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid_distForce(amplitude = 100, falling = 0.001, nperiod = 1, offset = 0, period = 10, rising = 0.001, startTime = 1, width = 0.05) annotation(
    Placement(visible = true, transformation(origin = {-128, 116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-125, 91}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-125, 75}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Forces.WorldForce force(animation = false, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.world) annotation(
    Placement(visible = true, transformation(origin = {14, 160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const3(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-77, 169}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const4(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-77, 151}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Sensors.CutForce cutForce(animation = false, positiveSign = true, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve) annotation(
    Placement(visible = true, transformation(origin = {34, 133}, extent = {{5, 5}, {-5, -5}}, rotation = -270)));
  Modelica.Mechanics.MultiBody.Sensors.CutForce cutForce1(animation = false, positiveSign = true, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve) annotation(
    Placement(visible = true, transformation(origin = {17, 90}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Sensors.CutForce cutForce_body_b_tot(animation = false, positiveSign = true, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.frame_resolve) annotation(
    Placement(visible = true, transformation(origin = {49, 90}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(boxHeight = 4^(1/3)*0.06, boxWidth = 4^(1/3)*0.06, boxWidthDirection = {1, 0, 0}, n = {0, 1, 0}, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {80, -62}, extent = {{-16, -16}, {16, 16}}, rotation = 90)));
  Modelica.Mechanics.Translational.Sources.Position position(useSupport = true) annotation(
    Placement(visible = true, transformation(origin = {16, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine(amplitude = 0.05, f = 50) annotation(
    Placement(visible = true, transformation(origin = {-83, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.RelAngleSensor relAngleSensor annotation(
    Placement(visible = true, transformation(origin = {7, 3}, extent = {{-7, 7}, {7, -7}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, height = 20, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-100, 180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(revolute.frame_b, bodyShape.frame_a) annotation(
    Line(points = {{80, 10}, {80, 56}}, thickness = 2));
  connect(revolute.support, damper.flange_a) annotation(
    Line(points = {{63, -17.2}, {40, -17.2}, {40, -9.2}}, thickness = 1));
  connect(damper.flange_b, revolute.axis) annotation(
    Line(points = {{40, 7}, {54, 7}, {54, -7}, {63, -7}}, thickness = 1));
  connect(trapezoid_distForce.y, force1.force[1]) annotation(
    Line(points = {{-117, 116}, {-50.3, 116}, {-50.3, 90}, {-20, 90}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(const.y, force1.force[2]) annotation(
    Line(points = {{-119.5, 91}, {-54.9, 91}, {-54.9, 90}, {-20, 90}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(const1.y, force1.force[3]) annotation(
    Line(points = {{-119.5, 75}, {-60.4, 75}, {-60.4, 90}, {-20, 90}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(force1.frame_resolve, world.frame_b) annotation(
    Line(points = {{-8, 80}, {-38, 80}, {-38, -78}, {-48, -78}}, pattern = LinePattern.Dash));
  connect(const3.y, force.force[2]) annotation(
    Line(points = {{-71.5, 169}, {-30, 169}, {-30, 160}, {2, 160}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(const4.y, force.force[3]) annotation(
    Line(points = {{-71.5, 151}, {-56, 151}, {-56, 160}, {2, 160}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(force.frame_resolve, world.frame_b) annotation(
    Line(points = {{14, 150}, {-38, 150}, {-38, -78}, {-48, -78}}, color = {95, 95, 95}, pattern = LinePattern.Dash));
  connect(force.frame_b, cutForce.frame_a) annotation(
    Line(points = {{24, 160}, {34, 160}, {34, 138}}, color = {95, 95, 95}, thickness = 0.5));
  connect(force1.frame_b, cutForce1.frame_a) annotation(
    Line(points = {{2, 90}, {12, 90}}, color = {95, 95, 95}, thickness = 0.5));
  connect(cutForce.frame_resolve, world.frame_b) annotation(
    Line(points = {{29, 129}, {-38, 129}, {-38, -78}, {-48, -78}}, color = {95, 95, 95}, pattern = LinePattern.Dash));
  connect(cutForce1.frame_resolve, world.frame_b) annotation(
    Line(points = {{21, 85}, {21, 72}, {-38, 72}, {-38, -78}, {-48, -78}}, pattern = LinePattern.Dash));
  connect(cutForce.frame_b, cutForce_body_b_tot.frame_a) annotation(
    Line(points = {{34, 128}, {34, 90}, {44, 90}}, color = {95, 95, 95}, thickness = 0.5));
  connect(cutForce1.frame_b, cutForce_body_b_tot.frame_a) annotation(
    Line(points = {{22, 90}, {44, 90}}, color = {95, 95, 95}, thickness = 0.5));
  connect(cutForce_body_b_tot.frame_b, bodyShape.frame_b) annotation(
    Line(points = {{54, 90}, {80, 90}}, thickness = 0.5));
  connect(world.frame_b, cutForce_body_b_tot.frame_resolve) annotation(
    Line(points = {{-48, -78}, {-38, -78}, {-38, 72}, {53, 72}, {53, 85}}, pattern = LinePattern.Dash));
  connect(world.frame_b, prismatic.frame_a) annotation(
    Line(points = {{-48, -78}, {80, -78}}, thickness = 1));
  connect(prismatic.support, position.support) annotation(
    Line(points = {{70.4, -68.4}, {16.4, -68.4}, {16.4, -48.4}}, color = {0, 127, 0}, thickness = 1));
  connect(revolute.frame_a, prismatic.frame_b) annotation(
    Line(points = {{80, -24}, {80, -46}}, thickness = 1));
  connect(sine.y, position.s_ref) annotation(
    Line(points = {{-72, -38}, {4, -38}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(revolute.axis, relAngleSensor.flange_b) annotation(
    Line(points = {{63, -7}, {59, -7}, {59, 9}, {6, 9}}));
  connect(revolute.support, relAngleSensor.flange_a) annotation(
    Line(points = {{63, -17.2}, {6, -17.2}, {6, -3.2}}));
  connect(ramp.y, force.force[1]) annotation(
    Line(points = {{-89, 180}, {-9, 180}, {-9, 160}, {1, 160}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(position.flange, prismatic.axis) annotation(
    Line(points = {{26, -38}, {70, -38}, {70, -50}}, color = {0, 127, 0}, thickness = 1));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-09, Interval = 0.01),
    Diagram(graphics = {Text(origin = {-143, 144}, extent = {{-47, 10}, {47, -10}}, textString = "Input Disturbance Force
(such as hit by hammer)", horizontalAlignment = TextAlignment.Left), Text(origin = {-86, 204}, extent = {{-60, 10}, {60, -10}}, textString = "Semi-Constant disturbance force
(such as wind)", horizontalAlignment = TextAlignment.Left), Text(origin = {150, -29}, extent = {{-42, 19}, {42, -19}}, textString = "move the hinge of 
pendulum in y-direction", horizontalAlignment = TextAlignment.Left), Text(origin = {-92, -15}, extent = {{-38, 13}, {38, -13}}, textString = "Forced vibration", horizontalAlignment = TextAlignment.Left), Text(origin = {150, -29}, extent = {{-42, 19}, {42, -19}}, textString = "move the hinge of 
pendulum in y-direction", horizontalAlignment = TextAlignment.Left), Text(origin = {27, 27}, extent = {{-37, 7}, {37, -7}}, textString = "friction dumping", horizontalAlignment = TextAlignment.Left)}, coordinateSystem(extent = {{-200, -100}, {200, 220}})));
end KapitzaPendulum_001;
