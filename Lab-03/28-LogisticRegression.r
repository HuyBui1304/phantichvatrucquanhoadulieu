if(!require(caret)) install.packages("caret")
if(!require(pROC)) install.packages("pROC")

library(caret)    
library(pROC)     

Sys.setlocale("LC_ALL", "en_US.UTF-8")
Sys.setenv(LANGUAGE = 'en')

df <- read.csv('/Users/huy/Documents/phân tích và trực quan hoá dữ liệu/Lab-03/water_potability.csv')
dataset_name <- "water"
head(df)
df$Potability <- as.factor(df$Potability)
levels(df$Potability) <- c("Không", "Có")

df$ph[is.na(df$ph)] <- mean(df$ph, na.rm = TRUE)
df$Sulfate[is.na(df$Sulfate)] <- mean(df$Sulfate, na.rm = TRUE)
df$Trihalomethanes[is.na(df$Trihalomethanes)] <- mean(df$Trihalomethanes, na.rm = TRUE)

features <- setdiff(names(df), "Potability")
df[, features] <- scale(df[, features])

set.seed(42)
train_index <- createDataPartition(df$Potability, p = 0.7, list = FALSE)
train_data <- df[train_index, ]
test_data <- df[-train_index, ]

model <- glm(Potability ~ ., data = train_data, family = binomial(link = "logit"))

summary_model <- summary(model)
print(summary_model)

coef_df <- data.frame(
  feature = names(coef(model)),
  coefficients = coef(model),
  odds_ratio = exp(coef(model)),
  p_value = summary_model$coefficients[, 4]
)
print(coef_df)

pred_probs <- predict(model, newdata = test_data, type = "response")
pred_classes <- ifelse(pred_probs > 0.5, "Có", "Không")
pred_classes <- factor(pred_classes, levels = c("Không", "Có"))

conf_mat <- confusionMatrix(pred_classes, test_data$Potability, positive = "Có")
print(conf_mat)

cat("\nCác chỉ số đánh giá mô hình:\n")
cat("Độ chính xác (Accuracy):", round(conf_mat$overall["Accuracy"], 4), "\n")
cat("Độ nhạy (Sensitivity/Recall):", round(conf_mat$byClass["Sensitivity"], 4), "\n")
cat("Độ đặc hiệu (Specificity):", round(conf_mat$byClass["Specificity"], 4), "\n")
cat("Độ chính xác dương tính (Precision):", round(conf_mat$byClass["Pos Pred Value"], 4), "\n")
cat("Chỉ số F1:", round(conf_mat$byClass["F1"], 4), "\n")

roc_obj <- roc(response = test_data$Potability, predictor = pred_probs, levels = c("Không", "Có"), direction = "<")
auc_value <- auc(roc_obj)
cat("Diện tích dưới đường cong ROC (AUC):", round(auc_value, 4), "\n")

plot(roc_obj, main="Đường cong ROC", col="blue", lwd=2)
legend("bottomright", legend = paste("AUC =", round(auc_value, 4)), col = "blue", lwd = 2)


model_full <- glm(Potability ~ ., data = train_data, family = binomial(link = "logit"))
model_step <- step(model_full, direction = "both")
summary(model_step)

pred_probs_step <- predict(model_step, newdata = test_data, type = "response")
pred_classes_step <- ifelse(pred_probs_step > 0.5, "Có", "Không")
pred_classes_step <- factor(pred_classes_step, levels = c("Không", "Có"))

conf_mat_step <- confusionMatrix(pred_classes_step, test_data$Potability, positive = "Có")
print(conf_mat_step)


roc_step <- roc(response = test_data$Potability, predictor = pred_probs_step, levels = c("Không", "Có"), direction = "<")
auc_step <- auc(roc_step)
cat("AUC mới:", round(auc_step, 4), "\n")

plot(roc_step, main = "Đường cong ROC - Logistic Regression", col = "blue", lwd = 2)
legend("bottomright", legend = paste("AUC =", round(auc_step, 4)), col = "blue", lwd = 2)

