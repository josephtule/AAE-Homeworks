%General Mission Analysis Tool(GMAT) Script
%Created: 2021-09-17 01:56:18


%----------------------------------------
%---------- Spacecraft
%----------------------------------------

Create Spacecraft sat;
GMAT sat.DateFormat = UTCGregorian;
GMAT sat.Epoch = '17 Sep 2021 00:00:00.000';
GMAT sat.CoordinateSystem = EarthMJ2000Eq;
GMAT sat.DisplayStateType = Keplerian;
GMAT sat.SMA = 60000.00000000004;
GMAT sat.ECC = 0.7500000000000003;
GMAT sat.INC = 59.99999999999999;
GMAT sat.RAAN = 306.6148021947984;
GMAT sat.AOP = 314.190551535992;
GMAT sat.TA = 99.88774933204886;
GMAT sat.DryMass = 850;
GMAT sat.Cd = 2.2;
GMAT sat.Cr = 1.8;
GMAT sat.DragArea = 15;
GMAT sat.SRPArea = 1;
GMAT sat.SPADDragScaleFactor = 1;
GMAT sat.SPADSRPScaleFactor = 1;
GMAT sat.NAIFId = -10000001;
GMAT sat.NAIFIdReferenceFrame = -9000001;
GMAT sat.OrbitColor = Red;
GMAT sat.TargetColor = Teal;
GMAT sat.OrbitErrorCovariance = [ 1e+70 0 0 0 0 0 ; 0 1e+70 0 0 0 0 ; 0 0 1e+70 0 0 0 ; 0 0 0 1e+70 0 0 ; 0 0 0 0 1e+70 0 ; 0 0 0 0 0 1e+70 ];
GMAT sat.CdSigma = 1e+70;
GMAT sat.CrSigma = 1e+70;
GMAT sat.Id = 'SatId';
GMAT sat.Attitude = CoordinateSystemFixed;
GMAT sat.SPADSRPInterpolationMethod = Bilinear;
GMAT sat.SPADSRPScaleFactorSigma = 1e+70;
GMAT sat.SPADDragInterpolationMethod = Bilinear;
GMAT sat.SPADDragScaleFactorSigma = 1e+70;
GMAT sat.ModelFile = 'aura.3ds';
GMAT sat.ModelOffsetX = 0;
GMAT sat.ModelOffsetY = 0;
GMAT sat.ModelOffsetZ = 0;
GMAT sat.ModelRotationX = 0;
GMAT sat.ModelRotationY = 0;
GMAT sat.ModelRotationZ = 0;
GMAT sat.ModelScale = 1;
GMAT sat.AttitudeDisplayStateType = 'Quaternion';
GMAT sat.AttitudeRateDisplayStateType = 'AngularVelocity';
GMAT sat.AttitudeCoordinateSystem = EarthMJ2000Eq;
GMAT sat.EulerAngleSequence = '321';


%----------------------------------------
%---------- ForceModels
%----------------------------------------

Create ForceModel LowEarthProp_ForceModel;
GMAT LowEarthProp_ForceModel.CentralBody = Earth;
GMAT LowEarthProp_ForceModel.PrimaryBodies = {Earth};
GMAT LowEarthProp_ForceModel.SRP = Off;
GMAT LowEarthProp_ForceModel.RelativisticCorrection = Off;
GMAT LowEarthProp_ForceModel.ErrorControl = RSSStep;
GMAT LowEarthProp_ForceModel.GravityField.Earth.Degree = 0;
GMAT LowEarthProp_ForceModel.GravityField.Earth.Order = 0;
GMAT LowEarthProp_ForceModel.GravityField.Earth.StmLimit = 100;
GMAT LowEarthProp_ForceModel.GravityField.Earth.PotentialFile = 'JGM2.cof';
GMAT LowEarthProp_ForceModel.GravityField.Earth.TideModel = 'None';
GMAT LowEarthProp_ForceModel.Drag.AtmosphereModel = JacchiaRoberts;
GMAT LowEarthProp_ForceModel.Drag.HistoricWeatherSource = 'ConstantFluxAndGeoMag';
GMAT LowEarthProp_ForceModel.Drag.PredictedWeatherSource = 'ConstantFluxAndGeoMag';
GMAT LowEarthProp_ForceModel.Drag.CSSISpaceWeatherFile = 'SpaceWeather-All-v1.2.txt';
GMAT LowEarthProp_ForceModel.Drag.SchattenFile = 'SchattenPredict.txt';
GMAT LowEarthProp_ForceModel.Drag.F107 = 150;
GMAT LowEarthProp_ForceModel.Drag.F107A = 150;
GMAT LowEarthProp_ForceModel.Drag.MagneticIndex = 3;
GMAT LowEarthProp_ForceModel.Drag.SchattenErrorModel = 'Nominal';
GMAT LowEarthProp_ForceModel.Drag.SchattenTimingModel = 'NominalCycle';
GMAT LowEarthProp_ForceModel.Drag.DragModel = 'Spherical';

%----------------------------------------
%---------- Propagators
%----------------------------------------

Create Propagator LowEarthProp;
GMAT LowEarthProp.FM = LowEarthProp_ForceModel;
GMAT LowEarthProp.Type = RungeKutta89;
GMAT LowEarthProp.InitialStepSize = 60;
GMAT LowEarthProp.Accuracy = 9.999999999999999e-12;
GMAT LowEarthProp.MinStep = 0.001;
GMAT LowEarthProp.MaxStep = 2700;
GMAT LowEarthProp.MaxStepAttempts = 50;
GMAT LowEarthProp.StopIfAccuracyIsViolated = true;

%----------------------------------------
%---------- Subscribers
%----------------------------------------

Create OrbitView DefaultOrbitView;
GMAT DefaultOrbitView.SolverIterations = Current;
GMAT DefaultOrbitView.UpperLeft = [ 0.001176470588235294 0 ];
GMAT DefaultOrbitView.Size = [ 0.6170588235294118 0.9305882352941176 ];
GMAT DefaultOrbitView.RelativeZOrder = 266;
GMAT DefaultOrbitView.Maximized = false;
GMAT DefaultOrbitView.Add = {sat, Earth};
GMAT DefaultOrbitView.CoordinateSystem = EarthMJ2000Eq;
GMAT DefaultOrbitView.DrawObject = [ true true ];
GMAT DefaultOrbitView.DataCollectFrequency = 1;
GMAT DefaultOrbitView.UpdatePlotFrequency = 50;
GMAT DefaultOrbitView.NumPointsToRedraw = 0;
GMAT DefaultOrbitView.ShowPlot = true;
GMAT DefaultOrbitView.MaxPlotPoints = 20000;
GMAT DefaultOrbitView.ShowLabels = true;
GMAT DefaultOrbitView.ViewPointReference = Earth;
GMAT DefaultOrbitView.ViewPointVector = [ -120000 30000 20000 ];
GMAT DefaultOrbitView.ViewDirection = Earth;
GMAT DefaultOrbitView.ViewScaleFactor = 1;
GMAT DefaultOrbitView.ViewUpCoordinateSystem = EarthMJ2000Eq;
GMAT DefaultOrbitView.ViewUpAxis = Z;
GMAT DefaultOrbitView.EclipticPlane = Off;
GMAT DefaultOrbitView.XYPlane = On;
GMAT DefaultOrbitView.WireFrame = Off;
GMAT DefaultOrbitView.Axes = On;
GMAT DefaultOrbitView.Grid = Off;
GMAT DefaultOrbitView.SunLine = Off;
GMAT DefaultOrbitView.UseInitialView = On;
GMAT DefaultOrbitView.StarCount = 7000;
GMAT DefaultOrbitView.EnableStars = On;
GMAT DefaultOrbitView.EnableConstellations = Off;

Create GroundTrackPlot DefaultGroundTrackPlot;
GMAT DefaultGroundTrackPlot.SolverIterations = Current;
GMAT DefaultGroundTrackPlot.UpperLeft = [ 0.002352941176470588 0.4541176470588235 ];
GMAT DefaultGroundTrackPlot.Size = [ 0.5 0.4505882352941176 ];
GMAT DefaultGroundTrackPlot.RelativeZOrder = 258;
GMAT DefaultGroundTrackPlot.Maximized = false;
GMAT DefaultGroundTrackPlot.Add = {sat};
GMAT DefaultGroundTrackPlot.DataCollectFrequency = 1;
GMAT DefaultGroundTrackPlot.UpdatePlotFrequency = 50;
GMAT DefaultGroundTrackPlot.NumPointsToRedraw = 0;
GMAT DefaultGroundTrackPlot.ShowPlot = true;
GMAT DefaultGroundTrackPlot.MaxPlotPoints = 20000;
GMAT DefaultGroundTrackPlot.CentralBody = Earth;
GMAT DefaultGroundTrackPlot.TextureMap = 'ModifiedBlueMarble.jpg';

Create ReportFile ReportFile1;
GMAT ReportFile1.SolverIterations = Current;
GMAT ReportFile1.UpperLeft = [ 0 0 ];
GMAT ReportFile1.Size = [ 0 0 ];
GMAT ReportFile1.RelativeZOrder = 0;
GMAT ReportFile1.Maximized = false;
GMAT ReportFile1.Filename = 'C:\Users\Joseph\Desktop\GMAT\AAE532\AAE532_PS03_P02\problem2_a.txt';
GMAT ReportFile1.Precision = 16;
GMAT ReportFile1.Add = {sat.Earth.RadPer, sat.Earth.RadApo, sat.Earth.Energy, sat.Earth.SMA, sat.Earth.SemilatusRectum, sat.Earth.HMAG, sat.EarthMJ2000Eq.HX, sat.EarthMJ2000Eq.HY, sat.EarthMJ2000Eq.HZ, sat.EarthMJ2000Eq.X, sat.EarthMJ2000Eq.Y, sat.EarthMJ2000Eq.Z};
GMAT ReportFile1.WriteHeaders = true;
GMAT ReportFile1.LeftJustify = On;
GMAT ReportFile1.ZeroFill = Off;
GMAT ReportFile1.FixedWidth = true;
GMAT ReportFile1.Delimiter = ' ';
GMAT ReportFile1.ColumnWidth = 23;
GMAT ReportFile1.WriteReport = true;


%----------------------------------------
%---------- Mission Sequence
%----------------------------------------

BeginMissionSequence;
Propagate LowEarthProp(sat) {sat.Earth.Periapsis};
