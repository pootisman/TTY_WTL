function out = model
%
% sas.m
%
% Model exported on Feb 19 2014, 22:34 by COMSOL 4.3.2.189.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('C:\Users\SSS\Documents\TTY_WTL');

model.modelNode.create('mod1');

model.geom.create('geom1', 2);

model.mesh.create('mesh1', 'geom1');

model.physics.create('es', 'Electrostatics', 'geom1');
model.physics.create('mf', 'InductionCurrents', 'geom1');

model.study.create('std1');
model.study('std1').feature.create('stat', 'Stationary');
model.study('std1').feature('stat').activate('es', true);
model.study('std1').feature('stat').activate('mf', true);

model.geom('geom1').lengthUnit('mm');

model.param.set('I', '1[A]');
model.param.set('U', '1[V]');
model.param.set('dist', '4[mm]');
model.param.remove('dist');
model.param.set('D', '4[mm]');
model.param.set('d', '1[mm]');

model.geom('geom1').feature.create('r1', 'Rectangle');
model.geom('geom1').feature.duplicate('r2', 'r1');
model.geom('geom1').feature.remove('r1');
model.geom('geom1').feature.remove('r2');
model.geom('geom1').feature.create('sq1', 'Square');
model.geom('geom1').feature('sq1').set('size', '5');
model.geom('geom1').feature('sq1').set('base', 'center');
model.geom('geom1').run('sq1');
model.geom('geom1').feature.create('c1', 'Circle');
model.geom('geom1').feature('c1').set('r', 'd/2');
model.geom('geom1').feature('c1').setIndex('pos', '-D/2', 0);
model.geom('geom1').run('c1');
model.geom('geom1').feature.create('c2', 'Circle');
model.geom('geom1').feature('c2').set('r', 'd/2');
model.geom('geom1').feature('c2').setIndex('pos', 'D/2', 0);
model.geom('geom1').run('c2');
model.geom('geom1').feature.create('dif1', 'Difference');
model.geom('geom1').feature('sq1').set('size', '5000');
model.geom('geom1').feature.remove('dif1');
model.geom('geom1').run('c2');
model.geom('geom1').feature.create('dif1', 'Difference');
model.geom('geom1').feature('dif1').selection('input').set({'sq1'});
model.geom('geom1').feature('dif1').selection('input2').set({'c1' 'c2'});
model.geom('geom1').run;

model.material.create('mat1');
model.material('mat1').name('Air');
model.material('mat1').set('family', 'air');
model.material('mat1').propertyGroup('def').set('relpermeability', '1');
model.material('mat1').propertyGroup('def').set('relpermittivity', '1');
model.material('mat1').propertyGroup('def').set('dynamicviscosity', 'eta(T[1/K])[Pa*s]');
model.material('mat1').propertyGroup('def').set('ratioofspecificheat', '1.4');
model.material('mat1').propertyGroup('def').set('electricconductivity', '0[S/m]');
model.material('mat1').propertyGroup('def').set('heatcapacity', 'Cp(T[1/K])[J/(kg*K)]');
model.material('mat1').propertyGroup('def').set('density', 'rho(pA[1/Pa],T[1/K])[kg/m^3]');
model.material('mat1').propertyGroup('def').set('thermalconductivity', 'k(T[1/K])[W/(m*K)]');
model.material('mat1').propertyGroup('def').set('soundspeed', 'cs(T[1/K])[m/s]');
model.material('mat1').propertyGroup('def').func.create('eta', 'Piecewise');
model.material('mat1').propertyGroup('def').func('eta').set('funcname', 'eta');
model.material('mat1').propertyGroup('def').func('eta').set('arg', 'T');
model.material('mat1').propertyGroup('def').func('eta').set('extrap', 'constant');
model.material('mat1').propertyGroup('def').func('eta').set('pieces', {'200.0' '1600.0' '-8.38278E-7+8.35717342E-8*T^1-7.69429583E-11*T^2+4.6437266E-14*T^3-1.06585607E-17*T^4'});
model.material('mat1').propertyGroup('def').func.create('Cp', 'Piecewise');
model.material('mat1').propertyGroup('def').func('Cp').set('funcname', 'Cp');
model.material('mat1').propertyGroup('def').func('Cp').set('arg', 'T');
model.material('mat1').propertyGroup('def').func('Cp').set('extrap', 'constant');
model.material('mat1').propertyGroup('def').func('Cp').set('pieces', {'200.0' '1600.0' '1047.63657-0.372589265*T^1+9.45304214E-4*T^2-6.02409443E-7*T^3+1.2858961E-10*T^4'});
model.material('mat1').propertyGroup('def').func.create('rho', 'Analytic');
model.material('mat1').propertyGroup('def').func('rho').set('funcname', 'rho');
model.material('mat1').propertyGroup('def').func('rho').set('args', {'pA' 'T'});
model.material('mat1').propertyGroup('def').func('rho').set('expr', 'pA*0.02897/8.314/T');
model.material('mat1').propertyGroup('def').func('rho').set('dermethod', 'manual');
model.material('mat1').propertyGroup('def').func('rho').set('argders', {'pA' 'd(pA*0.02897/8.314/T,pA)'; 'T' 'd(pA*0.02897/8.314/T,T)'});
model.material('mat1').propertyGroup('def').func.create('k', 'Piecewise');
model.material('mat1').propertyGroup('def').func('k').set('funcname', 'k');
model.material('mat1').propertyGroup('def').func('k').set('arg', 'T');
model.material('mat1').propertyGroup('def').func('k').set('extrap', 'constant');
model.material('mat1').propertyGroup('def').func('k').set('pieces', {'200.0' '1600.0' '-0.00227583562+1.15480022E-4*T^1-7.90252856E-8*T^2+4.11702505E-11*T^3-7.43864331E-15*T^4'});
model.material('mat1').propertyGroup('def').func.create('cs', 'Analytic');
model.material('mat1').propertyGroup('def').func('cs').set('funcname', 'cs');
model.material('mat1').propertyGroup('def').func('cs').set('args', {'T'});
model.material('mat1').propertyGroup('def').func('cs').set('expr', 'sqrt(1.4*287*T)');
model.material('mat1').propertyGroup('def').func('cs').set('dermethod', 'manual');
model.material('mat1').propertyGroup('def').func('cs').set('argders', {'T' 'd(sqrt(1.4*287*T),T)'});
model.material('mat1').propertyGroup('def').addInput('temperature');
model.material('mat1').propertyGroup('def').addInput('pressure');
model.material('mat1').propertyGroup.create('RefractiveIndex', 'Refractive index');
model.material('mat1').propertyGroup('RefractiveIndex').set('n', '1');
model.material('mat1').set('family', 'air');

model.geom('geom1').feature('dif1').set('repairtol', '1.0E-9');
model.geom('geom1').run;
model.geom('geom1').repairTol(1.0E-9);
model.geom('geom1').runAll;

model.physics('es').feature.create('pot1', 'ElectricPotential', 1);
model.physics('es').feature('pot1').selection.set([9 10 11 12]);

model.geom('geom1').scaleUnitValue(true);
model.geom('geom1').lengthUnit('m');
model.geom('geom1').runAll;
model.geom('geom1').feature('sq1').set('size', '1');
model.geom('geom1').runAll;
model.geom('geom1').run;

model.physics('es').feature.create('pot2', 'ElectricPotential', 1);
model.physics('es').feature('pot2').set('V0', 1, 'U');
model.physics('es').feature('pot2').selection.set([5 6 7 8]);
model.physics('mf').feature.create('scu1', 'SurfaceCurrent', 1);
model.physics('mf').feature.create('mp1', 'MagneticPotential', 1);
model.physics('mf').feature('mp1').selection.set([5 6 7 8]);
model.physics('mf').feature('scu1').selection.set([9 10 11 12]);
model.physics('mf').feature('scu1').set('Js0', {'0' '0' 'I/(2*pi*d)'});

model.study('std1').feature.create('param', 'Parametric');
model.study('std1').feature('param').setIndex('pname', 'I', 0);
model.study('std1').feature('param').setIndex('plistarr', '', 0);
model.study('std1').feature('param').setIndex('pname', 'I', 0);
model.study('std1').feature('param').setIndex('plistarr', '', 0);
model.study('std1').feature('param').setIndex('pname', 'D', 0);
model.study('std1').feature('param').setIndex('plistarr', 'range(1[mm],5[mm],200[mm])', 0);

model.probe.create('dom1', 'Domain');
model.probe('dom1').model('mod1');
model.probe('dom1').set('expr', 'es.We');
model.probe('dom1').set('descr', 'Electric energy density');
model.probe('dom1').set('type', 'integral');
model.probe.create('dom2', 'Domain');
model.probe('dom2').model('mod1');
model.probe('dom2').set('type', 'integral');
model.probe('dom2').set('expr', 'mf.Wm');
model.probe('dom2').set('descr', 'Magnetic energy density');

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').feature.create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'stat');
model.sol('sol1').feature.create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'stat');
model.sol('sol1').feature.create('s1', 'Stationary');
model.sol('sol1').feature('s1').feature.create('seDef', 'Segregated');
model.sol('sol1').feature('s1').feature.create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').feature('s1').feature.remove('seDef');
model.sol('sol1').attach('std1');

model.batch.create('p1', 'Parametric');
model.batch('p1').study('std1');
model.batch('p1').feature.create('so1', 'Solutionseq');
model.batch('p1').feature('so1').set('seq', 'sol1');
model.batch('p1').feature('so1').set('store', 'off');
model.batch('p1').feature('so1').set('clear', 'on');
model.batch('p1').feature('so1').set('psol', 'none');
model.batch('p1').set('pname', {'D'});
model.batch('p1').set('plistarr', {'range(1[mm],5[mm],200[mm])'});
model.batch('p1').set('sweeptype', 'sparse');
model.batch('p1').set('probesel', 'all');
model.batch('p1').set('probes', {'dom1' 'dom2'});
model.batch('p1').set('plot', 'off');
model.batch('p1').set('err', 'on');
model.batch('p1').set('pdistrib', 'off');
model.batch('p1').attach('std1');
model.batch('p1').set('control', 'param');

model.sol.create('sol2');
model.sol('sol2').study('std1');
model.sol('sol2').name('Parametric 2');

model.batch('p1').feature('so1').set('psol', 'sol2');

model.result.create('pg1', 'PlotGroup2D');
model.result('pg1').name('Electric Potential (es)');
model.result('pg1').set('data', 'dset2');
model.result('pg1').set('oldanalysistype', 'noneavailable');
model.result('pg1').set('data', 'dset2');
model.result('pg1').feature.create('surf1', 'Surface');
model.result('pg1').feature('surf1').name('Surface');
model.result('pg1').feature('surf1').set('oldanalysistype', 'noneavailable');
model.result('pg1').feature('surf1').set('data', 'parent');
model.result.create('pg2', 'PlotGroup2D');
model.result('pg2').name('Magnetic Flux Density Norm (mf)');
model.result('pg2').set('data', 'dset2');
model.result('pg2').set('oldanalysistype', 'noneavailable');
model.result('pg2').set('data', 'dset2');
model.result('pg2').feature.create('surf1', 'Surface');
model.result('pg2').feature('surf1').name('Surface');
model.result('pg2').feature('surf1').set('oldanalysistype', 'noneavailable');
model.result('pg2').feature('surf1').set('expr', 'mf.normB');
model.result('pg2').feature('surf1').set('data', 'parent');

model.probe('dom1').genResult('none');
model.probe('dom2').genResult('none');

model.batch('p1').run;

model.result('pg1').run;

out = model;
