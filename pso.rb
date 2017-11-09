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
  new_vx1 = w * vx1 + c1 * ran1 * (p["x1"] - x1) + c2 * ran2 * (g["x1"] - x1)
  new_vx2 = w * vx2 + c1 * ran1 * (p["x2"] - x2) + c2 * ran2 * (g["x2"] - x2)
  return new_vx1, new_vx2
end

def optimization()
  p "hoge"
  #for p in ps do
  #  i = 0
  #  personal_best_score[i] = evaluation(p[i][0],p[i][1])
  #  i++
  #end
  #best_particle = personal_best_score.min
  #for p in personal_best_score do
  #  i = 0
  #  if best_particle = p[i] then
  #    gloval_best_position = [p[i][0], p[i][1]]
  #  end
  #  i++
  #end
end


if __FILE__ == $0 then 
  ## inertia constant
  w = 0.5
  ## particle ratio
  c1 = 1.5
  c2 = 1.5
  ## max particle number
  num = 100
  ## max num
  max = 5
  min = -5
  ## range number for x1 and x2
  min_x1, max_x1 = min, max
  min_x2, max_x2 = min, max
  ## search space
  ps = Array.new(2).map{Array.new(num){Random.rand(min,max)}}
  vs = Array.new(2).map{Array.new(num,0.0)}
  personal_best_positions = Marshal.load(Marshal.dump(ps))
  personal_best_score = Array.new(num)
  gloval_best_position = Array.new(2)
  ## max generation
  max_genes = 30
  ## calculate value
  optimization()
end
