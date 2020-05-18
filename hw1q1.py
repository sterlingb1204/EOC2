import babynames

print("The Fantastic Four!")
print("-" * 19)


names = {name: sum(babynames.get_frequency(name).values()) for name in ["Reed", "Susan", "Ben", "Johnny"]}

for name, count in names.items():
    print(f"{name:>7}: {count:>9,}")

print(f"\n{max(names, key=names.get)} is the most popular!")