function [result] = func_2dLocalization(range, mic, measured)
nCandidates = size(range.w, 2);

minError = Inf;
result = zeros(1, 2);
for cnt = 1:nCandidates
    for cnt2 = 1:nCandidates
        cur = [range.w(cnt), range.h(cnt2)];
        
        dist = zeros(1, mic.num);
        for cnt3 = 1:mic.num
            dist(cnt3) = norm(mic.pos(cnt3, :) - cur);
        end
                
        error = 0;
        isCandidate = true;
        for cnt3 = 1:mic.num
            error = error + (measured(cnt3) - dist(cnt3))^2;            
            for cnt4 = cnt3 + 1:mic.num
                cError = ((measured(cnt3) - measured(cnt4)) - (dist(cnt3) - dist(cnt4)))^2;
                
                if cError > 25 
                    isCandidate = false;
                    break;
                end
                
                error = error + cError;
            end
            
            if ~isCandidate
                break;
            end
        end    

        if error < minError && isCandidate
            minError = error;
            result = cur;
        end
    end
end

if minError == Inf
    fMinError = ones(1, mic.num) * Inf;
    fResult = zeros(mic.num, 2);
    for cnt = 1:nCandidates
        for cnt2 = 1:nCandidates
            cur = [range.w(cnt), range.h(cnt2)];

            dist = zeros(1, mic.num);
            for cnt3 = 1:mic.num
                dist(cnt3) = norm(mic.pos(cnt3, :) - cur);
            end

            fError = zeros(mic.num, 1);
            for cnt3 = 1:mic.num - 1
                for cnt4 = cnt3 + 1:mic.num
                    diff = measured(cnt3) - measured(cnt4);
                    ref = dist(cnt3) - dist(cnt4);  

                    error = (ref - diff)^2;

                    for cnt5 = 1:mic.num
                        if cnt5 ~= cnt3 && cnt5 ~= cnt4
                            fError(cnt5) = fError(cnt5) + error;
                        end
                    end
                end
            end    

            for cnt3 = 1:mic.num
                if fError(cnt3) < fMinError(cnt3)
                    fMinError(cnt3) = fError(cnt3);
                    fResult(cnt3, :) = cur;
                end
            end
        end
    end

    [~, idx] = min(fMinError);
    result = fResult(idx, :);
end




end

