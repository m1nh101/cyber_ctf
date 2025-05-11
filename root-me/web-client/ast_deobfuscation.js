/*
  At this time I solve the challenge, AI is now popular.
  By uploading the AST file for AI, it will reconstruct the code.
  Otherwise, as challenge download file is Javascript AST.
  Easy to use escodegen library to reconstruct the code.
  The challenge password is the result of the reconstructed code.
*/

(() => {
  let d = [1856, 1824, 1776, 1728, 1776, 1728, 1776];
  d = d.map(c => String.fromCharCode(c >> 4));
  console.log(d);
})();

function gen_sensor() {
  let sens = [10] + [45] + [65] + [78] + [47];
  if ((sens >>= 4) == 20) {
    sens << 4;
  }
  let sensor = (function () {
    return [
      65353704, 65353663, 65353663, 65353707, 65353680,
      65353701, 65353663, 65353709, 65353680, 65353706,
      65353710, 65353724, 65353718, 65353680, 65353707,
      65353706, 65353696, 65353709, 65353705, 65353722,
      65353724, 65353708, 65353710, 65353723, 65353702,
      65353696, 65353697
    ];
  })()
    .map(c => String.fromCharCode(c ^ sens))
    .join('');
  return sensor;
}

let sensor = gen_sensor();
console.log(sensor);