import sys
import simple_policy_gradient as spg

if __name__ == "__main__":
    # # pg train 100 1
    # print(sys.argv)
    # if not len(sys.argv) <= 5:
    #     print("Invalid number of arguments provided. Try again..")
    #     sys.exit()
    # algorithm =
    # action = sys.argv[2]
    action = "train"
    epochs = 200
    runs_per_epoch = 50
    print('Started ................')
    algo = spg.SimplePolicyGradient(epochs=epochs, runs_per_epoch=runs_per_epoch)

    if action == "eval":
        algo.eval()
    elif action == "train":
        algo.train()
    else:
        print("Invalid action chosen")