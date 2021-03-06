%General Mission Analysis Tool(GMAT) Script
%Created: 2021-09-17 02:19:54


%----------------------------------------
%---------- Spacecraft
%----------------------------------------

Create Spacecraft sat;
GMAT sat.DateFormat = UTCGregorian;
GMAT sat.Epoch = '17 Sep 2021 00:00:00.000';
GMAT sat.CoordinateSystem = EarthMJ2000Eq;
GMAT sat.DisplayStateType = Keplerian;
GMAT sat.SMA = 60000.00000000001;
GMAT sat.ECC = 0.7499999999999994;
GMAT sat.INC = 0;
GMAT sat.RAAN = 0;
GMAT sat.AOP = 151.8167;
GMAT sat.TA = 180;
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

Create Spacecraft sat2;
GMAT sat2.DateFormat = UTCGregorian;
GMAT sat2.Epoch = '17 Sep 2021 00:00:00.000';
GMAT sat2.CoordinateSystem = EarthMJ2000Eq;
GMAT sat2.DisplayStateType = Keplerian;
GMAT sat2.SMA = 34999.99999999992;
GMAT sat2.ECC = 0.7499999999999996;
GMAT sat2.INC = 0;
GMAT sat2.RAAN = 0;
GMAT sat2.AOP = 151.8167;
GMAT sat2.TA = 180;
GMAT sat2.DryMass = 850;
GMAT sat2.Cd = 2.2;
GMAT sat2.Cr = 1.8;
GMAT sat2.DragArea = 15;
GMAT sat2.SRPArea = 1;
GMAT sat2.SPADDragScaleFactor = 1;
GMAT sat2.SPADSRPScaleFactor = 1;
GMAT sat2.NAIFId = -10001001;
GMAT sat2.NAIFIdReferenceFrame = -9001001;
GMAT sat2.OrbitColor = Green;
GMAT sat2.TargetColor = LightGray;
GMAT sat2.OrbitErrorCovariance = [ 1e+70 0 0 0 0 0 ; 0 1e+70 0 0 0 0 ; 0 0 1e+70 0 0 0 ; 0 0 0 1e+70 0 0 ; 0 0 0 0 1e+70 0 ; 0 0 0 0 0 1e+70 ];
GMAT sat2.CdSigma = 1e+70;
GMAT sat2.CrSigma = 1e+70;
GMAT sat2.Id = 'SatId';
GMAT sat2.Attitude = CoordinateSystemFixed;
GMAT sat2.SPADSRPInterpolationMethod = Bilinear;
GMAT sat2.SPADSRPScaleFactorSigma = 1e+70;
GMAT sat2.SPADDragInterpolationMethod = Bilinear;
GMAT sat2.SPADDragScaleFactorSigma = 1e+70;
GMAT sat2.ModelFile = 'aura.3ds';
GMAT sat2.ModelOffsetX = 0;
GMAT sat2.ModelOffsetY = 0;
GMAT sat2.ModelOffsetZ = 0;
GMAT sat2.ModelRotationX = 0;
GMAT sat2.ModelRotationY = 0;
GMAT sat2.ModelRotationZ = 0;
GMAT sat2.ModelScale = 1;
GMAT sat2.AttitudeDisplayStateType = 'Quaternion';
GMAT sat2.AttitudeRateDisplayStateType = 'AngularVelocity';
GMAT sat2.AttitudeCoordinateSystem = EarthMJ2000Eq;
GMAT sat2.EulerAngleSequence = '321';

Create Spacecraft sat3;
GMAT sat3.DateFormat = UTCGregorian;
GMAT sat3.Epoch = '17 Sep 2021 00:00:00.000';
GMAT sat3.CoordinateSystem = EarthMJ2000Eq;
GMAT sat3.DisplayStateType = Keplerian;
GMAT sat3.SMA = 84999.99999999993;
GMAT sat3.ECC = 0.7500000000000001;
GMAT sat3.INC = 0;
GMAT sat3.RAAN = 0;
GMAT sat3.AOP = 151.8167000000001;
GMAT sat3.TA = 179.9999987925817;
GMAT sat3.DryMass = 850;
GMAT sat3.Cd = 2.2;
GMAT sat3.Cr = 1.8;
GMAT sat3.DragArea = 15;
GMAT sat3.SRPArea = 1;
GMAT sat3.SPADDragScaleFactor = 1;
GMAT sat3.SPADSRPScaleFactor = 1;
GMAT sat3.NAIFId = -10002001;
GMAT sat3.NAIFIdReferenceFrame = -9002001;
GMAT sat3.OrbitColor = Yellow;
GMAT sat3.TargetColor = DarkGray;
GMAT sat3.OrbitErrorCovariance = [ 1e+70 0 0 0 0 0 ; 0 1e+70 0 0 0 0 ; 0 0 1e+70 0 0 0 ; 0 0 0 1e+70 0 0 ; 0 0 0 0 1e+70 0 ; 0 0 0 0 0 1e+70 ];
GMAT sat3.CdSigma = 1e+70;
GMAT sat3.CrSigma = 1e+70;
GMAT sat3.Id = 'SatId';
GMAT sat3.Attitude = CoordinateSystemFixed;
GMAT sat3.SPADSRPInterpolationMethod = Bilinear;
GMAT sat3.SPADSRPScaleFactorSigma = 1e+70;
GMAT sat3.SPADDragInterpolationMethod = Bilinear;
GMAT sat3.SPADDragScaleFactorSigma = 1e+70;
GMAT sat3.ModelFile = 'aura.3ds';
GMAT sat3.ModelOffsetX = 0;
GMAT sat3.ModelOffsetY = 0;
GMAT sat3.ModelOffsetZ = 0;
GMAT sat3.ModelRotationX = 0;
GMAT sat3.ModelRotationY = 0;
GMAT sat3.ModelRotationZ = 0;
GMAT sat3.ModelScale = 1;
GMAT sat3.AttitudeDisplayStateType = 'Quaternion';
GMAT sat3.AttitudeRateDisplayStateType = 'AngularVelocity';
GMAT sat3.AttitudeCoordinateSystem = EarthMJ2000Eq;
GMAT sat3.EulerAngleSequence = '321';



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
GMAT DefaultOrbitView.UpperLeft = [ 0 0 ];
GMAT DefaultOrbitView.Size = [ 0.6170588235294118 0.9305882352941176 ];
GMAT DefaultOrbitView.RelativeZOrder = 16;
GMAT DefaultOrbitView.Maximized = false;
GMAT DefaultOrbitView.Add = {sat, sat2, sat3, Earth};
GMAT DefaultOrbitView.CoordinateSystem = EarthMJ2000Eq;
GMAT DefaultOrbitView.DrawObject = [ true true true true ];
GMAT DefaultOrbitView.DataCollectFrequency = 1;
GMAT DefaultOrbitView.UpdatePlotFrequency = 50;
GMAT DefaultOrbitView.NumPointsToRedraw = 0;
GMAT DefaultOrbitView.ShowPlot = true;
GMAT DefaultOrbitView.MaxPlotPoints = 20000;
GMAT DefaultOrbitView.ShowLabels = true;
GMAT DefaultOrbitView.ViewPointReference = Earth;
GMAT DefaultOrbitView.ViewPointVector = [ 0 0 400000 ];
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
GMAT DefaultGroundTrackPlot.UpperLeft = [ 0.001764705882352941 0.4529411764705882 ];
GMAT DefaultGroundTrackPlot.Size = [ 0.5 0.4505882352941176 ];
GMAT DefaultGroundTrackPlot.RelativeZOrder = 7;
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
GMAT ReportFile1.UpperLeft = [ 0.01470588235294118 0.02941176470588235 ];
GMAT ReportFile1.Size = [ 0.8029411764705883 0.9635294117647059 ];
GMAT ReportFile1.RelativeZOrder = 156;
GMAT ReportFile1.Maximized = false;
GMAT ReportFile1.Filename = 'C:\Users\Joseph\Desktop\GMAT\AAE532\AAE532_PS03_P02\problem2_b1.txt';
GMAT ReportFile1.Precision = 16;
GMAT ReportFile1.Add = {sat.Earth.RadPer, sat.Earth.RadApo, sat.Earth.Energy, sat.Earth.SMA, sat.Earth.SemilatusRectum, sat.EarthMJ2000Eq.HX, sat.EarthMJ2000Eq.HY, sat.EarthMJ2000Eq.HZ, sat.Earth.HMAG, sat.EarthMJ2000Eq.X, sat.EarthMJ2000Eq.Y, sat.EarthMJ2000Eq.Z};
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
Propagate LowEarthProp(sat) LowEarthProp(sat2, sat3) {sat3.Earth.Periapsis};
