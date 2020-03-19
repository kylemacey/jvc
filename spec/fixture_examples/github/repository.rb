JVC.fixture(:repository) do
  default do
    Octokit.repo("rails/rails")
  end

  trait(:personal) do
    Octokit.repo("kylemacey/repo-contrib-graph")
  end
end