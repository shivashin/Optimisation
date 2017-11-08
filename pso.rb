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

end


if __FILE__ == $0
  ## inertia constant
  w = 0.5
  ## particle ratio
  c1 = 2.0
  c2 = 2.0
  ## max particle number
  num = 100
  ## range number for x1 and x2
  min_x1, max_x1 = -5, 5
  min_x2, max_x2 = -5, 5
  ## search space
  search = [{min_x: min_x, max_x: max_x}, {min_y: min_y, max_y: max_y}]
  ## max generation
  max_genes = 30
end
