function u_y = fn_kirchhoff_kernel(u_x, freq, r_xy, e_xy, n_x, n_y, a_x, C, vels, density)

nf = length(freq);
nd = size(e_xy, 2);
nm = 2;

M = fn_calculate_M(e_xy, n_x, n_y, a_x, C, vels, density);

u_y = zeros([size(nds_y, 1), nf, nd]);
fprintf('[');
for f = 1:nf
    for m = 1:nm
        E = fn_calculate_E(r_xy, freq(f), vels, nd);
        for p = 1:nd
            for q = 1:nd
                u_y(:, f, q) = u_y(:, f, q) + (u_x(: , f, p).' * (M(:, :, m, p, q) .* E)).'; %matrix multiplication deals with sum over contributions from facets on previous surface
            end
        end
    end
    if rem(round(f/nf*100), 10) == 0
        fprintf('-');
    end
end
fprintf(']\n');
end