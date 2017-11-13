## Evaluation Rosenbrock function
def evaluation(x1,x2)
  return 100 * (x2 - x1 ** 2) ** 2 + (1 - x1) ** 2
end

## update position
def update_pos(x1, x2, vx1, vx2)
  new_x1 = x1 + vx1
  new_x2 = x2 + vx2
  return new_x1, new_x2
end

## update velocity 
def update_velocity(x1, x2, vx1, vx2, p, g, w, c1, c2)
  ## generate random number
  random = Random.new()
  ran1 = random.rand(1.0)
  ran2 = random.rand(1.0)
  ## update
  new_vx1 = w * vx1 + c1 * ran1 * (p[:x1] - x1) + c2 * ran2 * (g[0][:x1] - x1)
  new_vx2 = w * vx2 + c1 * ran1 * (p[:x2] - x2) + c2 * ran2 * (g[0][:x2] - x2)
  return new_vx1, new_vx2
end

def optimization(ps, vs, personal_best_positions, personal_best_score, gloval_best_position, max_genes, num, w, c1, c2)
  best_particle = personal_best_score.min
  for i in 0..num-1 do
    if best_particle = personal_best_score[i] then
      gloval_best_position[0][:x1] = personal_best_positions[i][:x1]
      gloval_best_position[0][:x2] = personal_best_positions[i][:x2]
    end
  end
  for t in 1..max_genes do
    for n in 0..num-1 do
      x1, x2 = ps[n][:x1], ps[n][:x2]
      vx1, vx2 = vs[n][:vx1], vs[n][:vx2]
      p = Marshal.load(Marshal.dump(personal_best_positions[n]))
      new_x1, new_x2 = update_pos(x1, x2, vx1, vx2)
      ps[n][:x1], ps[n][:x2] = new_x1, new_x2
      new_vx1, new_vx2 = update_velocity(new_x1, new_x2, vx1, vx2, p, gloval_best_position, w, c1, c2)
      vs[n][:vx1], vs[n][:vx2] = new_vx1, new_vx2
      score = evaluation(new_x1, new_x2)
      if score < personal_best_score[n] then
        personal_best_score[n] = score
        personal_best_positions[n][:x1] = new_x1
        personal_best_positions[n][:x2] = new_x2
      end
    end
    best_particle = personal_best_score.min
    for i in 0..num-1 do
      if best_particle == personal_best_score[i] then
        gloval_best_position[0][:x1] = personal_best_positions[i][:x1]
        gloval_best_position[0][:x2] = personal_best_positions[i][:x2]
      end
    end
  end
  p gloval_best_position
  p personal_best_score.min
end


if __FILE__ == $0 then 
  ## inertia constant
  w = 0.5
  ## particle ratio
  c1 = 1.6
  c2 = 1.5
  ## max particle number
  num = 100
  ## max num
  max = 3.0
  min = -3.0
  ## search space
  ps = Array.new()
  random = Random.new()
  for i in 1..num do
    p = Hash.new()
    p[:x1] = random.rand(min..max)
    p[:x2] = random.rand(min..max)
    ps << p
  end
  vs = Array.new()
  for i in 1..num do
    p = Hash.new()
    p[:vx1] = 0.0
    p[:vx2] = 0.0
    vs << p
  end
  personal_best_positions = Marshal.load(Marshal.dump(ps))
  personal_best_score = Array.new()
  for i in 0..num-1 do
    personal_best_score[i] = evaluation(ps[i][:x1], ps[i][:x2])
  end
  gloval_best_position = Array.new()
  hoge = Hash.new()
  hoge[:x1] = 0.0
  hoge[:x2] = 0.0
  gloval_best_position << hoge
  ## max generation
  max_genes = 300
  ## calculate value
  optimization(ps, vs, personal_best_positions, personal_best_score, gloval_best_position, max_genes, num, w, c1, c2)
end
