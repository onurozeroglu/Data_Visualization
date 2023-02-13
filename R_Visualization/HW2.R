LifeCycleSavings
attach(LifeCycleSavings)
rownames(LifeCycleSavings)
library(ggplot2)

#relation between people under 15 and disposable income
plot(pop15~dpi, xlim = c(0, 4100),col="blue", xlab = 'Disposable Income', ylab = 'Age under 15', main = 'Life Savings', data = LifeCycleSavings[1:50,])

#relation between people under 15 and Growth rate of disposable Income
plot(pop15~ddpi, xlim = c(0, 20),col="blue", xlab = 'Growth rate of disposable Income', ylab = 'Age under 15', main = 'Life Savings', data = LifeCycleSavings[1:50,])

#relation between aggregate personal savings and countries
first_plot <- ggplot(LifeCycleSavings, aes(x = reorder(row.names(LifeCycleSavings), LifeCycleSavings$sr), y = LifeCycleSavings$sr, fill = LifeCycleSavings$sr)) + 
  geom_col(colour="black") +
  scale_fill_gradient(
    low = "lightskyblue", 
    high = "lightskyblue4", 
    guide = FALSE
  ) + 
  labs(x="Countries", y="Aggregate personal savings") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1, size = rel(1.1)),
        axis.title.y = element_text(margin = margin(t = 0, r = 14, b = 0, l = 0)),
        plot.margin = unit(c(2,4.2,2,1), "cm"))
first_plot
#relation between disposable income and countries
second_plot <- ggplot(LifeCycleSavings, aes(x = reorder(row.names(LifeCycleSavings), LifeCycleSavings$dpi), y = LifeCycleSavings$dpi, fill = LifeCycleSavings$dpi)) + 
  geom_col(colour="black") +
  scale_fill_gradient(
    low = "lightskyblue", 
    high = "lightskyblue4", 
    guide = FALSE
  ) + 
  labs(x="Countries", y="Disposable Income") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1, size = rel(1.1)),
        axis.title.y = element_text(margin = margin(t = 0, r = 14, b = 0, l = 0)),
        plot.margin = unit(c(2,4.2,2,1), "cm"))
second_plot

