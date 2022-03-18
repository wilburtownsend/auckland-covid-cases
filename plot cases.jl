using CSV, DataFrames, Dates, Plots
# Load data
data = DataFrame(CSV.File("auckland_cases.csv"))
data[!,"date"] = Date.(data[!,"date"], dateformat"d/m/y")
data = dropmissing(data)
# Create plot
xticks = [Date("2022-02-01")+ Dates.Day(i*7) for i ∈ 0:6]
xticks_formatted = Dates.format.(xticks, "dd/mm")
yticks = collect(0:2000:14000)
plot(data[!,"date"], data[!,"cases"],
	linewidth=2,
	ygrid=false, yformatter=:plain,
	xgrid=false, legend=false,
	ylabel="COVID-19 cases reported in the Auckland region",
	ylabelfontsize=9,
	size=(1000,600),
	thickness_scaling=1.5,
	xticks=(xticks,xticks_formatted),
	yticks=(yticks,yticks),
	ylims=(0,14000),
	fontfamily="Helvetica")
png("auckland_cases.png")