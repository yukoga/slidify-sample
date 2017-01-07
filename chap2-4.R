## ---- include ----
source('../init.R')
loadtest('from chap2-4.R')

## ---- compare ----
par(mfcol=c(2,2))
plot(X.price, type='l', xlab='', ylab='price')
plot(X.return, type='l', xlab='date', ylab='return')
abline(h=0, lty=3)
plot(Y.price, type='l', xlab='', ylab='price')
plot(Y.return, type='l', xlab='date', ylab='return')
abline(h=0, lty=3)

## ---- plot-return ----
indexes = seq(100)
df = build_df(data_list=list(indexes, X.return, Y.return), 
              headers=c('date', 'X', 'Y'), rowindexes=NULL)
m1 = mPlot(x='date', y=list('X', 'Y'), data=df, type="Line")
m1$set(pointSize=0, lineWidth=1, lineColors=list('#09B27F', '#DA00FF'), 
       labels=list('X', 'Y'), goals=list(0.0,0.0),
       goalLineColors=list('black', 'gray'),
       hideHover='auto',
       dateFormat = "#! function (x) {
          _date = new Date((x-1)*60*60*24*1000 + 60*60*24*1000*365*47 + 60*60*24*1000*12);
          return new Intl.DateTimeFormat('ja').format(_date);
       }!#",
       yLabelFormat = "#! function (y) {
          return (Math.round(y * Math.pow(10, 2)) / Math.pow(10, 2)).toString() + ' (%)';
       }!#")
print(m1)

## ---- plot-price ----
indexes2 = seq(101)
df2 = build_df(data_list=list(indexes2, X.price, Y.price), 
               headers=c('date', 'X', 'Y'), rowindexes=NULL)
m2 = mPlot(x='date', y=list('X', 'Y'), data=df2, type="Line")
m2$set(pointSize=0, lineWidth=1, lineColors=list('#09B27F', '#DA00FF'), 
       labels=list('X', 'Y'), 
       hideHover='auto',
       dateFormat = "#! function (x) {
       _date = new Date((x-1)*60*60*24*1000 + 60*60*24*1000*365*47 + 60*60*24*1000*12);
       return new Intl.DateTimeFormat('ja').format(_date);
       }!#",
       yLabelFormat = "#! function (y) {
       return (Math.round(y * Math.pow(10, 2)) / Math.pow(10, 2)).toString() + ' (JPY)';
       }!#")
print(m2)

## ---- mean-and-var-xy ----
mat_X = c(mean(X.return), sd(X.return))
mat_Y = c(mean(Y.return), sd(Y.return))
mat_headers = c('X', 'Y')
mat_rownames = c('mean', 'std')
df_stat = build_df(list(mat_X, mat_Y), mat_headers, mat_rownames)
