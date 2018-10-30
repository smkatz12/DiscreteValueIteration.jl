function test_sparse_vanilla_same(m)
    vanilla_solver = ValueIterationSolver(max_iterations=500, belres=1e-8)
    sparse_solver = SparseValueIterationSolver(max_iterations=500, belres=1e-8)
    vanilla_policy = solve(vanilla_solver, m)
    sparse_policy = solve(sparse_solver, m)
    @test vanilla_policy.policy == sparse_policy.policy
    @test isapprox(vanilla_policy.util, sparse_policy.util; atol=1e-3)
    @test isapprox(vanilla_policy.qmat, sparse_policy.qmat; atol=1e-3)
end

m1 = SimpleGridWorld(size=(10,10))
test_sparse_vanilla_same(m1)

m2 = SpecialGridWorld()
test_sparse_vanilla_same(m2)
