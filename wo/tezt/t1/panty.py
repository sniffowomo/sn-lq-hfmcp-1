# Testing ruff server basically 

from src.utz import header1


def main():
    header1("Welcome to the Rich Prettifier Example")
    print("This is a simple demonstration of using Rich for logging and console output.")
    
    # Example log messages
    from src.utz import l_critical, l_debug, l_error, l_info, l_warning
    
    l_debug("This is a debug message.")
    l_info("This is an info message.")
    l_warning("This is a warning message.")
    l_error("This is an error message.")
    l_critical("This is a critical message.")

if __name__ == "__main__":
    main()
