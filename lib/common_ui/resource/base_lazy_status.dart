abstract class BaseLazyStatus {}

class BaseLazyLoad extends BaseLazyStatus {}

class BaseLazyNoAction extends BaseLazyStatus {}

class BaseLazyLoading extends BaseLazyStatus {}

class BaseLazyMoreLoading extends BaseLazyStatus {}

class BaseLazyError extends BaseLazyStatus {
  String? error;

  BaseLazyError(this.error);
}
